# Run this script to replace the default template repository values with values specific to your module.

Process
{
	Write-Host -ForegroundColor Green "
This script will replace the default template repository files and values with ones specific to your module.
If you have made changes to any files, you may want to commit them before continuing, as this script may overwrite them.
"

	[string] $moduleName = Read-Host -Prompt "Enter the name of your module (e.g. 'YourModuleName')"

	[string] $organizationName = Read-Host -Prompt "Enter your name, or the the name of your organization (e.g. 'My Company'). This will be used in the module manifest and repository license"

	Remove-TemplateModuleFiles
	New-ModuleFiles -ModuleName $moduleName -OrganizationName $organizationName
	Set-RepositoryDefaultFiles -ModuleName $moduleName -OrganizationName $organizationName
	Remove-TemplateDefaultFiles
}

Begin
{
	$InformationPreference = 'Continue'
	[string] $RepositoryRoot = $PSScriptRoot

	function Remove-TemplateModuleFiles
	{
		[string] $templateModuleDirectoryPath = "$RepositoryRoot\src\Template.PowerShell.ScriptModule"
		if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
		{
			Remove-Item -Path $templateModuleDirectoryPath -Recurse -Force
		}
	}

	function New-ModuleFiles([string] $moduleName, [string] $organizationName)
	{
		[string] $moduleDirectoryPath = "$RepositoryRoot\src\$moduleName"
		[string] $moduleFilePath = "$moduleDirectoryPath\$moduleName.psm1"
		[string] $moduleManifestFilePath = "$moduleDirectoryPath\$moduleName.psd1"
		[string] $moduleTestsFilePath = "$moduleDirectoryPath\$moduleName.Tests.ps1"

		# Create the module directory.
		if (-Not (Test-Path -Path $moduleDirectoryPath -PathType Container))
		{
			New-Item -Path $moduleDirectoryPath -ItemType Directory
		}

		# Create the module file.
		if (-Not (Test-Path -Path $moduleFilePath -PathType Leaf))
		{

		}

		# Create the module manifest file.
		if (-Not (Test-Path -Path $moduleManifestFilePath -PathType Leaf))
		{

		}
		else
		{
			Write-Host "Module manifest file already exists at '$moduleManifestFilePath'. Skipping creation."
		}

		# Create the module tests file.
		if (-Not (Test-Path -Path $moduleTestsFilePath -PathType Leaf))
		{

		}
		else
		{
			Write-Host "Module tests file already exists at '$moduleTestsFilePath'. Skipping creation."
		}
	}

	function Remove-TemplateDefaultFiles
	{
		[string] $templateDefaultFilesDirectoryPath = "$RepositoryRoot\_TemplateDefaultFiles"
		if (Test-Path -Path $templateDefaultFilesDirectoryPath -PathType Container)
		{
			Remove-Item -Path $templateDefaultFilesDirectoryPath -Recurse -Force
		}
	}
}
