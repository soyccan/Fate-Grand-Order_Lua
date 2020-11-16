# Fate-Grand-Order_Lua
This is a modified version to use adb instead of Ankula

Lua Version: 5.3.3

## Tutorial
On host (where Android emulator runs):
1. Start a Nox emulator
2. Run `nox_adb.exe devices` to see on which port the emulator listens
Assume it's 62025
3. Run the following to make adb daemon accessible remotely
```
netsh interface portproxy add v4tov4 \
        listenport=62025 listenaddress=0.0.0.0 \
        connectport=62025 connectaddress=127.0.0.1
```

On remote (where this script runs):
1. Connect to host: `adb connect 192.168.163.1:62025`
2. Run the script: `lua FGO_TW_REGULAR.lua`

To take screenshot:
adb shell screencap -p /sdcard/sh.png
adb pull /sdcard/sh.png

## Troubleshooting
- `adb kill-server`

## Orignal Readme
[![Lua-5.1-Sikuli](https://cdn.rawgit.com/29988122/Fate-Grand-Order_Lua/master/docs/media/Lua--Sikuli-5.1-blue.svg)](http://www.sikuli.org/)[![GitHub license](https://cdn.rawgit.com/29988122/Fate-Grand-Order_Lua/master/docs/media/Fate-Grand-Order_Lua.svg)](https://github.com/29988122/Fate-Grand-Order_Lua/blob/master/LICENSE)

Screw those farming events - I only wanna enjoy the (kinoko) story!

Therefore I proudly brought you this: FGO automation script.

<p>
	<img alt="Chaldea" src="https://camo.githubusercontent.com/19a9a5e1023613c01ba79aa1d03cae17d201f610/68747470733a2f2f7669676e65747465312e77696b69612e6e6f636f6f6b69652e6e65742f666174656772616e646f726465722f696d616765732f322f32642f4368616c6465615f53656375726974795f4f7267616e697a6174696f6e5f4c6f676f2e706e672f7265766973696f6e2f6c61746573742f7363616c652d746f2d77696474682d646f776e2f323030303f63623d3230313631313139303833333437" width="400"/>
</p>

This script supported CN, EN, JP and TW servers on Android devices < Oreo 8.0 and emulators.

[What if I have > Android 8.1 phone?](https://29988122.github.io/Fate-Grand-Order_Lua/#/install?id=android-81-and-above)

As of 2018.12.30, this script is **working without root** / without being blocked or banned, although I DO NOT take responsibility for your banned account! 

[Disclaimer and concern about your account](https://29988122.github.io/Fate-Grand-Order_Lua/#/account-safety)

Please read the **[Documentation](https://29988122.github.io/Fate-Grand-Order_Lua/#/)**.

Any questions can be asked in the "Issues" section. Don't be shy xD

Any feature request or bug report is welcome. Please create a new issue and I'll do my best.

Please consider giving our repo a star to encourage us if this script is useful to you : )

Enjoy the game!
