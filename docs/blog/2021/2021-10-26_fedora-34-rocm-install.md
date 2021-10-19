---
title: "Fedora 34: ROCm Installation"
date: "2021-10-26"
tags: ["blog", "linux", "fedora"]
type: post
permalink: /blog/fedora-34-rocm-install
---

# {{ $frontmatter.title }}

See <https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html#installing-rocm>.

## Repository

I peg to a version for stability reasons. Below I peg to version `4.3.1`, by using `baseurl=https://repo.radeon.com/rocm/centos8/4.3.1` instead:of `baseurl=http://repo.radeon.com/rocm/centos8/rpm`:

```sh
sudo tee /etc/yum.repos.d/rocm.repo <<EOF
[ROCm]
name=ROCm
baseurl=https://repo.radeon.com/rocm/centos8/4.3.1
enabled=1
gpgcheck=1
gpgkey=http://repo.radeon.com/rocm/rocm.gpg.key
EOF
```

## Prerequisites

```sh
sudo rpm --import http://repo.radeon.com/rocm/rocm.gpg.key
sudo dnf install kernel-headers-`uname -r` kernel-devel-`uname -r`
sudo dnf install gcc rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools
sudo dnf install python3.6
mkdir -pv ~/rpmbuild/SPECS/rocm-4.3.1
tee ~/rpmbuild/SPECS/rocm-4.3.1/rocm-platform-python-dummy.spec <<'EOF'
Name:           rocm-platform-python-dummy
Version:        0.0.1
Release:        1%{?dist}
Summary:        Resolves ROCm issues with `nothing provides /usr/libexec/platform-python needed by ...` errors
License:        MIT
BuildArch:      noarch
URL:            https://bana.io/blog/fedora-34-rocm-install
BuildRequires:  python3.6
BuildRequires:  bash
Requires:       python3.6
Requires:       bash
Provides:       /usr/libexec/platform-python
Packager:       Mohamed Bana <m@bana.io>

%pre
python --version
ln -sv $(which python3.6) /usr/libexec/platform-python

%post
ls -lah /usr/libexec/platform-python || true

%preun
rm -v /usr/libexec/platform-python

%postun
ls -lah /usr/libexec/platform-python || true

%description
Resolves ROCm issues with `nothing provides /usr/libexec/platform-python needed by ...` errors.

See:

* https://github.com/RadeonOpenCompute/ROCm/issues/567#issuecomment-771870262
* https://rigtorp.se/notes/rocm
* https://rocmdocs.amd.com/en/latest
* https://bana.io/blog/fedora-34-rocm-install/

%files

%changelog
EOF
$ rpmbuild -bb ~/rpmbuild/SPECS/rocm-4.3.1/rocm-platform-python-dummy.spec
Processing files: rocm-platform-python-dummy-0.0.1-1.fc34.noarch
Checking for unpackaged file(s): /usr/lib/rpm/check-files /home/mbana/rpmbuild/BUILDROOT/rocm-platform-python-dummy-0.0.1-1.fc34.x86_64
Wrote: /home/mbana/rpmbuild/RPMS/noarch/rocm-platform-python-dummy-0.0.1-1.fc34.noarch.rpm
Executing(%clean): /bin/sh -e /var/tmp/rpm-tmp.9VQhM4
+ umask 022
+ cd /home/mbana/rpmbuild/BUILD
+ /usr/bin/rm -rf /home/mbana/rpmbuild/BUILDROOT/rocm-platform-python-dummy-0.0.1-1.fc34.x86_64
+ RPM_EC=0
++ jobs -p
+ exit 0
$ sudo dnf install ~/rpmbuild/RPMS/noarch/rocm-platform-python-dummy-0.0.1-1.fc34.noarch.rpm
Last metadata expiration check: 0:03:36 ago on Tue 26 Oct 2021 00:49:21 +01.
Dependencies resolved.
================================================================================================================================================================================================================================================================================
 Package                                                                       Architecture                                              Version                                                          Repository                                                       Size
================================================================================================================================================================================================================================================================================
Installing:
 rocm-platform-python-dummy                                                    noarch                                                    0.0.1-1.fc34                                                     @commandline                                                    6.8 k

Transaction Summary
================================================================================================================================================================================================================================================================================
Install  1 Package

Total size: 6.8 k
Installed size: 0
Is this ok [y/N]: y
Downloading Packages:
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                                                                                                                                                                                                                        1/1
  Running scriptlet: rocm-platform-python-dummy-0.0.1-1.fc34.noarch                                                                                                                                                                                                         1/1
Python 3.9.7

  Installing       : rocm-platform-python-dummy-0.0.1-1.fc34.noarch                                                                                                                                                                                                         1/1
  Running scriptlet: rocm-platform-python-dummy-0.0.1-1.fc34.noarch                                                                                                                                                                                                         1/1
lrwxrwxrwx. 1 root root 14 Oct 26 00:53 /usr/libexec/platform-python -> /bin/python3.6

  Verifying        : rocm-platform-python-dummy-0.0.1-1.fc34.noarch                                                                                                                                                                                                         1/1

Installed:
  rocm-platform-python-dummy-0.0.1-1.fc34.noarch

Complete!
```

## Installation

```sh
$ sudo dnf --enablerepo=ROCm --disablerepo=fedora install rocm-bandwidth-test rocm-clang-ocl rocm-cmake rocm-dbgapi rocm-debug-agent rocm-device-libs rocm-gdb rocm-opencl rocm-opencl-devel rocm-smi-lib  rocminfo rocminfo4.3.1 rocprofiler-dev rocrand rocsolver roctracer-dev
$ sudo dnf --enablerepo=ROCm install rocm-validation-suite hip-base hip-rocclr rocblas
$ sudo dnf --enablerepo=ROCm --disablerepo=fedora install rocm-smi rocm-dev hip-doc hip-samples hsa-amd-aqlprofile hsakmt-roct-devel openmp-extras rocm-utils
$ sudo dnf --enablerepo=ROCm --disablerepo=fedora install atmi comgr half hip-doc hipblas hipcub hipfft hipfort hipify-clang hipsparse hsa-amd-aqlprofile hsa-rocr-dev hsakmt-roct llvm-amdgpu llvm-amdgpu-alt migraphx miopen-hip  miopengemm miopenkernels-gfx900-56kdb miopenkernels-gfx900-64kdb miopenkernels-gfx906-60kdb miopenkernels-gfx906-64kdb miopenkernels-gfx908-120kdb miopentensile mivisionx rccl rdc rocalution rocfft rocprim rocsparse rocthrust
$ sudo dnf install 'dnf-command(versionlock)'
$ sudo dnf versionlock exclude rocminfo-0:3.9.0-1.fc34 # Not too sure about this step
+Last metadata expiration check: 0:19:32 ago on Tue 26 Oct 2021 01:13:20 +01.
Adding exclude on: rocminfo-0:3.9.0-1.fc34.*
$ tee -a ~/.zshrc <<'EOF'

########
# ROCm #
export ROCM_VERSION="rocm-4.3.1"
export ROCM_PATH="/opt/${ROCM_VERSION}"
export PATH="${ROCM_PATH}/rocprofiler/bin:${PATH}"
export PATH="${ROCM_PATH}/opencl/bin:${PATH}"
export PATH="${ROCM_PATH}/bin:${PATH}"
export LD_LIBRARY_PATH="${ROCM_PATH}/lib:${ROCM_PATH}/opencl/lib:${ROCM_PATH}/hsa/lib:${LD_LIBRARY_PATH}"
########

EOF
```

### Notes

* We disable the fedora repository -`--disablerepo=fedora`- because we want to use the `rocminfo` package in <http://repo.radeon.com/rocm/centos8/rpm>. See [Useful Commands](#useful-commands) for more information
* We don't install `miopen-opencl` as this conflicts with `miopen-hip`.
* We don't install `hip-nvcc` as this requires `cuda`.
* We don't install `rock-dkms rock-dkms-firmware`, i.e., `sudo dnf --enablerepo=ROCm --disablerepo=fedora install rock-dkms rock-dkms-firmware`.

## Useful Commands

```sh
dnf repository-packages ROCm list                    # list all available packages from http://repo.radeon.com/rocm/centos8/rpm
dnf repository-packages ROCm list --installed        # list all installed packages from http://repo.radeon.com/rocm/centos8/rpm
$ dnf --quiet repoquery --location rocminfo          # list all repositories that contain rocminfo
http://fedora.mirror.liquidtelecom.com/fedora/linux//releases/34/Everything/x86_64/os/Packages/r/rocminfo-3.9.0-1.fc34.x86_64.rpm
https://repo.radeon.com/rocm/centos8/4.3.1/rocminfo-1.0.0.40301-59.el8.x86_64.rpm
```
**NB:** There are two `rocminfo` packages.

## Test Installation

```sh
$ source ~/.zshrc
$ which clinfo
/opt/rocm-4.3.1/opencl/bin/clinfo
$ clinfo -v | grep -E 'Platform Vendor:|Board name:|  Version:'
  Platform Vendor:				 Advanced Micro Devices, Inc.
  Board name:					 Navi 10 [Radeon RX 5600 OEM/5600 XT / 5700/5700 XT]
  Version:					 OpenCL 2.0
$ rocm_smi.py --showdriverversion --showmemvendor --showproductname --showserial --showuniqueid --showhw
======================= ROCm System Management Interface =======================
============================ Concise Hardware Info =============================
GPU  DID   GFX RAS  SDMA RAS  UMC RAS  VBIOS            BUS
0    731f  N/A      N/A       N/A      115-D182PI0-100  0000:0C:00.0
================================================================================
========================= Version of System Component ==========================
Driver version: 5.14.11-200.fc34.x86_64
================================================================================
================================== Unique ID ===================================
GPU[0]		: Unique ID: N/A
================================================================================
================================ Memory Vendor =================================
GPU[0]		: GPU memory vendor: micron
================================================================================
================================ Serial Number =================================
GPU[0]		: Serial Number: N/A
================================================================================
================================= Product Info =================================
GPU[0]		: Card model: 		0x4e2
GPU[0]		: Card vendor: 		Advanced Micro Devices, Inc. [AMD/ATI]
GPU[0]		: Card SKU: 		D182PI
================================================================================
WARNING:  		 One or more commands failed
============================= End of ROCm SMI Log ==============================
$ rocm_smi.py
======================= ROCm System Management Interface =======================
================================= Concise Info =================================
GPU  Temp   AvgPwr  SCLK    MCLK    Fan     Perf    PwrCap  VRAM%  GPU%
0    68.0c  94.0W   980Mhz  875Mhz  37.65%  manual  315.0W   75%   99%
================================================================================
============================= End of ROCm SMI Log ==============================
```

## Conclusion

Now mine something ... :)

## References

* <https://github.com/RadeonOpenCompute/ROCm/issues/567#issuecomment-771870262>.
* <https://rocmdocs.amd.com/en/latest/>.
* <https://rigtorp.se/notes/rocm/>.
* <https://github.com/RadeonOpenCompute/ROCm/issues/567>.
