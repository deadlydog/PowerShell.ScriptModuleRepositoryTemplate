using module '.\ScriptModuleRepositoryTemplate.psm1'

Describe 'New-PowerShellScriptModuleRepository' {
	BeforeEach {
		[string] $TemporaryRepoPath = "$TestDrive\NewModule"
		if (Test-Path -Path $TemporaryRepoPath) {
			Remove-Item -Path $TemporaryRepoPath -Recurse -Force
		}
	}

	It 'Should create a new directory with the module repository files using the specified module name' {
		# Arrange.
		$repositoryDirectoryPath = $TemporaryRepoPath
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

	It 'Should replace all dot-files and dot-directories prefixed with an underscore to remove the underscore' {
		# Arrange.
		$repositoryDirectoryPath = $TemporaryRepoPath
		$moduleName = 'NewModule'
		$organizationName = 'My Organization'

		$expectedDotDirectoryPath = Join-Path -Path $repositoryDirectoryPath -ChildPath ".vscode"
		$expectedDotFilePath = Join-Path -Path $repositoryDirectoryPath -ChildPath ".gitignore"

		# Act.
		New-PowerShellScriptModuleRepository -RepositoryDirectoryPath $repositoryDirectoryPath -ModuleName $moduleName -OrganizationName $organizationName

		# Assert.

		# No files should start with '_.'
		$repoFilePaths = Get-ChildItem -Path $repositoryDirectoryPath -Recurse -Force
		$repoFilePaths | ForEach-Object {
			[string] $fileName = $_.Name
			$fileName | Should -Not -Match '^_\.'
		}

		# Verify at least one Dot directory and file were renamed properly.
		$expectedDotDirectoryPath | Should -Exist
		$expectedDotFilePath | Should -Exist
	}
}
