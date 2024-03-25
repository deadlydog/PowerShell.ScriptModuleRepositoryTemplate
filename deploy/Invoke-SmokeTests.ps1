# These tests are runs as part of the deployment process to ensure the newly published module is working as expected.
# These tests run against the installed module, not the source code, so they are a real-world test and should not use mocks.
# Since mocks are not used, be careful to not rely on state stored on the machine, such as a module configuration file.
# This is a great place to put tests that differ between operating systems, since they will be ran on multiple platforms.
# To run these tests on your local machine, see the comments in the BeforeAll block.

BeforeAll {
	Import-Module -Name 'ScriptModuleRepositoryTemplate' -Force

	# To run these tests on your local machine, comment out the Import-Module command above and uncomment the one below.
	# 	Do this to use the module version from source code, not the installed version.
	# 	This is necessary to test functionality that you've added to the module, but have not yet published and installed.
	# Import-Module "$PSScriptRoot\..\src\ScriptModuleRepositoryTemplate" -Force
}

Describe 'New-PowerShellScriptModuleRepository' {
	It 'Should create a new directory with the module repository files' {
		# Arrange.
		$repositoryDirectoryPath = "$TestDrive\NewModuleRepo"
		$moduleName = 'NewModule'
		$organizationName = 'My Organization'

		$expectedModuleDirectoryPath = Join-Path -Path $repositoryDirectoryPath -ChildPath "src\$moduleName"
		$expectedModuleFilePath = Join-Path -Path $expectedModuleDirectoryPath -ChildPath "$moduleName.psm1"
		$expectedModuleManifestFilePath = Join-Path -Path $expectedModuleDirectoryPath -ChildPath "$moduleName.psd1"
		$expectedModuleTestsFilePath = Join-Path -Path $expectedModuleDirectoryPath -ChildPath "$moduleName.Tests.ps1"

		# Act.
		New-PowerShellScriptModuleRepository -RepositoryDirectoryPath $repositoryDirectoryPath -ModuleName $moduleName -OrganizationName $organizationName

		# Assert.
		$expectedModuleDirectoryPath | Should -Exist
		$expectedModuleFilePath | Should -Exist
		$expectedModuleManifestFilePath | Should -Exist
		$expectedModuleTestsFilePath | Should -Exist
	}
}
