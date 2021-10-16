#!/usr/bin/env bash

USERNAME=$(whoami)
BASE_PATH="/home/$USERNAME"
CONFIG_PATH="$BASE_PATH/.config/"
TEMP_PATH='/tmp/'

if [[ `git config user.email` ]]
then
  echo "Git config found..."
else
  echo "Please configure git and github SSH connection before proceeding..."
  exit 1
fi

if [[ `i3 --version` ]]
then
  echo "i3wm found"
else
  echo "This script is meant to be run on a system running i3wm..."
  exit 2
fi

sudo -v

echo "Updating package manager..."
yay -Syyu

echo "Cloning repositories"
cd $BASE_PATH
git clone git@github.com:vicentedpsantos/wallpapers.git

cd $BASE_PATH
git clone git@github.com:vicentedpsantos/scripts.git
cd scripts && chmod +x ./*

cd $TEMP_PATH
git clone https://github.com/vicentedpsantos/dotfiles

install_zsh
configure_i3
configure_vim
configure_kitty

install_zsh()
{
  echo "Installing ZSH..."
  yay -S zsh
  cp $("$TEMP_PATH/dotfiles/.zshenv $BASEPATH/.zshenv")

  mkdir -p "$BASE_PATH/.zsh/profiles"
  touch $(eval "echo $BASE_PATH/.zsh/profiles/default.zsh")

  create_base_file ".zshrc"
  echo "DEFAULT_ZSH_ENABLE=\"true\"\n\nsource $HOME/.zshenv/" > "$BASE_PATH/.zshrc"
  echo "Done installing ZSH!"
}

configure_i3()
{
  echo "Configuring i3..."
  create_config_dir "i3"
  create_config_file "i3" "config"
  copy_from_dotfiles_to ".config/i3/config" "$CONFIG_PATH/i3/config"
  copy_from_dotfiles_to ".config/i3status/config" "$CONFIG_PATH/i3status/config"
  i3-msg reload
  i3-msg restart
  echo "Done configuring i3"
}

configure_nvim()
{
  echo "Configuring vim"
  yay -S neovim
  copy_from_dotfiles_to ".config/nvim/init.vim" "$CONFIG_PATH/nvim/init.vim"
  copy_from_dotfiles_to ".vimrc" "$BASE_PATH/.vimrc" # Copying old vim config just because
  echo "Done configuring vim"
}

configure_kitty()
{
  echo "Configuring kitty..."
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  copy_from_dotfiles_to ".config/kitty/kitty.conf" "$CONFIG_PATH/kitty/kitty.conf"
  echo "Done configuring kitty!"
}

create_config_dir()
{
  mkdir -p "$CONFIG_PATH/$1"
}

create_base_file()
{
  touch $(eval "echo $BASE_PATH/$1")
}

create_config_file()
{
  touch $(eval "echo $CONFIG_PATH/$1/$2")
}

copy_from_dotfiles_to()
{
  cp $("$TEMP_PATH/dotfiles/$1 $2")
}
