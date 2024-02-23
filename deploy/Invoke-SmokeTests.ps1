# These tests are runs as part of the deployment process to ensure the newly published module is working as expected.
# These tests run against the installed module, not the source code, so they are a real-world test and should not use mocks.
# Since mocks are not used, be careful to not rely on state stored on the machine, such as a module configuration file.
# This is a great place to put tests that differ between operating systems, since they will be ran on multiple platforms.
# To run these tests on your local machine, see the comments in the BeforeAll block.

BeforeAll {
	Import-Module -Name 'Template.PowerShell.ScriptModule' -Force

	# To run these tests on your local machine, comment out the Import-Module command above and uncomment the one below.
	# 	Do this to use the module version from source code, not the installed version.
	# 	This is necessary to test functionality that you've added to the module, but have not yet published and installed.
	# Import-Module "$PSScriptRoot\..\src\Template.PowerShell.ScriptModule" -Force
}

Describe 'Get-TemplateDescription' {
	It 'Should return "Hello, World!"' {
		$result = Get-TemplateDescription
		$result | Should -Not -BeNullOrEmpty
	}
}
