param(
    [string]$TargetRoot = ""
)

$ErrorActionPreference = "Stop"

$projectRoot = if ($PSScriptRoot) { $PSScriptRoot } else { (Get-Location).Path }
$skillsRoot = Join-Path $projectRoot "skills"

if (-not (Test-Path $skillsRoot)) {
    throw "Cannot find skills directory: $skillsRoot"
}

if (-not $TargetRoot) {
    if ($env:CODEX_HOME) {
        $TargetRoot = Join-Path $env:CODEX_HOME "skills"
    } else {
        $TargetRoot = Join-Path $HOME ".codex\skills"
    }
}

New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null

$copied = @()
Get-ChildItem -Path $skillsRoot -Directory | ForEach-Object {
    $destination = Join-Path $TargetRoot $_.Name
    if (Test-Path $destination) {
        Remove-Item -LiteralPath $destination -Recurse -Force
    }
    Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
    $copied += $_.Name
}

Write-Output ("Installed skills to: " + $TargetRoot)
Write-Output ("Copied: " + ($copied -join ", "))
