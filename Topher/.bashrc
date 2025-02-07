#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### Command Aliasses ###

alias ls='ls -la --color=auto'
alias du='du -hd1'
alias tree='tree -d'

### Functions ###

# Git clone clipboard and cd into newly created folder
function Git(){
    git clone $1
    cd  "$(\ls -1dt ./*/ | head -n 1)"
}

function GitCode(){
    git clone $1
    cd  "$(\ls -1dt ./*/ | head -n 1)"
    code .
}

### User System Processes ###

PS1='[\u@\h \W]\$ '

export VISUAL=vim
export EDITOR="$VISUAL"

source /usr/share/git/completion/git-completion.bash
