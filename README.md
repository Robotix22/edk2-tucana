# EDK2 UEFI Firmware For Mi Note 10


## Status

Can boot into UEFI Shell this only what I tested.

## Working

Display

## Not Working

everything expect Display for some reason.

## Building

You need to clone these repositories 

```bash
git clone https://github.com/Robotix22/edk2-tucana.git
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
```
You should have all three directories side by side.

Now Install needed Packages

For Debian and Ubuntu:

```bash
sudo apt install build-essential uuid-dev iasl git nasm gcc-aarch64-linux-gnu abootimg python3-distutils gettext
```

Now you can build the UEFI Image by doing

```bash
cd edk2-tucana
./firstrun.sh
./build.sh
```

And finally you can now boot the Image or flash the image to `boot` or `recovery`.
By flashing the Image to `recovery` you get "Dual-boot".

```bash
fastboot boot uefi-tucana.img
fastboot flash boot uefi-tucana.img
fastboot flash recovery uefi-tucana.img
```

## Credits

This is based on `Idonotkno,s` `edk2-sm7150`.

