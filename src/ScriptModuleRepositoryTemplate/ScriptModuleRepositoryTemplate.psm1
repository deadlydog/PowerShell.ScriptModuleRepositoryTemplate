function New-PowerShellScriptModuleRepository
{
<#
	.SYNOPSIS
		Creates a new PowerShell script module repository directory with boilerplate files and CI/CD workflows already defined.

	.DESCRIPTION
		This function creates a new PowerShell script module repository with boilerplate files and CI/CD workflows already defined. This allows you to create new PowerShell script modules quickly and easily.

		Once the directory is created, you can run `git init` in it to initialize it as a git repository, and then push it to your own git server.

		You will then need to follow the instructions in the ReadMe.md file to finish setting up the repository.

	.PARAMETER RepositoryDirectoryPath
		The path to the new directory that should be created for the module repository.

	.PARAMETER ModuleName
		The name of the module to create.

	.PARAMETER OrganizationName
		The name of the individual or organization that owns the module.

	.EXAMPLE
		PS> New-PowerShellScriptModuleRepository -RepositoryDirectoryPath 'C:\MyNewModule' -ModuleName 'MyNewModule' -OrganizationName 'My Name'

		Creates a new module repository at 'C:\MyNewModule' with the module name 'MyNewModule' and the organization name 'My Name'.

	.INPUTS
		None. You cannot pipe objects to New-PowerShellScriptModuleRepository.

	.OUTPUTS
		None. New-PowerShellScriptModuleRepository does not return any output.
		It creates a new directory with the module repository files.

	.LINK
		https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate
#>
	[CmdletBinding(SupportsShouldProcess)]
	[Alias('New-PSRepository')]
	Param
	(
		[Parameter(Mandatory = $true, HelpMessage = "The path to the new directory that should be created for the module repository.")]
		[ValidateNotNullOrEmpty()]
		[string] $RepositoryDirectoryPath,

		[Parameter(Mandatory = $true, HelpMessage = "The name of the module to create.")]
		[ValidateNotNullOrEmpty()]
		[string] $ModuleName,

		[Parameter(Mandatory = $true, HelpMessage = "The name of the individual or organization that owns the module.")]
		[ValidateNotNullOrEmpty()]
		[string] $OrganizationName
	)

	CopyTemplateFilesToRepositoryRoot -repositoryDirectoryPath $RepositoryDirectoryPath
	SetModuleFileNames -repositoryDirectoryPath $RepositoryDirectoryPath -moduleName $ModuleName
	SetTemplateTokenValuesInAllRepositoryFiles -repositoryDirectoryPath $RepositoryDirectoryPath -moduleName $ModuleName -organizationName $OrganizationName
}

function CopyTemplateFilesToRepositoryRoot([string] $repositoryDirectoryPath)
{
	if (-not (Test-Path -Path $repositoryDirectoryPath -PathType Container))
	{
		Write-Verbose "Creating the repository directory '$repositoryDirectoryPath'."
		New-Item -Path $repositoryDirectoryPath -ItemType Directory > $null
	}

	[string] $templateModuleDirectoryPath = "$PSScriptRoot\TemplateRepoFiles"
	if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
	{
		Write-Verbose "Copying the template repository files from '$templateModuleDirectoryPath' to the repository directory '$repositoryDirectoryPath'."
		Copy-Item -Path $templateModuleDirectoryPath\* -Destination $repositoryDirectoryPath -Recurse -Force
	}

	# Rename all dot-files prefixed with an underscore to remove the underscore.
	# The underscore prefix is a workaround to a bug with Publish-Module and Publish-PSResource the excludes dot-files
	# and dot-directories from being included in the module package.
	$repoDotFiles = Get-ChildItem -Path $repositoryDirectoryPath -Recurse -Force -Filter '_.*'
	$repoDotFiles | ForEach-Object {
		[string] $filePath = $_.FullName
		[string] $newFileName = $_.Name -replace '^_\.', '.'
		Rename-Item -Path $filePath -NewName $newFileName -Force
	}
}

function SetModuleFileNames([string] $repositoryDirectoryPath, [string] $moduleName)
{
	[string] $moduleDirectoryPath = "$repositoryDirectoryPath\src\__NewModuleName__"
	[string] $moduleFilePath = "$moduleDirectoryPath\__NewModuleName__.psm1"
	[string] $moduleManifestFilePath = "$moduleDirectoryPath\__NewModuleName__.psd1"
	[string] $moduleTestsFilePath = "$moduleDirectoryPath\__NewModuleName__.Tests.ps1"

	if (Test-Path -Path $moduleFilePath -PathType Leaf)
	{
		Rename-Item -Path $moduleFilePath -NewName "$moduleName.psm1" -Force
	}

	if (Test-Path -Path $moduleManifestFilePath -PathType Leaf)
	{
		Rename-Item -Path $moduleManifestFilePath -NewName "$moduleName.psd1" -Force
	}

	if (Test-Path -Path $moduleTestsFilePath -PathType Leaf)
	{
		Rename-Item -Path $moduleTestsFilePath -NewName "$moduleName.Tests.ps1" -Force
	}

	# Rename the directory last.
	if (Test-Path -Path $moduleDirectoryPath -PathType Container)
	{
		Rename-Item -Path $moduleDirectoryPath -NewName $moduleName -Force
	}
}

function SetTemplateTokenValuesInAllRepositoryFiles([string] $repositoryDirectoryPath, [string] $moduleName, [string] $organizationName)
{
	$repositoryFiles = Get-ChildItem -Path $repositoryDirectoryPath -Recurse -File
	foreach ($file in $repositoryFiles)
	{
		$filePath = $file.FullName
		$contents = Get-Content -Path $filePath
		$contents = $contents -replace '__NewModuleName__', $moduleName
		$contents = $contents -replace '__IndividualOrOrganizationName__', $organizationName
		$contents = $contents -replace '__NewModuleGuid__', (New-Guid).ToString()
		Set-Content -Path $filePath -Value $contents
	}
}
