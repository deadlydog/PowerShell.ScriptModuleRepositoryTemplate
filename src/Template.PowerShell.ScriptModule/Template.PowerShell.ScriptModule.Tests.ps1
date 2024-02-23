using module './Template.PowerShell.ScriptModule.psm1'

Describe 'Get-HelloWorld' {
	It 'Should return "Hello, World!"' {
		$expected = 'Hello, World!*'
		$result = Get-HelloWorld
		$result | Should -BeLike $expected
	}
}
