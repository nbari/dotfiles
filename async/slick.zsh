typeset -Ag prompt_data

function zle-line-init zle-keymap-select prompt_refresh {
    PROMPT=$($HOME/projects/rust/slick/target/debug/slick prompt -k "$KEYMAP" -r "$?" -d "$prompt_data[prompt_git]")
    zle && zle reset-prompt
    # zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function prompt_git(){
    #sleep 3
    #if [ -n "$(cd $1 && git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
      #prompt_data[out]=$(git rev-parse --abbrev-ref HEAD)
    #fi
    $HOME/projects/rust/slick/target/debug/slick precmd
    prompt_refresh
}

prompt_precmd() {
    prompt_data[out]=""
    #prompt_git $(pwd) &!
    prompt_git $(pwd)
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
