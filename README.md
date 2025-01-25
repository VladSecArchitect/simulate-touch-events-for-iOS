# iOS Touch Event Simulator

## Overview
A tool for simulating touch events on iOS devices through XPC services and IOKit interfaces. This project provides low-level access to the touch input system, allowing programmatic generation of touch events.

This tool can be valuable for:
- Security researchers analyzing touch event handling and input validation
- Developers investigating touch input subsystem behavior and event processing
- Reverse engineers studying iOS input stack implementation
- QA engineers developing automated UI testing frameworks
- Accessibility researchers working on touch input assistance tools
- Performance analysts measuring touch input latency and event processing

The project helps understand how iOS processes touch events at the IOKit level, which is essential for:
- Input security vulnerability research
- Touch event handling optimization
- Custom input method development
- System-level UI automation
- Touch input debugging and diagnostics

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
│               User Applications             │
├─────────────────────────────────────────────┤
│               Cocoa Touch                   │
│     (AddressBook, MessageUI, StoreKit)      │
├─────────────────────────────────────────────┤
│               Media Layer                   │
│  (Core Animation, OpenGL ES, Core Graphics) │
├─────────────────────────────────────────────┤
│          UIKit / CoreGraphics               │
│    (UIKit, WebKit, MapKit, Core Location)   │
├─────────────────────────────────────────────┤
│               IOKit Framework               │ ◄── Project Level 1:
│  ┌─────────────────┐    ┌────────────────┐  │     XPC Client
│  │  Touch Service  │    │  XPC Service   │  │     (xpc_client.mm)
│  └─────────────────┘    └────────────────┘  │     Uses: IOKit, XPC
├─────────────────────────────────────────────┤
│              IOKit Driver Layer             │ ◄── Project Level 2:
│  ┌─────────────────┐    ┌────────────────┐  │     Touch Service
│  │   HID Driver    │    │  Power Mgmt    │  │     (main.mm)
│  └─────────────────┘    └────────────────┘  │     Uses: IOHIDFamily
├─────────────────────────────────────────────┤
│                  HAL Layer                  │
│  ┌─────────────────┐    ┌────────────────┐  │
│  │    SPI/I2C      │    │    GPIO        │  │
│  └─────────────────┘    └────────────────┘  │
├─────────────────────────────────────────────┤
│              Hardware (Touch IC)            │
└─────────────────────────────────────────────┘
```
The project is structured into two main components:

1. XPC Client (xpc_client_bkp.mm) - operating at the IOKit Framework level:
   - Manages user input and XPC communication.
   - Establishes XPC connection to the service using `xpc_connection_create_mach_service`.
   - Sets up event handlers for connection lifecycle management with `xpc_connection_set_event_handler`.
   - Serializes and deserializes touch coordinates for transmission.
   - Sends touch coordinates to the service via XPC.

2. Touch Service (main_bkp.mm) - functioning at the IOKit Driver Layer level:
   - Initializes the HID system client using `IOHIDEventSystemClientCreateWithType`.
   - Integrates with the RunLoop for processing events.
   - Handles system signals and manages the service lifecycle.

## Low-Level Integration
The project directly interfaces with iOS system components across several layers:

### HID Event System Integration
- Establishes a connection to the HID system using `IOHIDEventSystemClient`.
- Schedules event processing within the system RunLoop.
- Utilizes `mach_absolute_time()` for managing hardware timing.

### Touch Event Simulation
- Generates digitizer events using `IOHIDEventCreateDigitizerEvent`:
  - Configures the transducer type for simulating hand interactions.
  - Sets parameters for display integration.
  - Manages event masks to represent different touch states.
- Simulates finger events with `IOHIDEventCreateDigitizerFingerEventWithQuality`:
  - Handles touch states such as down, move, and up.
  - Translates coordinates into the digitizer's space.
  - Adjusts touch pressure and quality settings.

### Event Dispatch Chain
1. The client sends touch coordinates via XPC.
2. The service receives and validates the incoming data.
3. The service constructs HID events with the appropriate hardware parameters.
4. Events are injected directly into the HID system.
5. The system processes these events as if they were actual hardware inputs.

This low-level approach bypasses higher iOS input layers, simulating events at hardware level.

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

