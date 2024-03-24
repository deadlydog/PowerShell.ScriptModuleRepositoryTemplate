# Finish setting up your repo

> [!IMPORTANT]
> Congratulations on initializing your repository! 🎉
>
> 🚧 You are not quite done yet though. 🚧
>
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

#### 🔑 Create a PowerShell Gallery API Key

In order to publish the module to the gallery, you need to get an API key.
If you already have an API key that you want to use, you can skip to the next step.

> [!CAUTION]
> It is considered best practice to use a different API key for each module you publish.
> It reduces the impact scope if one of the API keys becomes compromised.

If you will be publishing the module to a custom PowerShell Gallery feed, you will need to get an API key for that feed. Otherwise, follow the steps below.

<details>
<summary>Click to view steps to create a new API Key for the PowerShell Gallery...</summary>

1. Navigate to <https://www.powershellgallery.com/account/apikeys>, and login if necessary.
1. Click `Create` to create a new API key for this module.
1. For the `Key Name` it is a good idea to include the name of your module.
   e.g. `__NewModuleName__ module CI/CD pipeline`
1. Ensure the `Push new packages and package versions` scope is selected.
1. For the `Glob Pattern` enter the name of your module: `__NewModuleName__`
1. Click the `Create` button to create the API key.
1. Click the `Copy` button on the new API key to copy it to your clipboard, as you will need it for the next section.

You may want to leave this page open in your browser until you have the API key saved in your repository secrets in the next section.

</details>

#### ▶ GitHub Actions and Azure DevOps Pipelines setup instructions

Building and publishing the PowerShell module using GitHub Actions and Azure DevOps Pipelines are both supported.
Follow the instructions for the CI/CD platform you plan to use.

<details>
<summary>Click to see GitHub setup instructions...</summary>

If using GitHub Actions for your CI/CD workflows, perform the following steps to setup your API key as a repository secret:

1. Navigate to your GitHub repository in your browser.
1. Go to the `Settings` tab for your repository.
1. In the left-hand menu, in the `Security` section, click on `Secrets and variables` and select `Actions`.
1. In the `Secrets` tab click the `New repository secret` button.
1. Set the `Name` to: `POWERSHELL_GALLERY_API_KEY`
1. Set the `Secret` to the API key value that you copied in the previous section.

Next we want to create an Environment so that stable module versions require manual approval before being published to the gallery:

1. You should still be in the `Settings` section of your repository.
1. In the left-hand menu, in the `Environments` section, click on `Environments`.
1. Click the `New environment` button.
1. Set the `Name` to (all lowercase): `production`
1. Click the `Configure environment` button.
1. Check the `Required reviewers` checkbox and add the usernames of the people allowed to approve new stable version deployments.
1. Click the `Save protection rules` button.

If your GitHub account does not meet [the requirements to use `Environments`](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment), the `Environments` section will not be available.
You will instead need to add [the Manual Workflow Approval action](https://github.com/marketplace/actions/manual-workflow-approval) to [the deployment workflow](/.github/workflows/build-test-and-deploy-powershell-module.yml) to block deployments until they are approved.

Finally, we will need to grant GitHub Actions permission to add git tags to the repository so it can keep track of the version number:

1. You should still be in the `Settings` section of your repository.
1. In the left-hand menu, in the `Code and automation` section, click on `Actions` and select `General`.
1. Scroll down to `Workflow permissions` and ensure `Read and write permissions` is selected.
1. Click the `Save` button.

If you do not do this you will get the following error in the `Set the new version tag` step of the deployment workflow:

```text
fatal: unable to access 'https://github.com/<Author>/<Repo>/': The requested URL returned error: 403
```

</details>

<details>
<summary>Click to see Azure DevOps setup instructions...</summary>

Coming soon.

</details>

### ✔ Step 5: Review and update boilerplate repo files

The following boilerplate git repository files should be reviewed and updated or removed as needed.

- [__NewModuleName__.psd1](/src/__NewModuleName__/__NewModuleName__.psd1): Update the module manifest with your module's information.
- [Changelog](/Changelog.md): If you don't plan to track a changelog, remove this file and it's reference from the ReadMe.
- [License](/License.md): Update to match your module's license, and ensure it uses the correct name and year in the copyright.
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
