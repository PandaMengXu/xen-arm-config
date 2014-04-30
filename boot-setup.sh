#!/bin/bash
cd sources/linux-stable
mkimage -A arm -T kernel -a 0x20008000 -e 0x20008000 -C none -d ../xen/xen/xen xen-uImage
cp xen-uImage /media/neongas/boot
cp arch/arm/boot/zImage /media/neongas/boot
cp arch/arm/boot/dts/exynos5420-arndale-octa.dtb /media/neongas/boot

cd /media/neongas/boot
mkimage -A arm -T script -C none -n boot.scr -d boot.txt boot.scr

