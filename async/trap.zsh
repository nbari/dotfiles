#
autoload -Uz async && async
async_init
typeset -Ag prompt_data

function zle-line-init zle-keymap-select prompt_refresh {
    PROMPT="$prompt_data[out] >> "
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

prompt_git(){
    sleep 3
    if [ -n "$(cd $1 && git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
      prompt_data[out]=$(git rev-parse --abbrev-ref HEAD)
    fi
}

prompt_precmd() {
    callback() {
        echo 11111
        prompt_refresh
    }
    trap callback EXIT
    prompt_data[out]=""
    prompt_git $(pwd) &!
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
