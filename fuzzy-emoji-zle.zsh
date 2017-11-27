#!/usr/bin/env zsh

function wfxr::zle::fuzzy-emoji() {
    BUFFER=$BUFFER$(fuzzy-emoji)
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N wfxr::zle::fuzzy-emoji
bindkey ${EMOJI_CLI_KEYBIND:='^[m'} wfxr::zle::fuzzy-emoji
