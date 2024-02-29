# This is just example code. Run the _InitializeRepository.ps1 script to replace this file with your module.

function Get-TemplateDescription
{
	[CmdletBinding()]
	Param ()

	[string] $description = @'
This module is part of a template git repository that you can use to create new PowerShell script module repos quickly and easily with boilerplate files and CI/CD workflows already defined.

For more information, visit the repository at https://github.com/deadlydog/Template.PowerShell.ScriptModule.
'@

	Write-Output $description
}

function New-PowerShellModuleRepository
{
	[CmdletBinding()]
	Param
	(
		[Parameter(Mandatory = $true, HelpMessage = "The path to the directory where the module repository should be created.")]
		[ValidateNotNullOrEmpty()]
		[string] $RepositoryDirectoryPath,

		[Parameter(Mandatory = $true, HelpMessage = "The name of the module to create.")]
		[ValidateNotNullOrEmpty()]
		[string] $ModuleName,

		[Parameter(Mandatory = $true, HelpMessage = "The name of the individual or organization that owns the module.")]
		[ValidateNotNullOrEmpty()]
		[string] $OrganizationName
	)

	Copy-TemplateFilesToRepositoryRoot -repositoryDirectoryPath $RepositoryDirectoryPath
	Set-ModuleFileNames -repositoryDirectoryPath $RepositoryDirectoryPath -moduleName $ModuleName
	Set-TemplateTokenValuesInAllRepositoryFiles -repositoryDirectoryPath $RepositoryDirectoryPath -moduleName $ModuleName -organizationName $OrganizationName
}

function Copy-TemplateFilesToRepositoryRoot([string] $repositoryDirectoryPath)
{
	if (-not (Test-Path -Path $repositoryDirectoryPath -PathType Container))
	{
		New-Item -Path $repositoryDirectoryPath -ItemType Directory > $null
	}

	[string] $templateModuleDirectoryPath = "$repositoryDirectoryPath\src\Template.PowerShell.ScriptModule\TemplateRepoFiles"
	if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
	{
		Copy-Item -Path $templateModuleDirectoryPath\* -Destination $repositoryDirectoryPath -Recurse -Force
	}
}

function Set-ModuleFileNames([string] $repositoryDirectoryPath, [string] $moduleName)
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

function Set-TemplateTokenValuesInAllRepositoryFiles([string] $repositoryDirectoryPath, [string] $moduleName, [string] $organizationName)
{
	$repositoryFiles = Get-ChildItem -Path $RepositoryRoot -Recurse -File -Exclude '_InitializeRepository.ps1'
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
