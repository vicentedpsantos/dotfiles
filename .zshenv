# Lua
eval $(luarocks path --bin)

ZSH_THEME="awesomepanda"
# ZSH_THEME="wuffers"

plugins=(
  sudo
  web-search
  copydir
  copyfile
  history
  zsh-syntax-highlighting
  zsh-autosuggestions
  wd
  copyfile
)

source $HOME/.config/zsh/env
source $HOME/.config/zsh/path
source $HOME/.config/zsh/alias
source $HOME/.config/zsh/functions
source $HOME/.config/zsh/profileswitch

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh
