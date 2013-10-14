#!/bin/bash

export BUILD_VER="AniDroid-N4"
export BUILD_REL="01"

export KERNEL_DIR=`pwd`
export OUTPUT_DIR=../PACKAGE
export ZIMAGE_DIR=$KERNEL_DIR/arch/arm/boot
export MODULES_DIR=$OUTPUT_DIR/system/lib/modules

# copy output files
# rm -rf $MODULES_DIR/*
find $KERNEL_DIR -name '*.ko' -exec cp -v {} $MODULES_DIR \;
cp -vr $ZIMAGE_DIR/zImage $OUTPUT_DIR/kernel

# create flashable zip
echo
echo "Creating flashable ZIP.."
echo
cd $OUTPUT_DIR
zip -r `echo $BUILD_VER`-`echo $BUILD_REL`.zip *
mv `echo $BUILD_VER`-`echo $BUILD_REL`.zip $OUTPUT_DIR/../

echo
echo "Building AniDroid Kernel successfully compelted!"

cd $KERNEL_DIR
