# FreeBSD .cshrc - csh resource script

alias h  history 25
alias j  jobs -l
alias ls ls -GF
alias l ls -lhaGF
alias la ls -aF
alias lf ls -FA
alias ll ls -lAF
alias rm rm -i
alias mv mv -i
alias cp cp -i
alias g  grep --color=auto
alias pg 'ps auxwww | grep -v "grep" | grep --color=auto'
alias set-ssh-agent 'pkill ssh-agent; eval `ssh-agent -c`; ssh-add ~/.ssh/id_rsa'
alias pyclean 'find . -iname "*.py[co]" -exec rm -f {} +;'
alias s autossh -M 0 -t \!:1 \"tmux -2 attach -t $USER\!:2 -d \|\| tmux -2 new -s $USER\!:2 \"

# A righteous umask
umask 22

set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

set autologout = 300

setenv EDITOR  vim
setenv PAGER  less
setenv BLOCKSIZE  K
setenv CLICOLOR
setenv LSCOLORS gxfxcxdxbxegedabagacad

set COLOR1="%{\e[0;32m%}"
set COLOR2="%{\e[0;33m%}"
set COLOR3="%{\e[0;36m%}"
set COLOR4="%{\e[0;0m%}"
set COLOR5="%{\e[0;33m%}"

if ($?prompt) then
  # An interactive shell -- set some stuff up
  if ($uid == 0) then
    set COLOR3="%{\e[1;31m%}"
    set user = root
  endif
  set prompt="$COLOR2\[$COLOR3%n@%M$COLOR2\:$COLOR1%~$COLOR2\] [%p %d]\n$COLOR5>$COLOR4 "
  set promptchars = "%#"

  set filec
  set history = 1000
  set savehist = (1000 merge)
  set autolist = ambiguous
  # Use history to aid expansion
  set autoexpand
  set autorehash
  set mail = (/var/mail/$USER)
  if ( $?tcsh ) then
    bindkey "^W" backward-delete-word
    bindkey -k up history-search-backward
    bindkey -k down history-search-forward
  endif

endif
