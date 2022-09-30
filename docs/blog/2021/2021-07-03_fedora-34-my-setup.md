---
title: "Fedora 34: My Setup"
date: "2021-07-03"
tags: ["blog", "linux", "fedora"]
type: post
permalink: /blog/fedora-34-my-setup
---

# {{ $frontmatter.title }} <Badge text="WIP" vertical="middle" type="warn"/>

## TLDR

See:

* <https://gist.github.com/mbana/cdfa87edef88046bc7e0108cc4be23ca>.
* [Entire Script](#entire-script).

## `hwinfo` and `hw-probe`

### `hw-probe`

See <https://linux-hardware.org/?probe=f61ba12c20>:

```sh
$ sudo -E hw-probe -all -upload
Probe for hardware ... Ok
Reading logs ... Ok
Uploaded to DB, Thank you!

Probe URL: https://linux-hardware.org/?probe=f61ba12c20
```

or

```sh
$ sudo -E hw-probe -probe
Probe for hardware ... Ok
Local probe path: /root/HW_PROBE/LATEST/hw.info
$ sudo hw-probe --show --verbose

Host Info
=========

System: fedora-34
Arch:   x86_64
Kernel: 5.12.13-300.fc34.x86_64
Vendor: Micro-Star International Co., Ltd.
Model:  PRESTIGE X570 CREATION
Year:   2021
Type:   desktop
Hwaddr: 43b5068dfeb73bba4c8d7196beaf6c4d


Devices (120)
=============

+------+---------------------+----------+------------------+-------------------------------------+--------------+------------+----------+
| Bus  | ID                  | Class    | Vendor           | Device                              | Type         | Driver     | Status   |
+------+---------------------+----------+------------------+-------------------------------------+--------------+------------+----------+
|      | 0                   |          |                  |                                     |              |            | detected |
| PCI  | 1002-731f-1462-3816 | 03-00    | Advanced Micr... | Navi 10 [Radeon RX 5600 OEM/5600... | graphics ... | amdgpu     | detected |
| PCI  | 10de-2204-1462-3884 | 03-00    | NVIDIA Corpor... | GA102 [GeForce RTX 3090]            | graphics ... | nvidia     | works    |
| PCI  | 1002-ab38-1002-ab38 | 04-03    | Advanced Micr... | Navi 10 HDMI Audio                  | sound        | snd_hda... | detected |
| PCI  | 1022-1487-1462-6c36 | 04-03    | Advanced Micr... | Starship/Matisse HD Audio Contro... | sound        | snd_hda... | detected |
| PCI  | 10de-1aef-1462-3884 | 04-03    | NVIDIA Corpor... | GA102 High Definition Audio Cont... | sound        | snd_hda... | detected |
| PCI  | 1d6a-07b1-1462-7c36 | 02-00    | Aquantia Corp.   | AQC107 NBase-T/IEEE 802.3bz Ethe... | network      | atlantic   | works    |
| PCI  | 8086-1539-1462-7c36 | 02-00    | Intel Corpora... | I211 Gigabit Network Connection     | network      | igb        | works    |
| PCI  | 8086-2723-8086-0084 | 02-80    | Intel Corpora... | Wi-Fi 6 AX200                       | network      | iwlwifi    | works    |
| PCI  | 1022-7901-1022-7901 | 01-06-01 | Advanced Micr... | FCH SATA Controller [AHCI mode]     | storage      | ahci       | detected |
| PCI  | 1022-7901-1022-7901 | 01-06-01 | Advanced Micr... | FCH SATA Controller [AHCI mode]     | storage      | ahci       | detected |
| PCI  | 1987-5016-1987-5016 | 01-08-02 | Phison Electr... | E16 PCIe4 NVMe Controller           | storage      | nvme       | works    |
| PCI  | 1b21-0612-1b21-1060 | 01-06-01 | ASMedia Techn... | ASM1062 Serial ATA Controller       | storage      | ahci       | detected |
| PCI  | 1002-1478           | 06-04    | Advanced Micr... | Navi 10 XL Upstream Port of PCI ... | bridge       | pcieport   | detected |
| PCI  | 1002-1479-1002-1479 | 06-04    | Advanced Micr... | Navi 10 XL Downstream Port of PC... | bridge       | pcieport   | detected |
| PCI  | 1022-1440           | 06-00    | Advanced Micr... | Matisse Device 24: Function 0       | bridge       |            | detected |
| PCI  | 1022-1441           | 06-00    | Advanced Micr... | Matisse Device 24: Function 1       | bridge       |            | detected |
| PCI  | 1022-1442           | 06-00    | Advanced Micr... | Matisse Device 24: Function 2       | bridge       |            | detected |
| PCI  | 1022-1443           | 06-00    | Advanced Micr... | Matisse Device 24: Function 3       | bridge       | k10temp    | detected |
| PCI  | 1022-1444           | 06-00    | Advanced Micr... | Matisse Device 24: Function 4       | bridge       |            | detected |
| PCI  | 1022-1445           | 06-00    | Advanced Micr... | Matisse Device 24: Function 5       | bridge       |            | detected |
| PCI  | 1022-1446           | 06-00    | Advanced Micr... | Matisse Device 24: Function 6       | bridge       |            | detected |
| PCI  | 1022-1447           | 06-00    | Advanced Micr... | Matisse Device 24: Function 7       | bridge       |            | detected |
| PCI  | 1022-1480-1462-7c36 | 06-00    | Advanced Micr... | Starship/Matisse Root Complex       | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1482           | 06-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Host... | bridge       |            | detected |
| PCI  | 1022-1483-1462-7c36 | 06-04    | Advanced Micr... | Starship/Matisse GPP Bridge         | bridge       | pcieport   | works    |
| PCI  | 1022-1483-1462-7c36 | 06-04    | Advanced Micr... | Starship/Matisse GPP Bridge         | bridge       | pcieport   | works    |
| PCI  | 1022-1483-1462-7c36 | 06-04    | Advanced Micr... | Starship/Matisse GPP Bridge         | bridge       | pcieport   | works    |
| PCI  | 1022-1484-7c36-1462 | 06-04    | Advanced Micr... | Starship/Matisse Internal PCIe G... | bridge       | pcieport   | detected |
| PCI  | 1022-1484-7c36-1462 | 06-04    | Advanced Micr... | Starship/Matisse Internal PCIe G... | bridge       | pcieport   | detected |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a3-1462-7c36 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | works    |
| PCI  | 1022-57a4-7c36-1462 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | detected |
| PCI  | 1022-57a4-7c36-1462 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | detected |
| PCI  | 1022-57a4-7c36-1462 | 06-04    | Advanced Micr... | Matisse PCIe GPP Bridge             | bridge       | pcieport   | detected |
| PCI  | 1022-57ad           | 06-04    | Advanced Micr... | Matisse Switch Upstream             | bridge       | pcieport   | works    |
| PCI  | 1022-790e-1462-7c36 | 06-01    | Advanced Micr... | FCH LPC Bridge                      | bridge       |            | detected |
| PCI  | 1b21-1184-1b21-118f | 06-04    | ASMedia Techn... | ASM1184e 4-Port PCIe x1 Gen2 Pac... | bridge       | pcieport   | detected |
| PCI  | 1b21-1184-1b21-118f | 06-04    | ASMedia Techn... | ASM1184e 4-Port PCIe x1 Gen2 Pac... | bridge       | pcieport   | detected |
| PCI  | 1b21-1184-1b21-118f | 06-04    | ASMedia Techn... | ASM1184e 4-Port PCIe x1 Gen2 Pac... | bridge       | pcieport   | detected |
| PCI  | 1b21-1184-1b21-118f | 06-04    | ASMedia Techn... | ASM1184e 4-Port PCIe x1 Gen2 Pac... | bridge       | pcieport   | detected |
| PCI  | 1b21-1184-1b21-118f | 06-04    | ASMedia Techn... | ASM1184e 4-Port PCIe x1 Gen2 Pac... | bridge       | pcieport   | detected |
| PCI  | 1022-1485-1462-7c36 | 13-00    | Advanced Micr... | Starship/Matisse Reserved SPP       | non-essen... |            | detected |
| PCI  | 1022-1485-1462-7c36 | 13-00    | Advanced Micr... | Starship/Matisse Reserved SPP       | non-essen... |            | detected |
| PCI  | 1022-148a-1462-7c36 | 13-00    | Advanced Micr... | Starship/Matisse PCIe Dummy Func... | non-essen... |            | detected |
| PCI  | 1022-790b-1462-7c36 | 0c-05    | Advanced Micr... | FCH SMBus Controller                | smbus        | i2c_pii... | detected |
| PCI  | 1022-149c-1022-148c | 0c-03-30 | Advanced Micr... | Matisse USB 3.0 Host Controller     | usb contr... | xhci_hcd   | detected |
| PCI  | 1022-149c-1462-7c36 | 0c-03-30 | Advanced Micr... | Matisse USB 3.0 Host Controller     | usb contr... | xhci_hcd   | detected |
| PCI  | 1022-149c-1462-7c36 | 0c-03-30 | Advanced Micr... | Matisse USB 3.0 Host Controller     | usb contr... | xhci_hcd   | detected |
| USB  | 8087-0029           | e0-01-01 | Intel Corp.      | AX200 Bluetooth                     | bluetooth    | btusb      | detected |
| USB  | 046d-086b           | 0e-01-00 | Logitech, Inc.   | Logi 4K Stream Edition              | camera       | usbhid     | detected |
| USB  | 4971-1001           | 08-06-50 | SimpleTech       | SW_VCD                              | cdrom        | uas, us... | detected |
| USB  | 0634-5600           | 08-06-50 | Micron Techno... | Crucial X8 SSD                      | disk         | uas        | detected |
| USB  | 0781-5588           | 08-06-50 | SanDisk Corp.    | Extreme Pro                         | disk         | uas        | detected |
| USB  | 05e3-0608           | 09-00-00 | Genesys Logic... | Hub                                 | hub          | hub        | detected |
| USB  | 0bda-0411           | 09-00-00 | Realtek Semic... | Hub                                 | hub          | hub        | detected |
| USB  | 0bda-5411           | 09-00-01 | Realtek Semic... | RTS5411 Hub                         | hub          | hub        | detected |
| USB  | 174c-2074           | 09-00-01 | ASMedia Techn... | ASM1074 High-Speed hub              | hub          | hub        | detected |
| USB  | 174c-2074           | 09-00-01 | ASMedia Techn... | ASM1074 High-Speed hub              | hub          | hub        | detected |
| USB  | 174c-3074           | 09-00-00 | ASMedia Techn... | ASM1074 SuperSpeed hub              | hub          | hub        | detected |
| USB  | 174c-3074           | 09-00-00 | ASMedia Techn... | ASM1074 SuperSpeed hub              | hub          | hub        | detected |
| USB  | 1d6b-0002           | 09-00-00 | Linux Foundation | 2.0 root hub                        | hub          | hub        | detected |
| USB  | 1d6b-0002           | 09-00-00 | Linux Foundation | 2.0 root hub                        | hub          | hub        | detected |
| USB  | 1d6b-0002           | 09-00-00 | Linux Foundation | 2.0 root hub                        | hub          | hub        | detected |
| USB  | 1d6b-0003           | 09-00-00 | Linux Foundation | 3.0 root hub                        | hub          | hub        | detected |
| USB  | 1d6b-0003           | 09-00-00 | Linux Foundation | 3.0 root hub                        | hub          | hub        | detected |
| USB  | 1d6b-0003           | 09-00-00 | Linux Foundation | 3.0 root hub                        | hub          | hub        | detected |
| USB  | 1462-7c36           | 03-00-00 | Micro Star In... | MYSTIC LIGHT                        | human int... | usbhid     | detected |
| USB  | 046d-c33c           | 03-01-01 | Logitech, Inc.   | G513 RGB MECHANICAL GAMING KEYBOARD | keyboard     | usbhid     | detected |
| USB  | 046d-c08b           | 03-01-02 | Logitech, Inc.   | G502 SE HERO Gaming Mouse           | mouse        | usbhid     | detected |
| EISA | samsung-sam0f9c     |          | Samsung          | C49RG9x SAM0F9C 3840x1080 1193x3... | monitor      |            | detected |
| SYS  | american-megatre... |          | American Mega... | BIOS 1.E2 06/23/2021                | bios         |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | amd-23-113-0-ryz... |          | AMD              | Ryzen 9 3950X 16-Core Processor     | cpu          |            | works    |
| SYS  | corsair-cmk32gx4... |          | Corsair          | RAM CMK32GX4M1D3000C16 32GB DIMM... | memory       |            | works    |
| SYS  | corsair-cmk32gx4... |          | Corsair          | RAM CMK32GX4M1D3000C16 32GB DIMM... | memory       |            | works    |
| SYS  | micro-star-inter... |          | Micro-Star In... | Motherboard PRESTIGE X570 CREATI... | motherboard  |            | works    |
| SCSI | micron-crucial-x... |          | Micron           | Crucial X8 SSD 2TB                  | disk         | uas, sd    | detected |
| SCSI | sandisk-3-2-gen-1   |          | SanDisk          | 3.2 Gen 1 496GB SSD                 | disk         | uas, sd    | detected |
| NVME | phison-sabrent-r... |          | Phison           | Sabrent Rocket Q4 1TB               | disk         | nvme       | works    |
+------+---------------------+----------+------------------+-------------------------------------+--------------+------------+----------+

```

### `hwinfo`

```sh
sudo hwinfo --short --all
cpu:
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 3618 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 3500 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 3500 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2266 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 2200 MHz
                       AMD Ryzen 9 3950X 16-Core Processor, 3500 MHz
keyboard:
  /dev/input/event4    Logitech G513 RGB MECHANICAL GAMING KEYBOARD
mouse:
  /dev/input/mice      Logitech G502 HERO Gaming Mouse
monitor:
                       SAMSUNG C49RG9x
graphics card:
                       nVidia VGA compatible controller
                       ATI Navi 10
sound:
                       ATI Navi 10 HDMI Audio
                       AMD Starship/Matisse HD Audio Controller
                       nVidia Audio device
storage:
                       AMD FCH SATA Controller [AHCI mode]
                       AMD FCH SATA Controller [AHCI mode]
                       Phison Electronics Non-Volatile memory controller
                       ASMedia ASM1062 Serial ATA Controller
network:
  enp36s0              Aquantia AQC107 NBase-T/IEEE 802.3bz Ethernet Controller [AQtion]
  wlo1                 Intel WLAN controller
  enp43s0              Intel I211 Gigabit Network Connection
network interface:
  enp36s0              Ethernet network interface
  virbr0               Ethernet network interface
  wlo1                 Ethernet network interface
  enp43s0              Ethernet network interface
  lo                   Loopback network interface
disk:
  /dev/nvme0n1         Phison Electronics Disk
  /dev/sdb             Micron Crucial X8 SSD
  /dev/sdc             Hitachi HTS545032B9A300
  /dev/sda             SanDisk 3.2 Gen 1
  /dev/zram0           Disk
                       SanDisk 3.2 Gen 1
                       Micron Crucial X8 SSD
partition:
  /dev/nvme0n1p1       Partition
  /dev/nvme0n1p2       Partition
  /dev/nvme0n1p3       Partition
  /dev/sdb1            Partition
  /dev/sdc1            Partition
  /dev/sda1            Partition
  /dev/sda2            Partition
  /dev/sda3            Partition
cdrom:
  /dev/sr0             Hitachi SW_VCD
usb controller:
                       AMD Matisse USB 3.0 Host Controller
                       AMD Matisse USB 3.0 Host Controller
                       AMD Matisse USB 3.0 Host Controller
bios:
                       BIOS
bridge:
                       AMD Starship/Matisse GPP Bridge
                       AMD PCI bridge
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD PCI bridge
                       AMD Matisse Device 24: Function 3
                       AMD Starship/Matisse GPP Bridge
                       AMD PCI bridge
                       AMD Matisse Device 24: Function 1
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       ASMedia ASM1184e PCIe Switch Port
                       ASMedia ASM1184e PCIe Switch Port
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD PCI bridge
                       AMD FCH LPC Bridge
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD PCI bridge
                       AMD PCI bridge
                       AMD Matisse Device 24: Function 6
                       AMD PCI bridge
                       AMD Starship/Matisse GPP Bridge
                       AMD Starship/Matisse Root Complex
                       AMD Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
                       AMD Matisse Device 24: Function 4
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD PCI bridge
                       ASMedia ASM1184e PCIe Switch Port
                       AMD Matisse Device 24: Function 2
                       AMD PCI bridge
                       AMD Matisse Device 24: Function 0
                       ASMedia ASM1184e PCIe Switch Port
                       AMD Starship/Matisse Internal PCIe GPP Bridge 0 to bus[E:B]
                       ATI PCI bridge
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD Matisse Device 24: Function 7
                       AMD Starship/Matisse PCIe Dummy Host Bridge
                       AMD PCI bridge
                       ASMedia ASM1184e PCIe Switch Port
                       AMD Matisse Device 24: Function 5
                       ATI PCI bridge
hub:
                       Linux Foundation 3.0 root hub
                       ASMedia ASM1074 High-Speed hub
                       ASMedia ASM1074 SuperSpeed hub
                       Linux Foundation 2.0 root hub
                       ASMedia ASM1074 SuperSpeed hub
                       Linux Foundation 3.0 root hub
                       Linux Foundation 2.0 root hub
                       Genesys Logic Hub
                       Linux Foundation 2.0 root hub
                       Realtek 4-Port USB 2.1 Hub
                       Realtek 4-Port USB 3.1 Hub
                       ASMedia ASM1074 High-Speed hub
                       Linux Foundation 3.0 root hub
memory:
                       Main Memory
bluetooth:
                       Intel Bluetooth Device
unknown:
                       FPU
                       DMA controller
                       PIC
                       Keyboard controller
                       AMD Starship/Matisse Reserved SPP
                       AMD Starship/Matisse Reserved SPP
                       AMD Starship/Matisse PCIe Dummy Function
                       AMD FCH SMBus Controller
  /dev/ttyS0           16550A
  /dev/input/event3    Logitech Logi 4K Stream Edition
  /dev/input/event5    Logitech G513 RGB MECHANICAL GAMING KEYBOARD
  /dev/input/event2    Micro Star International MYSTIC LIGHT
  /dev/input/event7    Logitech G502 HERO Gaming Mouse
```

## Kernel Parameters

Set keyboard layout:

```sh
sudo grubby --update-kernel=ALL --args="vconsole.keymap=gb"
```

Reduce logging output:

```sh
sudo grubby --update-kernel=ALL --args="loglevel=0 rd.udev.log_priority=0 rd.systemd.show_status=0"
```

1. Ignore Windows SSD drive, see: <https://askubuntu.com/questions/352836/how-can-i-tell-linux-kernel-to-completely-ignore-a-disk-as-if-it-was-not-even-co>
2. Full control of your AMD GPU while using the amdgpu driver, you need to append the boot parameter `amdgpu.ppfeaturemask=0xffffffff`.
3. Required by `lm-sensors`/`sensors-detect` for X570 boards.

```sh
sudo grubby --update-kernel=ALL --args="libata.force=1.00:disable acpi_enforce_resources=lax amdgpu.ppfeaturemask=0xffffffff"
```

Enable `zswap`, see <https://fedoraproject.org/wiki/Zswap>:

```sh
sudo grubby --update-kernel=ALL --args="zswap.enabled=1 zswap.max_pool_percent=25 zswap.compressor=lz4hc"
```

1. Disable Plymouth
2. Disable logo
3. Boot in verbose mode:
4. Remove redhat graphical boot.

```sh
sudo grubby --update-kernel=ALL --remove-args="rhgb quiet" --args="rd.plymouth=0 plymouth.enable=0 logo.nologo nosplash verbose"
```

## `/etc/dnf/dnf.conf` configuration

```sh
echo 'max_parallel_downloads=32' | sudo tee -a /etc/dnf/dnf.conf
echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
```

## Repositories configuration

```sh
sudo dnf install fedora-workstation-repositories
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install libdvdcss

sudo dnf install -y rpmfusion-nonfree-release-tainted

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf config-manager --set-enabled google-chrome
sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam
sudo dnf config-manager --set-enabled rpmfusion-free
sudo dnf config-manager --set-enabled rpmfusion-free-updates
sudo dnf update -y
```

## zsh installation and configuration

```sh
sudo dnf install -y git git-lfs vim curl wget zsh zsh-syntax-highlighting zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo usermod -s $(which zsh) mbana
```

## Install Software

```sh
sudo dnf install -y curl wget \
  vim bash-completion \
  kernel-devel-$(uname -r) kernel-headers-$(uname -r) \
  git git-lfs wget curl util-linux-user \
  make \
  coreutils tree coreutils-common progress nmap arp-scan iproute net-tools iputils \
  powerline vim-powerline tmux-powerline powerline-fonts fontawesome-fonts \
  google-chrome-stable \
  steam \
  gnome-extensions-app gnome-extensions-app gnome-tweaks gnome-shell-extension-appindicator \
  gnome-shell-extension-pop-shell \
  mozilla-fira-fonts-common mozilla-fira-mono-fonts mozilla-fira-sans-fonts fira-code-fonts \
  fira-code-fonts 'mozilla-fira*' 'google-roboto*' \
  jq \
  timeshift \
  yubikey-manager \
  gpg gnupg2 \
  p7zip p7zip-plugins gzip xz bzip2 lzo lz4 lzma libknet1-compress-lz4-plugin \
  kernel-devel-$(uname -r) kernel-headers-$(uname -r) \
  coreutils util-linux tree jq parallel \
  corectrl \
  dnfdragora \
  mesa-demos vulkan-tools vkmark \
  mangohud goverlay \
  neofetch lm_sensors \
  inkscape gimp \
```

```sh
sudo dnf install \
  dnf-plugins-core \
  dnf-plugin-showvars \
  dnf-plugin-tracer
```

### Install more fonts

```sh
function install_and_use_fonts() {
  sudo dnf copr enable peterwu/iosevka
  sudo dnf install -y \
    '*iosevka*'
  echo '-------------------------------------------------------------------------------'
  # https://gist.github.com/alokyadav15/c3a2bbe6089ceff286215113bd092703
  TEMP_DIR="$(mktemp -d)"
  cd "${TEMP_DIR}"

  # git clone --depth=1 git@github.com:mozilla/Fira.git ./mozilla-Fira
  git clone --depth=1 https://github.com/mozilla/Fira.git ./mozilla-Fira
  sudo cp -r ./mozilla-Fira /usr/share/fonts/mozilla-Fira

  fc-cache --force --really-force --system-only --verbose /usr/share/fonts-mozilla-Fira || true
  fc-cache --force --really-force --system-only --verbose /usr/share/fonts/mozilla-Fira || true
  sudo fc-cache --force --really-force --system-only --verbose /usr/share/fonts-mozilla-Fira || true
  sudo fc-cache --force --really-force --system-only --verbose /usr/share/fonts/mozilla-Fira || true
  fc-cache --force --really-force --verbose || true
  fc-cache --force --really-force --system-only --verbose || true

  gsettings set org.gnome.desktop.interface document-font-name 'Fira Sans Regular 11'
  gsettings set org.gnome.desktop.interface font-name 'Fira Sans Regular 11'
  gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono Regular 11'
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Bold 11'
  gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

  gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
  gsettings set org.gnome.desktop.interface font-rgba-order 'rgb'
  gsettings set org.gnome.desktop.interface font-hinting 'slight'

  cd ~
  rm -fr "${TEMP_DIR}"
}

install_and_use_fonts
```

### Upgrade

```sh
sudo dnf upgrade --refresh
sudo dnf groupupdate core
```

### Install Flatpaks

See:

* <https://developer.fedoraproject.org/deployment/flatpak/flatpak-usage.html>.
* <https://docs.fedoraproject.org/en-US/flatpak/>.

```sh
flatpak remote-add --system -vv --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-add --system -vv --if-not-exists fedora oci+https://registry.fedoraproject.org
flatpak update --system -vv
flatpak install --system -vv flathub org.signal.Signal
flatpak install --system -vv flathub com.skype.Client
flatpak install --system -vv flathub us.zoom.Zoom
flatpak install --system -vv flathub com.vscodium.codium
flatpak install --system -vv flathub com.visualstudio.code
flatpak install --system -vv flathub com.visualstudio.code-oss
flatpak install --system -vv flathub org.mozilla.firefox
```

### Install Visual Studio Code

```sh
cd /tmp
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code
xdg-mime default code.desktop text/plain
echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf
echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p
```

### Install Multimedia

```sh
sudo dnf groupupdate sound-and-video
sudo dnf install libdvdcss
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264
```

### Install Development Tools

```sh
sudo dnf install \
  make \
  cargo \
  rust rust-debugger-common rust-doc rust-gdb rust-lldb rust-src rust-std-static rustfmt \
  golang \
  nodejs npm yarnpkg nodejs-typescript
```

## `/etc/modprobe.d/*.conf` Configurations

```sh
# https://www.reddit.com/r/RetroPie/comments/aakkop/xbox_one_s_controller_disable_ertm_persist_on/
echo 'options bluetooth disable_ertm=1' | sudo tee -a /etc/modprobe.d/bluetooth-xbox-one-s.conf
# https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
echo 'options iwlmvm power_scheme=1' | sudo tee -a /etc/modprobe.d/iwlmvm.conf
# https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
echo 'options iwlwifi power_level=5' | sudo tee -a /etc/modprobe.d/iwlwifi.conf
# https://nullr0ute.com/2021/03/setting-the-wireless-regulatory-domain/
# https://wireless.wiki.kernel.org/en/developers/regulatory/crda
# https://www.linuxquestions.org/questions/slackware-14/network-manager-wifi-regional-settings-4175559295/
# http://cachestocaches.com/2016/1/disabling-ubuntus-broken-wi-fi-driver/
echo 'options cfg80211 ieee80211_regdom=GB' | sudo tee -a /etc/modprobe.d/cfg80211.conf
sudo iw reg set GB
```

### Nvidia <Badge text="TODO" vertical="middle" type="info"/>

See <https://rpmfusion.org/Howto/NVIDIA>.

```sh
sudo dnf install \
  akmod-nvidia \
  xorg-x11-drv-nvidia-cuda
```

## `/etc/dracut.conf.d/lz4.conf`: Configuration

See <https://gist.github.com/raymanfx/7b672c9fa59996a73c049e507f33fafb>.

```sh
echo 'hostonly="yes"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
echo 'compress="lz4"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
echo 'add_drivers+="lz4hc lz4hc_compress"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
```

## Additional configuration

```sh
yes | sudo sensors-detect
```

## Done

```sh
echo '-------------------------------------------------------------------------------'
sudo dracut --force --verbose --regenerate-all
echo '-------------------------------------------------------------------------------'
sudo dnf autoremove
echo '-------------------------------------------------------------------------------'
sudo systemctl reboot
```

## References

* <https://github.com/smvarela/fedora-postinstall>.
* <https://mutschler.eu/linux/install-guides/fedora-post-install/>.
* <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/basic-system-configuration/System_Locale_and_Keyboard_Configuration/>.
* <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/basic-system-configuration/System_Locale_and_Keyboard_Configuration/>.
* <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/>.
* <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/kernel-module-driver-configuration/Working_with_Kernel_Modules/>.
* <https://wiki.archlinux.org/index.php/silent_boot>.
* <https://rpmfusion.org/Howto/NVIDIA>.

## Entire Script

```sh
#!/usr/bin/env bash
# References:
#
# * <https://github.com/smvarela/fedora-postinstall>.
# * <https://mutschler.eu/linux/install-guides/fedora-post-install/>.
# * <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/basic-system-configuration/System_Locale_and_Keyboard_Configuration/>.
# * <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/>.
# * <https://docs.fedoraproject.org/en-US/fedora/f34/system-administrators-guide/kernel-module-driver-configuration/Working_with_Kernel_Modules/>.
# * <https://wiki.archlinux.org/index.php/silent_boot>.
# * <https://rpmfusion.org/Howto/NVIDIA>.
set -eufo pipefail

timedatectl set-timezone Europe/London
timedatectl set-ntp yes
# # Warning: The system is configured to read the RTC time in the local time zone.
# #          This mode cannot be fully supported. It will create various problems
# #          with time zone changes and daylight saving time adjustments. The RTC
# #          time is never updated, it relies on external facilities to maintain it.
# #          If at all possible, use RTC in UTC by calling
# #          'timedatectl set-local-rtc 0'.
# timedatectl set-local-rtc 0

function kernel_parameters_configuration() {
  echo '-------------------------------------------------------------------------------'
  # rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1
  sudo grubby --update-kernel=ALL --args="vconsole.keymap=gb"
  sudo grubby --update-kernel=ALL --args="loglevel=0 rd.udev.log_priority=0 rd.systemd.show_status=0"
  sudo grubby --update-kernel=ALL --args="libata.force=1.00:disable acpi_enforce_resources=lax amdgpu.ppfeaturemask=0xffffffff"
  sudo grubby --update-kernel=ALL --args="zswap.enabled=1 zswap.max_pool_percent=25 zswap.compressor=lz4hc"
  sudo grubby --update-kernel=ALL --remove-args="rhgb quiet" --args="rd.plymouth=0 plymouth.enable=0 logo.nologo nosplash verbose"
  echo '-------------------------------------------------------------------------------'
}
kernel_parameters_configuration

function configure_dnf() {
  echo '-------------------------------------------------------------------------------'
  echo 'max_parallel_downloads=20' | sudo tee -a /etc/dnf/dnf.conf
  echo 'fastestmirror=true' | sudo tee -a /etc/dnf/dnf.conf
  echo 'deltarpm=true' | sudo tee -a /etc/dnf/dnf.conf
  # https://dnf-plugins-extras.readthedocs.io/en/latest/
  # sudo dnf install dnf-plugins-core
  # sudo dnf install dnf-plugin-kickstart
  # sudo dnf install dnf-plugin-rpmconf
  # sudo dnf install dnf-plugin-showvars
  # sudo dnf install dnf-plugin-snapper
  # sudo dnf install dnf-plugin-system-upgrade
  # sudo dnf install dnf-plugin-torproxy
  # sudo dnf install dnf-plugin-tracer
  sudo dnf install \
    dnf-plugins-core \
    dnf-plugin-showvars \
    dnf-plugin-tracer
  echo '-------------------------------------------------------------------------------'

}
configure_dnf

sudo dnf install fedora-workstation-repositories
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf groupupdate core
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate sound-and-video

sudo dnf install -y rpmfusion-free-release-tainted
sudo dnf install libdvdcss

sudo dnf install -y rpmfusion-nonfree-release-tainted

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf config-manager --set-enabled google-chrome
sudo dnf config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
sudo dnf config-manager --set-enabled rpmfusion-nonfree-steam
sudo dnf config-manager --set-enabled rpmfusion-free
sudo dnf config-manager --set-enabled rpmfusion-free-updates
sudo dnf update -y

sudo dnf install -y \
  vim bash-completion \
  kernel-devel-$(uname -r) kernel-headers-$(uname -r) \
  git git-lfs wget curl util-linux-user \
  make \
  coreutils tree coreutils-common progress nmap arp-scan iproute net-tools iputils \
  powerline vim-powerline tmux-powerline powerline-fonts fontawesome-fonts \
  google-chrome-stable \
  steam \
  gnome-extensions-app gnome-extensions-app gnome-tweaks gnome-shell-extension-appindicator \
  gnome-shell-extension-pop-shell \
  mozilla-fira-fonts-common mozilla-fira-mono-fonts mozilla-fira-sans-fonts fira-code-fonts \
  fira-code-fonts 'mozilla-fira*' 'google-roboto*' \
  jq \
  timeshift \
  yubikey-manager \
  gpg gnupg2 \
  p7zip p7zip-plugins gzip xz bzip2 lzo lz4 lzma libknet1-compress-lz4-plugin \
  kernel-devel-$(uname -r) kernel-headers-$(uname -r) \
  coreutils util-linux tree jq parallel ShellCheck shfmt \
  corectrl \
  dnfdragora \
  mesa-demos vulkan-tools vkmark \
  mangohud goverlay \
  neofetch lm_sensors hw-probe \
  inkscape gimp

# MANGOHUD=0 vkmark --present-mode immediate

function install_and_use_fonts() {
  sudo dnf copr enable peterwu/iosevka
  sudo dnf install -y \
    '*iosevka*'
  echo '-------------------------------------------------------------------------------'
  # https://gist.github.com/alokyadav15/c3a2bbe6089ceff286215113bd092703
  TEMP_DIR="$(mktemp -d)"
  cd "${TEMP_DIR}"

  # git clone --depth=1 git@github.com:mozilla/Fira.git ./mozilla-Fira
  git clone --depth=1 https://github.com/mozilla/Fira.git ./mozilla-Fira
  sudo cp -r ./mozilla-Fira /usr/share/fonts/mozilla-Fira

  fc-cache --force --really-force --system-only --verbose /usr/share/fonts-mozilla-Fira || true
  fc-cache --force --really-force --system-only --verbose /usr/share/fonts/mozilla-Fira || true
  sudo fc-cache --force --really-force --system-only --verbose /usr/share/fonts-mozilla-Fira || true
  sudo fc-cache --force --really-force --system-only --verbose /usr/share/fonts/mozilla-Fira || true
  fc-cache --force --really-force --verbose || true
  fc-cache --force --really-force --system-only --verbose || true

  gsettings set org.gnome.desktop.interface document-font-name 'Fira Sans Regular 11'
  gsettings set org.gnome.desktop.interface font-name 'Fira Sans Regular 11'
  gsettings set org.gnome.desktop.interface monospace-font-name 'Fira Mono Regular 11'
  gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Fira Sans Bold 11'
  gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

  gsettings set org.gnome.desktop.interface font-antialiasing 'rgba'
  gsettings set org.gnome.desktop.interface font-rgba-order 'rgb'
  gsettings set org.gnome.desktop.interface font-hinting 'slight'

  cd ~
  rm -fr "${TEMP_DIR}"
}
install_and_use_fonts

sudo dnf upgrade --refresh
sudo dnf groupupdate core

function flatpak_configuration() {
  echo '-------------------------------------------------------------------------------'
  # https://developer.fedoraproject.org/deployment/flatpak/flatpak-usage.html
  # https://docs.fedoraproject.org/en-US/flatpak/
  flatpak remote-add --system -vv --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak remote-add --system -vv --if-not-exists fedora oci+https://registry.fedoraproject.org
  flatpak update --system -vv
  flatpak install --system -vv flathub org.signal.Signal
  flatpak install --system -vv flathub com.skype.Client
  flatpak install --system -vv flathub us.zoom.Zoom
  flatpak install --system -vv flathub com.vscodium.codium
  flatpak install --system -vv flathub com.visualstudio.code
  flatpak install --system -vv flathub com.visualstudio.code-oss
  flatpak install --system -vv flathub org.mozilla.firefox
  echo '-------------------------------------------------------------------------------'
}
flatpak_configuration

function install_vscode() {
  echo '-------------------------------------------------------------------------------'
  cd /tmp
  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
  sudo dnf check-update
  sudo dnf install code
  xdg-mime default code.desktop text/plain
  echo 'fs.inotify.max_user_watches=524288' | sudo tee -a /etc/sysctl.conf
  echo 'vm.swappiness=10' | sudo tee -a /etc/sysctl.conf
  sudo sysctl -p
  echo '-------------------------------------------------------------------------------'
}
install_vscode

sudo dnf groupupdate sound-and-video
sudo dnf install libdvdcss
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,ugly-\*,base} gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel ffmpeg gstreamer-ffmpeg
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install -y gstreamer1-plugin-openh264 mozilla-openh264

sudo dnf group install 'Development Tools'
sudo dnf install \
  make \
  cargo \
  rust rust-debugger-common rust-doc rust-gdb rust-lldb rust-src rust-std-static rustfmt \
  golang \
  nodejs npm yarnpkg nodejs-typescript

sudo dnf install vala libvala libgee-devel vte291-devel json-glib-devel

function dracut_configuration() {
  echo '-------------------------------------------------------------------------------'
  # https://gist.github.com/raymanfx/7b672c9fa59996a73c049e507f33fafb
  echo 'hostonly="yes"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
  echo 'compress="lz4"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
  echo 'add_drivers+="lz4hc lz4hc_compress"' | sudo tee -a /etc/dracut.conf.d/lz4.conf
  echo '-------------------------------------------------------------------------------'
}
dracut_configuration

function modprobe_configuration() {
  echo '-------------------------------------------------------------------------------'
  # https://www.reddit.com/r/RetroPie/comments/aakkop/xbox_one_s_controller_disable_ertm_persist_on/
  echo 'options bluetooth disable_ertm=1' | sudo tee -a /etc/modprobe.d/bluetooth-xbox-one-s.conf
  # https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
  echo 'options iwlmvm power_scheme=1' | sudo tee -a /etc/modprobe.d/iwlmvm.conf
  # https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
  echo 'options iwlwifi power_level=5' | sudo tee -a /etc/modprobe.d/iwlwifi.conf
  # https://nullr0ute.com/2021/03/setting-the-wireless-regulatory-domain/
  # https://wireless.wiki.kernel.org/en/developers/regulatory/crda
  # https://www.linuxquestions.org/questions/slackware-14/network-manager-wifi-regional-settings-4175559295/
  # http://cachestocaches.com/2016/1/disabling-ubuntus-broken-wi-fi-driver/
  echo 'options cfg80211 ieee80211_regdom=GB' | sudo tee -a /etc/modprobe.d/cfg80211.conf
  sudo iw reg set GB
  echo '-------------------------------------------------------------------------------'
}
modprobe_configuration

function ssh_configuration() {
  echo '-------------------------------------------------------------------------------'
  echo 'TODO: ssh_configuration'
  echo '-------------------------------------------------------------------------------'
}
ssh_configuration

echo '-------------------------------------------------------------------------------'
yes | sudo sensors-detect
echo '-------------------------------------------------------------------------------'

function regenerate_grub() {
  echo '-------------------------------------------------------------------------------'
  sudo dracut --force --verbose --regenerate-all
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
  sudo dracut --force --verbose --regenerate-all
  echo '-------------------------------------------------------------------------------'
}
regenerate_grub

function shell_configuration() {
  echo '-------------------------------------------------------------------------------'
  sudo dnf install -y git git-lfs vim curl wget zsh zsh-syntax-highlighting zsh-autosuggestions
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo usermod -s "$(which zsh)" "${USER}"
  echo '-------------------------------------------------------------------------------'
}
shell_configuration

echo '-------------------------------------------------------------------------------'
sudo dnf autoremove
echo '-------------------------------------------------------------------------------'

sudo systemctl reboot
```
