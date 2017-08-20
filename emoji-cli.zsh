function __emoji() {
    emoji=`$0:A:h/ls-emoji.rb | column -t | fzf | awk '{print ":"$1":"}'`
    BUFFER=$BUFFER$emoji
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N __emoji
bindkey '^[m' __emoji
