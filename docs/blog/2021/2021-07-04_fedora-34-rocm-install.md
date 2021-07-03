---
title: "Fedora 34: ROCm Installation"
date: "2021-07-04"
tags: ["blog", "linux", "fedora"]
type: post
permalink: /blog/fedora-34-rocm-install
---

# {{ $frontmatter.title }} <Badge text="WIP" vertical="middle" type="warn"/>

## Install

See <https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#installing-rocm>.

### Prerequisites

```sh
sudo dnf install kernel-headers-`uname -r` kernel-devel-`uname -r`
```

### Latest Version

```sh
sudo tee /etc/yum.repos.d/rocm.repo <<EOF
[ROCm]
name=ROCm
baseurl=http://repo.radeon.com/rocm/centos8/rpm
enabled=1
gpgcheck=1
gpgkey=http://repo.radeon.com/rocm/rocm.gpg.key
EOF
```

### Specific Version

I peg to a version for stability reasons. Below I peg to version `4.2`:

```sh
sudo tee /etc/yum.repos.d/rocm.repo <<EOF
[ROCm]
name=ROCm
baseurl=https://repo.radeon.com/rocm/centos8/4.2/
enabled=1
gpgcheck=1
gpgkey=https://repo.radeon.com/rocm/rocm.gpg.key
EOF
```

### Generic Steps

```sh
sudo dnf install rocm-opencl rocm-utils rocm-smi rocm-device-libs
```

List installed packages:

```sh
$ dnf repository-packages ROCm list --installed
Installed Packages
comgr.x86_64              2.0.0.40200-21.el8         @ROCm
hsa-rocr-dev.x86_64       1.3.0.40200-21.el8         @ROCm
llvm-amdgpu.x86_64        12.0.0.21161.40200-21.el8  @ROCm
rocm-clang-ocl.x86_64     0.5.0.40200-21.el8         @ROCm
rocm-device-libs.x86_64   1.0.0.40200-21.el8         @ROCm
rocm-opencl.x86_64        2.0.0.40200-21.el8         @ROCm
rocm-opencl-devel.x86_64  2.0.0.40200-21.el8         @ROCm
rocm-utils.x86_64         4.2.0.40200-21.el8         @ROCm
➜  ~ dnf list --installed | grep "@ROCm"
comgr.x86_64              2.0.0.40200-21.el8         @ROCm
hsa-rocr-dev.x86_64       1.3.0.40200-21.el8         @ROCm
llvm-amdgpu.x86_64        12.0.0.21161.40200-21.el8  @ROCm
rocm-clang-ocl.x86_64     0.5.0.40200-21.el8         @ROCm
rocm-device-libs.x86_64   1.0.0.40200-21.el8         @ROCm
rocm-opencl.x86_64        2.0.0.40200-21.el8         @ROCm
rocm-opencl-devel.x86_64  2.0.0.40200-21.el8         @ROCm
rocm-utils.x86_64         4.2.0.40200-21.el8         @ROCm
```

**NB:** There are two versions of `rocminfo` available:

```sh
$ dnf repoquery --location rocminfo
Last metadata expiration check: 0:20:47 ago on Sat 03 Jul 2021 23:51:46 BST.
https://repo.radeon.com/rocm/centos8/4.2/rocminfo-1.0.0.40200-21.el8.x86_64.rpm
https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/fedora/linux/releases/34/Everything/x86_64/os/Packages/r/rocminfo-3.9.0-1.fc34.x86_64.rpm
```

## Test Installation

```sh
$ OPENCL_VERSION="rocm-4.2.0"
$ export PATH="/opt/${OPENCL_VERSION}/rocprofiler/bin:${PATH}"
$ export PATH="/opt/${OPENCL_VERSION}/opencl/bin:${PATH}"
$ export PATH="/opt/${OPENCL_VERSION}/bin:${PATH}"
$ export LD_LIBRARY_PATH="/opt/${OPENCL_VERSION}/lib:/opt/${OPENCL_VERSION}/opencl/lib:${LD_LIBRARY_PATH}"
$ which clinfo
/opt/rocm-4.2.0/opencl/bin/clinfo
$ clinfo -v | grep -E 'Platform Vendor:|Board name:|  Version:'
  Platform Vendor:				 NVIDIA Corporation
  Platform Vendor:				 Advanced Micro Devices, Inc.
  Version:					 OpenCL 3.0 CUDA
  Board name:					 Navi 10 [Radeon RX 5600 OEM/5600 XT / 5700/5700 XT]
  Version:					 OpenCL 2.0
$ which rocm-smi
/usr/bin/rocm-smi
$ rocm-smi


========================ROCm System Management Interface========================
================================================================================
GPU  Temp   AvgPwr  SCLK    MCLK    Fan   Perf  PwrCap  VRAM%  GPU%
0    43.0c  8.0W    800Mhz  100Mhz  0.0%  auto  210.0W    0%   0%
================================================================================
==============================End of ROCm SMI Log ==============================
$ rocm_agent_enumerator
gfx000
gfx1010
```

## Conclusion

Now mine something ... :)

## References

* <https://rocmdocs.amd.com/en/latest/>.
* <https://rigtorp.se/notes/rocm/>.
* <https://github.com/RadeonOpenCompute/ROCm/issues/567>.
