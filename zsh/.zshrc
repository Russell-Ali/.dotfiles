# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS

zstyle :compinstall filename '$HOME/.zshrc'

# Enable Colors
autoload -U colors && colors

# environment variables
export EDITOR='/usr/bin/nvim'
export PATH=$HOME/.Android:$HOME/.Android/SDK/platform-tools/:$HOME/.cargo/bin:$HOME/.local/lib/python*/site-packages:$PATH
export PROMPT="[%~] > "

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

# starship promt
#eval "$(starship init zsh)"

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

unzipf() {
    if [ -z "$2" ]; then
        folder=$(echo "$1" | head -c -5)
    else
        folder=$(echo "$2")
    fi
    command unzip $1 -d $folder
}
source /home/rasul/Code/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
