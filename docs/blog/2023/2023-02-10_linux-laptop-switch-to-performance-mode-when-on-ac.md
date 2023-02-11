---
title: "Linux: Switch to performance mode when AC adapter is plugged in"
date: "2023-02-10"
tags: ["blog", "laptop", "pc", "linux", "udev"]
type: post
permalink: /blog/linux-laptop-switch-to-performance-mode-when-on-ac
---

# {{ $frontmatter.title }}

There is no setting in GNOME to switch to `performance` mode when the AC adapter is plugged into the laptop.

A slight continuation of [Linux: Razer Blade 15 2022 - QHD 240Hz - GeForce RTX 3060](/blog/razer-blade-15-2022-RZ09-0421-laptop-linux).

## Configuration

### List available profile modes

```sh
$ powerprofilesctl list
* performance:
    Driver:     intel_pstate
    Degraded:   no

  balanced:
    Driver:     intel_pstate

  power-saver:
    Driver:     intel_pstate
```

### Create rules to set `performance` mode

As `root` run:

```bash
cat <<EOF > /etc/udev/rules.d/99-power-profile.rules
# https://www.reddit.com/r/gnome/comments/snihk3/comment/hw5hmzn/?utm_source=share&utm_medium=web2x&context=3
# https://bana.io/blog/linux-laptop-switch-to-performance-mode-when-on-ac
SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="0",RUN+="$(which powerprofilesctl) set power-saver"
SUBSYSTEM=="power_supply",ENV{POWER_SUPPLY_ONLINE}=="1",RUN+="$(which powerprofilesctl) set performance"
EOF
```

## Test

1. Either reboot (`sudo systemctl reboot`) or `sudo udevadm control --reload-rules && sudo udevadm trigger`.
2. Plug in AC adapter and then run `powerprofilesctl get`.
3. Unplug AC adapter and then  run `powerprofilesctl get`.

The values should change from `performance` to `power-saver` between steps 2 and 3.
