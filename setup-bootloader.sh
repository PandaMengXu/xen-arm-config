#!/bin/bash
DEV=$1
SOURCE=$2

if [ -z "$DEV" ]; then
echo "Usage: $0 [device] [source]"
exit 0
fi

if [ -z "$SOURCE" ]; then
SOURCE=1
fi

if [ $SOURCE -eq 1 ]; then

dd iflag=dsync oflag=dsync if=boot_linaro/arndale-octa.bl1.bin of=$DEV bs=512 seek=1
dd iflag=dsync oflag=dsync if=boot_linaro/smdk5420-spl-20131211-1.signed.bin of=$DEV bs=512 seek=31
dd iflag=dsync oflag=dsync if=boot_linaro/u-boot.bin of=$DEV bs=512 seek=63
dd iflag=dsync oflag=dsync if=boot_linaro/arndale-octa.tzsw.bin of=$DEV bs=512 seek=719

elif [ $SOURCE -eq 2 ]; then

dd iflag=dsync oflag=dsync if=boot_insignal/arndale_octa.bl1.bin of=$DEV bs=512 seek=1
dd iflag=dsync oflag=dsync if=boot_insignal/arndale_octa.bl2.bin of=$DEV bs=512 seek=31
dd iflag=dsync oflag=dsync if=boot_insignal/u-boot.bin of=$DEV bs=512 seek=63
dd iflag=dsync oflag=dsync if=boot_insignal/arndale_octa.tzsw.bin of=$DEV bs=512 seek=719

else
echo "unknown source=$SOURCE"
fi

