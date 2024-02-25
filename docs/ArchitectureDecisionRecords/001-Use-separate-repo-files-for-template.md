# 001 - Use separate repo files for template

## Status

Accepted 2024-02-25

## Context

When I originally conceived of this template repository I was just going to have the template files be this actual repo's files, and I started out the implementation that way.
When writing the script that would be used to initialize the template repository with the user's module information, I had to keep track of which files in the repo would need to be updated (e.g. the new module directory and files, License, Changelog, Smoke Tests).
This had me questioning if it would be better to use totally separate files for all of the template files, and just have the initialization script overwrite all of the repo contents with the template files.

## Options Considered

1. Use this repo's files as the template files.
1. Use separate files for all of the template files (stored in their own directory).

### Use this repo's files as the template files

Pros:

- Fewer files in the repo.
- Possibly less confusing to the user, as it follows the traditional idea of what a template repository is.
e.g. the files in the repo are where you start from.

### Use separate files for all of the template files

Pros:

- Less logic in the initialization script, as we don't need to keep track of which files are for the repo and which are for the template.
- Easier to update the template files without having to worry about the repo files.
- Less confusion about which files are for this repo vs. which are for the template.
- Allows users to more easily create their own custom template files easier if they want to; they just need to update the template files.
- Allows for the PowerShell module to be able to create new starter repos, rather than having to clone the GitHub repo template.

Cons:

- Some of the files in the repo will be duplicates of the template files, so when adding new feature/changes we may need to remember to make them in both this repo and the template files.

## Decision

We are going to store all of the template repo files in their own directory, as this separation makes it easier to understand which files are part of the template and which are part of this repo.
It also allows for users to more easily create their own custom templates, and to use the PowerShell module to create new starter repos.
