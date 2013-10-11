#!/bin/bash

export CCOMPILER=~/android-toolchain-eabi/bin/arm-eabi-
make ARCH=arm mako_defconfig
make ARCH=arm CROSS_COMPILE=$CCOMPILER -j`grep 'processor' /proc/cpuinfo | wc -l`
