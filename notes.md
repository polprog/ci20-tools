# Useful links

[elinux.org/CI20_Dev_Zone](https://elinux.org/CI20_Dev_Zone#Building_Linux_Kernel_from_sources)



# Booting from SD Card

Use ./prep-sdcard.sh to burn u-boot+SPL to the SD card.  
Create a FAT partition at offset +1M.
	

	fatload mmc 0:1 0x81000000 uImage
	bootm 0x81000000
	
	
The above works with 6.14.x 
For uImages made with older Linux version the newer uboot fails to boot them.
If the old kernel 3.18 uImage is loaded into the load address listed in it, the new u-boot gives a weird error (-5). If its loaded somewhere else then the boot process hangs (but not sure where, if in u-boot or kernel).



Full 6.14.6 boot log:

```
U-Boot 2025.07-rc2polprog-g1b5e435102aa (Aug 27 2025 - 23:24:55 +0200)

CPU:   Ingenic JZ4780
Board: Creator CI20 (rev.2)
DRAM:  1 GiB
Core:  14 devices, 7 uclasses, devicetree: separate
MMC:   MSC: 0, MSC: 1
Loading Environment from MMC... Reading from MMC(0)... *** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0 
=> fatload mmc 0:1 0x81000000 uImage
10043480 bytes read in 893 ms (10.7 MiB/s)
=> bootm 0x81000000
## Booting kernel from Legacy Image at 81000000 ...
   Image Name:   Linux-6.14.6
   Created:      2025-08-27  22:00:42 UTC
   Image Type:   MIPS Linux Kernel Image (uncompressed)
   Data Size:    10043416 Bytes = 9.6 MiB
   Load Address: 80100000
   Entry Point:  8078f764
   Verifying Checksum ... OK
Working FDT set to 0
   Loading Kernel Image to 80100000
[    0.000000] Linux version 6.14.6 (polprog@almiraj) (mipsel-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #3 PREEMPT Wed Aug 27 23:51:03 CEST 2025
[    0.000000] CPU0 revision is: 3ee1024f (Ingenic XBurst)
[    0.000000] FPU revision is: 00330000
[    0.000000] MIPS: machine is img,ci20
[    0.000000] earlycon: jz4780_uart0 at MMIO 0x10034000 (options '')
[    0.000000] printk: legacy bootconsole [jz4780_uart0] enabled
[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT
[    0.000000] cma: Reserved 32 MiB at 0x00c00000 on node -1
[    0.000000] Primary instruction cache 32kB, VIVT, 8-way, linesize 32 bytes.
[    0.000000] Primary data cache 32kB, 8-way, VIPT, no aliases, linesize 32 bytes
[    0.000000] MIPS secondary cache 256kB, 8-way, linesize 128 bytes.
[    0.000000] Zone ranges:
[    0.000000]   Normal   [mem 0x0000000000000000-0x000000001fffffff]
[    0.000000]   HighMem  [mem 0x0000000020000000-0x000000005fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000000000-0x000000000fffffff]
[    0.000000]   node   0: [mem 0x0000000030000000-0x000000005fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x000000005fffffff]
[    0.000000] On node 0, zone HighMem: 131072 pages in unavailable ranges
[    0.000000] Kernel command line: console=ttyS4,115200 rw rootwait root=/dev/mmcblk0p1 earlycon console=ttyS4,115200 clk_ignore_unused
[    0.000000] printk: log buffer data + meta data: 16384 + 51200 = 67584 bytes
[    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 bytes, linear)
[    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 bytes, linear)
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 262144
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] SLUB: HWalign=32, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu: 	RCU event tracing is enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 10 jiffies.
[    0.000000] NR_IRQS: 256
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] clocksource: ingenic-timer: mask: 0xffff max_cycles: 0xffff, max_idle_ns: 38884100 ns
[    0.000001] sched_clock: 16 bits at 750kHz, resolution 1333ns, wraps every 43690000ns
[    0.008294] Console: colour dummy device 80x25
[    0.012811] Calibrating delay loop... 1196.85 BogoMIPS (lpj=5984256)
[    0.059186] pid_max: default: 32768 minimum: 301
[    0.064073] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.071429] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.099646] rcu: Hierarchical SRCU implementation.
[    0.104439] rcu: 	Max phase no-delay instances is 1000.
[    0.110142] Memory: 990956K/1048576K available (6746K kernel code, 251K rwdata, 2572K rodata, 276K init, 168K bss, 24176K reserved, 32768K cma-reserved, 786432K highmem)
[    0.126049] devtmpfs: initialized
[    0.134875] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.144887] futex hash table entries: 256 (order: -1, 3072 bytes, linear)
[    0.152923] pinctrl core: initialized pinctrl subsystem
[    0.159507] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.172510] /hdmi@10180000: Fixed dependency cycle(s) with /lcdc0@13050000
[    0.179547] /lcdc0@13050000: Fixed dependency cycle(s) with /hdmi@10180000
[    0.189070] /hdmi@10180000: Fixed dependency cycle(s) with /connector
[    0.195658] /connector: Fixed dependency cycle(s) with /hdmi@10180000
[    0.207074] gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.216851] gpio gpiochip1: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.226407] gpio gpiochip2: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.235819] gpio gpiochip3: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.245359] gpio gpiochip4: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.254889] gpio gpiochip5: Static allocation of GPIO base is deprecated, use dynamic allocation.
[    0.268778] jz4780-dma 13420000.dma: JZ4780 DMA controller initialised
[    0.276341] SCSI subsystem initialized
[    0.280221] usbcore: registered new interface driver usbfs
[    0.287142] usbcore: registered new interface driver hub
[    0.292506] usbcore: registered new device driver usb
[    0.297779] pps_core: LinuxPPS API ver. 1 registered
[    0.302741] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.312062] PTP clock support registered
[    0.316286] jz4780-nemc 13410000.nemc: /nemc@13410000/efuse@d0 requests invalid bank 0
[    0.324290] jz4780-nemc 13410000.nemc: /nemc@13410000/efuse@d0 has no addresses
[    0.331713] jz4780-nemc 13410000.nemc: JZ4780 NEMC initialised
[    0.339102] clocksource: Switched to clocksource ingenic-timer
[    0.354291] NET: Registered PF_INET protocol family
[    0.359466] IP idents hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.367837] tcp_listen_portaddr_hash hash table entries: 1024 (order: 0, 4096 bytes, linear)
[    0.376409] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.384246] TCP established hash table entries: 2048 (order: 1, 8192 bytes, linear)
[    0.392027] TCP bind hash table entries: 2048 (order: 2, 16384 bytes, linear)
[    0.399290] TCP: Hash tables configured (established 2048 bind 2048)
[    0.405789] UDP hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.412403] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes, linear)
[    0.419593] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.425773] RPC: Registered named UNIX socket transport module.
[    0.431753] RPC: Registered udp transport module.
[    0.436475] RPC: Registered tcp transport module.
[    0.441263] RPC: Registered tcp-with-tls transport module.
[    0.446805] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.454027] Initialise system trusted keyrings
[    0.458643] workingset: timestamp_bits=14 max_order=18 bucket_order=4
[    0.466319] Key type asymmetric registered
[    0.470469] Asymmetric key parser 'x509' registered
[    0.475423] bounce: pool size: 64 pages
[    0.479322] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 249)
[    0.486758] io scheduler mq-deadline registered
[    0.491395] io scheduler kyber registered
[    0.495437] io scheduler bfq registered
[    0.501502] ledtrig-cpu: registered to indicate activity on CPUs
[    0.508594] Serial: 8250/16550 driver, 5 ports, IRQ sharing disabled
[    0.517594] 10030000.serial: ttyS0 at MMIO 0x10030000 (irq = 51, base_baud = 3000000) is a 16550A
[    0.527582] 10031000.serial: ttyS1 at MMIO 0x10031000 (irq = 50, base_baud = 3000000) is a 16550A
[    0.537599] 10032000.serial: ttyS2 at MMIO 0x10032000 (irq = 49, base_baud = 3000000) is a 16550A
[    0.547070] serial serial0: tty port ttyS2 registered
[    0.553230] 10033000.serial: ttyS3 at MMIO 0x10033000 (irq = 48, base_baud = 3000000) is a 16550A
[    0.563265] 10034000.serial: ttyS4 at MMIO 0x10034000 (irq = 34, base_baud = 3000000) is a 16550A
[    0.572335] printk: legacy console [ttyS4] enabled
[    0.572335] printk: legacy console [ttyS4] enabled
[    0.581999] printk: legacy bootconsole [jz4780_uart0] disabled
[    0.581999] printk: legacy bootconsole [jz4780_uart0] disabled
[    0.602211] usbcore: registered new interface driver usb-storage
[    0.605602] usbcore: registered new interface driver ch341
[    0.611074] usbserial: USB Serial support registered for ch341-uart
[    0.618211] jz4740-rtc 10003000.rtc: registered as rtc0
[    0.622454] jz4740-rtc 10003000.rtc: hctosys: unable to read the hardware clock
[    0.630241] jz4780-i2c 10050000.i2c: Bus frequency is 400 KHz
[    0.637039] jz4780-i2c 10051000.i2c: Bus frequency is 100 KHz
[    0.642137] jz4780-i2c 10052000.i2c: Bus frequency is 100 KHz
[    0.647675] jz4780-i2c 10053000.i2c: Bus frequency is 100 KHz
[    0.653635] jz4780-i2c 10054000.i2c: Bus frequency is 400 KHz
[    0.663211] jz4740-mmc 13450000.mmc: Got CD GPIO
[    0.666425] clocksource: ingenic-ost: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 637086815595 ns
[    0.674919] clocksource: Switched to clocksource ingenic-ost
[    0.680581] sched_clock: 32 bits at 3000kHz, resolution 333ns, wraps every 715827882841ns
[    0.689562] usbcore: registered new interface driver usbhid
[    0.694418] jz4740-mmc 13450000.mmc: Ingenic SD/MMC card driver registered
[    0.701040] usbhid: USB HID core driver
[    0.705627] NET: Registered PF_PACKET protocol family
[    0.709904] jz4740-mmc 13450000.mmc: Using DMA, 4-bit mode
[    0.722344] Loading compiled-in X.509 certificates
[    0.779477] dm9000 16000000.dm9000: read wrong id 0x90004646
[    0.782953] dm9000 16000000.dm9000: eth0: Invalid ethernet MAC address. Please set using ip
[    0.790790] eth0: dm9000b at (ptrval),(ptrval) IRQ 19 MAC: 36:2d:5c:69:04:d2 (random)
[    0.799255] jz4740-mmc 13460000.mmc: allocated mmc-pwrseq
[    0.805026] clk: [    0.834585] jz4740-mmc 13460000.mmc: Ingenic SD/MMC card driver registered
[    0.838841] jz4740-mmc 13460000.mmc: Using DMA, 4-bit mode
[    0.844885] Waiting for root device /dev/mmcblk0p1...
[    0.914711] mmc1: new high speed SDIO card at address 0001
[    1.096926] mmc0: host does not support reading read-only switch, assuming write-enable
[    1.104703] mmc0: new high speed SDHC card at address eb5b
[    1.108614] mmcblk0: mmc0:eb5b SQ08G 7.50 GiB
[    1.115500]  mmcblk0: p1
[    1.141078] FAT-fs (mmcblk0p1): Volume was not properly unmounted. Some data may be corrupt. Please run fsck.
[    1.148387] VFS: Mounted root (vfat filesystem) on device 179:1.
[    1.154998] Freeing unused kernel image (initmem) memory: 276K
[    1.160208] This architecture does not have kernel memory protection.
[    1.166559] Run /sbin/init as init process
[    1.170789] Run /etc/init as init process
[    1.174673] Run /bin/init as init process
[    1.178659] Run /bin/sh as init process
[    1.182479] Kernel panic - not syncing: No working init found.  Try passing init= option to kernel. See Linux Documentation/admin-guide/init.rst for guidance.
[    1.196543] Rebooting in 10 seconds..


U-Boot 2025.07-rc2polprog-g1b5e435102aa (Aug 27 2025 - 23:24:55 +0200)

CPU:   Ingenic JZ4780
Board: Creator CI20 (rev.2)
DRAM:  1 GiB
Core:  14 devices, 7 uclasses, devicetree: separate
MMC:   MSC: 0, MSC: 1
Loading Environment from MMC... Reading from MMC(0)... *** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  0 
Welcome to ci20
=> 
```
