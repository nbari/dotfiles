# ----------------------------------------------------------------------------
# Put custom alias per host on .zshenv
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# zsh functions path
# ----------------------------------------------------------------------------
fpath=( "$HOME/.zsh/functions" ${fpath[@]} )

# ----------------------------------------------------------------------------
# vim mode
# ----------------------------------------------------------------------------
bindkey -v

# ----------------------------------------------------------------------------
# Advanced Tab-completion
# ----------------------------------------------------------------------------
autoload -U compinit && compinit

# ----------------------------------------------------------------------------
# load plugins
# ----------------------------------------------------------------------------
if [ -d "$HOME/.zsh/plugins" ]; then
    for plugin ($HOME/.zsh/plugins/*.zsh) source $plugin
fi

# ----------------------------------------------------------------------------
# exports
# ----------------------------------------------------------------------------
export PATH="$HOME/Library/Python/2.7/bin:$HOME/node_modules/.bin:/opt/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/share/bin:$PATH"
# remove duplicates in the PATH
typeset -U PATH
export CLICOLOR=1

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
    # Linux Style
    alias ls='ls --color=tty'
else
    # BSD Style
    export LSCOLORS="Exfxcxdxbxegedabagacad"
fi

export EDITOR=vim
export LESSCHARSET=utf-8
export PAGER='less -R'
export GOPATH=~/projects/go
export TERM=xterm-256color
[ -n "$TMUX" ] && export TERM=screen-256color

# ----------------------------------------------------------------------------
# shell options
# ----------------------------------------------------------------------------
setopt RM_STAR_WAIT
setopt complete_aliases
setopt autocd
setopt autopushd
setopt pushdminus
setopt pushdsilent
setopt pushdtohome
setopt pushd_ignore_dups

# ----------------------------------------------------------------------------
# Command history configuration
# ----------------------------------------------------------------------------
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=1000
SAVEHIST=1000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# ----------------------------------------------------------------------------
# zstyle
# ----------------------------------------------------------------------------
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "$HOME/.zcache"
zstyle ':completion:*' use-ip true
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' file-sort modification
# Don't prompt for a huge list, page it!
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# kill
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)[ 0-9:]#([^ ]#)*=01;38=01;31=01;30'
# Rehash when completing commands
zstyle ":completion:*:commands" rehash 1
# ls colors
zstyle ':completion:*' list-colors 'di=94:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# ----------------------------------------------------------------------------
# alias
# ----------------------------------------------------------------------------
alias active='grep -Ev "^($|#)"'
alias c='clear'
alias cp='cp -i'
# copy with rsync
alias cpr="rsync --delay-updates --delete-after --checksum --archive --progress -h"
alias cpu='top -o cpu'
# clean dropbox conflicted files
alias dropboxclean="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -f {} \;"
# clean gdrive
alias gdriveclean="find . -iname '*\[Conflict\]' -exec rm -f {} \;"
alias dev='git checkout develop'
alias dh='dirs -v'
alias h='history'
alias j='jobs -l'
alias l='pwd -P; ls -lhaGF'
alias less='less -FSRX'
alias ll='ls -ALF'
alias master='git checkout master'
alias mem='top -o vsize'
alias mv='mv -i'
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias path='echo -e ${PATH//:/\\n}'
alias pg='ps auxwww | grep -v "grep" | grep --color=auto'
alias pro='cd ~/projects'
alias pscpu='ps aux | sort -r -nk 3,3 | head -n 10'
alias psmem='ps aux | sort -r -nk 4 | head -n 10'
alias pyclean='find . -iname "*.py[co]" -exec rm -f {} +;'
alias pyserv="python -m SimpleHTTPServer"
alias rm='rm -i'
alias svi='sudo vim'
alias tmp='cd ~/tmp'
# git log
alias gl="git log --graph --pretty=format:'%C(bold blue)%ad%Creset %C(yellow)%h%Creset%C(auto)%d%Creset %s %C(dim magenta)<%an>%Creset %C(dim green)(%ar)%Creset' --date=short"
alias gd="echo master diff:; git diff --name-status master"
# tmux
alias t="tmux -2 attach -d || tmux -2 new"
compdef t=tmux
alias tl='tmux list-sessions'
# alias for directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias d='dirs -v | head -10'

chrome() {
    open -a "Google Chrome" "http://www.google.com/search?q=$1";
}

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}
# ----------------------------------------------------------------------------
# Kill all process that match $1
# ----------------------------------------------------------------------------
kill9() {
    for pid in `ps aux | grep -v "grep" | grep "$@" | awk '{print $2}'`
    do
        kill -9 $pid && echo "Killed ${pid}"
    done
}

# ----------------------------------------------------------------------------
# sync .dotfiles
# ----------------------------------------------------------------------------
sync-dotfiles() {
   [[ ! -z $1 ]] && tar chf - -C${HOME} .zsh .zshrc .vim .vimrc .tmux.conf | pv | ssh $1 "tar mxf - -C ~/"
}

# ----------------------------------------------------------------------------
# ssh+tmux
# ----------------------------------------------------------------------------
export AUTOSSH_POLL=15
s() {
  [[ ! -z $1 ]] && autossh -M 0 -t $1 "tmux -2 attach -t $USER$2 -d || tmux -2 new -s $USER$2"
}
compdef s=ssh

# ----------------------------------------------------------------------------
# set ssh-agent
# ----------------------------------------------------------------------------
set-ssh-agent () {
    SSH_AGENT_PID=$(ps ax | grep -c "[s]sh-agent")
    if [[ ! -z "${SSH_AGENT_PID// }" ]]; then
        for agent in /tmp/ssh-*/agent.*; do
            export SSH_AUTH_SOCK=$agent
            if ssh-add -l 2>&1 > /dev/null; then
                echo Found working SSH Agent:
                ssh-add -l
                return
            fi
        done
    fi
    pkill ssh-agent; eval `ssh-agent`; ssh-add ~/.ssh/id_rsa
}

# ----------------------------------------------------------------------------
# whois
# ----------------------------------------------------------------------------
iwhois() {
    resolver="whois.geek.nz"
    tld=`echo ${@: -1} | awk -F "." '{print $NF}'`
    whois -h ${tld}.${resolver} "$@" ;
}

# ----------------------------------------------------------------------------
# csh history
# ----------------------------------------------------------------------------
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down"

# ----------------------------------------------------------------------------
# use OS time
# ----------------------------------------------------------------------------
disable -r time

# ----------------------------------------------------------------------------
# magic-space
# ----------------------------------------------------------------------------
bindkey " " magic-space # do history expansion on space !XX<space>

# ----------------------------------------------------------------------------
# Edit command using vim - hit ESC and then v
# emacs mode:  Ctrl-x e -  bindkey '^Xe' edit-command-line
# ----------------------------------------------------------------------------
export KEYTIMEOUT=1
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# ----------------------------------------------------------------------------
# prompt
# ----------------------------------------------------------------------------
autoload -U pure_prompt && pure_prompt
RPROMPT="%F{8}%*"

# ----------------------------------------------------------------------------
# tmux
# ----------------------------------------------------------------------------
if hash tmux &> /dev/null; then
    if [ -z "$TMUX" ]; then
        tmux has-session || tmux -2 new
    elif [ ! -z "$SSH_CONNECTION" ]; then
        tmux set-option -g status-right '#[fg=colour003][ #H - #[fg=colour111]#(uname) #[fg=colour003]]#[fg=colour231]#(uptime | grep -o "...user.*")' > /dev/null
        tmux set-option -g status-position bottom > /dev/null
        tmux set-option -g window-status-current-bg colour071 > /dev/null
    fi
fi
