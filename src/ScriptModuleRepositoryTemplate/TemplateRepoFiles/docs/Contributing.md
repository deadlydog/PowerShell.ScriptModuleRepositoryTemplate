# Contributing to this project

Feel free to open an issue or pull request.

## 💻 Local development

This PowerShell module is developed using Visual Studio Code.
If you encounter any issues developing on your local machine, you can use [Docker Desktop](https://www.docker.com/products/docker-desktop/) and the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) VS Code extension to develop in a Docker container with all of the required dependencies, so that you do not have to install them locally.
You may also develop in your web browser with GitHub Codespaces to avoid needing to put any code or dependencies on your local machine.

### 🛠️ Building and testing

The code is built and tested by CI/CD pipelines on every commit to the `main` branch and every PR opened against the `main` branch.

When developing locally, you can use [the VS Code tasks](/.vscode/tasks.json) to simulate the build and test process and be notified of any problems before pushing your code up to the remote repository.
In VS Code, open the command palette (Ctrl+Shift+P) and select `Tasks: Run Build Task` or `Tasks: Run Test Task`.

When you run the build task, it will run PSScriptAnalyzer and CSpell spellcheck.
If CSpell flags a word as `unknown` that is not misspelled, you can add it to the `.cspell.json` file in the root of the repository to have it ignore the word.

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
