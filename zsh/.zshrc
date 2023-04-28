# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS

zstyle :compinstall filename '$HOME/.zshrc'

# bindkey -v
export KEYTIMEOUT=1

# Enable Colors
autoload -U colors && colors

# environment variables
export EDITOR=/usr/bin/nvim
export ANDROID_HOME=$HOME/.Android/Sdk/
export CHROME_EXECUTABLE=/usr/bin/chromium-browser

# Expanding the path
# cargo
export PATH=$HOME/.cargo/bin:$PATH
# python
export PATH=$HOME/.local/lib/python*/site-packages:$PATH
# flutter
export PATH=$HOME/Git/flutter/bin:$PATH
# android studio
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# starship promtp
eval "$(starship init zsh)"

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
alias sudo='sudo '
alias \#='sudo'
alias so='source $HOME/.zshrc'
alias la="lsd -lhAt --color=always"
alias ls="lsd --color=always"
alias ll="lsd -lht --color=always"
alias untar='tar xvf'
alias grep='grep --color=always'
alias rd='rm -r'
alias rf='rm -rf'
alias mv='mv -i'
alias suv='sudo nvim'
alias suvi='sudo nvim'
alias suvim='sudo nvim'
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

source "$HOME/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
