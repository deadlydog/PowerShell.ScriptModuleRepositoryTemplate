🚧 This repo is still a work in progress and not yet ready to be used 🚧

<p align="center">
  <a href="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-and-test-powershell-module.yml"><img alt="Build status" src="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-and-test-powershell-module.yml/badge.svg"></a>
  <a href="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-test-and-deploy-powershell-module.yml"><img alt="Deploy status" src="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/actions/workflows/build-test-and-deploy-powershell-module.yml/badge.svg"></a>
  <a href="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/blob/main/License.md"><img alt="License" src="https://img.shields.io/github/license/deadlydog/PowerShell.ScriptModuleRepositoryTemplate.svg"></a>
  <a href="https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/blob/main/docs/Contributing.md"><img alt="PRs welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg"></a>
</p>

<p align="center">
  <a href="https://www.powershellgallery.com/packages/ScriptModuleRepositoryTemplate"><img alt="Stable PowerShell module version" src="https://img.shields.io/powershellgallery/v/ScriptModuleRepositoryTemplate.svg"></a>
  <a href="https://www.powershellgallery.com/packages/ScriptModuleRepositoryTemplate"><img alt="Prerelease PowerShell module version" src="https://img.shields.io/powershellgallery/vpre/ScriptModuleRepositoryTemplate.svg?include_prereleases&label=powershell%20gallery%20prerelease&colorB=yellow"></a>
  <a href="https://www.powershellgallery.com/packages/ScriptModuleRepositoryTemplate"><img src="https://img.shields.io/powershellgallery/dt/ScriptModuleRepositoryTemplate.svg"></a>
</p>

<p align="center">
  <!-- Must add 'Windows', 'MacOS', and 'Linux' to the module manifest tags for them to show up on the Platforms badge. -->
  <img src="https://img.shields.io/powershellgallery/p/ScriptModuleRepositoryTemplate.svg">
  <img src="https://img.shields.io/github/languages/top/deadlydog/PowerShell.ScriptModuleRepositoryTemplate.svg">
  <img src="https://img.shields.io/github/languages/code-size/deadlydog/PowerShell.ScriptModuleRepositoryTemplate.svg">
</p>

# PowerShell Script Module Repository Template

A template repository and module for creating new PowerShell script module repos quickly with boilerplate files and CI/CD workflows already defined.

## ✨ Features

Use this repo template or module for your new git repository to get the following features out-of-the-box:

- GitHub Actions workflows (Azure DevOps Pipelines YAML support coming soon) that:
  - Publish a prerelease version on every commit to the `main` branch, and a stable version once manually approved.
    - Can also manually trigger deployments of feature branches.
  - Version the module.
  - Run PSScriptAnalyzer to ensure best practices are followed.
  - Run build tests, and smoke tests on multiple platforms (Windows, Linux, MacOS).
  - Publish the module to the PowerShell Gallery or a custom feed.
  - Spell check all files in the repository.
  - Display test code coverage results on PRs.
- Visual Studio Code tasks to easily run Pester tests and PSScriptAnalyzer locally.
- A `.devcontainer` for use with Visual Studio Code's [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) and [GitHub Codespaces](https://github.com/features/codespaces).
- Boilerplate repository files, such as ReadMe, License, Changelog, .gitignore, .editorconfig, PR and Issue templates, and more.

This template/module does not require any additional modules or dependencies to be installed on your machine, or force you to learn a new build framework or language.

## 🚀 Get started

There are two ways to create your new PowerShell module repository:

1. Use the `New-PowerShellScriptModuleRepository` cmdlet to create a new repository, or
1. Create a new repository from this template in GitHub.

Both of these methods are described in more detail below.

Once the repository is created, follow the instructions in the repo's ReadMe file to complete the setup.
The non-transformed instructions can also be [viewed here](/src/ScriptModuleRepositoryTemplate/TemplateRepoFiles/ReadMe.md).

### 📂 Method 1: Use the New-PowerShellScriptModuleRepository cmdlet

Step 1: Install the `ScriptModuleRepositoryTemplate` module [from the PowerShell Gallery](https://www.powershellgallery.com/packages/ScriptModuleRepositoryTemplate):

```powershell
Install-Module -Name ScriptModuleRepositoryTemplate -Scope CurrentUser
```

Step 2: Create the new repository files:

```powershell
New-PowerShellScriptModuleRepository -RepositoryDirectoryPath 'C:\MyRepoName' -ModuleName 'MyModuleName' -OrganizationName 'My Name'
```

The above command will create a new directory at `C:\MyRepoName` with the boilerplate files and workflows for publishing your module already set up.

You can then perform a `git init` in that directory and push it to where you want your git repository hosted (e.g. Azure DevOps or GitHub).

To complete the setup, follow the instructions in the module repo's ReadMe file.

### 📄 Method 2: Create repository from GitHub template

If your repository will be hosted on GitHub, you can follow the steps below:

#### 🗍 Step 1: Create a new repo from this template

The official docs for creating a new repository from a template can [be found here](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
In short, the steps are:

1. Click the `Use this template` button at the top of the repository and choose `Create a new repository`.
1. Name your new repository (including your module's name is a good idea) and give it a description.
1. Click the `Create repository` button.
1. You should now have the new repository in your account with the name you chose.
1. Clone your new repository to your local machine to start making changes to it.

#### 🤖 Step 2: Replace repo template information

Run the [_InitializeRepository.ps1](/_InitializeRepository.ps1) script to update the repository files with your module's information.
You will be prompted to enter some information, such as:

- Your module's name (no spaces)
- Your name or organization name (may contain spaces)

Once the script completes, most of the repo files will be replaced.
You should commit the changes.

To complete the setup, follow the instructions in the repo's new ReadMe file (that replaced this one).

## 📋 Create your own template (optional)

Not happy with some of the default template configurations?
Maybe you don't like the .editorconfig settings, or want it to publish to your own internal PowerShell Gallery feed by default?
You can derive your own template from this repository and use it for your future modules, minimizing the custom changes you need to make every time you create a new repo.

To create your own template:

1. Fork [this repository on GitHub](https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate).
1. In GitHub, from your repo's `Settings` tab under the `General` section, rename the repository to reflect that it is a template and check the box to make it a `Template repository`.
1. Modify [the template repo files](/src/ScriptModuleRepositoryTemplate/TemplateRepoFiles/) with whatever customizations you want.
1. If you are introducing more replacement tokens in the files, you will need to update the `Set-TemplateTokenValuesInAllRepositoryFiles` function in the [ScriptModuleRepositoryTemplate.psm1](/src/ScriptModuleRepositoryTemplate/ScriptModuleRepositoryTemplate.psm1) file to handle them.

You can now create new repositories from your GitHub template in the same way you would use this one.

If you want to be able to create new repositories from a module, you will need to publish your module under a different name.

## ❤ Donate to support this template (optional)

Buy me a hot apple cider for providing this template open source and for free 🙂

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5MWSTSXNYEJWW)

## TODO

Things to still do:

- Add support for Azure DevOps.
- Allow user to create single .psm1 file or Public/Private directory structure for separate files per function.
- Allow using a custom PowerShell Gallery feed URL.
- Make azure DevOps and GitHub steps in the ReadMe collapsible.
  Have screenshots and links to a recording of the setup in both, since they involve clicking around in the UI.
  Perhaps link to [this tutorial for Azure DevOps](https://dev.to/olalekan_oladiran_d74b7a6/how-to-enable-continuous-integration-with-azure-pipelines-1doi)?
- Maybe support new deployments on tag creation.
