# ----------------------------------------------------------------------------
# Put custom alias per host on .zshenv
# ----------------------------------------------------------------------------

my_status(){
    sleep 3
    if [ -n "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
        git rev-parse --abbrev-ref HEAD
    fi
}

my_callback(){
    OUT=$3
    async_job my_worker my_status
}

autoload -Uz async && async
async_init

async_start_worker "my_worker" -n
async_register_callback my_worker my_callback
async_job "my_worker" my_status

TMOUT=1
TRAPALRM() { zle reset-prompt }

date_string="%D{%Y-%m-%d %H:%M:%S}"
username="%n"
path_string="%3c"
precmd() {
    print -rP "${date_string} ${username} ${path_string} ${OUT}"
}
PROMPT='» '
