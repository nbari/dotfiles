# ----------------------------------------------------------------------------
# Put custom alias per host on .zshenv
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# zsh functions path
# ----------------------------------------------------------------------------
fpath=( "$HOME/.zsh/functions" ${fpath[@]} )

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
export PATH="$HOME/Library/Python/2.7/bin:/opt/local/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/share/bin"
export CLICOLOR=1
export LSCOLORS="Exfxcxdxbxegedabagacad"

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

HISTSIZE=100
SAVEHIST=100

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
# zstyle ':completion:*:*:*:*:*' menu yes select
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

# ----------------------------------------------------------------------------
# alias
# ----------------------------------------------------------------------------
alias active='grep -Ev "^($|#)"'
alias c='clear'
alias chrome='open -a "Google Chrome"'
alias cp='cp -i'
alias cpu='top -o cpu'
alias dev='git checkout develop'
alias dh='dirs -v'
alias h='history'
alias j='jobs -l'
alias l='pwd; ls -lhaGF'
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
alias tmp='cd ~/tmp'
alias svi='sudo vim'
# copy with a progress bar.
# Rsync options are:
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
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
# rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>
# rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" [source_dir] [dest_host:/dest_dir]
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
    fi
fi
