#!/bin/bash

OPENOCD=openocd
IMAGE=u-boot-dtb.bin
FLASH_ADDR=0x08000000

if [ ! -f "$IMAGE" ]; then
    echo "File not found: $IMAGE"
    echo "Run this script from the U-Boot build directory."
    exit 1
fi

$OPENOCD -f interface/stlink.cfg -f target/stm32f7x.cfg \
    -c "program $IMAGE $FLASH_ADDR verify reset exit"