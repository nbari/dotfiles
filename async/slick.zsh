# https://www.reddit.com/r/zsh/comments/a6deyd/simple_async_prompt/
# In a file `prompt_foo_setup` available on `fpath`:

typeset -g slick_prompt_data
typeset -g slick_prompt_timestamp

function slick_prompt_refresh {
    if ! read -r slick_prompt_data <&$1; then
        slick_prompt_data=" "
    fi
    PROMPT=$($HOME/projects/rust/slick/target/debug/slick prompt -k "$KEYMAP" -r $? -d $slick_prompt_data -t $slick_prompt_timestamp)

    zle reset-prompt

    # Remove the handler and close the fd
    zle -F $1
    exec {1}<&-
}

function zle-line-init zle-keymap-select {
    PROMPT=$($HOME/projects/rust/slick/target/debug/slick prompt -k "$KEYMAP" -r $? -d $slick_prompt_data)
    zle && zle reset-prompt
}

function slick_prompt_precmd() {
    exec {FD}< <(
        $HOME/projects/rust/slick/target/debug/slick precmd
    )
    zle -F $FD slick_prompt_refresh
}

function slick_prompt_preexec() {
    slick_prompt_timestamp=$EPOCHSECONDS
}

zle -N zle-line-init
zle -N zle-keymap-select
autoload -Uz add-zsh-hook
add-zsh-hook precmd slick_prompt_precmd
add-zsh-hook preexec slick_prompt_preexec
