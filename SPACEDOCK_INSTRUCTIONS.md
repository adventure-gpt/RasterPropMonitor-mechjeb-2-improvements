# SpaceDock Distribution Instructions

This guide walks you through uploading RasterPropMonitor - MechJeb 2.15.1 Fork to SpaceDock.

## Prerequisites

1. **SpaceDock Account** - Create an account at https://spacedock.info if you don't have one
2. **Built Release Package** - Run `.\build-release.ps1` to create the release zip
3. **Test the Package** - Install in a clean KSP 1.12.x installation and verify:
   - RPM loads without errors in KSP.log
   - MechJeb menus work in IVA
   - External cameras render properly

## Creating a New Mod on SpaceDock

### Step 1: Navigate to Upload
1. Go to https://spacedock.info
2. Log in to your account
3. Click "Add Mod" in the top navigation

### Step 2: Fill in Mod Details

**Basic Information:**
| Field | Value |
|-------|-------|
| Name | `RasterPropMonitor - MechJeb 2.15.1 Integration Fork` |
| Short Description | `RPM fork with near-complete MechJeb 2.15.1 interface parity - enables full MechJeb control from IVA cockpit displays` |
| License | `GPL-3.0` |
| Game | `Kerbal Space Program` |
| Game Version | `1.12.3` (or your target version) |

**Long Description (Markdown):**
```markdown
# RasterPropMonitor - MechJeb 2.15.1 Integration Fork

This fork of RasterPropMonitor provides **near-complete MechJeb 2.15.1 interface parity**, enabling full MechJeb autopilot control directly from IVA cockpit displays.

## Why This Fork?

The standard [FirstPersonKSP/RasterPropMonitor](https://github.com/FirstPersonKSP/RasterPropMonitor) was designed for older MechJeb versions. MechJeb 2.15.1 underwent significant internal refactoring that broke RPM's integration:
- Properties changed to fields
- Module structure reorganized
- New autopilot components

**This fork bridges that gap**, providing working MechJeb integration for modern KSP installations.

## Features

### Complete MechJeb 2.15.1 Support
- ✅ **Ascent Autopilot** - Full control over ascent profiles and orbit insertion
- ✅ **Landing Guidance** - Updated for new `MechJebModuleLandingGuidance` module
- ✅ **Maneuver Planner** - All operations work from RPM menus
- ✅ **Smart A.S.S.** - Attitude control modes
- ✅ **Node Executor** - Execute maneuver nodes
- ✅ **Rendezvous & Docking** - Autopilot control

### Additional Fixes
- Fixed external camera clipping (near clip plane set to 0.01m)
- Fixed camera transform parenting for KSP floating origin

## Requirements

- **Kerbal Space Program 1.12.x**
- **MechJeb 2.15.1** or later
- **Module Manager** (for IVA patches)

## Installation

1. Delete any existing `GameData/JSI/RasterPropMonitor` folder
2. Extract this package to your KSP `GameData` folder
3. Verify folder structure: `GameData/JSI/RasterPropMonitor/`

## Compatibility

This mod **replaces** the standard FirstPersonKSP RasterPropMonitor. Do not install both.

Compatible with:
- MechJeb 2.15.1+
- ASET Props/Avionics
- Most IVA mods that use RPM

## Links

- **GitHub**: https://github.com/adventure-gpt/RasterPropMonitor-mechjeb-2-improvements
- **Standard RPM (for non-MechJeb users)**: https://github.com/FirstPersonKSP/RasterPropMonitor
- **MechJeb 2**: https://github.com/MuMech/MechJeb2

## Credits

- Original RPM by Mihara and MOARdV
- FirstPersonKSP fork maintainers
- MechJeb 2 by MuMech team
```

**Source Code URL:** `https://github.com/adventure-gpt/RasterPropMonitor-mechjeb-2-improvements`

### Step 3: Upload the Release File

1. Click "Choose File" and select `RasterPropMonitor-MechJeb2-v1.0.3-mechjeb2.zip`
2. Set the version number to match (e.g., `1.0.3-mechjeb2`)
3. Add changelog notes:
   ```
   Initial release of MechJeb 2.15.1 integration fork
   
   - Complete MechJeb 2.15.1 wrapper implementation
   - Fixed ascent autopilot buttons and status
   - Fixed landing guidance for new module structure  
   - Fixed maneuver planner operation invocation
   - Fixed external camera clipping and positioning
   ```

### Step 4: Set Relationships

**Dependencies:**
- Module Manager (required)

**Recommendations:**
- MechJeb 2 (recommended)
- ASET Props Pack
- ASET Avionics Pack

**Conflicts:**
- FirstPersonKSP RasterPropMonitor (this replaces it)

### Step 5: Review and Publish

1. Preview your mod page
2. Verify all links work
3. Click "Publish"

## Updating the Mod

For future releases:

1. Build a new release: `.\build-release.ps1`
2. Go to your mod page on SpaceDock
3. Click "Create New Version"
4. Upload the new zip file
5. Set the new version number
6. Add changelog notes
7. Publish

## Version Numbering

Use semantic versioning with a `-mechjeb2` suffix:
- `1.0.3-mechjeb2` - Initial MechJeb 2.15.1 fork release
- `1.0.4-mechjeb2` - Bug fixes
- `1.1.0-mechjeb2` - New features

## Testing Checklist

Before uploading, verify:

- [ ] KSP loads without errors (check KSP.log)
- [ ] RPM monitors display correctly
- [ ] MechJeb menus appear in RPM
- [ ] Ascent autopilot can be enabled/disabled
- [ ] Landing autopilot works
- [ ] Maneuver nodes can be created
- [ ] External cameras render vessel and surroundings
- [ ] No errors in KSP.log during IVA use

## Support

For issues:
1. Check KSP.log for errors
2. Verify MechJeb 2.15.1+ is installed
3. Open an issue on GitHub: https://github.com/adventure-gpt/RasterPropMonitor-mechjeb-2-improvements/issues
