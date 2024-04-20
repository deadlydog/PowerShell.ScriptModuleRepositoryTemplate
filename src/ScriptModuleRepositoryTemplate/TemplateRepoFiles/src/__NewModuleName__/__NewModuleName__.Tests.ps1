using module '.\__NewModuleName__.psm1'

# UPDATE ME: This is just example code. Replace the code below with your module's tests.
Describe 'Get-HelloWorld' {
	It 'Should return "Hello, World!"' {
		$expected = 'Hello, World!'
		$result = Get-HelloWorld
		$result | Should -Be $expected
	}
}
