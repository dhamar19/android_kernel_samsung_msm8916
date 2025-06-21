#!/bin/bash

export KBUILD_BUILD_USER=DhamarAr
export KBUILD_BUILD_HOST=Ordinary-Being
export USE_CCACHE=1
export ARCH=arm
export CROSS_COMPILE=$(pwd)/tool/bin/arm-eabi-

mkdir output
make mrproper

make -C $(pwd) O=output VARIANT_DEFCONFIG=msm8916_sec_j5lte_eur_defconfig msm8916_sec_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j$(nproc --all) -C $(pwd) O=output 2>&1 | tee -a output/compile.log

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
