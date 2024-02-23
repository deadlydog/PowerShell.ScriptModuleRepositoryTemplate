# Template PowerShell Script Module Repository

A template repository to create new PowerShell modules quickly with boilerplate files and CI/CD workflows already defined.

## ✨ Features

Use this template for your new git repository to get the following features out-of-the-box:

- GitHub Actions workflows or Azure DevOps Pipelines YAML files that:
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

## 📄 Template setup instructions

Use this template to create a new repository for your PowerShell module.
Follow the instructions below to get started.

### 🗍 Step 1: Create a new repo from this template

The official docs for creating a new repository from a template can [be found here](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).
In short, the steps are:

1. Click the `Use this template` button at the top of the repository and choose `Create a new repository`.
1. Name your new repository and give it a description.
1. Click the `Create repository` button.
1. You should now have the new repository in your account with the name you chose.
1. Clone your new repository to your local machine to start making changes to it.

### 🤖 Step 2: Replace repo template information

Run the [_InitializeRepository.ps1](/_InitializeRepository.ps1) script to update the repository files with your module's information.
You will be prompted to enter the following information:

- Your module's name (no spaces)
- Your name or organization name (may contain spaces)

<details>
<summary>Click to see the high-level operations the script performs</summary>

The script performs the following actions:

- Replaces `Template.PowerShell.ScriptModule` with your module's name.
- Replaces `Daniel Schroeder` with your name or organization name.
- Updates the PowerShell module manifest's `GUID` property with a new unique GUID.

</details>

For information that can not be updated automatically, perform the following actions after running the above script:

1. Search for `UPDATE ME` in the repository and update the file accordingly.

### ➕ Step 3: Add your module

If you already have a module written, add the module's `.psm1` and `.psd1` files to the `src` directory, replacing the existing files.

<!-- 1. Add your module to the `src` directory.
   1. If you already have a module written:
      1. Add the `.psm1` and `.psd1` files directly to the `src` directory.
      1. Delete the `Template.PowerShell.ScriptModule.psm1` and `Template.PowerShell.ScriptModule.psd1` files from the `src` directory.
   1. If you have not written the module yet:
      1. Rename the `Template.PowerShell.ScriptModule.psm1` and `Template.PowerShell.ScriptModule.psd1` files in the `src` directory to match your module name.
1. Perform a find-and-replace across the entire repository to replace `Template.PowerShell.ScriptModule` with your module's name (no spaces). -->

### 🚀 Step 4: Update your CI/CD workflows

This template includes CI/CD workflows for building and publishing the PowerShell module using both GitHub Actions and Azure DevOps Pipelines.
Follow the instructions for the CI/CD system you plan to use.

#### 🐙🐱 GitHub Actions

If using GitHub Actions for your CI/CD workflows, perform the following steps:

#### ♻️ Azure DevOps Pipelines

If using Azure DevOps Pipelines for your CI/CD pipelines, perform the following steps:

### ✔ Step 5: Review and update boilerplate repo files

The following boilerplate git repository files should be reviewed and updated or removed.

Will require changes:

- [License](/License.md): Update to match your module's license, and ensure it uses the correct name in the copyright.
- [CODEOWNERS](/.github/CODEOWNERS): Update to match your module's maintainers, or remove this file.
- [FUNDING](/.github/FUNDING.yml): Update to match your module's donation information, or remove this file.
- [ReadMe](/ReadMe.md): Update with your module's information.

May require changes:

- Module manifest: Update the module manifest (the `.psd1` file in the `src` directory) with your module's information.
- [Changelog](/Changelog.md): If you don't plan to track a changelog, remove this file and it's reference from the ReadMe.
- [Contributing](/docs/Contributing.md): Update to match your module's contributing guidelines, or remove it.
- [Architectural Decision Records](/docs/ArchitectureDecisionRecords/): Remove this directory if you don't plan to use ADRs, and it's reference from the Contributing page.
- [bug_report](/.github/ISSUE_TEMPLATE/bug_report.md), [feature_request](/.github/ISSUE_TEMPLATE/feature_request.md), [pull_request_template](/.github/pull_request_template.md): Update the bug report, feature request, and pull request templates as needed to meet your requirements, or remove them.
- Build and deployment workflows: The workflows include extra steps that you may not want, such as spell check, code coverage, etc.
  Review the workflows and remove any steps that you don't want to include in your CI/CD pipeline.

### 📋 Step 6 (optional): Create your own template

Now that you have the repository looking the way you want, you may want to use it as a template for your future modules so that you don't have to make all of the same changes each time.
In GitHub, from the repo's `Settings` tab under the `General` section, you can rename the repository to reflect that it is a template and check the box to make it a `Template repository`.

The caveat here is you have already ran the script that updated the repository files with your module's name and other information.
In your template repo, you would want to add instructions to do a find-and-replace on the repository files to update the module's name, and any other information you want changed for new modules created from your template.

### ❤ Step 7 (optional): Donate to support this template

Buy me a hot apple cider for providing this template open source and for free 🙂

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5MWSTSXNYEJWW)

### ❌ Step 8: Remove this section and everything above once setup is complete

> [!IMPORTANT]
> All of the information above can be deleted once you have your module setup and the CI/CD pipeline workflows are working.
>
> Modify the information below for your new module, or just delete it all to have a blank canvas.

---

## 💬 Description

A short description of what this project does.

## ❓ Why this exists

A short description of why this project exists.
What use-case is it meant to solve?

## ✨ Features

List the features of this project:

- Feature 1
- Feature 2

## 🚀 Quick start

A quick guide on how to get started with this module, including installation and usage:

- A link to the module in the PowerShell Gallery.
- Code snippets of installing and using the module.
- Links to wiki or other documentation.

## ➕ How to contribute

Issues and Pull Requests are welcome.
See [the Contributing page](docs/Contributing.md) for more details.

## 📃 Changelog

See what's changed in the application over time by viewing [the changelog](Changelog.md).
