# Module manifest docs: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_module_manifests

@{

  # Script module or binary module file associated with this manifest.
  RootModule = 'ScriptModuleRepositoryTemplate.psm1'

  # Version number of this module.
  ModuleVersion = '0.0.0'

  # Supported PSEditions
  # CompatiblePSEditions = @()

  # ID used to uniquely identify this module
  GUID = '643e6cf9-a844-4a1e-9771-643226c06943'

  # Author of this module
  Author = 'Daniel Schroeder'

  # Company or vendor of this module
  CompanyName = 'Daniel Schroeder'

  # Copyright statement for this module
  Copyright = '(c) Daniel Schroeder. All rights reserved.'

  # Description of the functionality provided by this module
  Description = @'
This module does nothing, but is part of a template git repository that you can clone to create new PowerShell script modules quickly and easily with boilerplate files and CI/CD workflows already defined.

Checkout the template repository at https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate.
'@

  # Minimum version of the PowerShell engine required by this module
  PowerShellVersion = '3.0'

  # Name of the PowerShell host required by this module
  # PowerShellHostName = ''

  # Minimum version of the PowerShell host required by this module
  # PowerShellHostVersion = ''

  # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
  # DotNetFrameworkVersion = ''

  # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
  # ClrVersion = ''

  # Processor architecture (None, X86, Amd64) required by this module
  # ProcessorArchitecture = ''

  # Modules that must be imported into the global environment prior to importing this module
  # RequiredModules = @()

  # Assemblies that must be loaded prior to importing this module
  # RequiredAssemblies = @()

  # Script files (.ps1) that are run in the caller's environment prior to importing this module.
  # ScriptsToProcess = @()

  # Type files (.ps1xml) to be loaded when importing this module
  # TypesToProcess = @()

  # Format files (.ps1xml) to be loaded when importing this module
  # FormatsToProcess = @()

  # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
  # NestedModules = @()

  # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
  FunctionsToExport = @(
    'New-PowerShellScriptModuleRepository'
  )

  # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
  CmdletsToExport = @()

  # Variables to export from this module
  VariablesToExport = '*'

  # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
  AliasesToExport = @()

  # DSC resources to export from this module
  # DscResourcesToExport = @()

  # List of all modules packaged with this module
  # ModuleList = @()

  # List of all files packaged with this module
  # FileList = @()

  # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
  PrivateData = @{

    PSData = @{

      # Tags applied to this module. These help with module discovery in online galleries.
      Tags = @(
        'PowerShell'
        'Module'
        'Repository'
        'Template'
        'ScriptModule'
        'Repo'
        'GitHub'
        'Actions'
        'AzureDevOps'
        'DevOps'
        'Pipelines'
        'CICD'
        'Deploy'
      )

      # A URL to the license for this module.
      LicenseUri = 'https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/blob/main/License.md'

      # A URL to the main website for this project.
      ProjectUri = 'https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate'

      # A URL to an icon representing this module.
      # IconUri = ''

      # ReleaseNotes of this module
      ReleaseNotes = 'Changelog: https://github.com/deadlydog/PowerShell.ScriptModuleRepositoryTemplate/blob/main/Changelog.md'

      # Prerelease string of this module
      # Prerelease = ''

      # Flag to indicate whether the module requires explicit user acceptance for install/update/save
      # RequireLicenseAcceptance = $false

      # External dependent modules of this module
      # ExternalModuleDependencies = @()

    } # End of PSData hashtable

  } # End of PrivateData hashtable

  # HelpInfo URI of this module
  # HelpInfoURI = ''

  # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
  # DefaultCommandPrefix = ''

}
