# Changelog

This page is a list of _notable_ changes made in each version.

## v1.1.0 - April 20, 2024

Features:

- Run Pester tests during the build on Windows PowerShell too, to catch backward-incompatible changes earlier.

Fixes:

- Use backslash instead of forward-slash to import module in Pester tests for Windows PowerShell backward compatibility.

## v1.0.0 - April 13, 2024

Features:

- Initial release.
  Currently only supports creating repos for GitHub Actions workflows that publish to the public PowerShell Gallery.
