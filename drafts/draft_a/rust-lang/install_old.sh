#!/usr/bin/env zsh
set -ef -o pipefail
# set -euf -o pipefail

# #!/usr/bin/env bash
# # https://sipb.mit.edu/doc/safe-shell/
# set -ef -o pipefail
# # set -euf -o pipefail


# #!/usr/bin/env bash
# # Tested against Bash 4.4.23(1)-release

# set -eu -o pipefail

# set -o noclobber    # Avoid overlay files (echo "hi" > foo)
# set -o errexit      # Used to exit upon error, avoiding cascading errors
# set -o pipefail     # Unveils hidden failures
# set -o nounset      # Exposes unset variables

# # # set -o nullglob     # Non-matching globs are removed  ('*.foo' => '')
# # shopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# # # set -o failglob     # Non-matching globs throw errors
# # shopt -s failglob   # Non-matching globs throw errors
# # # set -o nocaseglob   # Case insensitive globs
# # shopt -s nocaseglob # Case insensitive globs
# # # set -o globstar     # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')
# # shopt -s globstar # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

# # For zsh
# setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# setopt -s failglob   # Non-matching globs throw errors
# setopt -s nocaseglob # Case insensitive globs
# setopt -s globstar # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

function install_rust_all() {
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
      rust \
      rust-analysis \
      rust-docs \
      rust-mingw \
      rust-src \
      rust-std \
      rustc \
      rustc-dev \
      rustfmt \
    --target \
      x86_64-unknown-linux-gnu \
      x86_64-unknown-linux-musl \
      x86_64-pc-windows-gnu \
      x86_64-pc-windows-msvc \
      i686-pc-windows-gnu \
      i686-pc-windows-msvc \
      i686-unknown-linux-gnu
}

# https://github.com/rust-lang/rustup#other-installation-methods
function install_rust() {
  printf "%b" "\033[92m" "install_rust" "\033[0m" "\n"

  # printf "%b" "\033[92m" "install_rust: removing ~/.rustup/tmp" "\033[0m" "\n"
  # rm -vr ~/.rustup/tmp

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

  source "${HOME}/.cargo/env"
  printf "%b" "\033[92m" "install_rust: install complete" "\033[0m" "\n"
  printf "%b" "\033[92m" "--------------------------------" "\033[0m" "\n"
  printf "%b" "\033[92m" "install_rust: setting up shell" "\033[0m" "\n"

  # # https://github.com/rust-lang/rustup#enable-tab-completion-for-bash-fish-zsh-or-powershell
  # # Bash
  # rustup completions bash > ~/.local/share/bash-completion/completions/rustup

  # Zsh
  mkdir --verbose ~/.zfunc || true
  ## echo "fpath+=~/.zfunc" >> ~/.zshrc
  echo '


########
# Rust #
PATH="${HOME}/.cargo/bin:${PATH}"
fpath+=~/.zfunc
########


' >> ~/.zshrc
  source ~/.zshrc
  # ~/.profile ~/.zprofile

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
