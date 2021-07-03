---
title: "Fedora 33: BTRFS configuration for Timeshift"
date: "2021-06-07"
tags: ["blog", "linux", "fedora"]
type: post
permalink: /blog/fedora-33-btrs-timeshift
---

Configuration to get [Timeshift](https://github.com/teejee2008/timeshift) working.

## `timeshift` and `timeshift-gtk`: Install Timeshift

```sh
sudo dnf install -y timeshift timeshift-gtk
```

## Rename subvolumes

Replace:

1. `home00` with the name of `home` partition.
2. `root00` with the name of `root` partition.

```sh
sudo dnf install -y util-linux
sudo mkdir -pv /tmp/btrs_rename
BTRFS_PARTITION="$(findmnt --noheadings --nofsroot --types btrfs -o source --list /)"
sudo mount "${BTRFS_PARTITION}" /tmp/btrs_rename
sudo mv -v /tmp/btrs_rename/home00 /tmp/btrs_rename/@home
sudo mv -v /tmp/btrs_rename/root00 /tmp/btrs_rename/@
sudo umount /tmp/btrfs_test
```

### `/etc/fstab`

1. Append/Change to options `compress=zstd:1,ssd,noatime,space_cache,discard=async` of both `/` and `/home` partitions.
2. Append/Change to `subvol=@home` of the `/home` partition.
3. Append/Change to `subvol=@` of the `/` partition.

```properties
$ cat /etc/fstab
#
# /etc/fstab
# Created by anaconda on Wed May 12 01:05:40 2021
#
# Accessible filesystems, by reference, are maintained under '/dev/disk/'.
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info.
#
# After editing this file, run 'systemctl daemon-reload' to update systemd
# units generated from this file.
#
UUID=609b4828-40df-4606-828c-0875bb892ab3   /                       btrfs   subvol=@,compress=zstd:1,ssd,noatime,space_cache,discard=async          0 0
UUID=1B11-4A39                              /boot/efi               vfat    umask=0077,shortname=winnt                                              0 2
UUID=609b4828-40df-4606-828c-0875bb892ab3   /home                   btrfs   subvol=@home,compress=zstd:1,ssd,noatime,space_cache,discard=async      0 0
```

### `/etc/default/grub`

Comment out `GRUB_ENABLE_BLSCFG=true` and append `GRUB_ENABLE_BLSCFG=false`:

```properties
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
#GRUB_TERMINAL_OUTPUT="console"
GRUB_TERMINAL_OUTPUT="gfxterm"
GRUB_CMDLINE_LINUX="nosplash quiet"
GRUB_DISABLE_RECOVERY="true"
#GRUB_ENABLE_BLSCFG=true
GRUB_ENABLE_BLSCFG=false
```

### `/boot/efi/EFI/fedora/grub.cfg`: Re-generate grub configuration

```sh
sudo grubby --update-kernel=ALL --args="rootflags=subvol=@"
sudo dracut --force --regenerate-all
sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
sudo reboot # sudo systemctl reboot
```

### Post Reboot

`cmdline` should look like:

```sh
$ cat /proc/cmdline
BOOT_IMAGE=/@/boot/vmlinuz-5.11.19-200.fc33.x86_64 root=UUID=609b4828-40df-4606-828c-0875bb892ab3 ro rootflags=subvol=@ nosplash quiet
```

**NB:** `cmdline` should contain `rootflags=subvol=@`.

### Defragment disk

```sh
sudo btrfs filesystem defrag -czstd -rv / /home/
```

### Verify configuration with `timeshift-gtk`

```sh
sudo timeshift-gtk
```

### Create a snapshot using `timeshift` CLI

**`D`** below stands for on-demand:

```sh
sudo timeshift --create --comments "rocm-4.2.0" --tags D
```
