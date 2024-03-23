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
