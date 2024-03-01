# Template PowerShell Script Module Repository

🚧 This repo is still a work in progress and not yet ready to be used 🚧

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
1. Name your new repository (including your module name is a good idea) and give it a description.
1. Click the `Create repository` button.
1. You should now have the new repository in your account with the name you chose.
1. Clone your new repository to your local machine to start making changes to it.

### 🤖 Step 2: Replace repo template information

Run the [_InitializeRepository.ps1](/_InitializeRepository.ps1) script to update the repository files with your module's information.
You will be prompted to enter the following information:

- Your module's name (no spaces)
- Your name or organization name (may contain spaces)

Once the script completes, most of the repo files will be replaced and there will be some additional steps to follow in the [new ReadMe file](/src/Template.PowerShell.ScriptModule/TemplateRepoFiles/ReadMe.md) that replaces this one.

## 📋 Create your own template (optional)

Now that you have the repository looking the way you want, you may want to use it as a template for your future modules so that you don't have to make all of the same changes each time.
In GitHub, from the repo's `Settings` tab under the `General` section, you can rename the repository to reflect that it is a template and check the box to make it a `Template repository`.

The caveat here is you have already ran the script that updated the repository files with your module's name and other information.
In your template repo, you would want to add instructions to do a find-and-replace on the repository files to update the module's name, and any other information you want changed for new modules created from your template.

## ❤ Donate to support this template (optional)

Buy me a hot apple cider for providing this template open source and for free 🙂

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=5MWSTSXNYEJWW)

## TODO

Things to still do:

- Create new deployment on tag creation maybe
- Add instructions for how to assign version number in the contributing docs depending on if they are using actions or pipelines
- Prompt user for module name, org name, pipelines or actions, PowerShell gallery or custom feed with an option to leave it blank to - fill it in later
- Show instructions for granting GitHub permissions etc. during the prompt script
- Rename function to Get-TemplateDescription or similar and have it explain the module and a link to it.
- Make azure DevOps and GitHub steps in the ReadMe collapsible.
  Have screenshots and link to recording of the setup in both, since they involve clicking around in the UI.
  Perhaps link to [this tutorial](https://dev.to/olalekan_oladiran_d74b7a6/how-to-enable-continuous-integration-with-azure-pipelines-1doi)?
- In the ReadMe setup instructions or above, have a sentence or two explaining the layout of the ReadMe, or maybe a table of contents
- Add some badges as well to the ReadMe.
- Look at improving GitHub issue and PR templates: https://raw.githubusercontent.com/PowerShell/vscode-powershell/main/.github/ISSUE_TEMPLATE/bug-report.yml
- Update the module to be able to create new repos without using GitHub template. Have a New-PowerShellScriptModuleRepository cmdlet
- To prevent having to store CI/CD manual setup images in the repo, maybe have them as an external link to a GitHub branch.
  - Also create videos showing how to do the setup.
- Add a simple PowerShell devcontainer for both this repo and the template.
