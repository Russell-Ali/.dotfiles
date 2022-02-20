# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

# Enable Colors
autoload -U colors && colors

# environment variables
export MOZ_USE_XINPUT2=1
export PATH="$HOME/Sources/scripts:$PATH"

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

# spaceship promt
autoload -U promptinit; promptinit
prompt spaceship

# spaceship promt settings
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_GIT_STATUS_PREFIX=' ('
SPACESHIP_GIT_STATUS_SUFFIX=')'
SPACESHIP_GIT_STATUS_COLOR=yellow
SPACESHIP_DIR_LOCK_SYMBOL=" 󰌾 "
SPACESHIP_GIT_BRANCH_PREFIX="󰘬 "
SPACESHIP_GIT_STATUS_AHEAD="󰭾 "
SPACESHIP_GIT_STATUS_BEHIND="󰭽 "
SPACESHIP_PROMPT_ORDER=(dir git package node rust golang exec_time line_sep jobs exit_code char)

# startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# custom aliases
alias sudo='sudo '
alias doas='sudo '
alias la="ls -lhAt --color"
alias ls="ls --color"
alias ll="ls -lht --color"
alias untar='tar xvf'
alias grep='grep --color'
alias rd='rm -r'
alias rf='rm -rfv'
alias mv='mv -i'
alias suv='sudo nvim'
alias suvi='sudo nvim'
alias suvim='sudo nvim'
alias vim='nvim'
alias vi='nvim'
alias v='nvim'
alias cp='cp -r'
alias btc='bluetoothctl power on; bluetoothctl connect'
alias btd='bluetoothctl disconnect'

unzip() {
    if [ -z "$2" ]; then
        folder=$(echo "$1" | cut -f 1 -d '.')
    else
        folder=$(echo "$2")
    fi
    command unzip $1 -d $folder
}

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
