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
    if [ -n "$(cd $1 && git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
        git rev-parse --abbrev-ref HEAD
    else
        echo "--"
    fi
}

prompt_callback(){
    prompt_data[out]=$3
    prompt_refresh
}

async_start_worker 'prompt' -n
async_register_callback 'prompt' prompt_callback

prompt_precmd() {
    async_job 'prompt' prompt_git $(pwd)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
