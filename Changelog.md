# Changelog

This page is a list of _notable_ changes made in each version.

## v1.2.0 - March 27, 2025

Features:

- Add VS Code task to run CSpell spellcheck when building, as well as a stand-alone VS Code task.
- Update dev container to the latest PowerShell image and have it install PSScriptAnalyzer, Pester, and CSpell.
- Update default Contributing.md to include information around local development and building.

## v1.1.0 - April 20, 2024

Features:

- Run Pester tests during the build on Windows PowerShell too, to catch backward-incompatible changes earlier.

Fixes:

- Use backslash instead of forward-slash to import module in Pester tests for Windows PowerShell backward compatibility.

## v1.0.0 - April 13, 2024

Features:

- Initial release.
  Currently only supports creating repos for GitHub Actions workflows that publish to the public PowerShell Gallery.
