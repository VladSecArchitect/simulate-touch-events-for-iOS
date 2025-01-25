# iOS Touch Event Simulator

## Overview
A tool for simulating touch events on iOS devices through XPC services and IOKit interfaces. This project provides low-level access to the touch input system, allowing programmatic generation of touch events.

## Project Structure
```
.
├── client/                     # XPC client implementation
│   ├── Makefile
│   ├── xpc_client.mm          # Client source
│   └── xpc_client_bkp.mm      # Client backup
├── IOKit/                     # IOKit framework headers
│   ├── hid/                   # HID interfaces
│   ├── ps/                    # Power source interfaces
│   └── pwr_mgt/               # Power management
├── includes/                  # Additional headers
│   ├── launch.h
│   └── xpc -> SDK/xpc
├── private-headers/          # iOS private headers
│   ├── IOKit/hid/
│   └── UIKit/
├── LogManager.h              # Logging interface
├── LogManager.mm             # Logging implementation
├── iokit_trace.h            # IOKit tracing
├── ioreg_tools.h            # Registry tools interface
├── ioreg_tools.mm           # Registry tools implementation
├── main.h                   # Main interface
├── main.mm                  # Main implementation
├── main_bkp.mm             # Main backup
├── Makefile                # Build configuration
├── ru.redhot.SimulateTouches.plist  # LaunchDaemon config
└── touch_ent.plist         # Entitlements
```

## Architecture
```
┌─────────────────────────────────────────────┐
│               User Applications              │
├─────────────────────────────────────────────┤
│          UIKit / CoreGraphics               │
├─────────────────────────────────────────────┤
│               IOKit Framework               │
│  ┌─────────────────┐    ┌────────────────┐  │ ◄── XPC Client
│  │  Touch Service  │    │  XPC Service   │  │     (xpc_client.mm)
│  └─────────────────┘    └────────────────┘  │
├─────────────────────────────────────────────┤
│              IOKit Driver Layer             │ ◄── Touch Service
│  ┌─────────────────┐    ┌────────────────┐  │     (main.mm)
│  │   HID Driver    │    │  Power Mgmt    │  │
│  └─────────────────┘    └────────────────┘  │
├─────────────────────────────────────────────┤
│                  HAL Layer                  │
│  ┌─────────────────┐    ┌────────────────┐  │
│  │    SPI/I2C      │    │    GPIO        │  │
│  └─────────────────┘    └────────────────┘  │
├─────────────────────────────────────────────┤
│              Hardware (Touch IC)            │
└─────────────────────────────────────────────┘
```

The project operates at two levels:
1. XPC Client (xpc_client.mm) - at IOKit Framework level
2. Touch Service (main.mm) - at IOKit Driver Layer level

This architecture allows:
- Client: to communicate with the service via XPC
- Service: to directly interact with HID driver for touch event simulation

## Low-Level Integration
The project integrates directly with iOS system components:
- Direct access to HID driver through IOKit interfaces
- Hardware event simulation at driver level
- Raw touch event injection into input system
- Power management state handling
- Direct memory access for touch event buffers
- Hardware interrupt handling

## Installation

### LaunchDaemon Setup
Copy daemon configuration to proper location:
```bash
cp ru.redhot.SimulateTouches.plist /Library/LaunchDaemons/
```

Note: Starting from iOS 8, `launchctl` load/unload only works with daemons in `/Library/LaunchDaemons/`, not in `/System/Library/LaunchDaemons/`.

### Load Service
```bash
launchctl load /Library/LaunchDaemons/ru.redhot.SimulateTouches.plist
```

## Building

### Prerequisites
- Xcode Command Line Tools
- iOS SDK
- Root access on target device

### Build Commands
```bash
# Build everything
make all

# Build client only
cd client && make
```

## Usage
```bash
# Start client
./client/xpc_client

# Input touch coordinates when prompted
Enter x y: 100 200
```

## Technical Details
- Uses XPC for secure client-server communication
- Interfaces with IOKit for hardware access
- Supports multi-touch and force touch simulation
- Handles device power management states

## System Requirements
- iOS 8.0 or later
- Jailbroken device
- Root access

## Components
- XPC Client: Handles user input and communication
- IOKit Interface: Hardware access layer
- LaunchDaemon: System service management
- Logging System: Debug and error tracking

## Development
- Source files use `.mm` extension for Objective-C++
- Backup files (`*_bkp.mm`) maintain original versions
- Build system uses Makefiles for compilation

## Author
Vladislav Chelnokov (vlad@redhot.ru)

## License
MIT

## Notes
- Requires proper entitlements for hardware access
- May require security bypass on newer iOS versions
- Use with caution on production devices
