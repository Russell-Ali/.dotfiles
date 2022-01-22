#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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
alias rd='rm -rf'
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

unzipf() {
    folder=$(echo "$1" | cut -f 1 -d '.')
    unzip $1 -d $folder
}
