if [[ "$ONWARD_ZSH_ENABLE" == "true"  ]]; then
  echo "{zshenv} Setting ONWARD_ZSH up with ZSH."
  source "$HOME/.zsh/profiles/onward.zsh"
fi

if [[ "$PROXY_PICS_ZSH_ENABLE" == "true"  ]]; then
  echo "{zshenv} Setting PROXY_PICS_ZSH up with ZSH."
  source "$HOME/.zsh/profiles/proxy_pics.zsh"
fi

if [[ "$NATO_ZSH_ENABLE" == "true"  ]]; then
  echo "{zshenv} Setting NATO_ZSH up with ZSH."
  source "$HOME/.zsh/profiles/nato.zsh"
fi

if [[ "$DEFAULT_ZSH_ENABLE" == "true" ]]; then
  echo "{zshenv} Setting DEFAULT_ZSH up with ZSH."
  source "$HOME/.zsh/profiles/default.zsh"
fi

# Lua
alias lua="/home/vicentesantos/Downloads/lua-5.3.3/src/lua"
eval $(luarocks path --bin)

# Utils
alias kill3000="fuser -k -n tcp 3000"
alias killredis="fuser -k -n tcp 6379"
alias killport="fuser -k -n tcp $1"
alias emacs="emacs -nw"
alias vimrc="nvim ~/.config/nvim/init.vim"
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias be="bundle exec"
alias scripts="cd ~/scripts"

path+=('/home/vicentesantos/scripts')
export PATH
export SPACEMACSDIR="~/.config/spacemacs.d"

export ZSH="/home/vicentesantos/.oh-my-zsh"
export EDITOR='vim'

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
)

source $ZSH/oh-my-zsh.sh

. $HOME/.asdf/asdf.sh
