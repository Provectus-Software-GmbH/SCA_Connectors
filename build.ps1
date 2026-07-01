$ErrorActionPreference = "Stop"

# Repo root where this script is located
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# Mappings: source packages -> destination connector folder
$mappings = @(
    @{
        Name = "SAP"
        Source = Join-Path $root "..\SCA_SAPConnector_AF\packages"
        DestConnector = Join-Path $root "SAP Connector"
    },
    @{
        Name = "HubSpot"
        Source = Join-Path $root "..\SCA_HubSpotConnector_AF\packages"
        DestConnector = Join-Path $root "HubSpot Connector"
    },
    @{
        Name = "Salesforce"
        Source = Join-Path $root "..\SCA_SalesForceConnector_AF\packages"
        DestConnector = Join-Path $root "Salesforce Connector"
    },
    @{
        Name = "AAD-Cache"
        Source = Join-Path $root "..\SCA_AADCache_AF\AADcacheForSecureContactsApp\packages"
        DestConnector = Join-Path $root "AAD-Cache Connector"
    }
)

foreach ($map in $mappings) {
    $source = $map.Source
    $destConnector = $map.DestConnector

    if (-not (Test-Path -LiteralPath $source)) {
        Write-Warning "[$($map.Name)] Source not found: $source"
        continue
    }

    if (-not (Test-Path -LiteralPath $destConnector)) {
        New-Item -ItemType Directory -Path $destConnector -Force | Out-Null
    }

    # Clear destination first so it matches source packages content exactly
    Get-ChildItem -LiteralPath $destConnector -Force | Remove-Item -Recurse -Force

    # Copy only content of source packages folder (not the packages folder itself)
    Get-ChildItem -LiteralPath $source -Force | Copy-Item -Destination $destConnector -Recurse -Force

    Write-Host "[$($map.Name)] Copied content: $source -> $destConnector"
}

Write-Host "Done."