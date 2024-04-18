# Contributing to this project

Feel free to open an issue or pull request.

## 🚀 Publishing new versions

A prerelease version of the module is published automatically on every commit to the `main` branch.
The [GitHub Actions `deploy` workflow](/.github/workflows/build-test-and-deploy-powershell-module.yml) run must be manually approved to publish a stable version.

### Incrementing the version number

The version number is of the format Major.Minor.Patch and follows [semantic versioning](https://semver.org).
By default, every commit to the `main` branch will increment the Patch version number.

If you want to increment the Major or Minor version number, you have 2 options:

1. Manually start a [`deploy` workflow](/.github/workflows/build-test-and-deploy-powershell-module.yml) run and specify the version number to use.
   e.g. Specifying `2.4.0` will produce a new version of `2.4.0`.
1. Create a new version tag and pushing it up to GitHub.
   Builds are not triggered on tags, and thus the version tag will be used as the starting point for the next version.
   e.g. Creating a new tag of `v2.4.0` will produce a new version of `2.4.1` on the next commit to the `main` branch.

## 🧪 Smoke tests

[The Smoke tests](/deploy/Invoke-SmokeTests.ps1) are used during the CI/CD workflow to verify that the module is working as expected after it is published to the gallery.
The smoke tests are ran on Windows, MacOS, and Linux agents to ensure cross-platform compatibility, as well as against a Windows PowerShell 5.1 agent to ensure backward compatibility.

The difference between the smoke tests and the regular tests is that the smoke tests rely on the module actually being installed, not just the files being present.
This means they can only test the functions and aliases that are exported from the module manifest and publicly accessible.
This is the reason why we must use different files for the smoke tests than the regular tests; regular tests can test private functions and variables, but smoke tests cannot.

You do not need to run every public function test in the smoke tests, but it can help give you confidence that the module is truly cross-platform and backward compatible.
If you do not want to run any smoke tests, you can comment out all of the code in the smoke tests file.
The CI/CD workflow will still validate that the module can be installed on each platform.
