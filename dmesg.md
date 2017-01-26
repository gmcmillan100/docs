---
layout: page
title: dmsg
permalink: /dmsg/
resource: true
---
dmsg from the BSD1 host:

```
$dmsg
Copyright (c) 1992-2015 The FreeBSD Project.
Copyright (c) 1979, 1980, 1983, 1986, 1988, 1989, 1991, 1992, 1993, 1994
	The Regents of the University of California. All rights reserved.
FreeBSD is a registered trademark of The FreeBSD Foundation.
FreeBSD 10.2-RELEASE #0 r286666: Wed Aug 12 19:31:38 UTC 2015
    root@releng1.nyi.freebsd.org:/usr/obj/usr/src/sys/GENERIC i386
FreeBSD clang version 3.4.1 (tags/RELEASE_34/dot1-final 208032) 20140512
Preloaded elf kernel "/boot/kernel/kernel" at 0xc17ef000.
Calibrating TSC clock ... TSC clock: 266682911 Hz
CPU: Pentium II/Pentium II Xeon/Celeron (266.68-MHz 686-class CPU)
  Origin="GenuineIntel"  Id=0x634  Family=0x6  Model=0x3  Stepping=4
  Features=0x80f9ff<FPU,VME,DE,PSE,TSC,MSR,PAE,MCE,CX8,SEP,MTRR,PGE,MCA,CMOV,MMX>
Instruction TLB: 4 KB pages, 4-way set associative, 32 entries
Instruction TLB: 4 MB pages, fully associative, 2 entries
Data TLB: 4 KB pages, 4-way set associative, 64 entries
2nd-level cache: 512 KB, 4-way set associative, 32 byte line size
1st-level instruction cache: 16 KB, 4-way set associative, 32 byte line size
Data TLB: 4 MB Pages, 4-way set associative, 8 entries
1st-level data cache: 16 KB, 4-way set associative, 32 byte line size
real memory  = 201326592 (192 MB)
Physical memory chunk(s):
0x0000000000001000 - 0x000000000009efff, 647168 bytes (158 pages)
0x0000000000100000 - 0x00000000003fffff, 3145728 bytes (768 pages)
0x0000000001826000 - 0x000000000bc74fff, 172290048 bytes (42063 pages)
avail memory = 173465600 (165 MB)
bios32: Found BIOS32 Service Directory header at 0xc00f7540
bios32: Entry = 0xfd7b1 (c00fd7b1)  Rev = 0  Len = 1
pcibios: PCI BIOS entry at 0xfd7b0+0x21c
pnpbios: Found PnP BIOS data at 0xc00f7560
pnpbios: Entry = f0000:b77f  Rev = 1.0
Other BIOS signatures found:
XEN: CPU 0 has VCPU ID 4294967295
ULE: setup cpu 0
snd_unit_init() u=0x00ff8000 [512] d=0x00007c00 [32] c=0x000003ff [1024]
feeder_register: snd_unit=-1 snd_maxautovchans=16 latency=5 feeder_rate_min=1 feeder_rate_max=2016000 feeder_rate_round=25
wlan: <802.11 Link Layer>
Hardware, Intel Secure Key RNG: RDRAND is not present
Hardware, VIA Nehemiah Padlock RNG: VIA Padlock RNG not present
kbd: new array size 4
kbd1 at kbdmux0
mem: <memory>
Pentium Pro MTRR support enabled
null: <null device, zero device>
nfslock: pseudo-device
Falling back to <Software, Yarrow> random adaptor
random: <Software, Yarrow> initialized
VESA: INT 0x10 vector 0xc000:0x04b4
VESA: information block
0000   56 45 53 41 00 02 00 01 00 01 01 00 00 00 22 00
0010   00 01 08 00 34 01 0b 01 00 01 12 01 00 01 20 01
0020   00 01 00 01 01 01 ff ff 00 00 00 00 00 00 00 00
0030   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0040   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0050   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0060   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0070   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0080   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0090   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00a0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00b0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00c0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00d0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00e0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00f0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0100   50 45 52 4d 45 44 49 41 32 2e 00 33 44 4c 41 42
0110   53 00 50 45 52 4d 45 44 49 41 32 20 52 45 46 00
0120   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0130   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0140   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0150   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0160   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0170   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0180   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0190   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01a0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01b0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01c0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01d0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01e0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
01f0   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
VESA: 2 mode(s) found
VESA: v2.0, 512k memory, flags:0x1, mode table:0xc33fe022 (1000022)
VESA: PERMEDIA2.
VESA: 3DLABS PERMEDIA2 REF 
VMBUS: load
io: <I/O>
hpt27xx: RocketRAID 27xx controller driver v1.2.7
hptrr: RocketRAID 17xx/2xxx SATA controller driver v1.2
hptnr: R750/DC7280 controller driver v1.1.4
ACPI BIOS Error (bug): A valid RSDP was not found (20150515/tbxfroot-258)
ACPI: Table initialisation failed: AE_NOT_FOUND
ACPI: Try disabling either ACPI or apic support.
pci_open(1):	mode 1 addr port (0x0cf8) is 0x80000058
pci_open(1a):	mode1res=0x80000000 (0x80000000)
pci_cfgcheck:	device 0 [class=060000] [hdr=00] is there (id=71808086)
pcibios: BIOS version 2.10
pcib0 pcibus 0 on motherboard
pir0: <PCI Interrupt Routing Table: 7 Entries> on motherboard
$PIR: Entry 0.0.INTA has different mask for link 0x60, merging
$PIR: Entry 0.0.INTB has different mask for link 0x61, merging
$PIR: Entry 0.0.INTC has different mask for link 0x62, merging
$PIR: Entry 0.0.INTD has different mask for link 0x63, merging
$PIR: Entry 0.7.INTA has different mask for link 0x60, merging
$PIR: Entry 0.7.INTB has different mask for link 0x61, merging
$PIR: Entry 0.7.INTC has different mask for link 0x62, merging
$PIR: Entry 0.7.INTD has different mask for link 0x63, merging
$PIR: Entry 0.1.INTA has different mask for link 0x61, merging
$PIR: Entry 0.1.INTB has different mask for link 0x62, merging
$PIR: Entry 0.1.INTC has different mask for link 0x63, merging
$PIR: Entry 0.1.INTD has different mask for link 0x60, merging
$PIR: Links after initial probe:
Link  IRQ  Rtd  Ref  IRQs
0x60  255   N     7  3 4 5 7 9 10 11 12 14 15
0x61  255   N     7  3 4 5 7 9 10 11 12 14 15
0x62  255   N     7  3 4 5 7 9 10 11 12 14 15
0x63  255   N     7  3 4 5 7 9 10 11 12 14 15
$PIR: Found matching pin for 0.14.INTA at func 0: 9
$PIR: Found matching pin for 0.15.INTA at func 0: 12
$PIR: Found matching pin for 0.7.INTD at func 2: 11
$PIR: Links after initial IRQ discovery:
Link  IRQ  Rtd  Ref  IRQs
0x60  255   N     7  3 4 5 7 9 10 11 12 14 15
0x61    9   Y     7  3 4 5 7 9 10 11 12 14 15
0x62   12   Y     7  3 4 5 7 9 10 11 12 14 15
0x63   11   Y     7  3 4 5 7 9 10 11 12 14 15
$PIR: IRQs used by BIOS: 9 11 12
$PIR: Interrupt Weights:
[    0   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15 ]
[    0   0   0   0   0   0   0   0   0   7   0   7   7   0   0   0 ]
pci0: <PCI bus> on pcib0
pci0: domain=0, physical bus=0
found->	vendor=0x8086, dev=0x7180, revid=0x03
	domain=0, bus=0, slot=0, func=0
	class=06-00-00, hdrtype=0x00, mfdev=0
	cmdreg=0x0106, statreg=0x2290, cachelnsz=0 (dwords)
	lattimer=0x20 (960 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
	map[10]: type Prefetchable Memory, range 32, base 0xf8000000, size 26, enabled
found->	vendor=0x8086, dev=0x7181, revid=0x03
	domain=0, bus=0, slot=1, func=0
	class=06-04-00, hdrtype=0x01, mfdev=0
	cmdreg=0x000f, statreg=0x02a0, cachelnsz=0 (dwords)
	lattimer=0x60 (2880 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
	secbus=1, subbus=1
found->	vendor=0x8086, dev=0x7110, revid=0x02
	domain=0, bus=0, slot=7, func=0
	class=06-01-00, hdrtype=0x00, mfdev=1
	cmdreg=0x000f, statreg=0x0280, cachelnsz=0 (dwords)
	lattimer=0x00 (0 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
found->	vendor=0x8086, dev=0x7111, revid=0x01
	domain=0, bus=0, slot=7, func=1
	class=01-01-80, hdrtype=0x00, mfdev=0
	cmdreg=0x0005, statreg=0x0280, cachelnsz=0 (dwords)
	lattimer=0x40 (1920 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
	map[20]: type I/O Port, range 32, base 0xfcd0, size  4, enabled
found->	vendor=0x8086, dev=0x7112, revid=0x01
	domain=0, bus=0, slot=7, func=2
	class=0c-03-00, hdrtype=0x00, mfdev=0
	cmdreg=0x0005, statreg=0x0280, cachelnsz=0 (dwords)
	lattimer=0x40 (1920 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
	intpin=d, irq=11
	map[20]: type I/O Port, range 32, base 0xfce0, size  5, enabled
$PIR: 0:7 INTD routed to irq 11
found->	vendor=0x8086, dev=0x7113, revid=0x02
	domain=0, bus=0, slot=7, func=3
	class=06-80-00, hdrtype=0x00, mfdev=0
	cmdreg=0x0003, statreg=0x0280, cachelnsz=0 (dwords)
	lattimer=0x00 (0 ns), mingnt=0x00 (0 ns), maxlat=0x00 (0 ns)
	map[90]: type I/O Port, range 32, base 0x7000, size  4, enabled
found->	vendor=0x100b, dev=0x0020, revid=0x00
	domain=0, bus=0, slot=14, func=0
	class=02-00-00, hdrtype=0x00, mfdev=0
	cmdreg=0x0007, statreg=0x0290, cachelnsz=0 (dwords)
	lattimer=0x5a (2700 ns), mingnt=0x0b (2750 ns), maxlat=0x34 (13000 ns)
	intpin=a, irq=9
	powerspec 2  supports D0 D1 D2 D3  current D0
	map[10]: type I/O Port, range 32, base 0xf800, size  8, enabled
	map[14]: type Memory, range 32, base 0xfedfb000, size 12, enabled
$PIR: 0:14 INTA routed to irq 9
found->	vendor=0x104c, dev=0x8019, revid=0x00
	domain=0, bus=0, slot=15, func=0
	class=0c-00-10, hdrtype=0x00, mfdev=0
	cmdreg=0x0016, statreg=0x0210, cachelnsz=8 (dwords)
	lattimer=0x40 (1920 ns), mingnt=0x03 (750 ns), maxlat=0x04 (1000 ns)
	intpin=a, irq=12
	powerspec 1  supports D0 D2 D3  current D0
	map[10]: type Memory, range 32, base 0xfedfa800, size 11, enabled
	map[14]: type Memory, range 32, base 0xfedfc000, size 14, enabled
$PIR: 0:15 INTA routed to irq 12
agp0: <Intel 82443LX (440 LX) host to PCI bridge> on hostb0
agp0: allocating GATT for aperture of size 64M
pcib1: <PCI-PCI bridge> at device 1.0 on pci0
pcib1:   domain            0
pcib1:   secondary bus     1
pcib1:   subordinate bus   1
pcib1:   memory decode     0xfd800000-0xfecfffff
pcib1:   special decode    ISA, VGA
pci1: <PCI bus> on pcib1
pcib1: allocated bus range (1-1) for rid 0 of pci1
pci1: domain=0, physical bus=1
found->	vendor=0x104c, dev=0x3d07, revid=0x01
	domain=0, bus=1, slot=0, func=0
	class=03-00-00, hdrtype=0x00, mfdev=0
	cmdreg=0x0007, statreg=0x02b0, cachelnsz=0 (dwords)
	lattimer=0x40 (1920 ns), mingnt=0xc0 (48000 ns), maxlat=0xc0 (48000 ns)
	intpin=a, irq=9
	map[10]: type Memory, range 32, base 0xfecc0000, size 17, enabled
pcib1: allocated memory range (0xfecc0000-0xfecdffff) for rid 10 of pci0:1:0:0
	map[14]: type Memory, range 32, base 0xfd800000, size 23, enabled
pcib1: allocated memory range (0xfd800000-0xfdffffff) for rid 14 of pci0:1:0:0
	map[18]: type Memory, range 32, base 0xfe000000, size 23, enabled
pcib1: allocated memory range (0xfe000000-0xfe7fffff) for rid 18 of pci0:1:0:0
$PIR: 0:1 INTA routed to irq 9
pcib1: slot 0 INTA is routed to irq 9
vgapci0: <VGA-compatible display> mem 0xfecc0000-0xfecdffff,0xfd800000-0xfdffffff,0xfe000000-0xfe7fffff irq 9 at device 0.0 on pci1
vgapci0: Boot video device
isab0: <PCI-ISA bridge> at device 7.0 on pci0
isa0: <ISA bus> on isab0
atapci0: <Intel PIIX4 UDMA33 controller> port 0x1f0-0x1f7,0x3f6,0x170-0x177,0x376,0xfcd0-0xfcdf at device 7.1 on pci0
ata0: <ATA channel> at channel 0 on atapci0
ata1: <ATA channel> at channel 1 on atapci0
uhci0: <Intel 82371AB/EB (PIIX4) USB controller> port 0xfce0-0xfcff irq 11 at device 7.2 on pci0
usbus0 on uhci0
uhci0: usbpf: Attached
piix0: <PIIX Timecounter> port 0x7000-0x700f at device 7.3 on pci0
Timecounter "PIIX" frequency 3579545 Hz quality 0
sis0: <NatSemi DP8381[56] 10/100BaseTX> port 0xf800-0xf8ff mem 0xfedfb000-0xfedfbfff irq 9 at device 14.0 on pci0
sis0: Silicon Revision: DP83815C
miibus0: <MII bus> on sis0
nsphyter0: <DP83815 10/100 media interface> PHY 0 on miibus0
nsphyter0: OUI 0x1000e8, model 0x0002, rev. 1
nsphyter0:  none, 10baseT, 10baseT-FDX, 100baseTX, 100baseTX-FDX, auto
sis0: bpf attached
sis0: Ethernet address: 00:a0:cc:a0:e0:ce
pci0: <serial bus, FireWire> at device 15.0 (no driver attached)
cpu0 on motherboard
ahc_isa_identify 0: ioport 0xc00 alloc failed
ahc_isa_identify 1: ioport 0x1c00 alloc failed
ahc_isa_identify 2: ioport 0x2c00 alloc failed
ahc_isa_identify 3: ioport 0x3c00 alloc failed
ahc_isa_identify 4: ioport 0x4c00 alloc failed
ahc_isa_identify 5: ioport 0x5c00 alloc failed
ahc_isa_identify 6: ioport 0x6c00 alloc failed
ahc_isa_identify 7: ioport 0x7c00 alloc failed
ahc_isa_identify 8: ioport 0x8c00 alloc failed
ahc_isa_identify 9: ioport 0x9c00 alloc failed
ahc_isa_identify 10: ioport 0xac00 alloc failed
ahc_isa_identify 11: ioport 0xbc00 alloc failed
ahc_isa_identify 12: ioport 0xcc00 alloc failed
ahc_isa_identify 13: ioport 0xdc00 alloc failed
ahc_isa_identify 14: ioport 0xec00 alloc failed
pnp_identify: Trying Read_Port at 203
Reading PnP configuration for YMH0030.
YMH0021: start dependent (0)
YMH0021: adding io range 0x220-0x22f, size=0x10, align=0x10
YMH0021: adding io range 0x530-0x537, size=0x8, align=0x8
YMH0021: adding io range 0x388-0x38f, size=0x8, align=0x8
YMH0021: adding io range 0x330-0x331, size=0x2, align=0x2
YMH0021: adding io range 0x370-0x371, size=0x2, align=0x2
YMH0021: adding irq mask 0x20
YMH0021: adding dma mask 0x1
YMH0021: adding dma mask 0x2
YMH0021: start dependent (1)
YMH0021: adding io range 0x240-0x24f, size=0x10, align=0x10
YMH0021: adding io range 0xe80-0xe87, size=0x8, align=0x8
YMH0021: adding io range 0x388-0x38f, size=0x8, align=0x8
YMH0021: adding io range 0x300-0x301, size=0x2, align=0x2
YMH0021: adding io range 0x100-0xfff, size=0x2, align=0x2
YMH0021: adding irq mask 0xea0
YMH0021: adding dma mask 0xb
YMH0021: adding dma mask 0xb
YMH0021: start dependent (2)
YMH0021: adding io range 0x220-0x28f, size=0x10, align=0x10
YMH0021: adding io range 0x530-0xf4f, size=0x8, align=0x8
YMH0021: adding io range 0x388-0x3ff, size=0x8, align=0x8
YMH0021: adding io range 0x300-0x335, size=0x2, align=0x2
YMH0021: adding io range 0x100-0xfff, size=0x2, align=0x2
YMH0021: adding irq mask 0xea0
YMH0021: adding dma mask 0xb
YMH0021: adding dma mask 0xb
YMH0021: end dependent
YMH0022: start dependent (0)
YMH0022: adding io range 0x201-0x201, size=0x1, align=0x1
YMH0022: start dependent (1)
YMH0022: adding io range 0x201-0x211, size=0x1, align=0x10
YMH0022: end dependent
Reading PnP configuration for USR600b.
USR600b: adding irq mask 0x2b8
USR600b: start dependent (0)
USR600b: adding io range 0x100-0x2e7, size=0x8, align=0x8
USR600b: end dependent
PNP Identify complete
pnpbios: 15 devices, largest 317 bytes
PNP0c02: adding memory32 range 0xe0000-0xe3fff, size=0x4000, align=0x4000
pnpbios: handle 0 device ID PNP0c02 (020cd041)
PNP0c02: adding io range 0x4d0-0x4d1, size=0x2, align=0x1
PNP0c02: adding io range 0x8000-0x803f, size=0x40, align=0x1
PNP0c02: adding io range 0x7000-0x700f, size=0x10, align=0x1
pnpbios: handle 1 device ID PNP0c02 (020cd041)
PNP0c02: adding io range 0x78-0x80, size=0x9, align=0x1
PNP0c02: adding fixed memory32 range 0xfffc0000-0xffffffff, size=0x40000
pnpbios: handle 2 device ID PNP0c02 (020cd041)
PNP0c01: adding fixed memory32 range 0-0x9ffff, size=0xa0000
PNP0c01: adding fixed memory32 range 0xe4000-0xfffff, size=0x1c000
PNP0c01: adding fixed memory32 range 0x100000-0xbffffff, size=0xbf00000
PNP0c01: adding fixed memory32 range 0xfff80000-0xfffbffff, size=0x40000
pnpbios: handle 3 device ID PNP0c01 (010cd041)
PNP0200: adding io range 0-0xf, size=0x10, align=0x1
PNP0200: adding io range 0x81-0x8f, size=0xf, align=0x1
PNP0200: adding io range 0xc0-0xdf, size=0x20, align=0x1
PNP0200: adding dma mask 0x10
pnpbios: handle 4 device ID PNP0200 (0002d041)
PNP0100: adding io range 0x40-0x43, size=0x4, align=0x1
PNP0100: adding irq mask 0x1
pnpbios: handle 6 device ID PNP0100 (0001d041)
PNP0b00: adding io range 0x70-0x71, size=0x2, align=0x1
PNP0b00: adding irq mask 0x100
pnpbios: handle 7 device ID PNP0b00 (000bd041)
PNP0303: adding io range 0x60-0x60, size=0x1, align=0x1
PNP0303: adding io range 0x64-0x64, size=0x1, align=0x1
PNP0303: adding irq mask 0x2
pnpbios: handle 8 device ID PNP0303 (0303d041)
PNP0c04: adding io range 0xf0-0xff, size=0x10, align=0x1
PNP0c04: adding irq mask 0x2000
pnpbios: handle 9 device ID PNP0c04 (040cd041)
PNP0800: adding io range 0x61-0x61, size=0x1, align=0x1
pnpbios: handle 10 device ID PNP0800 (0008d041)
PNP0a03: adding io range 0xcf8-0xcff, size=0x8, align=0x1
pnpbios: handle 11 device ID PNP0a03 (030ad041)
PNP0501: adding io range 0x3f8-0x3ff, size=0x8, align=0x8
PNP0501: adding irq mask 0x10
pnpbios: handle 14 device ID PNP0501 (0105d041)
PNP0401: adding io range 0x378-0x37f, size=0x8, align=0x8
PNP0401: adding io range 0x778-0x77f, size=0x8, align=0x1
PNP0401: adding irq mask 0x80
PNP0401: adding dma mask 0x8
pnpbios: handle 15 device ID PNP0401 (0104d041)
PNP0700: adding io range 0x3f0-0x3f5, size=0x6, align=0x8
PNP0700: adding io range 0x3f7-0x3f7, size=0x1, align=0x1
PNP0700: adding irq mask 0x40
PNP0700: adding dma mask 0x4
pnpbios: handle 17 device ID PNP0700 (0007d041)
ex_isa_identify()
isa_probe_children: disabling PnP devices
pmtimer0 on isa0
unknown: <PNP0c02> can't assign resources (port)
unknown: <PNP0c02> at port 0x4d0-0x4d1,0x8000-0x803f,0x7000-0x700f pnpid PNP0c02 on isa0
unknown: <PNP0c02> can't assign resources (memory)
unknown: <PNP0c02> pnpid PNP0c02 on isa0
unknown: <System Memory> can't assign resources (memory)
unknown: <System Memory> at iomem 0-0x9ffff pnpid PNP0c01 on isa0
attimer0: <AT timer> at port 0x40-0x43 irq 0 pnpid PNP0100 on isa0
Timecounter "i8254" frequency 1193182 Hz quality 0
Event timer "i8254" frequency 1193182 Hz quality 100
atrtc0: <AT realtime clock> at port 0x70-0x71 irq 8 pnpid PNP0b00 on isa0
atrtc0: registered as a time-of-day clock (resolution 1000000us, adjustment 0.500000000s)
Event timer "RTC" frequency 32768 Hz quality 0
atkbdc0: <Keyboard controller (i8042)> at port 0x60,0x64 irq 1 pnpid PNP0303 on isa0
atkbd0: <AT Keyboard> irq 1 on atkbdc0
atkbd: the current kbd controller command byte 0045
atkbd: keyboard ID 0x41ab (2)
kbd0 at atkbd0
kbd0: atkbd0, AT 101/102 (2), config:0x0, flags:0x3d0000
atkbd0: [GIANT-LOCKED]
psm0: unable to allocate IRQ
(null) failed to probe at port 0x61 pnpid PNP0800 on isa0
uart0: <16550 or compatible> at port 0x3f8-0x3ff irq 4 flags 0x10 pnpid PNP0501 on isa0
uart0: fast interrupt
ppc0: using extended I/O port range
ppc0: SPP ECP  ECP+EPP
ppc0: <ECP parallel printer port> at port 0x378-0x37f,0x778-0x77f irq 7 drq 3 pnpid PNP0401 on isa0
ppc0: SMC-like chipset (ECP/EPP/PS2/NIBBLE) in COMPATIBLE mode
ppc0: FIFO with 16/16/8 bytes threshold
ppbus0: <Parallel port bus> on ppc0
lpt0: <Printer> on ppbus0
lpt0: Interrupt-driven port
ppi0: <Parallel I/O> on ppbus0
fdc0: ic_type 90 part_id 73
fdc0: <Enhanced floppy controller> at port 0x3f0-0x3f5,0x3f7 irq 6 drq 2 pnpid PNP0700 on isa0
fdc0: ic_type 90 part_id 73
fd0: <1440-KB 3.5" drive> on fdc0 drive 0
fd1: <1440-KB 3.5" drive> on fdc0 drive 1
ata: ata0 already exists; skipping it
ata: ata1 already exists; skipping it
atkbdc: atkbdc0 already exists; skipping it
atrtc: atrtc0 already exists; skipping it
attimer: attimer0 already exists; skipping it
fdc: fdc0 already exists; skipping it
ppc: ppc0 already exists; skipping it
sc: sc0 already exists; skipping it
uart: uart0 already exists; skipping it
isa_probe_children: probing non-PnP devices
orm0: <ISA Option ROMs> at iomem 0xc0000-0xc7fff,0xe4000-0xeffff pnpid ORM0000 on isa0
sc0: <System console> at flags 0x100 on isa0
sc0: VGA <16 virtual consoles, flags=0x300>
sc0: fb0, kbd1, terminal emulator: scteken (teken terminal)
vga0: <Generic ISA VGA> at port 0x3c0-0x3df iomem 0xa0000-0xbffff on isa0
uart1 failed to probe at port 0x2f8-0x2ff irq 3 on isa0
wbwd0 failed to probe on isa0
isa_probe_children: probing PnP devices
unknown: <PNP0c02> can't assign resources (port)
unknown: <PNP0c02> at port 0x4d0-0x4d1,0x8000-0x803f,0x7000-0x700f pnpid PNP0c02 on isa0
unknown: <PNP0c02> can't assign resources (memory)
unknown: <PNP0c02> pnpid PNP0c02 on isa0
unknown: <System Memory> can't assign resources (memory)
unknown: <System Memory> at iomem 0-0x9ffff pnpid PNP0c01 on isa0
(null) failed to probe at port 0x220-0x22f,0x530-0x537,0x388-0x38f,0x330-0x331,0x370-0x371 irq 5 drq 0,1 pnpid YMH0030 on isa0
(null) failed to probe at port 0x201 pnpid YMH0030 on isa0
(null) failed to probe at port 0x100-0x107 irq 3 pnpid USR600b on isa0
Device configuration finished.
procfs registered
Timecounters tick every 1.000 msec
vlan: initialized, using hash tables with chaining
tcp_init: net.inet.tcp.tcbhashsize auto tuned to 2048
lo0: bpf attached
hpt27xx: no controller detected.
hptrr: no controller detected.
hptnr: no controller detected.
usbus0: 12Mbps Full Speed USB v1.0
ata0: reset tp1 mask=03 ostat0=50 ostat1=51
ata0: stat0=0x50 err=0x01 lsb=0x00 msb=0x00
ata0: stat1=0x10 err=0x01 lsb=0x14 msb=0xeb
ata0: reset tp2 stat0=50 stat1=10 devices=0x20001
ugen0.1: <Intel> at usbus0
uhub0: <Intel UHCI root HUB, class 9/0, rev 1.00/1.00, addr 1> on usbus0
ata1: reset tp1 mask=00 ostat0=ff ostat1=ff
ada0 at ata0 bus 0 scbus0 target 0 lun 0
ada0: <Maxtor 6Y250P0 YAR41BW0> ATA-7 device
ada0: Serial Number Y62VF69E
ada0: 16.700MB/s transfers (PIO4, PIO 8192bytes)
ada0: 239372MB (490234752 512 byte sectors: 16H 63S/T 16383C)
ada0: Previously was known as ad0
pass0 at ata0 bus 0 scbus0 target 0 lun 0
pass0: <Maxtor 6Y250P0 YAR41BW0> ATA-7 device
pass0: Serial Number Y62VF69E
pass0: 16.700MB/s transfers (PIO4, PIO 8192bytes)
pass1 at ata0 bus 0 scbus0 target 1 lun 0
pass1: <YAMAHA CRW8824E 1.00> Removable CD-ROM SCSI device
pass1: Serial Number FCT0046728
pass1: 16.700MB/s transfers (PIO4, ATAPI 12bytes, PIO 65534bytes)
cd0 at ata0 bus 0 scbus0 target 1 lun 0
cd0: <YAMAHA CRW8824E 1.00> Removable CD-ROM SCSI device
cd0: Serial Number FCT0046728
cd0: 16.700MB/s transfers (PIO4, ATAPI 12bytes, PIO 65534bytes)
cd0: Attempt to query device size failed: NOT READY, Medium not present - tray closed
random: unblocking device.
Netvsc initializing... done!
Timecounter "TSC" frequency 266682911 Hz quality 800
uhub0: 2 ports with 2 removable, self powered
GEOM: new disk ada0
GEOM: new disk cd0
Trying to mount root from ufs:/dev/ada0s1a [rw]...
start_init: trying /sbin/init
warning: total configured swap (986208 pages) exceeds maximum recommended amount (344064 pages).
warning: increase kern.maxswzone or reduce amount of swap.
sis0: Applying short cable fix (reg=1d)
pid 569 (ntpd), uid 0: exited on signal 11 (core dumped)
```
