# Run this script to replace the default template repository values with values specific to your module.

Process
{
	Write-Host -ForegroundColor Green "
This script will delete all files in this repo and replace them with template files specific to your module.
If you have made changes to any files you may want to commit them before continuing, as this script will likely overwrite them.
"

	[string] $moduleName = Read-Host -Prompt "Enter the name of your module without spaces (e.g. 'YourModuleName')"

	[string] $organizationName = Read-Host -Prompt "Enter your name, or the the name of your organization (e.g. 'My Company'). This will be used in the module manifest and repository license"

	Import-Module -Name $TemplateModuleDirectoryPath -Force
	Remove-AllRepositoryFilesExceptTemplateModuleFiles
	New-PowerShellModuleRepository -RepositoryDirectoryPath $RepositoryDirectoryPath -ModuleName $moduleName -OrganizationName $organizationName
	Remove-TemplateModuleFiles

	Write-Host -ForegroundColor Green "Repo initialization complete. You can now commit the changes to your repository."
}

Begin
{
	$InformationPreference = 'Continue'
	[string] $RepositoryDirectoryPath = Resolve-Path -Path $PSScriptRoot
	[string] $TemplateModuleDirectoryPath = "$RepositoryDirectoryPath\src\Template.PowerShell.ScriptModule"

	function Remove-AllRepositoryFilesExceptTemplateModuleFiles
	{
		# Delete all files except the ones we want to keep.
		Get-ChildItem -Path $RepositoryDirectoryPath -Recurse -File |
			Where-Object {
				$_.FullName -notlike "$RepositoryDirectoryPath\.git\*" -and # Don't delete the .git directory.
				$_.FullName -notlike "$RepositoryDirectoryPath\_InitializeRepository.ps1" -and # Don't delete this script.
				$_.FullName -notlike "$TemplateModuleDirectoryPath\*" # Don't delete the template module files.
			} |
			Remove-Item -Force

		# Delete all empty directories that were left behind.
		Get-ChildItem -Path $RepositoryDirectoryPath -Recurse -Force -Directory |
			Sort-Object -Property FullName -Descending | # Delete child directories before parent directories.
			Where-Object { $_.GetFileSystemInfos().Count -eq 0 } |
			Remove-Item -Force
	}

	function Remove-TemplateModuleFiles
	{
		if (Test-Path -Path $TemplateModuleDirectoryPath -PathType Container)
		{
			Remove-Item -Path $TemplateModuleDirectoryPath -Recurse -Force
		}
	}
}
