# This is a shell archive.  Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".  Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
#	.
#	./.zsh
#	./.zsh/functions
#	./.zsh/functions/pure_prompt
#	./.zsh/plugins
#	./.zsh/plugins/git-flow-completion.zsh
#	./.zshrc
#
echo c - .
mkdir -p . > /dev/null 2>&1
echo c - ./.zsh
mkdir -p ./.zsh > /dev/null 2>&1
echo c - ./.zsh/functions
mkdir -p ./.zsh/functions > /dev/null 2>&1
echo x - ./.zsh/functions/pure_prompt
sed 's/^X//' >./.zsh/functions/pure_prompt << 'END-of-./.zsh/functions/pure_prompt'
X# see https://github.com/sindresorhus/pure
X
X# turns seconds into human readable time
X# 165392 => 1d 21h 56m 32s
Xpure_prompt_human_time() {
X	echo -n " "
X	local tmp=$1
X	local days=$(( tmp / 60 / 60 / 24 ))
X	local hours=$(( tmp / 60 / 60 % 24 ))
X	local minutes=$(( tmp / 60 % 60 ))
X	local seconds=$(( tmp % 60 ))
X	(( $days > 0 )) && echo -n "${days}d "
X	(( $hours > 0 )) && echo -n "${hours}h "
X	(( $minutes > 0 )) && echo -n "${minutes}m "
X	echo "${seconds}s"
X}
X
X# fastest possible way to check if repo is dirty
Xpure_prompt_git_dirty() {
X	# check if we're in a git repo
X	[[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
X
X    # ----------------------------------------------------------------------------
X	# check if it's dirty
X	# [[ "$PURE_GIT_UNTRACKED_DIRTY" == 0 ]] && local umode="-uno" || local umode="-unormal"
X	# command test -n "$(git status --porcelain --ignore-submodules ${umode})"
X	# (($? == 0)) && echo '*'
X    # ----------------------------------------------------------------------------
X
X    local GIT_STATE=""
X
X    local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
X    if [ "$NUM_AHEAD" -gt 0 ]; then
X        GIT_STATE="$GIT_STATE (+$NUM_AHEAD)"
X    fi
X
X    local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
X    if [ "$NUM_BEHIND" -gt 0 ]; then
X        if [[ -n $GIT_STATE ]]; then
X            GIT_STATE="$GIT_STATE"
X        fi
X        GIT_STATE="$GIT_STATE (-$NUM_BEHIND)"
X    fi
X
X    GIT_UNTRACKED=$(git status --porcelain | grep '??' 2> /dev/null | wc -l | tr -d ' ')
X    if [ $GIT_UNTRACKED -gt 0 ]; then
X        GIT_STATE="$GIT_STATE %F{2}[$GIT_UNTRACKED untracked]"
X    fi
X
X    GIT_MODIFIED=$(git status --porcelain | grep 'M' 2> /dev/null | wc -l | tr -d ' ')
X    if [ $GIT_MODIFIED -gt 0 ]; then
X        GIT_STATE="$GIT_STATE %F{5}[$GIT_MODIFIED modified]"
X    fi
X
X    GIT_DELETED=$(git status --porcelain | grep 'D' 2> /dev/null | wc -l | tr -d ' ')
X    if [ $GIT_DELETED -gt 0 ]; then
X        GIT_STATE="$GIT_STATE %F{1}[$GIT_DELETED deleted]"
X    fi
X
X    if ! git diff --cached --quiet 2> /dev/null; then
X        GIT_STATE="$GIT_STATE %F{12}[staged]"
X    fi
X
X    echo $GIT_STATE
X}
X
X# displays the exec time of the last command if set threshold was exceeded
Xpure_prompt_cmd_exec_time() {
X	local stop=$EPOCHSECONDS
X	local start=${cmd_timestamp:-$stop}
X	integer elapsed=$stop-$start
X	(($elapsed > 5)) && pure_prompt_human_time $elapsed
X}
X
Xpure_prompt_preexec() {
X	cmd_timestamp=$EPOCHSECONDS
X
X	# shows the current dir and executed command in the title when a process is active
X	print -Pn "\e]0;"
X	echo -nE "$PWD:t: $2"
X	print -Pn "\a"
X}
X
X# string length ignoring ansi escapes
Xpure_prompt_string_length() {
X	# Subtract one since newline is counted as two characters
X	#echo $(( ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}} - 1 ))
X    # print at the right side
X    #echo ${(l:$COLUMNS::-:)}
X    echo $(($COLUMNS-2))
X}
X
Xpure_prompt_precmd() {
X	# shows the full path in the title
X	print -Pn '\e]0;%~\a'
X
X	# git info
X	vcs_info
X
X	local pure_prompt_preprompt="\n$pure_prompt_username %F{074}%~%F{3}$vcs_info_msg_0_%F{1}`pure_prompt_git_dirty`%f%F{011}`pure_prompt_cmd_exec_time`%f"
X	print -P $pure_prompt_preprompt
X
X	# check async if there is anything to pull
X	(( ${PURE_GIT_PULL:-1} )) && {
X		# check if we're in a git repo
X		[[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] &&
X		# make sure working tree is not $HOME
X		[[ "$(command git rev-parse --show-toplevel)" != "$HOME" ]] &&
X		# check check if there is anything to pull
X        # set GIT_TERMINAL_PROMPT=0 to disable auth prompting for git fetch (git 2.3+)
X		GIT_TERMINAL_PROMPT=0 command git -c gc.auto=0 fetch &>/dev/null &&
X		# check if there is an upstream configured for this branch
X		command git rev-parse --abbrev-ref @'{u}' &>/dev/null && {
X			local arrows=''
X			(( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='-'
X			(( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='+'
X            [[ "$arrows" == '-+' ]] && arrows='±'
X			print -Pn "\e7\e[A\e[1G\e[`pure_prompt_string_length $pure_prompt_preprompt`C%F{6}${arrows:-%F\{2\}•}%f\e8"
X		}
X	} &!
X
X	# reset value since `preexec` isn't always triggered
X	unset cmd_timestamp
X}
X
X
Xpure_prompt() {
X	# prevent percentage showing up if output doesn't end with a newline
X	export PROMPT_EOL_MARK=''
X
X	prompt_opts=(cr subst percent)
X
X	zmodload zsh/datetime
X	autoload -Uz add-zsh-hook
X	autoload -Uz vcs_info
X
X	add-zsh-hook precmd pure_prompt_precmd
X	add-zsh-hook preexec pure_prompt_preexec
X
X	zstyle ':vcs_info:*' enable git
X	zstyle ':vcs_info:*' use-simple true
X	zstyle ':vcs_info:git*' formats ' %b'
X	zstyle ':vcs_info:git*' actionformats ' %b|%a'
X
X	pure_prompt_username='%F{2}%n'
X
X	# show username@host if logged in through SSH
X	[[ "$SSH_CONNECTION" != '' ]] && pure_prompt_username='%F{2}%n%F{8}@%M'
X
X	# show username@host if root, with username in red
X	[[ $UID -eq 0 ]] && pure_prompt_username='%F{1}%n%F{242}@%M' && PROMPT_SYMBOL='%F{3}#'
X
X	# prompt turns red if the previous command didn't exit with 0
X    PROMPT="%(?.%F{5}.%F{1})${PROMPT_SYMBOL:-$}%f "
X}
X
Xpure_prompt "$@"
END-of-./.zsh/functions/pure_prompt
echo c - ./.zsh/plugins
mkdir -p ./.zsh/plugins > /dev/null 2>&1
echo x - ./.zsh/plugins/git-flow-completion.zsh
sed 's/^X//' >./.zsh/plugins/git-flow-completion.zsh << 'END-of-./.zsh/plugins/git-flow-completion.zsh'
X#!zsh
X#
X# Installation
X# ------------
X#
X# To achieve git-flow completion nirvana:
X#
X#  0. Update your zsh's git-completion module to the newest verion.
X#     From here. http://zsh.git.sourceforge.net/git/gitweb.cgi?p=zsh/zsh;a=blob_plain;f=Completion/Unix/Command/_git;hb=HEAD
X#
X#  1. Install this file. Either:
X#
X#     a. Place it in your .zshrc:
X#
X#     b. Or, copy it somewhere (e.g. ~/.git-flow-completion.zsh) and put the following line in
X#        your .zshrc:
X#
X#            source ~/.git-flow-completion.zsh
X#
X#     c. Or, use this file as a oh-my-zsh plugin.
X#
X
X_git-flow ()
X{
X	local curcontext="$curcontext" state line
X	typeset -A opt_args
X
X	_arguments -C \
X		':command:->command' \
X		'*::options:->options'
X
X	case $state in
X		(command)
X
X			local -a subcommands
X			subcommands=(
X				'init:Initialize a new git repo with support for the branching model.'
X				'feature:Manage your feature branches.'
X				'config:Manage your configuration.'
X				'release:Manage your release branches.'
X				'hotfix:Manage your hotfix branches.'
X				'support:Manage your support branches.'
X				'version:Shows version information.'
X			)
X			_describe -t commands 'git flow' subcommands
X		;;
X
X		(options)
X			case $line[1] in
X
X				(init)
X					_arguments \
X						-f'[Force setting of gitflow branches, even if already configured]'
X					;;
X
X					(version)
X					;;
X
X					(hotfix)
X						__git-flow-hotfix
X					;;
X
X					(release)
X						__git-flow-release
X					;;
X
X					(feature)
X						__git-flow-feature
X					;;
X					(config)
X					__git-flow-config
X					;;
X
X			esac
X		;;
X	esac
X}
X
X__git-flow-release ()
X{
X	local curcontext="$curcontext" state line
X	typeset -A opt_args
X
X	_arguments -C \
X		':command:->command' \
X		'*::options:->options'
X
X	case $state in
X		(command)
X
X			local -a subcommands
X			subcommands=(
X				'start:Start a new release branch.'
X				'finish:Finish a release branch.'
X				'list:List all your release branches. (Alias to `git flow release`)'
X				'publish:Publish release branch to remote.'
X				'track:Checkout remote release branch.'
X				'delet:Delete a release branch.'
X			)
X			_describe -t commands 'git flow release' subcommands
X			_arguments \
X				-v'[Verbose (more) output]'
X		;;
X
X		(options)
X			case $line[1] in
X
X				(start)
X					_arguments \
X						-F'[Fetch from origin before performing finish]'\
X						':version:__git_flow_version_list'
X				;;
X
X				(finish)
X					_arguments \
X						-F'[Fetch from origin before performing finish]' \
X						-s'[Sign the release tag cryptographically]'\
X						-u'[Use the given GPG-key for the digital signature (implies -s)]'\
X						-m'[Use the given tag message]'\
X						-p'[Push to $ORIGIN after performing finish]'\
X						':version:__git_flow_version_list'
X				;;
X
X				(delete)
X					_arguments \
X						-f'[Force deletion]' \
X						-r'[Delete remote branch]' \
X						':version:__git_flow_version_list'
X				;;
X
X				(publish)
X					_arguments \
X						':version:__git_flow_version_list'
X				;;
X
X				(track)
X					_arguments \
X						':version:__git_flow_version_list'
X				;;
X
X				*)
X					_arguments \
X						-v'[Verbose (more) output]'
X				;;
X			esac
X		;;
X	esac
X}
X
X__git-flow-hotfix ()
X{
X	local curcontext="$curcontext" state line
X	typeset -A opt_args
X
X	_arguments -C \
X		':command:->command' \
X		'*::options:->options'
X
X	case $state in
X		(command)
X
X			local -a subcommands
X			subcommands=(
X				'start:Start a new hotfix branch.'
X				'finish:Finish a hotfix branch.'
X				'delete:Delete a hotfix branch.'
X				'list:List all your hotfix branches. (Alias to `git flow hotfix`)'
X			)
X			_describe -t commands 'git flow hotfix' subcommands
X			_arguments \
X				-v'[Verbose (more) output]'
X		;;
X
X		(options)
X			case $line[1] in
X
X				(start)
X					_arguments \
X						-F'[Fetch from origin before performing finish]'\
X						':hotfix:__git_flow_version_list'\
X						':branch-name:__git_branch_names'
X				;;
X
X				(finish)
X					_arguments \
X						-F'[Fetch from origin before performing finish]' \
X						-s'[Sign the release tag cryptographically]'\
X						-u'[Use the given GPG-key for the digital signature (implies -s)]'\
X						-m'[Use the given tag message]'\
X						-p'[Push to $ORIGIN after performing finish]'\
X						':hotfix:__git_flow_hotfix_list'
X				;;
X
X				(delete)
X					_arguments \
X						-f'[Force deletion]' \
X						-r'[Delete remote branch]' \
X						':hotfix:__git_flow_hotfix_list'
X				;;
X
X				*)
X					_arguments \
X						-v'[Verbose (more) output]'
X				;;
X			esac
X		;;
X	esac
X}
X
X__git-flow-feature ()
X{
X	local curcontext="$curcontext" state line
X	typeset -A opt_args
X
X	_arguments -C \
X		':command:->command' \
X		'*::options:->options'
X
X	case $state in
X		(command)
X
X			local -a subcommands
X			subcommands=(
X				'start:Start a new feature branch.'
X				'finish:Finish a feature branch.'
X				'delete:Delete a feature branch.'
X				'list:List all your feature branches. (Alias to `git flow feature`)'
X				'publish:Publish feature branch to remote.'
X				'track:Checkout remote feature branch.'
X				'diff:Show all changes.'
X				'rebase:Rebase from integration branch.'
X				'checkout:Checkout local feature branch.'
X				'pull:Pull changes from remote.'
X			)
X			_describe -t commands 'git flow feature' subcommands
X			_arguments \
X				-v'[Verbose (more) output]'
X		;;
X
X		(options)
X			case $line[1] in
X
X				(start)
X					_arguments \
X						-F'[Fetch from origin before performing finish]'\
X						':feature:__git_flow_feature_list'\
X						':branch-name:__git_branch_names'
X				;;
X
X				(finish)
X					_arguments \
X						-F'[Fetch from origin before performing finish]' \
X						-r'[Rebase instead of merge]'\
X						':feature:__git_flow_feature_list'
X				;;
X
X				(delete)
X					_arguments \
X						-f'[Force deletion]' \
X						-r'[Delete remote branch]' \
X						':feature:__git_flow_feature_list'
X				;;
X
X				(publish)
X					_arguments \
X						':feature:__git_flow_feature_list'\
X				;;
X
X				(track)
X					_arguments \
X						':feature:__git_flow_feature_list'\
X				;;
X
X				(diff)
X					_arguments \
X						':branch:__git_branch_names'\
X				;;
X
X				(rebase)
X					_arguments \
X						-i'[Do an interactive rebase]' \
X						':branch:__git_branch_names'
X				;;
X
X				(checkout)
X					_arguments \
X						':branch:__git_flow_feature_list'\
X				;;
X
X				(pull)
X					_arguments \
X						':remote:__git_remotes'\
X						':branch:__git_branch_names'
X				;;
X
X				*)
X					_arguments \
X						-v'[Verbose (more) output]'
X				;;
X			esac
X		;;
X	esac
X}
X
X__git-flow-config ()
X{
X	local curcontext="$curcontext" state line
X	typeset -A opt_args
X
X	_arguments -C \
X		':command:->command' \
X		'*::options:->options'
X
X	case $state in
X		(command)
X
X			local -a subcommands
X			subcommands=(
X				'list:List the configuration. (Alias to `git flow config`)'
X				'set:Set the configuration option'
X			)
X			_describe -t commands 'git flow config' subcommands
X		;;
X
X		(options)
X			case $line[1] in
X
X				(set)
X					_arguments \
X						--local'[Use repository config file]' \
X						--global'[Use global config file]'\
X						--system'[Use system config file]'\
X						--file'[Use given config file]'\
X						':option:(master develop feature hotfix release support	versiontagprefix)'
X				;;
X
X				*)
X					_arguments \
X						--local'[Use repository config file]' \
X						--global'[Use global config file]'\
X						--system'[Use system config file]'\
X						--file'[Use given config file]'
X				;;
X			esac
X		;;
X	esac
X}
X__git_flow_version_list ()
X{
X	local expl
X	declare -a versions
X
X	versions=(${${(f)"$(_call_program versions git flow release list 2> /dev/null | tr -d ' |*')"}})
X	__git_command_successful || return
X
X	_wanted versions expl 'version' compadd $versions
X}
X
X__git_flow_feature_list ()
X{
X	local expl
X	declare -a features
X
X	features=(${${(f)"$(_call_program features git flow feature list 2> /dev/null | tr -d ' |*')"}})
X	__git_command_successful || return
X
X	_wanted features expl 'feature' compadd $features
X}
X
X__git_remotes () {
X	local expl gitdir remotes
X
X	gitdir=$(_call_program gitdir git rev-parse --git-dir 2>/dev/null)
X	__git_command_successful || return
X
X	remotes=(${${(f)"$(_call_program remotes git config --get-regexp '"^remote\..*\.url$"')"}//#(#b)remote.(*).url */$match[1]})
X	__git_command_successful || return
X
X	# TODO: Should combine the two instead of either or.
X	if (( $#remotes > 0 )); then
X		_wanted remotes expl remote compadd $* - $remotes
X	else
X		_wanted remotes expl remote _files $* - -W "($gitdir/remotes)" -g "$gitdir/remotes/*"
X	fi
X}
X
X__git_flow_hotfix_list ()
X{
X	local expl
X	declare -a hotfixes
X
X	hotfixes=(${${(f)"$(_call_program hotfixes git flow hotfix list 2> /dev/null | tr -d ' |*')"}})
X	__git_command_successful || return
X
X	_wanted hotfixes expl 'hotfix' compadd $hotfixes
X}
X
X__git_branch_names () {
X	local expl
X	declare -a branch_names
X
X	branch_names=(${${(f)"$(_call_program branchrefs git for-each-ref --format='"%(refname)"' refs/heads 2>/dev/null)"}#refs/heads/})
X	__git_command_successful || return
X
X	_wanted branch-names expl branch-name compadd $* - $branch_names
X}
X
X__git_command_successful () {
X	if (( ${#pipestatus:#0} > 0 )); then
X		_message 'not a git repository'
X		return 1
X	fi
X	return 0
X}
X
Xzstyle ':completion:*:*:git:*' user-commands flow:'provide high-level repository operations'
END-of-./.zsh/plugins/git-flow-completion.zsh
echo x - ./.zshrc
sed 's/^X//' >./.zshrc << 'END-of-./.zshrc'
X# ----------------------------------------------------------------------------
X# Put custom alias per host on .zshenv
X# ----------------------------------------------------------------------------
X
X# ----------------------------------------------------------------------------
X# zsh functions path
X# ----------------------------------------------------------------------------
Xfpath=( "$HOME/.zsh/functions" ${fpath[@]} )
X
X# ----------------------------------------------------------------------------
X# Advanced Tab-completion
X# ----------------------------------------------------------------------------
Xautoload -U compinit && compinit
X
X# ----------------------------------------------------------------------------
X# load plugins
X# ----------------------------------------------------------------------------
Xif [ -d "$HOME/.zsh/plugins" ]; then
X    for plugin ($HOME/.zsh/plugins/*.zsh) source $plugin
Xfi
X
X# ----------------------------------------------------------------------------
X# exports
X# ----------------------------------------------------------------------------
Xexport PATH="$HOME/Library/Python/2.7/bin:/opt/local/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/share/bin"
Xexport CLICOLOR=1
Xexport LSCOLORS="Exfxcxdxbxegedabagacad"
X
Xexport EDITOR=vim
Xexport LESSCHARSET=utf-8
Xexport PAGER='less -R'
Xexport GOPATH=~/projects/go
Xexport TERM=xterm-256color
X[ -n "$TMUX" ] && export TERM=screen-256color
X
X# ----------------------------------------------------------------------------
X# shell options
X# ----------------------------------------------------------------------------
Xsetopt RM_STAR_WAIT
Xsetopt complete_aliases
Xsetopt autocd
Xsetopt autopushd
Xsetopt pushdminus
Xsetopt pushdsilent
Xsetopt pushdtohome
Xsetopt pushd_ignore_dups
X
X# ----------------------------------------------------------------------------
X# Command history configuration
X# ----------------------------------------------------------------------------
Xif [ -z "$HISTFILE" ]; then
X    HISTFILE=$HOME/.zsh_history
Xfi
X
XHISTSIZE=100
XSAVEHIST=100
X
X# Show history
Xcase $HIST_STAMPS in
X  "mm/dd/yyyy") alias history='fc -fl 1' ;;
X  "dd.mm.yyyy") alias history='fc -El 1' ;;
X  "yyyy-mm-dd") alias history='fc -il 1' ;;
X  *) alias history='fc -l 1' ;;
Xesac
X
Xsetopt append_history
Xsetopt extended_history
Xsetopt hist_expire_dups_first
Xsetopt hist_ignore_dups # ignore duplication command history list
Xsetopt hist_ignore_space
Xsetopt hist_verify
Xsetopt inc_append_history
Xsetopt share_history # share command history data
X
X# ----------------------------------------------------------------------------
X# zstyle
X# ----------------------------------------------------------------------------
Xzstyle ':completion::complete:*' use-cache 1
Xzstyle ':completion:*' use-ip true
X# Don't prompt for a huge list, page it!
Xzstyle ':completion:*:default' list-prompt '%S%M matches%s'
X# Have the newer files last so I see them first
Xzstyle ':completion:*' file-sort modification reverse
X
X# ----------------------------------------------------------------------------
X# alias
X# ----------------------------------------------------------------------------
Xalias c='clear'
Xalias cp='cp -i'
Xalias dh='dirs -v'
Xalias h='history'
Xalias j='jobs -l'
Xalias l='pwd; ls -al'
Xalias mv='mv -i'
Xalias pro='cd ~/projects'
Xalias pyclean='find . -iname "*.py[co]" -exec rm -f {} +;'
Xalias rm='rm -i'
Xalias zshrc='vim ~/.zshrc' # Quick access to the ~/.zshrc file
X# copy with a progress bar.
X# Rsync options are:
X#  -p - preserve permissions
X#  -o - preserve owner
X#  -g - preserve group
X#  -h - output in human-readable format
X#  --progress - display progress
X#  -b - instead of just overwriting an existing file, save the original
X#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
X#  -e /dev/null - only work on local files
Xalias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
X# git log
Xalias gl="git log --graph --pretty=format:'%C(bold blue)%h%Creset -%C(bold yellow)%d%Creset %s %C(dim green)(%cr) %C(cyan)<%an>%Creset' --abbrev-commit"
X# tmux
Xalias t="tmux -2 attach -d || tmux -2 new"
Xcompdef t=tmux
Xalias tl='tmux list-sessions'
X# alias for directories
Xalias -g ...='../..'
Xalias -g ....='../../..'
Xalias -g .....='../../../..'
Xalias -g ......='../../../../..'
Xalias 1='cd -'
Xalias 2='cd -2'
Xalias 3='cd -3'
Xalias 4='cd -4'
Xalias 5='cd -5'
Xalias 6='cd -6'
Xalias 7='cd -7'
Xalias 8='cd -8'
Xalias 9='cd -9'
Xalias d='dirs -v | head -10'
X
X# ----------------------------------------------------------------------------
X# ssh+tmux
X# ----------------------------------------------------------------------------
Xexport AUTOSSH_POLL=15
Xs() {
X  autossh -M 0 -t $1 "tmux -2 attach -t $USER$2 -d || tmux -2 new -s $USER$2"
X}
Xcompdef s=ssh
X
X# ----------------------------------------------------------------------------
X# csh history
X# ----------------------------------------------------------------------------
Xautoload -U up-line-or-beginning-search
Xautoload -U down-line-or-beginning-search
Xzle -N up-line-or-beginning-search
Xzle -N down-line-or-beginning-search
Xbindkey "^[[A" up-line-or-beginning-search # Up
Xbindkey "^[[B" down-line-or-beginning-search # Down"
X
X# ----------------------------------------------------------------------------
X# use OS time
X# ----------------------------------------------------------------------------
Xdisable -r time
X
X# ----------------------------------------------------------------------------
X# magic-space
X# ----------------------------------------------------------------------------
Xbindkey " " magic-space # do history expansion on space !XX<space>
X
X# ----------------------------------------------------------------------------
X# Edit command using vim - hit ESC and then v or Ctrl-x e
X# ----------------------------------------------------------------------------
Xexport KEYTIMEOUT=1
Xautoload edit-command-line
Xzle -N edit-command-line
Xbindkey '^Xe' edit-command-line
X
X# ----------------------------------------------------------------------------
X# prompt
X# ----------------------------------------------------------------------------
Xautoload -U pure_prompt && pure_prompt
XRPROMPT='%F{8}%*'
END-of-./.zshrc
exit

