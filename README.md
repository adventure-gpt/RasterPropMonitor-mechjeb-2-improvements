# RasterPropMonitor - MechJeb 2.15.1 Integration Fork

> 🚀 **COMPLETE MECHJEB 2.15.1 IVA INTERFACE** - Do nearly everything you can do with MechJeb's IMGUI menus, right from your cockpit displays

[![GitHub](https://img.shields.io/badge/GitHub-adventure--gpt-blue)](https://github.com/adventure-gpt/RasterPropMonitor-mechjeb-2-improvements)
[![KSP Version](https://img.shields.io/badge/KSP-1.12.x-green)](https://www.kerbalspaceprogram.com/)
[![License](https://img.shields.io/badge/License-GPL--3.0-orange)](LICENSE.md)

---

## Why This Fork Exists

**The Problem:** MechJeb 2.15.1 underwent massive internal refactoring. The standard [FirstPersonKSP/RasterPropMonitor](https://github.com/FirstPersonKSP/RasterPropMonitor) was designed for older MechJeb versions and its MechJeb integration is **completely broken** with MechJeb 2.15.1+:

- Properties changed to fields (camelCase → PascalCase throughout)
- Module structures reorganized (`MechJebModuleLandingGuidance` vs `MechJebModuleLandingAutopilot`)
- Ascent autopilot bindings renamed
- Maneuver planner internals changed
- Target controller API changed

**The Solution:** This fork is a **complete and total overhaul** of the MechJeb integration layer. It's not just a compatibility patch—it's a ground-up reimplementation that gives you **near-complete feature parity** with MechJeb 2.15.1's IMGUI interface, all accessible from your IVA cockpit displays.

---

## ✨ A Complete IVA MechJeb Experience

**You can do nearly everything you can do with MechJeb's IMGUI menus using this fork's RPM monitors.** This isn't a basic autopilot toggle—it's a comprehensive flight computer interface.

### Feature Comparison

| Feature | Standard RPM | This Fork |
|---------|:------------:|:---------:|
| Ascent Autopilot | ❌ Broken | ✅ **Full Control** |
| Landing Guidance | ❌ Broken | ✅ **Full Control** |
| Maneuver Planner | ❌ Broken | ✅ **All 18 Operations** |
| Smart A.S.S. | ⚠️ Partial | ✅ **Full Control** |
| Node Executor | ⚠️ Partial | ✅ **Full Control** |
| Rendezvous Autopilot | ❌ Broken | ✅ **Full Control** |
| Docking Autopilot | ❌ Broken | ✅ **Full Control** |
| Translatron | ❌ Missing | ✅ **Full Control** |
| Rover Autopilot | ❌ Missing | ✅ **Full Control** |
| Aircraft Autopilot | ❌ Missing | ✅ **Full Control** |
| Spaceplane Guidance | ❌ Missing | ✅ **Full Control** |
| Info Displays | ⚠️ Partial | ✅ **All Readouts** |

---

## 🎯 Complete Feature Breakdown

### Attitude Control (Smart A.S.S.)
- **Orbital Modes:** Prograde, Retrograde, Normal+/-, Radial+/-
- **Surface Modes:** Surface Prograde/Retrograde, Horizontal+/-  
- **Target Modes:** Target+/-, Relative Vel+/-, Parallel+/-
- **Advanced:** Node, Sun, Hold, Custom Pitch/Heading/Roll

### Ascent Guidance
- Target apoapsis and inclination
- Launch to plane of target
- Autopilot engage/disengage
- Real-time ascent profile control
- Stage tracking during ascent

### Landing Guidance  
- Target landing site selection
- Pick target on map
- Touchdown speed control
- Gear/chute deployment timing
- Landing prediction display
- Full autopilot control

### Maneuver Planner - ALL 18 MECHJEB OPERATIONS
| Operation | Description |
|-----------|-------------|
| Circularize | At apoapsis, periapsis, or specific altitude |
| Change Apoapsis | Raise/lower apoapsis |
| Change Periapsis | Raise/lower periapsis |
| Change Both Pe & Ap | Single-burn orbit shaping |
| Change Inclination | Plane change maneuvers |
| Change LAN | Longitude of ascending node |
| Change Semi-Major Axis | Direct SMA targeting |
| Change Surface Longitude | Apsis longitude |
| Change Eccentricity | Direct eccentricity control |
| Resonant Orbit | For satellite constellations |
| Hohmann Transfer | Two-impulse transfers |
| Match Planes | Plane change to target |
| Match Velocities | Relative velocity kill |
| Intercept at Time | Lambert solver intercepts |
| Fine-tune Approach | Course corrections |
| Return from Moon | Optimal moon return |
| Interplanetary Transfer | Basic transfer windows |
| Advanced Transfer | Porkchop plots & optimization |

### Rendezvous Autopilot
- Approach distance setting
- Full autopilot sequencing
- Relative velocity readouts
- Target distance tracking

### Docking Autopilot
- Port-to-port alignment
- Speed limit controls
- Roll control option
- Force alignment modes
- Real-time guidance

### Translatron (Translation Control)
- Vertical speed hold
- Surface speed control
- Keep vertical mode
- Low throttle protection

### Rover Autopilot
- Waypoint navigation
- Heading hold
- Speed control
- Stability assist

### Aircraft Autopilot
- Altitude hold
- Heading hold
- Vertical speed control
- Speed control
- Bank angle limits

### Spaceplane Guidance
- Approach guidance
- Final approach control
- Runway targeting

### Node Executor
- Execute next node
- Auto-warp to node
- Lead time configuration
- Tolerance settings

### Utilities Menu
- Auto-staging toggle
- RCS balancer
- Antenna control
- Solar panel control
- Stage stats refresh

### Additional Fixes

- **External Camera Rendering** - Fixed clipping issues (near clip plane 0.01m)
- **Camera Transform Parenting** - Proper handling of KSP's floating origin system
- **Asset Bundle Loading** - Compatible with FirstPersonKSP unified shader bundle

---

## 📦 Installation

### Requirements
- **Kerbal Space Program 1.12.x**
- **MechJeb 2.15.1** or later
- **Module Manager** (for IVA patches)

### Install Steps

1. **Remove existing RPM** - Delete `GameData/JSI/RasterPropMonitor` if present
2. **Extract this package** - Copy contents to your KSP `GameData` folder
3. **Verify structure:**
   ```
   GameData/
   └── JSI/
       ├── Agencies/
       ├── RasterPropMonitor/
       │   ├── Library/
       │   ├── Plugins/
       │   │   ├── RasterPropMonitor.dll
       │   │   └── MechJebRPM.dll
       │   ├── rasterpropmonitor-shaders.assetbundle
       │   └── rasterpropmonitor-font.assetbundle
       └── RPMPodPatches/
   ```

### ⚠️ Important
This fork **replaces** the standard FirstPersonKSP RasterPropMonitor. **Do NOT install both.**

---

## 🎯 Who Should Use This Fork?

### Use This Fork If:
- ✅ You use **MechJeb 2.15.1 or later**
- ✅ You want **FULL MechJeb control from IVA** - not just basic toggles
- ✅ You want to plan maneuvers, execute transfers, and run autopilots without leaving your cockpit
- ✅ You want the same functionality as MechJeb's IMGUI windows, but on your RPM monitors
- ✅ MechJeb buttons in standard RPM do nothing or cause errors

### Use Standard FirstPersonKSP Fork If:
- You don't use MechJeb at all
- You use an older MechJeb version (pre-2.15)
- You only need basic RPM functionality (readouts, cameras) without autopilot integration

**Standard Fork:** https://github.com/FirstPersonKSP/RasterPropMonitor

---

## 💡 What Makes This Different

The standard FirstPersonKSP RPM has a handful of MechJeb buttons that mostly don't work with MechJeb 2.15.1.

**This fork is a complete reimplementation.** We built:

1. **A full reflection-based MechJeb wrapper** (`MechJebProxy.cs`) that binds to MechJeb 2.15.1's internal types at runtime, handling all the API changes gracefully with version-aware fallbacks

2. **A comprehensive menu system** (`MechJebRPMMenu.cs` - 3,500+ lines) that mirrors MechJeb's IMGUI interface structure, giving you hierarchical menus for every MechJeb module

3. **Direct Operation invocation** - The maneuver planner doesn't just set parameters; it calls MechJeb's actual `Operation.MakeNodes()` methods to create maneuver nodes exactly like the IMGUI does

4. **Full TimeSelector support** - Every maneuver operation supports the same timing options as MechJeb's GUI (at apoapsis, at periapsis, at altitude, X seconds from now, at ascending node, etc.)

5. **Proper autopilot state management** - Enable, disable, and monitor all MechJeb autopilots with proper user registration so they don't conflict

---

## 🔧 Building From Source

### Prerequisites
- Visual Studio 2019+ or MSBuild
- .NET Framework 4.8 SDK
- KSP 1.12.x installation with MechJeb 2.15.1

### Build Commands
```powershell
# Full release build (recommended)
.\build-release.ps1

# Or specify custom KSP path
.\build-release.ps1 -KSPPath "D:\Games\KSP"

# Manual build
& "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\MSBuild.exe" RasterPropMonitor.sln /p:Configuration=Release
```

The build script will:
1. Build both DLLs from source
2. Copy asset bundles from your KSP installation (ensures correct versions)
3. Package everything into a release zip

---

## 📚 Technical Details

### MechJeb Wrapper Architecture

The integration uses a reflection-based wrapper (`MechJebRPMWrapper.cs`) that:
1. Discovers MechJeb assembly at runtime
2. Binds to internal types via reflection
3. Handles API differences between MechJeb versions
4. Provides stable interface for RPM handlers

### Key Files Modified
| File | Changes |
|------|---------|
| `MechJebRPMWrapper.cs` | Complete rewrite for 2.15.1 field/property changes |
| `MechJebRPMButtons.cs` | Updated autopilot enable/disable handlers |
| `JSIExternalCameraSelector.cs` | Fixed local coordinate handling |
| `FlyingCamera.cs` | Near clip plane fix (0.01m) |

---

## 📋 Changelog

### v1.0.3-mechjeb2 (2026-01)
**Complete MechJeb 2.15.1 Integration Overhaul**

This isn't a patch—it's a ground-up reimplementation of RPM's MechJeb integration:

- **3,500+ lines of new menu code** - Comprehensive `MechJebRPMMenu.cs` that mirrors MechJeb's IMGUI structure
- **Complete MechJebProxy rewrite** - Reflection-based wrapper handling all 2.15.1 API changes (PascalCase fields, module reorganization, property→field changes)
- **All 18 Maneuver Planner operations** - Not just toggles, but full parameter editing and TimeSelector support
- **New autopilot modules** - Translatron, Rover, Aircraft, and Spaceplane guidance menus added
- **Proper autopilot state management** - User registration system that doesn't conflict with other MechJeb users
- **External camera fixes** - Transform parenting and near clip plane corrections

---

## 🙏 Credits

- **Original RasterPropMonitor** - [Mihara](https://github.com/Mihara/RasterPropMonitor) and MOARdV
- **FirstPersonKSP Fork** - Community maintainers
- **MechJeb 2** - MuMech team

---

## 📄 License

RasterPropMonitor plugin (C) 2013-2018 Mihara, MOARdV, and other contributors.  
MechJeb 2.15.1 integration additions (C) 2026.

Code and shaders are licensed under **GPLv3**. See [LICENSE.md](LICENSE.md).

Props by alexustas and contributors under **CC 3.0 BY-NC-SA**.

---

## 🔗 Links

- **This Fork:** https://github.com/adventure-gpt/RasterPropMonitor-mechjeb-2-improvements
- **Standard RPM:** https://github.com/FirstPersonKSP/RasterPropMonitor  
- **MechJeb 2:** https://github.com/MuMech/MechJeb2
- **Original RPM:** https://github.com/Mihara/RasterPropMonitor (archived)
- **Full Documentation:** https://github.com/Mihara/RasterPropMonitor/wiki

---

## Original RPM Documentation

<details>
<summary>Click to expand original README content</summary>

To view this document with formatting, refer to https://github.com/Mihara/RasterPropMonitor/blob/master/README.md

RasterPropMonitor (RPM) is a toolkit and plugin that provides drastically-increased functionality to the IVA
mode in Kerbal Space Program.  Using RPM-enabled props, a player can control almost any aspect of spacecraft
or spaceplane operations.

RPM can interface with some mods, incorporating those mods' behaviors seamlessly into the RPM IVA.  A list of
actively supported and known working mods is available in the [release notes](https://github.com/Mihara/RasterPropMonitor/wiki/Changes-in-this-version).

Included in the RPM distribution are example props for use in enhancing the IVA experience.  Most of these
props were created by using stock KSP prop models.  There is also an MFD model by alexustas for use in glass cockpit designs.

The RPM distribution also contains configuration files for [Module Manager](http://forum.kerbalspaceprogram.com/index.php?/topic/50533-112-module-manager-2625-may-19th-where-the-singularity-started/) that will override some of the stock IVAs with the example props to give you an idea of what is possible with RPM.

However, ModuleManager is not part of this distribution.  You **must** install it separately.

**NOTE:** This mod by itself is not intended to be a comprehensive IVA experience.  While basic IVAs are
included, they are intended to be examples of what is possible.  Because creating a good IVA takes a significant
amount of time (I've put more than 80 hours into each of the IVAs I've made), these example IVAs are not frequently updated, and they only scratch the surface of what can be
accomplished using RasterPropMonitor.

### INSTALLATION INSTRUCTIONS:

Extract the contents of the GameData folder in the RPM zip file into the GameData folder of your KSP install.  You should see the following folder structure:

```
GameData |
         + JSI |
               + Agencies
               + RasterPropMonitor
               + RPMPodPatches
```

If you do not see GameData/JSI, you have installed this mod incorrectly, and it shall misbehave (missing props, other things not working right).

If you used CKAN to install this mod, check the file structure.  CKAN has installed this mod incorrectly in the past.  If CKAN installed it incorrectly, remove this mod and install it manually.  I do not provide support for CKAN installations.

### UPGRADING FROM OLDER VERSIONS:
As a general rule, you should delete any existing installation.

### CONFIGURATION

Out of the box, RasterPropMonitor ships with default configuration settings.  The configuration file is
installed to GameData/JSI/RasterPropMonitor/Plugins/PluginData/rpm-config.cfg

The config file settings are:

* DebugLogging - False by default.  Setting this to True will vastly increase the amount of information that
RasterPropMonitor writes to KSP's log file.  You should only need to change this for support purposes.
* ShowCallCount - False by default.  Primarily intended for IVA makers to collect information on what impact
their IVA has on performance.  Should not need to be set True except for collecting this info.  DebugLogging
must also be set True for the call count to be logged.
* DefaultRefreshRate - 5 by default.  Defines how many Update calls must elapse before RPM will update its
variables.  One Update occurs every screen refresh, so if KSP is running at 60fps, the default refresh rate
of 5 means that variables will update roughly 12 times per second.  Note that props may override this
value by making it smaller, but never by making it larger.
* MinimumRefreshRate - 1 by default.  Defines what the minimum value for the refresh rate may be.  Lower-spec
computers may benefit by setting this value higher than 1. It must not be larger than DefaultRefreshRate.
Large minimum values will cause some animations and updates to stutter, instead of moving smoothly.

### MOAR IVAs?

If the basic IVA experience included in this package is not enough, take a look at some of these:

* [ALCOR](http://forum.kerbalspaceprogram.com/index.php?/topic/50272-104alcorquotadvanced-landing-capsule-for-orbital-rendezvousquot-by-aset-21072015/) lander capsule by alexustas
* [Mk1-2 Pod](http://forum.kerbalspaceprogram.com/index.php?/topic/116440-iva104-mk1-2-pod-iva-replacement-by-aset-wip/) by alexustas

</details>
