#!/usr/bin/env zsh

function __emoji() {
    local emoji=`$0:A:h/emojify.rb -l | column -t | fzf | awk '{print ":"$1":"}'`
    BUFFER=$BUFFER$emoji
    CURSOR=$#BUFFER
    zle redisplay
}
zle     -N    __emoji
bindkey '^[m' __emoji
