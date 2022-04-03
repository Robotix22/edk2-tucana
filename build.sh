#!/bin/bash
# based on the instructions from edk2-platform
rm -r Build
rm uefi.img
rm uefi_image
set -e
. build_common.sh

rm -rf workspace/Build/tucanaPkg/DEBUG_GCC5/FV/Ffs/7E374E25-8E01-4FEE-87F2-390C23C606CDFVMAIN
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_AARCH64_PREFIX=aarch64-linux-gnu- build -s -n 0 -a AARCH64 -t GCC5 -p tucanaPkg/tucanaPkg.dsc
gzip -c < Build/tucanaPkg/DEBUG_GCC5/FV/TUCANAPKG_UEFI.fd >uefi_image
cat tucana.dtb >>uefi_image
abootimg --create uefi-tucana.img -k uefi_image -r ramdisk-null -f bootimg.cfg
