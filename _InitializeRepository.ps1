# Run this script to setup the repository for your module.

[System.Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingWriteHost', '')]
Param()

Process
{
	Write-Host -ForegroundColor Yellow "
This script will delete all files in this repo and replace them with template files specific to your module.
If you have made changes to any files you may want to commit them before continuing, as this script will likely overwrite them.
"

	[string] $moduleName = Read-Host -Prompt "Enter the name of your module without spaces (e.g. 'YourModuleName')"

	[string] $organizationName = Read-Host -Prompt "Enter your name, or the the name of your organization (e.g. 'My Company'). This will be used in the module manifest and repository license"

	Write-Information "Copying template repository module files to a temporary location."
	[string] $tempModuleDirectoryPath = CopyTemplateModuleFilesToTempDirectory -templateModuleDirectoryPath $TemplateModuleDirectoryPath

	Write-Information "Removing all files from this repository so they can be replaced with template repository files."
	RemoveAllUnnecessaryRepositoryFiles -repositoryDirectoryPath $RepositoryDirectoryPath

	Write-Information "Creating the template repository files."
	Import-Module -Name $tempModuleDirectoryPath -Force
	New-PowerShellScriptModuleRepository -RepositoryDirectoryPath $RepositoryDirectoryPath -ModuleName $moduleName -OrganizationName $organizationName
	Remove-Module -Name $TemplateModuleName -Force

	Write-Information "Removing the temporary template module files since we are done using it to create the template repository files."
	RemoveTemporaryModuleDirectory -tempModuleDirectoryPath $tempModuleDirectoryPath

	Write-Information "Starting external process to delete this script."
	DeleteThisScript

	Write-Host -ForegroundColor Green "Repo initialization complete. You can now commit the changes to your repository."
}

Begin
{
	$InformationPreference = 'Continue'
	[string] $RepositoryDirectoryPath = Resolve-Path -Path $PSScriptRoot
	[string] $TemplateModuleName = 'ScriptModuleRepositoryTemplate'
	[string] $TemplateModuleDirectoryPath = "$RepositoryDirectoryPath\src\$TemplateModuleName"

	function CopyTemplateModuleFilesToTempDirectory([string] $templateModuleDirectoryPath)
	{
		[string] $templateModuleName = Split-Path -Path $templateModuleDirectoryPath -Leaf
		[string] $tempModuleDirectoryPath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), (New-Guid).Guid, $templateModuleName)
		Copy-Item -Path $templateModuleDirectoryPath -Destination $tempModuleDirectoryPath -Recurse -Force
		return $tempModuleDirectoryPath
	}

	function RemoveAllUnnecessaryRepositoryFiles([string] $repositoryDirectoryPath)
	{
		# Delete all files except the ones we want to keep.
		Get-ChildItem -Path $repositoryDirectoryPath -Recurse -File |
			Where-Object {
				$_.FullName -notlike "$repositoryDirectoryPath\.git\*" -and # Don't delete the .git directory.
				$_.FullName -notlike "$repositoryDirectoryPath\_InitializeRepository.ps1" # Don't delete this script.
			} |
			Remove-Item -Force

		# Delete all empty directories that were left behind.
		Get-ChildItem -Path $repositoryDirectoryPath -Recurse -Force -Directory |
			Sort-Object -Property FullName -Descending | # Delete child directories before parent directories.
			Where-Object { $_.GetFileSystemInfos().Count -eq 0 } |
			Remove-Item -Force
	}

	function RemoveTemporaryModuleDirectory([string] $tempModuleDirectoryPath)
	{
		if (Test-Path -Path $tempModuleDirectoryPath -PathType Container)
		{
			Remove-Item -Path $tempModuleDirectoryPath -Recurse -Force -ErrorAction SilentlyContinue
		}
	}

	function DeleteThisScript
	{
		[string] $scriptPath = $MyInvocation.MyCommand.Path
		[string] $deleteCommand = "-ExecutionPolicy Bypass -NoProfile -Command `"Start-Sleep -Seconds 1; Remove-Item -Path $scriptPath -Force`""

		$powerShellVersion = $PSVersionTable.PSVersion.Major
		if ($powerShellVersion -le 5)
		{
			Invoke-Expression -Command "powershell $deleteCommand"
		}
		else
		{
			Invoke-Expression -Command "pwsh $deleteCommand"
		}
	}
}
