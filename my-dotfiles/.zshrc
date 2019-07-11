# ----------------------------------------------------------------------------
# Put custom alias per host on .zshenv
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# zsh functions path
# ----------------------------------------------------------------------------
fpath=( "$HOME/.zsh/functions" ${fpath[@]} )

unsetopt nomatch

# ----------------------------------------------------------------------------
# vim mode
# ----------------------------------------------------------------------------
bindkey -v
bindkey "^?" backward-delete-char

# ----------------------------------------------------------------------------
# Advanced Tab-completion
# ----------------------------------------------------------------------------
autoload -U compinit && compinit

# ----------------------------------------------------------------------------
# load plugins
# ----------------------------------------------------------------------------
[ -d "$HOME/.zsh/plugins" ] && for plugin ($HOME/.zsh/plugins/*.zsh) source $plugin

# ----------------------------------------------------------------------------
# exports
# ----------------------------------------------------------------------------
export PATH="/usr/local/opt/openssl/bin:/usr/local/opt/python/libexec/bin:$HOME/Library/Python/3.7/bin:$HOME/node_modules/.bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/share/bin:$PATH:$HOME/projects/go/bin:$HOME/.cargo/bin"
# export PATH="/usr/local/opt/python/libexec/bin:$HOME/Library/Python/3.6/bin:$HOME/Library/Python/2.7/bin:$HOME/node_modules/.bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/share/bin:$PATH:$HOME/projects/go/bin:$HOME/.cargo/bin"
# export PATH="/usr/local/opt/python@2/bin"

# ssh + gpg
export "GPG_TTY=$(tty)"
export "SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh"

# remove duplicates in the PATH
typeset -U PATH
export CLICOLOR=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Do we need Linux or BSD Style?
if ls --color -d . &>/dev/null 2>&1
then
    # Linux Style
    alias ls='ls --color=tty'
else
    # BSD Style
    export LSCOLORS=Exfxcxdxbxegedabagacad
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

HISTSIZE=10000
SAVEHIST=10000

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
alias cpr="rsync --delete --archive --numeric-ids --human-readable --verbose --info=progress2"
alias cpu='top -o cpu'
# clean dropbox conflicted files
alias dropboxclean="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -f {} \;"
# flush dns
alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
# clean gdrive
alias gdriveclean="find . -iname '*\[Conflict\]' -exec rm -f {} \;"
alias gdrive='cd ~/Google\ Drive'
alias git_empty='git commit -m "empty commit" --allow-empty'
alias gu='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;'
alias yk='gpg --card-status > /dev/null'
alias dev='git checkout develop'
alias dh='dirs -v'
alias h='history'
alias j='jobs -l'
alias l='pwd -P; ls -lhaGF'
alias less='less -FSRX'
alias ll='ls -AlF'
alias master='git checkout master'
alias mem='top -o vsize'
alias mv='mv -i'
alias myip="dig @ns1.google.com -t txt o-o.myaddr.l.google.com +short"
alias path='echo -e ${PATH//:/\\n}'
alias pg='ps auxwww | grep -v "grep" | grep --color=auto'
alias pro='cd ~/projects'
alias pscpu='ps aux | sort -r -nk 3,3 | head -n 10'
alias psmem='ps aux | sort -r -nk 4 | head -n 10'
alias pyclean='find . \( -iname "*.py[co]" -o -name "__pycache__" \) -exec rm -rf {} +;'
# alias pyclean='find . -iname "*.py[co]" -delete'
alias pyserv="python -m SimpleHTTPServer"
alias rm='rm -i'
alias ss='autossh -M 0'
alias svi='sudo vim'
alias ssh-tunnel='echo "ssh -C2qTnN -D 8080 (proxy) or -T -N -f -L 3307:db.tld:3307 host.tld"'
alias up='git add . && git commit -a -m "sync `date`" && git push'
alias tmp='cd ~/tmp'
# git log
alias gl="git log --decorate --graph --oneline --all --date=short --pretty=format:'%C(bold blue)%ad%Creset %C(yellow)%h%Creset%C(auto)%d%Creset %s %C(dim magenta)<%an>%Creset %C(dim green)(%ar)%Creset'"
alias gd="echo master diff:; git diff --name-status master develop"
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
alias connected='lsof -i | grep -E "(LISTEN|ESTABLISHED)"'
alias bookmarks='~/.zsh/bookmarks'
alias listen='lsof -iTCP -sTCP:LISTEN -n -P'
alias rand='LC_ALL=C; cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1'
# wake up yubikey
alias yk='gpg --card-status > /dev/null'
# HDMI / DP
alias hdmi='ddcctl -d 1 -i 17'
alias dp='ddcctl -d 1 -i 15'

# checksum
checksum() {
    [[ -a $1 ]] && openssl dgst -sha256 $1
}

# get currect active interface
iface(){
    route get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}';
}

# tmux new sessions
tn() {
    [[ ! -z $1 ]] && tmux -2 new -s $1
}
# tmux attach
ta() {
    [[ ! -z $1 ]] && tmux attach -t $1
}
# tmux send-keys right
ts() {
    tmux send-keys -t right "$@" C-m
}


# get PID/PGID/PPID/SID to certain process or pid:
pgid() {
    ps -ejf | egrep "STIME | $1" | grep -v egrep
}

get_headers_GET() {
    # curl -k -i -L -s -H "Accept-Encoding: gzip,deflate" -A "nbari - [$(date -u '+%FT%T')]" -D - $1 -o /dev/null
    curl -i -L -s -H "Accept-Encoding: gzip,deflate" -A "nbari - [$(date -u '+%FT%T')]" -D - $1 -o /dev/null
}

get_headers() {
    curl -I -L -H "Accept-Encoding: gzip,deflate" -H "Origin: http://example.com" -H "Access-Control-Request-Method: GET" $1
}

get_options() {
    curl -I -L -X OPTIONS -H "Origin: http://example.com" -H "Access-Control-Request-Method: GET" -H "Access-Control-Request-Headers: X-Requested-With" $1
}

get_akamai() {
    curl -I -L -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no, akamai-x-get-request-id, akamai-x-request-trace, akamai-x--meta-trace, akama-xi-get-extracted-values" $1
}

chrome() {
    open -a "Google Chrome" "http://www.google.com/search?q=$1";
}

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

set_env() {
    if [ -r $PWD/.zsh_config ]; then
        source $PWD/.zsh_config
        print -P -- %F{2}Ok%f
    else
        print -P -- %F{9}No .zsh_config found%f
    fi
}

enc () {
    [[ ! -z $1 ]] && gpg --symmetric --cipher-algo TWOFISH $1
}

mkdir_ansible_roles() {
    echo "ansible-galaxy init <name_of_role> --force"
}

gpg_encrypt() {
    echo "gpg --output file.gpg --encrypt --recipient user@email.com file.txt & gpg --output file.txt --decrypt file.gpg"
}

wttr() {
    curl "wttr.in/${1:-berlin}"
}

curl_time() {
    curl -o /dev/null -Ls -w " \
        time_namelookup:  %{time_namelookup}\n \
        time_connect:  %{time_connect}\n \
        time_appconnect:  %{time_appconnect}\n \
        time_pretransfer:  %{time_pretransfer}\n \
        time_redirect:  %{time_redirect}\n \
        time_starttransfer:  %{time_starttransfer}\n \
        ----------\n \
        time_total:  %{time_total}\n" "$1"
}

# ----------------------------------------------------------------------------
# Kill all process that match $1
# ----------------------------------------------------------------------------
kill9() {
    for pid in `ps aux | grep -v "grep" | grep "$@" | awk '{print $2}'`; do
        kill -9 $pid && echo "Killed ${pid}"
    done
}

# ----------------------------------------------------------------------------
# sync .dotfiles
# ----------------------------------------------------------------------------
sync-dotfiles() {
[[ ! -z $1 ]] && tar chf - -C${HOME} .zsh .zshrc .vim .vimrc .tmux.conf .cshrc | pv | ssh $@ "tar mxf - -C ~/"
}

# ----------------------------------------------------------------------------
# sync .tmux.conf
# ----------------------------------------------------------------------------
sync-tmux() {
[[ ! -z $1 ]] && scp $HOME/projects/dotfiles/my-dotfiles/.tmux-remote.conf $1:~/.tmux.conf
}

# ----------------------------------------------------------------------------
# ssh+tmux
# ----------------------------------------------------------------------------
export AUTOSSH_GATETIME=0
export AUTOSSH_POLL=10
export AUTOSSH_PORT=0
s() {
    [[ ! -z $1 ]] && autossh -M 0 -t $@ tmux -2 new -ADs $USER
}
compdef s=ssh

m() {
    [[ ! -z $1 ]] && mosh $@ -- tmux -2 new -ADs $USER
}

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
bindkey -M vicmd 'k' up-line-or-beginning-search # Up
bindkey -M vicmd 'j' down-line-or-beginning-search # Down

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
#autoload -U promptinit; promptinit
#PURE_PROMPT_SYMBOL="$"
#PURE_PROMPT_VICMD_SYMBOL="%F{yellow}>%f"
#prompt pure

zle -N zle-keymap-select
zle -N zle-line-init
zmodload zsh/datetime
autoload -Uz add-zsh-hook
add-zsh-hook precmd slick_prompt_precmd
add-zsh-hook preexec slick_prompt_preexec

typeset -g slick_prompt_data
typeset -g slick_prompt_timestamp

SLICK_PATH=$HOME/projects/rust/slick/target/release/slick

function slick_prompt_refresh {
    local exit_status=$?
    read -r -u $1 slick_prompt_data
    PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -r $exit_status -d ${slick_prompt_data:-""} -t ${slick_prompt_timestamp:-$EPOCHSECONDS})
    unset slick_prompt_timestamp
    zle reset-prompt

    # Remove the handler and close the fd
    zle -F $1
    exec {1}<&-
}

function zle-line-init zle-keymap-select {
    PROMPT=$($SLICK_PATH prompt -k "$KEYMAP" -d ${slick_prompt_data:-""})
    zle && zle reset-prompt
}

function slick_prompt_precmd() {
    slick_prompt_data=""
    local fd
    exec {fd}< <($SLICK_PATH precmd)
    zle -F $fd slick_prompt_refresh
}

function slick_prompt_preexec() {
    slick_prompt_timestamp=$EPOCHSECONDS
}

# ----------------------------------------------------------------------------
# tmux
# ----------------------------------------------------------------------------
if hash tmux &> /dev/null; then
    if [ -z "$TMUX" ]; then
        tmux -2 new
    elif [[ $(who am i) =~ '\([-a-zA-Z0-9\.]+\)$' ]] || [ ! -z "$SSH_CONNECTION" ] || [ ! -z "$REMOTEHOST" ]; then
        tmux set-option -g status-right '#[fg=colour003][ #H - #[fg=colour111]#(uname) #[fg=colour003]]#[fg=colour231]#(uptime | grep -o "...user.*")' > /dev/null
        tmux set-option -g status-position bottom > /dev/null
        tmux set-option -g window-status-current-bg colour071 > /dev/null
        tmux has-session || tmux -2 new
    fi
fi

unsetopt prompt_cr

# delete coplete for android
# compdef -d adb
eval "$(direnv hook zsh)"

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_TMUX=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# command history
fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# add current time to the right
# RPROMPT='%F{8}%*%f'
# preexec () {
#    str='%F{8}%*%f'
#    pos=$(( COLUMNS - 8 ))
#    print -Pn "\e7\e[1A\e[${pos}G${str}\e8"
# }

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
