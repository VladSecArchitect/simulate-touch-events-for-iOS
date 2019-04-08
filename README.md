# simulate-touch-events-for-iOS

## About LaunchDaemons

Note that `ru.redhot.SimulateTouches.plist` needs to be copied to `Library/LaunchDaemons/` because starting iOS 8, `launchctl` load/unload no longer works with daemons in `/System/Library/LaunchDaemons/`, it exits with an error <sup>[\[2\]][2]</sup>:
```bash
> launchctl load /System/Library/LaunchDaemons/ru.redhot.SimulateTouches.plist
> /System/Library/LaunchDaemons/ru.redhot.SimulateTouches.plist: The specified service path was not in the service cache
```
But it can successfully load/unload daemons from `/Library/LaunchDaemons/`, so `ru.redhot.SimulateTouches.plist` is put there.
