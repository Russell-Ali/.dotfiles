# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt HIST_IGNORE_ALL_DUPS
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/rasul/.zshrc'

# Enable Colors
autoload -U colors && colors

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
SPACESHIP_GIT_STATUS_PREFIX=' '
SPACESHIP_GIT_STATUS_SUFFIX=''
SPACESHIP_GIT_STATUS_COLOR=yellow

# startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

# custom aliases
alias sudo='sudo '
alias doas='sudo '
alias la="ls -lA --color"
alias ls="ls --color"
alias ll="ls -l --color"
alias untar='tar xvf'
alias grep='grep --color'
alias rd='rm -rf'
alias mv='mv -i'
alias suv='sudo vim'
alias suvi='sudo vim'
alias suvim='sudo vim'
alias vi='vim'
alias v='vim'
alias btc='bluetoothctl power on; bluetoothctl connect'
alias btd='bluetoothctl disconnect'

# screenfetch
export DESKTOP_SESSION='bspwm'
/home/rasul/sources/fetch-master/fm6000 -l 9 -c random -f /home/rasul/sources/fetch-master/empty.txt 
# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
