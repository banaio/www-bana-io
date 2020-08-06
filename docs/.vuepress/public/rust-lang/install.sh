#!/usr/bin/env zsh
set -ef -o pipefail
# set -euf -o pipefail

# https://github.com/rust-lang/rustup#other-installation-methods
function install_rust() {
  printf "%b" "\033[92m" "install_rust" "\033[0m" "\n"

  # printf "%b" "\033[92m" "install_rust: removing ~/.rustup/tmp" "\033[0m" "\n"
  # rm -vr ~/.rustup/tmp

  # Print https://sh.rustup.rs usage flags:
  # printf "%b" "\033[92m" "--------------------------------" "\033[0m" "\n"
  # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --verbose --help

  # printf "%b" "\033[92m" "--------------------------------" "\033[0m" "\n"
  # curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
    --verbose \
    --profile 'complete' \
    --component \
      cargo \
      clippy \
      lldb-preview \
      llvm-tools-preview \
      miri \
      rls \
      rust-analysis \
      rust-docs \
      rust-mingw \
      rust-std \
      rustc \
      rustc-dev \
      rustfmt \
    --target \
      x86_64-unknown-linux-gnu \
      x86_64-unknown-linux-musl \
      i686-unknown-linux-gnu

  printf "%b" "\033[92m" "install_rust: install complete" "\033[0m" "\n"
  printf "%b" "\033[92m" "--------------------------------" "\033[0m" "\n"
  printf "%b" "\033[92m" "install_rust: setting up shell" "\033[0m" "\n"

  source "${HOME}/.cargo/env"

  # https://github.com/rust-lang/rustup#enable-tab-completion-for-bash-fish-zsh-or-powershell
  # # Bash
  # rustup completions bash > ~/.local/share/bash-completion/completions/rustup

  # Zsh
  mkdir --verbose ~/.zfunc || true
  echo '

########
# Rust #
PATH="${HOME}/.cargo/bin:${PATH}"
fpath+=~/.zfunc
########

' >> ~/.zshrc
  source ~/.zshrc
  # https://sh.rustup.rs aleady adds it to: ~/.profile ~/.zprofile

  rustup completions zsh > ~/.zfunc/_rustup

  printf "%b" "\033[92m" "--------------------------------" "\033[0m" "\n"

  rustc --version
  rustup show
  # rustup component list
  # rustup target list

  rustup component add rust || true
  rustup component add rust-src || true
  # rustup component add rustfmt || true
  # rustup component add rls || true
  # rustup component add rust-analysis || true
  # rustup component add clippy || true
  # rustup component add llvm-tools-preview || true

  # rustup component list
  # rustup target list
  # rustup show

  rustc --version
  cargo --version

  cd hello-rust
  cargo run
}

install_rust
