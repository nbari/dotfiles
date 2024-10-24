# ----------------------------------------------------------------------------
# PATH
# ----------------------------------------------------------------------------
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/opt/homebrew/opt/curl/bin:/opt/homebrew/opt/openssl/bin:/opt/homebrew/opt/python/libexec/bin:$HOME/Library/Python/3.11/bin:$HOME/node_modules/.bin:/usr/local/bin:/usr/local/sbin:$PATH:$HOME/projects/go/bin:$HOME/.cargo/bin:$HOME/flutter/bin:/opt/homebrew/opt/libpq/bin:$HOME/.local/bin"

# ----------------------------------------------------------------------------
# PYENV - curl https://pyenv.run | bash
# ----------------------------------------------------------------------------
#export PYENV_ROOT="$HOME/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

# ----------------------------------------------------------------------------
# direnv
# ----------------------------------------------------------------------------
eval "$(direnv hook zsh)"

# ----------------------------------------------------------------------------
# zsh functions path
# ----------------------------------------------------------------------------
fpath+=${ZDOTDIR:-~}/.zsh_functions

# ----------------------------------------------------------------------------
# pnpm
# ----------------------------------------------------------------------------
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(fzf --zsh)"

# ----------------------------------------------------------------------------
# zinit
# ----------------------------------------------------------------------------
source /opt/homebrew/opt/zinit/zinit.zsh
autoload -Uz compinit && compinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit for \
    atload"zicompinit; zicdreplay" \
    blockf \
    lucid \
    wait \
    zsh-users/zsh-completions

zinit load nbari/my-zsh
zinit light kutsan/zsh-system-clipboard
zinit light zsh-users/zsh-syntax-highlighting

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# ----------------------------------------------------------------------------
# tmux
# ----------------------------------------------------------------------------
if command -v tmux &> /dev/null; then
    if [ -z "$TMUX" ]; then
        tmux -2 new
    elif [[ $(who am i) =~ '\([-a-zA-Z0-9\.]+\)$' ]] || [ ! -z "$SSH_CONNECTION" ] || [ ! -z "$REMOTEHOST" ]; then
        tmux set-option -g status-right '#[fg=colour003][ #H - #[fg=colour111]#(uname) #[fg=colour003]]#[fg=colour231]#(uptime | grep -o "...user.*")' > /dev/null
        tmux set-option -g status-position bottom > /dev/null
        tmux set-option -g window-status-current-bg colour071 > /dev/null
        tmux has-session || tmux -2 new
    fi
fi
