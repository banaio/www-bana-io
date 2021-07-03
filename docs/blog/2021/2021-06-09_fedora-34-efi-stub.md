---
title: "Fedora 34: EFI Stub"
date: "2021-06-09"
tags: ["blog", "linux", "fedora"]
type: post
permalink: /blog/fedora-34-efi-stub
---

# {{ $frontmatter.title }} <Badge text="WIP" vertical="middle" type="warn"/>

## Prerequisites

### Volume naming

```sh
$ sudo btrfs subvolume list /
ID 256 gen 291986 top level 5 path @home
ID 257 gen 291984 top level 5 path @
ID 265 gen 168851 top level 257 path var/lib/machines
ID 1299 gen 287158 top level 5 path timeshift-btrfs/snapshots/2021-06-08_18-00-01/@
ID 1300 gen 262918 top level 5 path timeshift-btrfs/snapshots/2021-06-08_18-00-01/@home
```

### `/etc/fstab`

```sh
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
UUID=609b4828-40df-4606-828c-0875bb892ab3                       /                                                   btrfs   subvol=@,compress=zstd:1,ssd,noatime,space_cache,discard=async,commit=120                                                                                   0 0
UUID=1B11-4A39                                                  /boot/efi                                           vfat    umask=0077,shortname=winnt                                                                                                                                  0 2
UUID=609b4828-40df-4606-828c-0875bb892ab3                       /home                                               btrfs   subvol=@home,compress=zstd:1,ssd,noatime,space_cache,discard=async,commit=120                                                                               0 0
```

## `efi-stub-update.sh`

```sh
#!/bin/bash -eufx
set -o pipefail

UUID_EFI_PARTITION="$(findmnt -kno UUID /boot/efi)"
ROOT_UUID="$(findmnt -kno UUID /)"
ROOTFSTYPE=$(findmnt -kno FSTYPE /)

function UpdateEFIStub() {
  local kver
  local uu
  local kk

  # find kernels to make. remake the present kernel and any newer kernels found.
  kver=$(sudo find /boot -type f -name "vmlinuz*" | sort -V | tail -n 1)
  [[ "${kver}" == *"debug" ]] && kver="$(sudo find /boot -type f -name "vmlinuz*" | sort -V | tail -n 2)"
  kver=($( (echo "${kver}" && sudo find /boot -type f -name "vmlinuz-$(uname -r)*") | sort -u | sort -Vr))

  echo
  echo "kvers=${kver[*]}"
  echo

  # loop over kerneles to build EFI images
  for kk in "${kver[@]}"; do

    echo "kk=${kk}: Making new EFI image for kernel ${kk##*/}"

    # # if there is an existing image for the current kernel, find it  and move it to *.old
    uu="$(sudo find "/boot/efi/EFI/Linux" -type f -name "linux-${kk##*vmlinuz-}-*.efi" | head -n 1)"
    # [[ -f "${uu}" ]] && sudo \mv -f "${uu}" "${uu}.old"
    echo
    # [Re]build the EFI image. Exact command will vary system to system.
    sudo dracut --force --kver "${kk##*vmlinuz-}" --kernel-cmdline "/@/boot/vmlinuz-$(uname -r) root=UUID=${ROOT_UUID} rootfstype=${ROOTFSTYPE} ro rootflags=subvol=@ add_efi_memmap text verbose" --confdir "/etc/dracut.conf.d" --kernel-image "${kk}" --uefi --verbose
    echo
    # get new image name
    uu="$(sudo find "/boot/efi/EFI/Linux" -type f -name "linux-${kk##*vmlinuz-}-*.efi" | grep -v -E '\.old^' | head -n 1)"
    echo
    # make new EFI boot entry
    sudo efibootmgr --create --disk /dev/nvme0n1 --part 1 --loader ${uu##/boot/efi} -L fedora-34-efistub
    echo
    # copy kernel
    sudo cp ${uu} /boot/efi/EFI/Linux/vmlinuz
  done

  echo
  echo 'COMPLETED'
  echo
  sudo efibootmgr -v
  echo
  sudo ls -laht /boot/efi/EFI/Linux
}

UpdateEFIStub
```

## Update and Reboot

```sh
./efi-stub-update.sh
sudo systemctl reboot
```

## References

* [Running fedora without /boot - has anyone here tried it?](https://www.reddit.com/r/Fedora/comments/a8zkvd/running_fedora_without_boot_has_anyone_here_tried/)
* <https://wiki.debian.org/EFIStub>
