---
title: "Linux: Razer Blade 15 2022 - QHD 240Hz - GeForce RTX 3060"
date: "2023-01-29"
tags: ["blog", "laptop", "pc", "linux"]
type: post
permalink: /blog/razer-blade-15-2022-RZ09-0421-laptop-linux
---

# {{ $frontmatter.title }}

[Razer Blade 15 - QHD 240Hz - GeForce RTX 3060 - Black](https://www.razer.com/gb-en/gaming-laptops/Razer-Blade-15/RZ09-0421EWD3-R3W1). Hardware Model: `Razer Blade 15 _2022_ - RZ09-0421`.

In summary everything works fine by default aside from the microphone and the left and right audio channels are swapped.

Also, I would love to have a chat with your with you have the same or similar laptop, please reach out to me on [mohamed@bana.io](mailto:mohamed@bana.io).

## System Information

Result of `sudo -E hw-probe -all -upload`: <https://linux-hardware.org/?probe=41d33a9029>.

Distribution:

```sh
$ cat /etc/os-release
NAME="Fedora Linux"
VERSION="37 (Workstation Edition)"
ID=fedora
VERSION_ID=37
VERSION_CODENAME=""
PLATFORM_ID="platform:f37"
PRETTY_NAME="Fedora Linux 37 (Workstation Edition)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:37"
DEFAULT_HOSTNAME="fedora"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f37/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=37
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=37
SUPPORT_END=2023-11-14
VARIANT="Workstation Edition"
VARIANT_ID=workstation
$ uname -a
Linux mbana-laptop-1 6.1.7-200.fc37.x86_64 #1 SMP PREEMPT_DYNAMIC Wed Jan 18 17:11:49 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
```

## Fixing The Microphone

By default the built-in microphone does not work. Thanks to [1] and [2] we have a solution.

First find out what packages provides the topology file shipped by the distribution so we can reinstall it if something goes wrong:

```sh
$ rpm -q --whatprovides /lib/firmware/intel/sof-tplg/sof-hda-generic-2ch.tplg.xz
alsa-sof-firmware-2.2.4-2.fc37.noarch
```

Get the topology file with the microphone fix:

```sh
# Download topology file with the fix
mkdir -pv /tmp/alsa-sof-firmware
cd /tmp/alsa-sof-firmware
curl -L --output ./sof-hda-generic-2ch-pdm1.zip "https://github.com/thesofproject/linux/files/5981682/sof-hda-generic-2ch-pdm1.zip"
unzip ./sof-hda-generic-2ch-pdm1.zip -d .
rm ./sof-hda-generic-2ch-pdm1.zip
# Make `sof-hda-generic-2ch.tplg.xz`
mv -v sof-hda-generic-2ch-pdm1.tplg sof-hda-generic-2ch.tplg
xz -C crc32 sof-hda-generic-2ch.tplg
# Copy new topology file over and then reboot
sudo cp -v ./sof-hda-generic-2ch.tplg.xz /lib/firmware/intel/sof-tplg/sof-hda-generic-2ch.tplg.xz
sudo chmod o+r,g+r /lib/firmware/intel/sof-tplg/sof-hda-generic-2ch.tplg.xz
sudo systemctl reboot
```

If it doesn't work, restore the version that came with the distribution and buy and pair of headphones:

```sh
sudo dnf reinstall alsa-sof-firmware
```

## Suspend

See [3]:

```sh
sudo grubby --update-kernel=ALL --args="mem_sleep_default=deep"
```

You _may_ also need:

```sh
sudo grubby --update-kernel=ALL --args="nvme.noacpi=1"
```

## Nvidia <Badge text="TODO" vertical="middle" type="info"/>

TODO.

## Additional Linux Configuration

My `/proc/cmdline` looks like:

```sh
$ cat /proc/cmdline
BOOT_IMAGE=(hd1,gpt2)/vmlinuz-6.1.7-200.fc37.x86_64 root=UUID=97f80d77-33fe-40c5-88db-3ace7c5f10f4 ro rootflags=subvol=root00 sysrq_always_enabled=1 rd.driver.blacklist=nouveau nouveau.modeset=0 nvidia-drm.modeset=1 initcall_blacklist=simpledrm_platform_driver_init rd.plymouth=0 plymouth.enable=0 rd.luks=0 rd.lvm=0 rd.md=0 rd.dm=0 verbose i915.enable_fbc=0 i915.enable_dc=0 i915.enable_psr=0 i915.disable_power_well=1 i915.enable_guc=3 i915.fastboot=1
```

## References

* 1: [ubuntu on razer blade 15 (2022, advanced)](https://abarry.org/ubuntu-on-razer-blade-15-2022-advanced).
* 2: [`[BUG] microphone detected but not working on 2022 Razer Blade 15`](https://github.com/thesofproject/sof/issues/5989).
* 3: [Suspend](https://wiki.archlinux.org/title/Framework_Laptop#Suspend).
