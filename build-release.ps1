# RasterPropMonitor MechJeb 2.15.1 Fork - Release Build Script
# This script builds the project and prepares a release package

param(
    [string]$KSPPath = "C:\Program Files (x86)\Steam\steamapps\common\Kerbal Space Program",
    [string]$OutputDir = ".\Release",
    [switch]$SkipBuild = $false
)

$ErrorActionPreference = "Stop"

# Resolve paths
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = $ScriptDir
$GameDataSource = Join-Path $ProjectRoot "GameData"
$ReleaseDir = Join-Path $ProjectRoot $OutputDir
$ReleaseGameData = Join-Path $ReleaseDir "GameData"

Write-Host "=== RasterPropMonitor MechJeb 2.15.1 Fork - Release Build ===" -ForegroundColor Cyan
Write-Host ""

# Verify KSP installation
if (-not (Test-Path $KSPPath)) {
    Write-Host "ERROR: KSP installation not found at: $KSPPath" -ForegroundColor Red
    Write-Host "Please specify the correct path using -KSPPath parameter" -ForegroundColor Yellow
    exit 1
}

$KSPGameData = Join-Path $KSPPath "GameData"
$KSPJSIFolder = Join-Path $KSPGameData "JSI\RasterPropMonitor"

if (-not (Test-Path $KSPJSIFolder)) {
    Write-Host "ERROR: FirstPersonKSP RasterPropMonitor not found in KSP installation" -ForegroundColor Red
    Write-Host "Please install the base RPM from: https://github.com/FirstPersonKSP/RasterPropMonitor/releases" -ForegroundColor Yellow
    exit 1
}

Write-Host "[1/5] Verifying KSP installation..." -ForegroundColor Green
Write-Host "  KSP Path: $KSPPath"
Write-Host "  JSI Path: $KSPJSIFolder"

# Check for required asset bundles
$ShaderBundle = Join-Path $KSPJSIFolder "rasterpropmonitor-shaders.assetbundle"
$FontBundle = Join-Path $KSPJSIFolder "rasterpropmonitor-font.assetbundle"

if (-not (Test-Path $ShaderBundle)) {
    Write-Host "ERROR: Shader bundle not found: $ShaderBundle" -ForegroundColor Red
    exit 1
}
if (-not (Test-Path $FontBundle)) {
    Write-Host "ERROR: Font bundle not found: $FontBundle" -ForegroundColor Red
    exit 1
}

Write-Host "  Found: rasterpropmonitor-shaders.assetbundle" -ForegroundColor DarkGray
Write-Host "  Found: rasterpropmonitor-font.assetbundle" -ForegroundColor DarkGray

# Build the project
if (-not $SkipBuild) {
    Write-Host ""
    Write-Host "[2/5] Building RasterPropMonitor.dll..." -ForegroundColor Green
    
    $MSBuild = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe"
    $RPMProject = Join-Path $ProjectRoot "RasterPropMonitor\RasterPropMonitor.csproj"
    
    & $MSBuild $RPMProject /p:Configuration=Release /t:Rebuild /v:minimal
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: RasterPropMonitor build failed" -ForegroundColor Red
        exit 1
    }
    
    Write-Host ""
    Write-Host "[3/5] Building MechJebRPM.dll..." -ForegroundColor Green
    
    $MechJebProject = Join-Path $ProjectRoot "MechJebRPM\MechJebRPM.csproj"
    & $MSBuild $MechJebProject /p:Configuration=Release /t:Rebuild /v:minimal
    if ($LASTEXITCODE -ne 0) {
        Write-Host "ERROR: MechJebRPM build failed" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host ""
    Write-Host "[2/5] Skipping build (using existing DLLs)..." -ForegroundColor Yellow
    Write-Host "[3/5] Skipping build (using existing DLLs)..." -ForegroundColor Yellow
}

# Clean and create release directory
Write-Host ""
Write-Host "[4/5] Preparing release package..." -ForegroundColor Green

if (Test-Path $ReleaseDir) {
    Remove-Item $ReleaseDir -Recurse -Force
}
New-Item -ItemType Directory -Path $ReleaseDir -Force | Out-Null
New-Item -ItemType Directory -Path "$ReleaseGameData\JSI\RasterPropMonitor\Plugins" -Force | Out-Null

# Copy DLLs from build output
$BuildOutput = Join-Path $ProjectRoot "bin\Release"
$PluginsDest = Join-Path $ReleaseGameData "JSI\RasterPropMonitor\Plugins"

Write-Host "  Copying built DLLs..." -ForegroundColor DarkGray
Copy-Item (Join-Path $BuildOutput "RasterPropMonitor.dll") $PluginsDest
Copy-Item (Join-Path $BuildOutput "MechJebRPM.dll") $PluginsDest

# Copy asset bundles from KSP installation (NOT from repo - ensures correct versions)
Write-Host "  Copying asset bundles from KSP installation..." -ForegroundColor DarkGray
$RPMDest = Join-Path $ReleaseGameData "JSI\RasterPropMonitor"
Copy-Item $ShaderBundle $RPMDest
Copy-Item $FontBundle $RPMDest

# Copy additional required files from repo GameData
Write-Host "  Copying configuration files..." -ForegroundColor DarkGray
$SourceJSI = Join-Path $GameDataSource "JSI"

# Copy Agencies
Copy-Item (Join-Path $SourceJSI "Agencies") (Join-Path $ReleaseGameData "JSI\Agencies") -Recurse

# Copy RPMPodPatches
Copy-Item (Join-Path $SourceJSI "RPMPodPatches") (Join-Path $ReleaseGameData "JSI\RPMPodPatches") -Recurse

# Copy Library folder
$LibrarySource = Join-Path $SourceJSI "RasterPropMonitor\Library"
$LibraryDest = Join-Path $RPMDest "Library"
Copy-Item $LibrarySource $LibraryDest -Recurse

# Copy plugin configuration files
$PluginsSource = Join-Path $SourceJSI "RasterPropMonitor\Plugins"
Copy-Item (Join-Path $PluginsSource "reduce-iva-cpu-usage.cfg") $PluginsDest
Copy-Item (Join-Path $PluginsSource "PluginData") (Join-Path $PluginsDest "PluginData") -Recurse
Copy-Item (Join-Path $PluginsSource "3rdPartyLicenses") (Join-Path $PluginsDest "3rdPartyLicenses") -Recurse

# Copy version file
Copy-Item (Join-Path $SourceJSI "RasterPropMonitor\RasterPropMonitor.version") $RPMDest

# Copy documentation
Write-Host "  Copying documentation..." -ForegroundColor DarkGray
Copy-Item (Join-Path $ProjectRoot "README.md") $ReleaseDir
Copy-Item (Join-Path $ProjectRoot "LICENSE.md") $ReleaseDir

# Create the zip file
Write-Host ""
Write-Host "[5/5] Creating release archive..." -ForegroundColor Green

$Version = "1.0.3-mechjeb2"  # Update this for each release
$ZipName = "RasterPropMonitor-MechJeb2-v$Version.zip"
$ZipPath = Join-Path $ProjectRoot $ZipName

if (Test-Path $ZipPath) {
    Remove-Item $ZipPath -Force
}

# Use Compress-Archive
Compress-Archive -Path "$ReleaseDir\*" -DestinationPath $ZipPath -CompressionLevel Optimal

$ZipSize = (Get-Item $ZipPath).Length / 1MB
Write-Host ""
Write-Host "=== Build Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Release package created: $ZipName" -ForegroundColor Green
Write-Host "Size: $([math]::Round($ZipSize, 2)) MB" -ForegroundColor Green
Write-Host ""
Write-Host "Package contents:" -ForegroundColor Yellow
Get-ChildItem $ReleaseDir -Recurse -File | ForEach-Object {
    $relativePath = $_.FullName.Replace($ReleaseDir, "").TrimStart("\")
    Write-Host "  $relativePath" -ForegroundColor DarkGray
}

Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Test the release package in a clean KSP installation"
Write-Host "  2. Upload $ZipName to SpaceDock"
Write-Host "  3. See SPACEDOCK_INSTRUCTIONS.md for upload guide"
Write-Host ""
