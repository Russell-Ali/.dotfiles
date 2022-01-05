#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

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
alias rd='rm -ri'
alias rm='rm -i'
alias mv='mv -i'
alias suv='sudo vim'
alias suvi='sudo vim'
alias suvim='sudo vim'
alias vi='vim'
alias v='vim'
alias btc='bluetoothctl power on; bluetoothctl connect'
alias btd='bluetoothctl disconnect'
