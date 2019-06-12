# https://www.reddit.com/r/zsh/comments/a6deyd/simple_async_prompt/
# In a file `prompt_foo_setup` available on `fpath`:

typeset -g prompt_data

function prompt_refresh {
    if ! read -r prompt_data <&$1; then
        prompt_data="[Read on fd $1 failed]"
    fi
    PROMPT=$($HOME/projects/rust/slick/target/debug/slick prompt -k "$KEYMAP" -r "$?" -d "$prompt_data")

    zle reset-prompt

    # Remove the handler and close the fd
    zle -F $1
    exec {1}<&-
}

function zle-line-init zle-keymap-select {
    PROMPT=$($HOME/projects/rust/slick/target/debug/slick prompt -k "$KEYMAP" -r "$?" -d "$prompt_data")
    zle && zle .reset-prompt
}

function prompt_precmd() {
    exec {FD}< <(
        $HOME/projects/rust/slick/target/debug/slick precmd
    )
    zle -F $FD prompt_refresh
}

function prompt_preexec() {
    typeset -g prompt_slick_cmd_timestamp=$EPOCHSECONDS
}

zle -N zle-line-init
zle -N zle-keymap-select
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd
add-zsh-hook preexec prompt_preexec
