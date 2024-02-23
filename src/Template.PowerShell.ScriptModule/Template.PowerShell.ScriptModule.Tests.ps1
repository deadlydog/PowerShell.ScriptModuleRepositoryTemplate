using module './Template.PowerShell.ScriptModule.psm1'

Describe 'Get-TemplateDescription' {
	It 'Should return "Hello, World!"' {
		$result = Get-TemplateDescription
		$result | Should -Not -BeNullOrEmpty
	}
}
