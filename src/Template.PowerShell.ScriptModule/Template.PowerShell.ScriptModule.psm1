# This is just example code. Run the _InitializeRepository.ps1 script to replace this file with your module.

function Get-TemplateDescription {
	[CmdletBinding()]
	Param ()

	[string] $description = @'
This module does nothing, but is part of a template git repository that you can clone to create new PowerShell script modules quickly and easily with boilerplate files and CI/CD workflows already defined.

For more information, visit the repository at https://github.com/deadlydog/Template.PowerShell.ScriptModule.
'@

	Write-Output $description
}
