# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS

zstyle :compinstall filename '$HOME/.zshrc'

# Enable Colors
autoload -U colors && colors

# environment variables
export CHROME_EXECUTABLE=/usr/bin/chromium-browser

# Expanding the path
# cargo
export PATH=$HOME/.cargo/bin:$PATH
# python
export PATH=$HOME/.local/lib/python*/site-packages:$PATH

# Key bindings
bindkey ";5C" forward-word
bindkey ";5D" backward-word

# Basic auto/tab complete:
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Auto cd
setopt autocd

# custom aliases
alias so='source $HOME/.zshrc'
alias la="lsd -lhAtU --color=always"
alias ls="lsd -U --color=always"
alias ll="lsd -lhtU --color=always"
alias untar='tar xvf'
alias rf='rm -rvf'
alias mv='mv -i'
alias suv='sudo nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cp='cp -r'
alias cat='bat'

unzipf() {
    if [ -z "$2" ]; then
        folder=$(echo "$1" | head -c -5)
    else
        folder=$(echo "$2")
    fi
    command unzip $1 -d $folder
}

# bun completions
[ -s "/home/rasul/.bun/_bun" ] && source "/home/rasul/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

source "$HOME/Git/minimal/minimal.zsh"
source "$HOME/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
