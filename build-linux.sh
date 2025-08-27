LINUX=linux-6.14.6
KERN_URL=https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.14.6.tar.xz

if [ ! -f $LINUX.tar.xz ]; then
    wget $KERN_URL
fi
if [ ! -d $LINUX ]; then
    tar -xJvf $LINUX.tar.xz 
fi


export ARCH=mips CROSS_COMPILE=mipsel-linux-gnu-

cd $LINUX
make ci20_defconfig
make -j 16 uImage
cp arch/mips/boot/uImage ../
#mkimage -A mips -O linux -T kernel -C none -a 0x81000000 -e 0x8078f764 -n kernel -d vmlinux -b arch/mips/boot/dts/ingenic/ci20.dtb uImage
