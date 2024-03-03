using module './ScriptModuleRepositoryTemplate.psm1'

Describe 'New-PowerShellScriptModuleRepository' {
	It 'Should create a new directory with the module repository files' {
		# Arrange.
		$repositoryDirectoryPath = "$TestDrive\NewModule"
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
