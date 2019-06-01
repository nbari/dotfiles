# https://www.reddit.com/r/zsh/comments/a6deyd/simple_async_prompt/
# In a file `prompt_foo_setup` available on `fpath`:
foo-response() {
  PROMPT="$(<&$1)"
  zle reset-prompt

  zle -F $1
  exec {1}<&-
}

prompt_foo_precmd() {
  PROMPT="waiting..."

  exec {FD}< <(
    sleep 10
    echo -n "foo > "
  )

  zle -F $FD foo-response
}

prompt_foo_setup() {
  add-zsh-hook precmd prompt_foo_precmd
}

prompt_foo_setup "$@"

# autoload -Uz promptinit; promptinit; prompt foo
