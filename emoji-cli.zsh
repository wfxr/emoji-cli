#!/usr/bin/env zsh

function emojify::cli() {
    local emoji=`$0:A:h/emojify.rb -l | column -t | fzf | awk '{print ":"$1":"}'`
    BUFFER=$BUFFER$emoji
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N emojify::cli
bindkey ${EMOJI_CLI_KEYBIND:='^[m'} emojify::cli
