# Run this script to replace the default template repository values with values specific to your module.

Process
{
	Write-Host -ForegroundColor Green "
This script will delete all files in this repo and replace them with template files specific to your module.
If you have made changes to any files you may want to commit them before continuing, as this script will likely overwrite them.
"

	[string] $moduleName = Read-Host -Prompt "Enter the name of your module without spaces (e.g. 'YourModuleName')"

	[string] $organizationName = Read-Host -Prompt "Enter your name, or the the name of your organization (e.g. 'My Company'). This will be used in the module manifest and repository license"

	Write-Information "Removing all files from this repository so they can be replaced with template repository files."
	Remove-AllRepositoryFilesExceptTemplateModuleFiles -repositoryDirectoryPath $RepositoryDirectoryPath

	Write-Information "Creating the template repository files."
	Import-Module -Name $TemplateModuleDirectoryPath -Force
	New-PowerShellScriptModuleRepository -RepositoryDirectoryPath $RepositoryDirectoryPath -ModuleName $moduleName -OrganizationName $organizationName
	Remove-Module -Name ScriptModuleRepositoryTemplate -Force

	Write-Information "Removing the template module files since we are done using it to create the template repository files."
	Remove-TemplateModuleFiles -templateModuleDirectoryPath $TemplateModuleDirectoryPath

	Write-Host -ForegroundColor Green "Repo initialization complete. You can now commit the changes to your repository."
}

Begin
{
	$InformationPreference = 'Continue'
	[string] $RepositoryDirectoryPath = Resolve-Path -Path $PSScriptRoot
	[string] $TemplateModuleDirectoryPath = "$RepositoryDirectoryPath\src\ScriptModuleRepositoryTemplate"

	function Remove-AllRepositoryFilesExceptTemplateModuleFiles([string] $repositoryDirectoryPath)
	{
		# Delete all files except the ones we want to keep.
		Get-ChildItem -Path $repositoryDirectoryPath -Recurse -File |
			Where-Object {
				$_.FullName -notlike "$repositoryDirectoryPath\.git\*" -and # Don't delete the .git directory.
				$_.FullName -notlike "$repositoryDirectoryPath\_InitializeRepository.ps1" -and # Don't delete this script.
				$_.FullName -notlike "$TemplateModuleDirectoryPath\*" # Don't delete the template module files.
			} |
			Remove-Item -Force

		# Delete all empty directories that were left behind.
		Get-ChildItem -Path $repositoryDirectoryPath -Recurse -Force -Directory |
			Sort-Object -Property FullName -Descending | # Delete child directories before parent directories.
			Where-Object { $_.GetFileSystemInfos().Count -eq 0 } |
			Remove-Item -Force
	}

	function Remove-TemplateModuleFiles([string] $templateModuleDirectoryPath)
	{
		if (Test-Path -Path $templateModuleDirectoryPath -PathType Container)
		{
			Remove-Item -Path $templateModuleDirectoryPath -Recurse -Force
		}
	}
}
