#!/usr/bin/env bash
# https://sipb.mit.edu/doc/safe-shell/
set -euf -o pipefail
# set -x
# set -euo pipefail
# set -euxo pipefail












#!/usr/bin/env zsh

#!/usr/bin/env bash
# Tested against Bash 4.4.23(1)-release

set -eu -o pipefail

set -o noclobber    # Avoid overlay files (echo "hi" > foo)
set -o errexit      # Used to exit upon error, avoiding cascading errors
set -o pipefail     # Unveils hidden failures
set -o nounset      # Exposes unset variables

# # set -o nullglob     # Non-matching globs are removed  ('*.foo' => '')
# shopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
# # set -o failglob     # Non-matching globs throw errors
# shopt -s failglob   # Non-matching globs throw errors
# # set -o nocaseglob   # Case insensitive globs
# shopt -s nocaseglob # Case insensitive globs
# # set -o globstar     # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')
# shopt -s globstar # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

# For zsh
setopt -s nullglob   # Non-matching globs are removed  ('*.foo' => '')
setopt -s failglob   # Non-matching globs throw errors
setopt -s nocaseglob # Case insensitive globs
setopt -s globstar # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')

#!/bin/sh

# # sudo apt-get update && sudo apt upgrade && sudo apt install zsh
# sudo apt-get install zsh powerline fonts-powerline zsh-syntax-highlighting
# git clone git@github.com:robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
# echo 'ZSH_THEME="agnoster"' >> ~/.zshrc
# chsh -s /bin/zsh
# # sudo usermod -s /usr/bin/zsh $(whoami)


# mkdir --verbose ~/.fonts/
# # cp ./fonts/Cascadia.ttf ~/.fonts/
# # fc-cache --force --verbose --really-force


# # sudo apt-get update
# # sudo apt-get -y upgrade


# # sudo dpkg --install ./browsers/google-chrome-stable_current_amd64.deb
# # sudo dpkg --install ./communications/slack-desktop-4.1.2-amd64.deb
# # sudo dpkg --install ./dev/code_1.40.0-1573064499_amd64.deb

# sudo apt install -y \
#     wget curl \
#     git git-core \
#     openssh-server openssh-client \
#     make parallel \
#     vim \
#     lm-sensors \
#     bat \
#     bonnie++ iozone3 hdparm \
#     docker.io docker-compose \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg-agent \
#     software-properties-common


# sudo systemctl start docker
# sudo systemctl enable docker
# sudo groupadd docker
# sudo usermod -aG docker "${USER}"
# newgrp docker
# docker version
# docker run hello-world


# sudo systemctl status ssh
# eval "$(ssh-agent -s)"
# chmod 600 ~/.ssh/id_rsa
# ssh-add ~/.ssh/id_rsa
# ssh -T git@github.com


# curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
# echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
# sudo apt update && sudo apt install signal-desktop


# cd /mnt/sata5_fat32/linux/dev/

# # Google has a Linux installer to install go on linux: https://storage.googleapis.com/golang/getgo/installer_linux
# # https://packages.ubuntu.com/bionic/golang

# sudo tar -C /usr/local -xzf ../dev/go1.13.4.linux-amd64.tar.gz
# # # export PATH="${PATH}:/usr/local/go/bin"
# # # # export GOROOT="${HOME}/go"
# # # export GOPATH="${HOME}/go"
# # # source $HOME/.profile
# echo '

# # Large history file
# HISTSIZE=1000000
# SAVEHIST="${HISTSIZE}"

# export PATH="${PATH}:/usr/local/go/bin"
# # export GOROOT="${HOME}/go"
# export GOPATH="${HOME}/go"

# ' >> ~/.zshrc
# mkdir "${HOME}/go"
# source ~/.zshrc

# mkdir --verbose ~/work || true
# # ssh -T git@github.com
# cd ~/work
# git clone git@bitbucket.org:openbankingteam/conformance-suite.git
# git clone git@bitbucket.org:openbankingteam/conformance-dcr.git

(cd ~/work/conformance-suite && make && pwd && make build && make test)
(cd ~/work/conformance-dcr && make && pwd && make build && make test)
