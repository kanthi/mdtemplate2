# lshw

list hardware

**Common Usage :**  ::

		$ sudo lshw


**Examples :**

.. code-block:: bash

        ~|⇒ sudo lshw
        sysadminlabs
            description: Portable Computer
            product: Inspiron 1440 ()
            vendor: Winbond Electronics
            serial: GHS
            width: 64 bits
            capabilities: vsyscall32
            configuration: boot=normal chassis=portable uuid=44454C4C-4800-1053-8044-C7C04F344253
          *-core
               description: Motherboard
               product: 0K138P
               vendor: Winbond Electronics
               physical id: 0
               serial: .GHSD4BS.CN7016699SG0TT.
             *-firmware
                  description: BIOS
                  vendor: Winbond Electronics
                  physical id: 0
                  version: A05
                  date: 10/20/2009
                  size: 64KiB
                  capacity: 15MiB
                  capabilities: isa pci pcmcia pnp upgrade shadowing cdboot bootselect int13floppy720 int5printscreen int9keyboard int14serial int17printer int10video acpi usb agp smartbattery biosbootspecification netboot
             *-cpu
                  description: CPU
                  product: Intel(R) Core(TM)2 Duo CPU     P7550  @ 2.26GHz
                  vendor: Intel Corp.
                  physical id: 400
                  bus info: cpu@0
                  slot: Microprocessor
                  size: 800MHz
                  capacity: 2267MHz
                  width: 64 bits
                  clock: 266MHz
                  capabilities: x86-64 fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx constant_tsc arch_perfmon pebs bts rep_good nopl aperfmperf pni dtes64 monitor ds_cpl est tm2 ssse3 cx16 xtpr pdcm sse4_1 xsave lahf_lm dtherm cpufreq
                  configuration: cores=2 enabledcores=2 threads=2
                *-cache:0
                     description: L1 cache
                     physical id: 700
                     size: 128KiB
                     capacity: 128KiB
                     capabilities: internal write-back data
                *-cache:1
                     description: L2 cache
                     physical id: 701
                     size: 3MiB
                     capacity: 3MiB
                     clock: 66MHz (15.0ns)
                     capabilities: pipeline-burst internal varies unified
             *-memory
                  description: System Memory
                  physical id: 1000
                  slot: System board or motherboard
                  size: 4GiB
                *-bank:0
                     description: DIMM DDR Synchronous 800 MHz (1.2 ns)
                     product: EBE21UE8AFSA-8G-F
                     vendor: 7F7FFE0000000000
                     physical id: 0
                     serial: 53B9168D
                     slot: DIMM_A
                     size: 2GiB
                     width: 64 bits
                     clock: 800MHz (1.2ns)
                *-bank:1
                     description: DIMM DDR Synchronous 800 MHz (1.2 ns)
                     product: EBE21UE8AFSA-8G-F
                     vendor: 7F7FFE0000000000
                     physical id: 1
                     serial: 61B9168D
                     slot: DIMM_B
                     size: 2GiB
                     width: 64 bits
                     clock: 800MHz (1.2ns)
             *-pci
                  description: Host bridge
                  product: Mobile 4 Series Chipset Memory Controller Hub
                  vendor: Intel Corporation
                  physical id: 100
                  bus info: pci@0000:00:00.0
                  version: 07
                  width: 32 bits
                  clock: 33MHz
                  configuration: driver=agpgart-intel
                  resources: irq:0
                *-display:0
                     description: VGA compatible controller
                     product: Mobile 4 Series Chipset Integrated Graphics Controller
                     vendor: Intel Corporation
                     physical id: 2
                     bus info: pci@0000:00:02.0
                     version: 07
                     width: 64 bits
                     clock: 33MHz
                     capabilities: msi pm vga_controller bus_master cap_list rom
                     configuration: driver=i915 latency=0
                     resources: irq:46 memory:f6c00000-f6ffffff memory:e0000000-efffffff ioport:efe8(size=8)
                *-display:1 UNCLAIMED
                     description: Display controller
                     product: Mobile 4 Series Chipset Integrated Graphics Controller
                     vendor: Intel Corporation
                     physical id: 2.1
                     bus info: pci@0000:00:02.1
                     version: 07
                     width: 64 bits
                     clock: 33MHz
                     capabilities: pm bus_master cap_list
                     configuration: latency=0
                     resources: memory:f6b00000-f6bfffff
                *-usb:0
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #4
                     vendor: Intel Corporation
                     physical id: 1a
                     bus info: pci@0000:00:1a.0
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:20 ioport:6f60(size=32)
                *-usb:1
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #5
                     vendor: Intel Corporation
                     physical id: 1a.1
                     bus info: pci@0000:00:1a.1
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:21 ioport:6f80(size=32)
                *-usb:2
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #6
                     vendor: Intel Corporation
                     physical id: 1a.2
                     bus info: pci@0000:00:1a.2
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:22 ioport:6fa0(size=32)
                *-usb:3
                     description: USB controller
                     product: 82801I (ICH9 Family) USB2 EHCI Controller #2
                     vendor: Intel Corporation
                     physical id: 1a.7
                     bus info: pci@0000:00:1a.7
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pm debug ehci bus_master cap_list
                     configuration: driver=ehci-pci latency=0
                     resources: irq:22 memory:fed1c400-fed1c7ff
                *-multimedia
                     description: Audio device
                     product: 82801I (ICH9 Family) HD Audio Controller
                     vendor: Intel Corporation
                     physical id: 1b
                     bus info: pci@0000:00:1b.0
                     version: 03
                     width: 64 bits
                     clock: 33MHz
                     capabilities: pm msi pciexpress bus_master cap_list
                     configuration: driver=snd_hda_intel latency=0
                     resources: irq:48 memory:f6afc000-f6afffff
                *-pci:0
                     description: PCI bridge
                     product: 82801I (ICH9 Family) PCI Express Port 1
                     vendor: Intel Corporation
                     physical id: 1c
                     bus info: pci@0000:00:1c.0
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pci pciexpress msi pm normal_decode bus_master cap_list
                     configuration: driver=pcieport
                     resources: irq:40 ioport:2000(size=4096) memory:f0400000-f05fffff ioport:f0600000(size=2097152)
                *-pci:1
                     description: PCI bridge
                     product: 82801I (ICH9 Family) PCI Express Port 2
                     vendor: Intel Corporation
                     physical id: 1c.1
                     bus info: pci@0000:00:1c.1
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pci pciexpress msi pm normal_decode bus_master cap_list
                     configuration: driver=pcieport
                     resources: irq:41 ioport:3000(size=4096) memory:f6900000-f69fffff ioport:f0800000(size=2097152)
                   *-network
                        description: Wireless interface
                        product: WiFi Link 5100
                        vendor: Intel Corporation
                        physical id: 0
                        bus info: pci@0000:0c:00.0
                        logical name: wlan0
                        version: 00
                        serial: 00:24:d6:2b:a7:c4
                        width: 64 bits
                        clock: 33MHz
                        capabilities: pm msi pciexpress bus_master cap_list ethernet physical wireless
                        configuration: broadcast=yes driver=iwlwifi driverversion=3.12.0-031200rc4-generic firmware=8.83.5.1 build 33692 ip=192.168.1.209 latency=0 link=yes multicast=yes wireless=IEEE 802.11abgn
                        resources: irq:47 memory:f69fe000-f69fffff
                *-pci:2
                     description: PCI bridge
                     product: 82801I (ICH9 Family) PCI Express Port 3
                     vendor: Intel Corporation
                     physical id: 1c.2
                     bus info: pci@0000:00:1c.2
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pci pciexpress msi pm normal_decode bus_master cap_list
                     configuration: driver=pcieport
                     resources: irq:42 ioport:d000(size=4096) memory:f6800000-f68fffff ioport:f0000000(size=1048576)
                   *-network
                        description: Ethernet interface
                        product: RTL8101E/RTL8102E PCI Express Fast Ethernet controller
                        vendor: Realtek Semiconductor Co., Ltd.
                        physical id: 0
                        bus info: pci@0000:09:00.0
                        logical name: eth0
                        version: 02
                        serial:
                        size: 10Mbit/s
                        capacity: 100Mbit/s
                        width: 64 bits
                        clock: 33MHz
                        capabilities: pm msi pciexpress msix vpd bus_master cap_list rom ethernet physical tp mii 10bt 10bt-fd 100bt 100bt-fd autonegotiation
                        configuration: autonegotiation=on broadcast=yes driver=r8169 driverversion=2.3LK-NAPI duplex=half latency=0 link=no multicast=yes port=MII speed=10Mbit/s
                        resources: irq:44 ioport:de00(size=256) memory:f0010000-f0010fff memory:f0000000-f000ffff memory:f0020000-f003ffff
                *-pci:3
                     description: PCI bridge
                     product: 82801I (ICH9 Family) PCI Express Port 5
                     vendor: Intel Corporation
                     physical id: 1c.4
                     bus info: pci@0000:00:1c.4
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pci pciexpress msi pm normal_decode bus_master cap_list
                     configuration: driver=pcieport
                     resources: irq:43 ioport:c000(size=4096) memory:f6600000-f67fffff ioport:f0100000(size=3145728)
                *-usb:4
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #1
                     vendor: Intel Corporation
                     physical id: 1d
                     bus info: pci@0000:00:1d.0
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:20 ioport:6f00(size=32)
                *-usb:5
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #2
                     vendor: Intel Corporation
                     physical id: 1d.1
                     bus info: pci@0000:00:1d.1
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:21 ioport:6f20(size=32)
                *-usb:6
                     description: USB controller
                     product: 82801I (ICH9 Family) USB UHCI Controller #3
                     vendor: Intel Corporation
                     physical id: 1d.2
                     bus info: pci@0000:00:1d.2
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: uhci bus_master cap_list
                     configuration: driver=uhci_hcd latency=0
                     resources: irq:22 ioport:6f40(size=32)
                *-usb:7
                     description: USB controller
                     product: 82801I (ICH9 Family) USB2 EHCI Controller #1
                     vendor: Intel Corporation
                     physical id: 1d.7
                     bus info: pci@0000:00:1d.7
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pm debug ehci bus_master cap_list
                     configuration: driver=ehci-pci latency=0
                     resources: irq:20 memory:fed1c000-fed1c3ff
                *-pci:4
                     description: PCI bridge
                     product: 82801 Mobile PCI Bridge
                     vendor: Intel Corporation
                     physical id: 1e
                     bus info: pci@0000:00:1e.0
                     version: 93
                     width: 32 bits
                     clock: 33MHz
                     capabilities: pci subtractive_decode bus_master cap_list
                *-isa
                     description: ISA bridge
                     product: ICH9M LPC Interface Controller
                     vendor: Intel Corporation
                     physical id: 1f
                     bus info: pci@0000:00:1f.0
                     version: 03
                     width: 32 bits
                     clock: 33MHz
                     capabilities: isa bus_master cap_list
                     configuration: driver=lpc_ich latency=0
                     resources: irq:0
                *-storage
                     description: SATA controller
                     product: 82801IBM/IEM (ICH9M/ICH9M-E) 4 port SATA Controller [AHCI mode]
                     vendor: Intel Corporation
                     physical id: 1f.2
                     bus info: pci@0000:00:1f.2
                     version: 03
                     width: 32 bits
                     clock: 66MHz
                     capabilities: storage msi pm ahci_1.0 bus_master cap_list
                     configuration: driver=ahci latency=0
                     resources: irq:45 ioport:6e70(size=8) ioport:6e78(size=4) ioport:6e80(size=8) ioport:6e88(size=4) ioport:6ea0(size=32) memory:fed1c800-fed1cfff
                *-serial UNCLAIMED
                     description: SMBus
                     product: 82801I (ICH9 Family) SMBus Controller
                     vendor: Intel Corporation
                     physical id: 1f.3
                     bus info: pci@0000:00:1f.3
                     version: 03
                     width: 64 bits
                     clock: 33MHz
                     configuration: latency=0
                     resources: memory:f6afbf00-f6afbfff ioport:1100(size=32)
             *-scsi:0
                  physical id: 1
                  logical name: scsi0
                  capabilities: emulated
                *-disk
                     description: ATA Disk
                     product: WDC WD5000BEVT-7
                     vendor: Western Digital
                     physical id: 0.0.0
                     bus info: scsi@0:0.0.0
                     logical name: /dev/sda
                     version: 01.0
                     serial: WD-WXP0A99
                     size: 465GiB (500GB)
                     capabilities: partitioned partitioned:dos
                     configuration: ansiversion=5 signature=f0000000
                   *-volume:0
                        description: Windows NTFS volume
                        physical id: 1
                        bus info: scsi@0:0.0.0,1
                        logical name: /dev/sda1
                        version: 3.1
                        serial: 68432cc1-3be3-bf47-a02d
                        size: 98MiB
                        capacity: 100MiB
                        capabilities: primary ntfs initialized
                        configuration: clustersize=4096 created=2013-09-13 01:06:57 filesystem=ntfs state=clean
                   *-volume:1
                        description: Windows NTFS volume
                        physical id: 2
                        bus info: scsi@0:0.0.0,2
                        logical name: /dev/sda2
                        version: 3.1
                        serial: 34f474b3-493a-e44f-9798-96eea2f13e1c
                        size: 75GiB
                        capacity: 75GiB
                        capabilities: primary bootable ntfs initialized
                        configuration: clustersize=4096 created=2013-10-08 03:22:05 filesystem=ntfs state=clean
                   *-volume:2
                        description: Windows NTFS volume
                        physical id: 3
                        bus info: scsi@0:0.0.0,3
                        logical name: /dev/sda3
                        version: 3.1
                        serial: 8c74cb2e-4db7-f842-9096-0fa378a7c246
                        size: 97GiB
                        capacity: 97GiB
                        capabilities: primary ntfs initialized
                        configuration: clustersize=4096 created=2013-10-08 03:56:43 filesystem=ntfs label=WINDATA modified_by_chkdsk=true mounted_on_nt4=true resize_log_file=true state=dirty upgrade_on_mount=true
                   *-volume:3
                        description: Extended partition
                        physical id: 4
                        bus info: scsi@0:0.0.0,4
                        logical name: /dev/sda4
                        size: 199GiB
                        capacity: 199GiB
                        capabilities: primary extended partitioned partitioned:extended
                      *-logicalvolume:0
                           description: Linux swap / Solaris partition
                           physical id: 5
                           logical name: /dev/sda5
                           capacity: 7628MiB
                           capabilities: nofs
                      *-logicalvolume:1
                           description: Linux filesystem partition
                           physical id: 6
                           logical name: /dev/sda6
                           logical name: /LINUXDATA
                           capacity: 98GiB
                           configuration: mount.fstype=ext4 mount.options=rw,relatime,data=ordered state=mounted
                      *-logicalvolume:2
                           description: Linux filesystem partition
                           physical id: 7
                           logical name: /dev/sda7
                           logical name: /
                           capacity: 93GiB
                           configuration: mount.fstype=ext4 mount.options=rw,relatime,errors=remount-ro,data=ordered state=mounted
             *-scsi:1
                  physical id: 2
                  logical name: scsi1
                  capabilities: emulated
                *-cdrom
                     description: DVD-RAM writer
                     product: DVD+-RW AD-7580S
                     vendor: Optiarc
                     physical id: 0.0.0
                     bus info: scsi@1:0.0.0
                     logical name: /dev/cdrom1
                     logical name: /dev/cdrw1
                     logical name: /dev/dvd1
                     logical name: /dev/dvdrw1
                     logical name: /dev/sr0
                     version: FD06
                     capabilities: removable audio cd-r cd-rw dvd dvd-r dvd-ram
                     configuration: ansiversion=5 status=nodisc
          *-battery
               product: DELL H415N98
               vendor: Sanyo
               physical id: 1
               slot: Sys. Battery Bay
               capacity: 78000mWh
               configuration: voltage=11.1V
