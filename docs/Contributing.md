# Contributing to this project

Feel free to open an issue or pull request.

## 🚀 Publishing new versions

This project acts as a template repository in GitHub, meaning that as soon as a change is pushed to the `main` branch, it will be used when new GitHub repositories are created from this template.

This project also creates a PowerShell module that can be used to create new repositories.
A prerelease version of the module is published to the PowerShell Gallery automatically on every commit to the `main` branch.
The [GitHub Actions `deploy` workflow run](https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-test-and-deploy-powershell-module.yml) must be manually approved to publish a stable version.

### Incrementing the version number

The version number is of the format Major.Minor.Patch and follows [semantic versioning](https://semver.org).
By default, every commit to the `main` branch will increment the Patch version number.

If you want to increment the Major or Minor version number, you have 2 options:

1. Manually start a [`deploy` workflow](https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-test-and-deploy-powershell-module.yml) run and specify the version number to use.
   e.g. Specifying `2.4.0` will produce a new version of `2.4.0`.
1. Create a new version tag and pushing it up to GitHub.
   Builds are not triggered on tags, and thus the version tag will be used as the starting point for the next version.
   e.g. Creating a new tag of `v2.4.0` will produce a new version of `2.4.1` on the next commit to the `main` branch.

## Why are the template dot-files filenames prefixed with an underscore?

`Publish-Module` has a bug where it does not include any files or directories starting with `.` in the module NuGet package.
The newer `Publish-PSResource` has fixed this issue somewhat so the directories and some of the files are included, but it still leaves out some dot-files, like the `.gitignore` and `.editorconfig` files.
To work around these issues, we prefix the files with an underscore (e.g. `_.gitignore`) so that they are included in the module package, and then remove the underscore prefix during the file copy process of the `New-PowerShellScriptModuleRepository` cmdlet.

## ⁉ Why was a specific decision made

Curious about some of the choices made in this project?
The reasons may be documented in the [Architecture Decision Records](/docs/ArchitectureDecisionRecords/).
