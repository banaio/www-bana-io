#!/bin/sh

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://git@github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# wget --recursive --no-parent --reject "index.html*" https://bana.io/shell/.oh-my-zsh/
wget https://bana.io/shell/gdb_history -O .gdb_history
wget https://bana.io/shell/gdbinit -O .gdbinit
wget https://bana.io/shell/gitconfig -O .gitconfig
wget https://bana.io/shell/gitignore-global -O .gitignore-global
wget https://bana.io/shell/npmrc -O .npmrc
wget https://bana.io/shell/tmux.conf -O .tmux.conf
wget https://bana.io/shell/zshenv -O .zshenv
wget https://bana.io/shell/zsh_history -O .zsh_history
wget https://bana.io/shell/zshrc -O .zshrc
