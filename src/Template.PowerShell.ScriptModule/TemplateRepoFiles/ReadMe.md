# Finish setting up your repo

> [!IMPORTANT]
> Congratulations on initializing your repository! 🎉
> 🚧 You are not quite done yet though. 🚧
> Complete the following steps to finish setting up your repository.

## 📄 Template setup instructions

Steps 1 and 2 were already performed to get this far.

### ➕ Step 3: Add your module (if applicable)

If you already have the module, manifest, and tests written, replace the following files with your module's files:

- [__NewModuleName__.psm1](/src/__NewModuleName__/__NewModuleName__.psm1)
- [__NewModuleName__.psd1](/src/__NewModuleName__/__NewModuleName__.psd1)
- [__NewModuleName__.Tests.ps1](/src/__NewModuleName__/__NewModuleName__.Tests.ps1)

Otherwise, use these files as a starting point for your new module.

### 🚀 Step 4: Update your CI/CD workflows

This template includes CI/CD workflows for building and publishing the PowerShell module using both GitHub Actions and Azure DevOps Pipelines.
Follow the instructions for the CI/CD system you plan to use.

#### GitHub Actions

If using GitHub Actions for your CI/CD workflows, perform the following steps:

#### Azure DevOps Pipelines

Coming soon.

### ✔ Step 5: Review and update boilerplate repo files

The following boilerplate git repository files should be reviewed and updated or removed as needed.

- [__NewModuleName__.psd1](/src/__NewModuleName__/__NewModuleName__.psd1): Update the module manifest with your module's information.
- [Changelog](/Changelog.md): If you don't plan to track a changelog, remove this file and it's reference from the ReadMe.
- [License](/License.md): Update to match your module's license, and ensure it uses the correct name in the copyright.
- [Contributing](/docs/Contributing.md): Update to match your module's contributing guidelines, or remove it.
- [bug_report](/.github/ISSUE_TEMPLATE/bug_report.md), [feature_request](/.github/ISSUE_TEMPLATE/feature_request.md), [pull_request_template](/.github/pull_request_template.md): Update these GitHub templates as needed to meet your requirements, or remove them.
- Build and deployment workflows: The workflows include extra steps that you may not want, such as spell check, code coverage, etc.
  Review the workflows and remove any steps that you don't want to include in your CI/CD pipeline.
- [ReadMe](/ReadMe.md): Update this file with your module's information.
  Some example template content is provided below; fill it out, or remove it and write your own.

> [!IMPORTANT]
> If you've made it this far, your repository is now ready for use! 🎉
> You may delete this and all of the content above and commit any changes you've made.

# __NewModuleName__ PowerShell Module

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
- Code examples of installing and and using the module.
- Links to wiki or other documentation.

## ➕ How to contribute

Issues and Pull Requests are welcome.
See [the Contributing page](docs/Contributing.md) for more details.

## 📃 Changelog

See what's changed in the application over time by viewing [the changelog](Changelog.md).
