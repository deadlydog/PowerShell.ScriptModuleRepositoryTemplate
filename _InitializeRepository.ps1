# Run this script to replace the default template repository values with values specific to your module.

Process
{
	Write-Host -ForegroundColor Green "
This script will delete all files in this repo and replace them with template files specific to your module.
If you have made changes to any files you may want to commit them before continuing, as this script will likely overwrite them.
"

	[string] $moduleName = Read-Host -Prompt "Enter the name of your module (e.g. 'YourModuleName')"

	[string] $organizationName = Read-Host -Prompt "Enter your name, or the the name of your organization (e.g. 'My Company'). This will be used in the module manifest and repository license"

	Remove-AllRepositoryFilesExceptTemplateModuleFiles
	Copy-TemplateFilesToRepositoryRoot
	Remove-TemplateModuleFiles
	Set-ModuleFileNames -moduleName $moduleName
	Set-TemplateTokenValuesInAllRepoFiles -moduleName $moduleName -organizationName $organizationName
}

Begin
{
	$InformationPreference = 'Continue'
	[string] $RepositoryRoot = $PSScriptRoot

	function Remove-AllRepositoryFilesExceptTemplateModuleFiles
	{
		Remove-Item -Path $RepositoryRoot\* -Recurse -Force -Exclude '.git','_InitializeRepository.ps1','src\Template.PowerShell.ScriptModule'
	}

	function Copy-TemplateFilesToRepositoryRoot
	{
		[string] $templateModuleDirectoryPath = "$RepositoryRoot\src\Template.PowerShell.ScriptModule"
		if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
		{
			Copy-Item -Path $templateModuleDirectoryPath\* -Destination $RepositoryRoot -Recurse -Force
		}
	}

	function Remove-TemplateModuleFiles
	{
		[string] $templateModuleDirectoryPath = "$RepositoryRoot\src\Template.PowerShell.ScriptModule"
		if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
		{
			Remove-Item -Path $templateModuleDirectoryPath -Recurse -Force
		}
	}

	function Set-ModuleFileNames([string] $moduleName)
	{
		[string] $moduleDirectoryPath = "$RepositoryRoot\src\__NewModuleName__"
		[string] $moduleFilePath = "$moduleDirectoryPath\__NewModuleName__.psm1"
		[string] $moduleManifestFilePath = "$moduleDirectoryPath\__NewModuleName__.psd1"
		[string] $moduleTestsFilePath = "$moduleDirectoryPath\__NewModuleName__.Tests.ps1"

		if (Test-Path -Path $moduleDirectoryPath -PathType Container)
		{
			Rename-Item -Path $moduleDirectoryPath -NewName $moduleName -Force
		}

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
	}

	function Set-TemplateTokenValuesInAllRepoFiles([string] $moduleName, [string] $organizationName)
	{
		$repositoryFiles = Get-ChildItem -Path $RepositoryRoot -Recurse -File
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
}
