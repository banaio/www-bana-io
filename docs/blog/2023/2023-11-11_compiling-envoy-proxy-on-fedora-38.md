---
title: "Envoy Proxy: Compiling on Fedora 38"
date: "2023-11-11"
tags: ["blog", "kubernetes", "envoy", "envoy proxy", "c++", "linux", "fedora"]
type: post
permalink: /blog/compiling-envoy-proxy-on-fedora-38
---

# {{ $frontmatter.title }}

It took me a while to get Envoy Proxy to compile natively on Fedora 38 so I am documenting it in order that I don't forget.

## Installing Prerequisites

Install all the dependencies:

```bash
sudo dnf groupinstall -y "Development Tools"
sudo dnf update -y
sudo dnf install -y \
  aspell-en \
  binutils-gold \
  ccache \
  cmake \
  ncurses-compat-libs \
  ninja-build \
  python3-pip \
  jq \
  wget \
  curl \
  git \
  libcxx libcxx-devel \
  libatomic \
  libstdc++ \
  libstdc++-static \
  libtool \
  lld \
  patch \
  python3-pip
wget "https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz"
mkdir ~/llvm
tar -xvf clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04.tar.xz -C ~/llvm
~/llvm/clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04/bin/llvm-config --version # Output: 11.0.1
```

Download Bazelisk\Bazel:

```bash
curl -Lo /tmp/bazelisk "https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-$([ $(uname -m) = "aarch64" ] && echo "arm64" || echo "amd64")"
chmod +x /tmp/bazelisk
sudo mkdir -pv /usr/local/bin
sudo install -o root -g root -m 0755 /tmp/bazelisk /usr/local/bin/bazel
export PATH="/usr/local/bin:${PATH}" # If required
bazel version # Output: Bazelisk version: v1.18.0
```

## Get Envoy Proxy source code

```bash
mkdir -pv ~/src
cd ~/src
git clone git@github.com:envoyproxy/envoy.git # Or https://github.com/envoyproxy/envoy.git
cd envoy
git checkout release/v1.23
```

## Compile Envoy Proxy

Configure it:

```bash
cd ~/src/envoy
export PATH="${HOME}/llvm/clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04/bin:${PATH}"
bazel/setup_clang.sh ~/llvm/clang+llvm-11.0.1-x86_64-linux-gnu-ubuntu-16.04
echo "build --config=clang" > user.bazelrc
echo "build --config=libc++" >> user.bazelrc
echo "build --copt=-fno-limit-debug-info" >> user.bazelrc
```

Build it:

```bash
bazel build --jobs=64 -c fastbuild --verbose_failures --sandbox_debug --spawn_strategy=local //source/exe:envoy-static
```

<!-- bazel build --jobs=32 -c fastbuild --verbose_failures --sandbox_debug --spawn_strategy=standalone envoy
bazel-bin/source/exe/envoy-static --version
``` -->

## Run Envoy Proxy

```bash
$ bazel-bin/source/exe/envoy-static --version
bazel-bin/source/exe/envoy-static  version: 9689bc57f80fe56dbb16a4e0d632cde5363d1811/1.23.12/Clean/DEBUG/BoringSSL
```

## Running Tests <Badge text="TODO" vertical="middle" type="info"/>

TODO.
