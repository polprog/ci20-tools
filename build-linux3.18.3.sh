LINUX=CI20_linux-ci20-v3.18
#KERN_URL=https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.18.3.tar.gz
#PREFIX=$(pwd)/codescape2015.06/mips-img-elf/2015.06-05/bin
PREFIX=$(pwd)/codescape/mips-img-linux-gnu/2018.11-01/bin

#if [ ! -f $LINUX.tar.gz ]; then
#    wget $KERN_URL
#fi
#if [ ! -d $LINUX ]; then
#    tar -xzvf $LINUX.tar.gz 
#fi


export ARCH=mips CROSS_COMPILE=mips-img-linux-gnu-
export PATH=$PREFIX:$PATH
cd $LINUX

echo "PREFIX=$PREFIX"
bash --rcfile <(echo "export PS1='builder:\w\$ '")
#make ci20_defconfig
#make -j 16 uImage
#cp arch/mips/boot/uImage ../
#mkimage -A mips -O linux -T kernel -C none -a 0x81000000 -e 0x8078f764 -n kernel -d vmlinux -b arch/mips/boot/dts/ingenic/ci20.dtb uImage
