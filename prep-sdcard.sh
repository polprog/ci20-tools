
if [ $# -lt 0 ]; then echo "Usage: $0 /dev/XXX"; exit 1; fi

#dd if=/dev/zero of=$1 bs=1K seek=526 count=32
dd if=u-boot/spl/u-boot-spl.bin of=$1 obs=512 seek=1
dd if=u-boot/u-boot.img of=$1 obs=1K seek=14
sync

echo "[+] SD card ready"
