# This is a shell archive.  Save it in a file, remove anything before
# this line, and then unpack it by entering "sh file".  Note, it may
# create directories; files and directories will be owned by you and
# have default permissions.
#
# This archive contains:
#
#	.
#	./.cshrc
#	./.tmux.conf
#	./.vim
#	./.vim/after
#	./.vim/after/syntax
#	./.vim/after/syntax/php.vim
#	./.vim/after/syntax/python.vim
#	./.vim/autoload
#	./.vim/autoload/plug.vim
#	./.vim/colors
#	./.vim/colors/nbari-colors.vim
#	./.vim/filetype.vim
#	./.vim/syntax
#	./.vim/syntax/haproxy.vim
#	./.vim/syntax/jquery.vim
#	./.vim/syntax/nginx.vim
#	./.vim/syntax/php.vim
#	./.vimrc
#	./.zsh
#	./.zsh/functions
#	./.zsh/functions/async
#	./.zsh/functions/pure_prompt
#	./.zsh/plugins
#	./.zsh/plugins/git-flow-completion.zsh
#	./.zshenv
#	./.zshrc
#
echo c - .
mkdir -p . > /dev/null 2>&1
echo x - ./.cshrc
sed 's/^X//' >./.cshrc << 'END-of-./.cshrc'
X# FreeBSD .cshrc - csh resource script
X
Xalias h  history 25
Xalias j  jobs -l
Xalias ls ls -GF
Xalias l ls -lhaGF
Xalias la ls -aF
Xalias lf ls -FA
Xalias ll ls -lAF
Xalias rm rm -i
Xalias mv mv -i
Xalias cp cp -i
Xalias g  grep --color=auto
Xalias pg 'ps auxwww | grep -v "grep" | grep --color=auto'
Xalias set-ssh-agent 'pkill ssh-agent; eval `ssh-agent -c`; ssh-add ~/.ssh/id_rsa'
Xalias pyclean 'find . -iname "*.py[co]" -exec rm -f {} +;'
Xalias s autossh -M 0 -t \!:1 \"tmux -2 attach -t $USER\!:2 -d \|\| tmux -2 new -s $USER\!:2 \"
X
X# A righteous umask
Xumask 22
X
Xset path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
X
Xset autologout = 300
X
Xsetenv EDITOR  vim
Xsetenv PAGER  less
Xsetenv BLOCKSIZE  K
Xsetenv CLICOLOR
Xsetenv LSCOLORS gxfxcxdxbxegedabagacad
X
Xset COLOR1="%{\e[0;32m%}"
Xset COLOR2="%{\e[0;33m%}"
Xset COLOR3="%{\e[0;36m%}"
Xset COLOR4="%{\e[0;0m%}"
Xset COLOR5="%{\e[0;33m%}"
X
Xif ($?prompt) then
X  # An interactive shell -- set some stuff up
X  if ($uid == 0) then
X    set COLOR3="%{\e[1;31m%}"
X    set user = root
X  endif
X  set prompt="$COLOR2\[$COLOR3%n@%M$COLOR2\:$COLOR1%~$COLOR2\] [%p %d]\n$COLOR5>$COLOR4 "
X  set promptchars = "%#"
X
X  set filec
X  set history = 1000
X  set savehist = (1000 merge)
X  set autolist = ambiguous
X  # Use history to aid expansion
X  set autoexpand
X  set autorehash
X  set mail = (/var/mail/$USER)
X  if ( $?tcsh ) then
X    bindkey "^W" backward-delete-word
X    bindkey -k up history-search-backward
X    bindkey -k down history-search-forward
X  endif
X
Xendif
END-of-./.cshrc
echo x - ./.tmux.conf
sed 's/^X//' >./.tmux.conf << 'END-of-./.tmux.conf'
X# utf8
X# set-window-option -g utf8 on
X
X# zsh
Xset-option -g default-shell /usr/local/bin/zsh
Xset-option -g default-command "reattach-to-user-namespace -l /usr/local/bin/zsh"
X
X# vi bindings
Xset-option -g status-key vi
Xset-window-option -g mode-keys vi
X
X# Set the maximum number of lines held in window history.
Xset -g history-limit 1000000
X# set-option -g status-utf8 on
Xset-option -g status-bg "#000000"
Xset-option -g status-fg "#FDB813"
Xset-option -g status-interval 5
Xset-option -g status-right-length 90
Xset-option -g status-right '[ #H ]#[fg=colour012]#(uptime | grep -o "...user.*")#[fg=colour007]  %H:%M:%S'
Xset-option -g status-position top
X
Xset -g window-status-format '#I #W'
Xset -g window-status-current-format ' #I #W '
Xsetw -g window-status-current-bg '#006994'
Xsetw -g window-status-current-fg '#FFFFFF'
Xsetw -g window-status-bg '#000000'
Xsetw -g window-status-fg '#d3d3d3'
X
X# window title string (uses statusbar variables)
Xset -g set-titles on
Xset -g set-titles-string "#T"
X
X# keybindings to make resizing easier with HJKL
Xbind -r h resize-pane -L
Xbind -r j resize-pane -D
Xbind -r k resize-pane -U
Xbind -r l resize-pane -R
Xbind -r H resize-pane -L 10
Xbind -r J resize-pane -D 10
Xbind -r K resize-pane -U 10
Xbind -r L resize-pane -R 10
X
X# Smart pane switching with awareness of vim splits
X# bind -n C-h if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-h" "select-pane -L"
X# bind -n C-j if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-j" "select-pane -D"
X# bind -n C-k if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-k" "select-pane -U"
X# bind -n C-l if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-l" "select-pane -R"
X
Xnot_tmux='`echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?x?)(diff)?$"` || `echo "#{pane_start_command}" | grep -iqE "fzf"` || `echo "#{pane_current_command}" | grep -iqE "fzf"`'
Xbind-key -n C-h if-shell "$not_tmux" "send-keys C-h" "select-pane -L"
Xbind-key -n C-j if-shell "$not_tmux" "send-keys C-j" "select-pane -D"
Xbind-key -n C-k if-shell "$not_tmux" "send-keys C-k" "select-pane -U"
Xbind-key -n C-l if-shell "$not_tmux" "send-keys C-l" "select-pane -R"
Xbind-key -n C-\ if-shell "$not_tmux" "send-keys C-\\" "select-pane -l"
X
X# easily toggle synchronization (mnemonic: e is for echo)
Xbind e setw synchronize-panes on
Xbind E setw synchronize-panes off
X
X# open in current_path
Xbind c new-window -c '#{pane_current_path}'
Xbind % split-window -h -c "#{pane_current_path}"
Xbind '"' split-window -c "#{pane_current_path}"
X
X# reset & clear history
Xbind r send-keys C-l \; clear-history \;
X
X# line & clock color
Xsetw -g clock-mode-colour colour024
Xset -g pane-border-style fg=colour235
Xset -g pane-active-border-style fg=colour124
END-of-./.tmux.conf
echo c - ./.vim
mkdir -p ./.vim > /dev/null 2>&1
echo c - ./.vim/after
mkdir -p ./.vim/after > /dev/null 2>&1
echo c - ./.vim/after/syntax
mkdir -p ./.vim/after/syntax > /dev/null 2>&1
echo x - ./.vim/after/syntax/php.vim
sed 's/^X//' >./.vim/after/syntax/php.vim << 'END-of-./.vim/after/syntax/php.vim'
X" syn match phpParent #;$#
END-of-./.vim/after/syntax/php.vim
echo x - ./.vim/after/syntax/python.vim
sed 's/^X//' >./.vim/after/syntax/python.vim << 'END-of-./.vim/after/syntax/python.vim'
Xsyn region Comment start=/"""/ end=/"""/
Xsyn region Comment start=/'''/ end=/'''/
END-of-./.vim/after/syntax/python.vim
echo c - ./.vim/autoload
mkdir -p ./.vim/autoload > /dev/null 2>&1
echo x - ./.vim/autoload/plug.vim
sed 's/^X//' >./.vim/autoload/plug.vim << 'END-of-./.vim/autoload/plug.vim'
X" vim-plug: Vim plugin manager
X" ============================
X"
X" Download plug.vim and put it in ~/.vim/autoload
X"
X"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
X"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
X"
X" Edit your .vimrc
X"
X"   call plug#begin('~/.vim/plugged')
X"
X"   " Make sure you use single quotes
X"
X"   " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
X"   Plug 'junegunn/vim-easy-align'
X"
X"   " Any valid git URL is allowed
X"   Plug 'https://github.com/junegunn/vim-github-dashboard.git'
X"
X"   " Multiple Plug commands can be written in a single line using | separators
X"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
X"
X"   " On-demand loading
X"   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
X"   Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
X"
X"   " Using a non-master branch
X"   Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
X"
X"   " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
X"   Plug 'fatih/vim-go', { 'tag': '*' }
X"
X"   " Plugin options
X"   Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
X"
X"   " Plugin outside ~/.vim/plugged with post-update hook
X"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
X"
X"   " Unmanaged plugin (manually installed and updated)
X"   Plug '~/my-prototype-plugin'
X"
X"   " Initialize plugin system
X"   call plug#end()
X"
X" Then reload .vimrc and :PlugInstall to install plugins.
X"
X" Plug options:
X"
X"| Option                  | Description                                      |
X"| ----------------------- | ------------------------------------------------ |
X"| `branch`/`tag`/`commit` | Branch/tag/commit of the repository to use       |
X"| `rtp`                   | Subdirectory that contains Vim plugin            |
X"| `dir`                   | Custom directory for the plugin                  |
X"| `as`                    | Use different name for the plugin                |
X"| `do`                    | Post-update hook (string or funcref)             |
X"| `on`                    | On-demand loading: Commands or `<Plug>`-mappings |
X"| `for`                   | On-demand loading: File types                    |
X"| `frozen`                | Do not update unless explicitly specified        |
X"
X" More information: https://github.com/junegunn/vim-plug
X"
X"
X" Copyright (c) 2017 Junegunn Choi
X"
X" MIT License
X"
X" Permission is hereby granted, free of charge, to any person obtaining
X" a copy of this software and associated documentation files (the
X" "Software"), to deal in the Software without restriction, including
X" without limitation the rights to use, copy, modify, merge, publish,
X" distribute, sublicense, and/or sell copies of the Software, and to
X" permit persons to whom the Software is furnished to do so, subject to
X" the following conditions:
X"
X" The above copyright notice and this permission notice shall be
X" included in all copies or substantial portions of the Software.
X"
X" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
X" EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
X" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
X" NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
X" LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
X" OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
X" WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
X
Xif exists('g:loaded_plug')
X  finish
Xendif
Xlet g:loaded_plug = 1
X
Xlet s:cpo_save = &cpo
Xset cpo&vim
X
Xlet s:plug_src = 'https://github.com/junegunn/vim-plug.git'
Xlet s:plug_tab = get(s:, 'plug_tab', -1)
Xlet s:plug_buf = get(s:, 'plug_buf', -1)
Xlet s:mac_gui = has('gui_macvim') && has('gui_running')
Xlet s:is_win = has('win32') || has('win64')
Xlet s:nvim = has('nvim') && exists('*jobwait') && !s:is_win
Xlet s:vim8 = has('patch-8.0.0039') && exists('*job_start')
Xlet s:me = resolve(expand('<sfile>:p'))
Xlet s:base_spec = { 'branch': 'master', 'frozen': 0 }
Xlet s:TYPE = {
X\   'string':  type(''),
X\   'list':    type([]),
X\   'dict':    type({}),
X\   'funcref': type(function('call'))
X\ }
Xlet s:loaded = get(s:, 'loaded', {})
Xlet s:triggers = get(s:, 'triggers', {})
X
Xfunction! plug#begin(...)
X  if a:0 > 0
X    let s:plug_home_org = a:1
X    let home = s:path(fnamemodify(expand(a:1), ':p'))
X  elseif exists('g:plug_home')
X    let home = s:path(g:plug_home)
X  elseif !empty(&rtp)
X    let home = s:path(split(&rtp, ',')[0]) . '/plugged'
X  else
X    return s:err('Unable to determine plug home. Try calling plug#begin() with a path argument.')
X  endif
X
X  let g:plug_home = home
X  let g:plugs = {}
X  let g:plugs_order = []
X  let s:triggers = {}
X
X  call s:define_commands()
X  return 1
Xendfunction
X
Xfunction! s:define_commands()
X  command! -nargs=+ -bar Plug call plug#(<args>)
X  if !executable('git')
X    return s:err('`git` executable not found. Most commands will not be available. To suppress this message, prepend `silent!` to `call plug#begin(...)`.')
X  endif
X  command! -nargs=* -bar -bang -complete=customlist,s:names PlugInstall call s:install(<bang>0, [<f-args>])
X  command! -nargs=* -bar -bang -complete=customlist,s:names PlugUpdate  call s:update(<bang>0, [<f-args>])
X  command! -nargs=0 -bar -bang PlugClean call s:clean(<bang>0)
X  command! -nargs=0 -bar PlugUpgrade if s:upgrade() | execute 'source' s:esc(s:me) | endif
X  command! -nargs=0 -bar PlugStatus  call s:status()
X  command! -nargs=0 -bar PlugDiff    call s:diff()
X  command! -nargs=? -bar -bang -complete=file PlugSnapshot call s:snapshot(<bang>0, <f-args>)
Xendfunction
X
Xfunction! s:to_a(v)
X  return type(a:v) == s:TYPE.list ? a:v : [a:v]
Xendfunction
X
Xfunction! s:to_s(v)
X  return type(a:v) == s:TYPE.string ? a:v : join(a:v, "\n") . "\n"
Xendfunction
X
Xfunction! s:glob(from, pattern)
X  return s:lines(globpath(a:from, a:pattern))
Xendfunction
X
Xfunction! s:source(from, ...)
X  let found = 0
X  for pattern in a:000
X    for vim in s:glob(a:from, pattern)
X      execute 'source' s:esc(vim)
X      let found = 1
X    endfor
X  endfor
X  return found
Xendfunction
X
Xfunction! s:assoc(dict, key, val)
X  let a:dict[a:key] = add(get(a:dict, a:key, []), a:val)
Xendfunction
X
Xfunction! s:ask(message, ...)
X  call inputsave()
X  echohl WarningMsg
X  let answer = input(a:message.(a:0 ? ' (y/N/a) ' : ' (y/N) '))
X  echohl None
X  call inputrestore()
X  echo "\r"
X  return (a:0 && answer =~? '^a') ? 2 : (answer =~? '^y') ? 1 : 0
Xendfunction
X
Xfunction! s:ask_no_interrupt(...)
X  try
X    return call('s:ask', a:000)
X  catch
X    return 0
X  endtry
Xendfunction
X
Xfunction! plug#end()
X  if !exists('g:plugs')
X    return s:err('Call plug#begin() first')
X  endif
X
X  if exists('#PlugLOD')
X    augroup PlugLOD
X      autocmd!
X    augroup END
X    augroup! PlugLOD
X  endif
X  let lod = { 'ft': {}, 'map': {}, 'cmd': {} }
X
X  if exists('g:did_load_filetypes')
X    filetype off
X  endif
X  for name in g:plugs_order
X    if !has_key(g:plugs, name)
X      continue
X    endif
X    let plug = g:plugs[name]
X    if get(s:loaded, name, 0) || !has_key(plug, 'on') && !has_key(plug, 'for')
X      let s:loaded[name] = 1
X      continue
X    endif
X
X    if has_key(plug, 'on')
X      let s:triggers[name] = { 'map': [], 'cmd': [] }
X      for cmd in s:to_a(plug.on)
X        if cmd =~? '^<Plug>.\+'
X          if empty(mapcheck(cmd)) && empty(mapcheck(cmd, 'i'))
X            call s:assoc(lod.map, cmd, name)
X          endif
X          call add(s:triggers[name].map, cmd)
X        elseif cmd =~# '^[A-Z]'
X          let cmd = substitute(cmd, '!*$', '', '')
X          if exists(':'.cmd) != 2
X            call s:assoc(lod.cmd, cmd, name)
X          endif
X          call add(s:triggers[name].cmd, cmd)
X        else
X          call s:err('Invalid `on` option: '.cmd.
X          \ '. Should start with an uppercase letter or `<Plug>`.')
X        endif
X      endfor
X    endif
X
X    if has_key(plug, 'for')
X      let types = s:to_a(plug.for)
X      if !empty(types)
X        augroup filetypedetect
X        call s:source(s:rtp(plug), 'ftdetect/**/*.vim', 'after/ftdetect/**/*.vim')
X        augroup END
X      endif
X      for type in types
X        call s:assoc(lod.ft, type, name)
X      endfor
X    endif
X  endfor
X
X  for [cmd, names] in items(lod.cmd)
X    execute printf(
X    \ 'command! -nargs=* -range -bang -complete=file %s call s:lod_cmd(%s, "<bang>", <line1>, <line2>, <q-args>, %s)',
X    \ cmd, string(cmd), string(names))
X  endfor
X
X  for [map, names] in items(lod.map)
X    for [mode, map_prefix, key_prefix] in
X          \ [['i', '<C-O>', ''], ['n', '', ''], ['v', '', 'gv'], ['o', '', '']]
X      execute printf(
X      \ '%snoremap <silent> %s %s:<C-U>call <SID>lod_map(%s, %s, %s, "%s")<CR>',
X      \ mode, map, map_prefix, string(map), string(names), mode != 'i', key_prefix)
X    endfor
X  endfor
X
X  for [ft, names] in items(lod.ft)
X    augroup PlugLOD
X      execute printf('autocmd FileType %s call <SID>lod_ft(%s, %s)',
X            \ ft, string(ft), string(names))
X    augroup END
X  endfor
X
X  call s:reorg_rtp()
X  filetype plugin indent on
X  if has('vim_starting')
X    if has('syntax') && !exists('g:syntax_on')
X      syntax enable
X    end
X  else
X    call s:reload_plugins()
X  endif
Xendfunction
X
Xfunction! s:loaded_names()
X  return filter(copy(g:plugs_order), 'get(s:loaded, v:val, 0)')
Xendfunction
X
Xfunction! s:load_plugin(spec)
X  call s:source(s:rtp(a:spec), 'plugin/**/*.vim', 'after/plugin/**/*.vim')
Xendfunction
X
Xfunction! s:reload_plugins()
X  for name in s:loaded_names()
X    call s:load_plugin(g:plugs[name])
X  endfor
Xendfunction
X
Xfunction! s:trim(str)
X  return substitute(a:str, '[\/]\+$', '', '')
Xendfunction
X
Xfunction! s:version_requirement(val, min)
X  for idx in range(0, len(a:min) - 1)
X    let v = get(a:val, idx, 0)
X    if     v < a:min[idx] | return 0
X    elseif v > a:min[idx] | return 1
X    endif
X  endfor
X  return 1
Xendfunction
X
Xfunction! s:git_version_requirement(...)
X  if !exists('s:git_version')
X    let s:git_version = map(split(split(s:system('git --version'))[2], '\.'), 'str2nr(v:val)')
X  endif
X  return s:version_requirement(s:git_version, a:000)
Xendfunction
X
Xfunction! s:progress_opt(base)
X  return a:base && !s:is_win &&
X        \ s:git_version_requirement(1, 7, 1) ? '--progress' : ''
Xendfunction
X
Xif s:is_win
X  function! s:rtp(spec)
X    return s:path(a:spec.dir . get(a:spec, 'rtp', ''))
X  endfunction
X
X  function! s:path(path)
X    return s:trim(substitute(a:path, '/', '\', 'g'))
X  endfunction
X
X  function! s:dirpath(path)
X    return s:path(a:path) . '\'
X  endfunction
X
X  function! s:is_local_plug(repo)
X    return a:repo =~? '^[a-z]:\|^[%~]'
X  endfunction
Xelse
X  function! s:rtp(spec)
X    return s:dirpath(a:spec.dir . get(a:spec, 'rtp', ''))
X  endfunction
X
X  function! s:path(path)
X    return s:trim(a:path)
X  endfunction
X
X  function! s:dirpath(path)
X    return substitute(a:path, '[/\\]*$', '/', '')
X  endfunction
X
X  function! s:is_local_plug(repo)
X    return a:repo[0] =~ '[/$~]'
X  endfunction
Xendif
X
Xfunction! s:err(msg)
X  echohl ErrorMsg
X  echom '[vim-plug] '.a:msg
X  echohl None
Xendfunction
X
Xfunction! s:warn(cmd, msg)
X  echohl WarningMsg
X  execute a:cmd 'a:msg'
X  echohl None
Xendfunction
X
Xfunction! s:esc(path)
X  return escape(a:path, ' ')
Xendfunction
X
Xfunction! s:escrtp(path)
X  return escape(a:path, ' ,')
Xendfunction
X
Xfunction! s:remove_rtp()
X  for name in s:loaded_names()
X    let rtp = s:rtp(g:plugs[name])
X    execute 'set rtp-='.s:escrtp(rtp)
X    let after = globpath(rtp, 'after')
X    if isdirectory(after)
X      execute 'set rtp-='.s:escrtp(after)
X    endif
X  endfor
Xendfunction
X
Xfunction! s:reorg_rtp()
X  if !empty(s:first_rtp)
X    execute 'set rtp-='.s:first_rtp
X    execute 'set rtp-='.s:last_rtp
X  endif
X
X  " &rtp is modified from outside
X  if exists('s:prtp') && s:prtp !=# &rtp
X    call s:remove_rtp()
X    unlet! s:middle
X  endif
X
X  let s:middle = get(s:, 'middle', &rtp)
X  let rtps     = map(s:loaded_names(), 's:rtp(g:plugs[v:val])')
X  let afters   = filter(map(copy(rtps), 'globpath(v:val, "after")'), '!empty(v:val)')
X  let rtp      = join(map(rtps, 'escape(v:val, ",")'), ',')
X                 \ . ','.s:middle.','
X                 \ . join(map(afters, 'escape(v:val, ",")'), ',')
X  let &rtp     = substitute(substitute(rtp, ',,*', ',', 'g'), '^,\|,$', '', 'g')
X  let s:prtp   = &rtp
X
X  if !empty(s:first_rtp)
X    execute 'set rtp^='.s:first_rtp
X    execute 'set rtp+='.s:last_rtp
X  endif
Xendfunction
X
Xfunction! s:doautocmd(...)
X  if exists('#'.join(a:000, '#'))
X    execute 'doautocmd' ((v:version > 703 || has('patch442')) ? '<nomodeline>' : '') join(a:000)
X  endif
Xendfunction
X
Xfunction! s:dobufread(names)
X  for name in a:names
X    let path = s:rtp(g:plugs[name]).'/**'
X    for dir in ['ftdetect', 'ftplugin']
X      if len(finddir(dir, path))
X        if exists('#BufRead')
X          doautocmd BufRead
X        endif
X        return
X      endif
X    endfor
X  endfor
Xendfunction
X
Xfunction! plug#load(...)
X  if a:0 == 0
X    return s:err('Argument missing: plugin name(s) required')
X  endif
X  if !exists('g:plugs')
X    return s:err('plug#begin was not called')
X  endif
X  let unknowns = filter(copy(a:000), '!has_key(g:plugs, v:val)')
X  if !empty(unknowns)
X    let s = len(unknowns) > 1 ? 's' : ''
X    return s:err(printf('Unknown plugin%s: %s', s, join(unknowns, ', ')))
X  end
X  for name in a:000
X    call s:lod([name], ['ftdetect', 'after/ftdetect', 'plugin', 'after/plugin'])
X  endfor
X  call s:dobufread(a:000)
X  return 1
Xendfunction
X
Xfunction! s:remove_triggers(name)
X  if !has_key(s:triggers, a:name)
X    return
X  endif
X  for cmd in s:triggers[a:name].cmd
X    execute 'silent! delc' cmd
X  endfor
X  for map in s:triggers[a:name].map
X    execute 'silent! unmap' map
X    execute 'silent! iunmap' map
X  endfor
X  call remove(s:triggers, a:name)
Xendfunction
X
Xfunction! s:lod(names, types, ...)
X  for name in a:names
X    call s:remove_triggers(name)
X    let s:loaded[name] = 1
X  endfor
X  call s:reorg_rtp()
X
X  for name in a:names
X    let rtp = s:rtp(g:plugs[name])
X    for dir in a:types
X      call s:source(rtp, dir.'/**/*.vim')
X    endfor
X    if a:0
X      if !s:source(rtp, a:1) && !empty(s:glob(rtp, a:2))
X        execute 'runtime' a:1
X      endif
X      call s:source(rtp, a:2)
X    endif
X    call s:doautocmd('User', name)
X  endfor
Xendfunction
X
Xfunction! s:lod_ft(pat, names)
X  let syn = 'syntax/'.a:pat.'.vim'
X  call s:lod(a:names, ['plugin', 'after/plugin'], syn, 'after/'.syn)
X  execute 'autocmd! PlugLOD FileType' a:pat
X  call s:doautocmd('filetypeplugin', 'FileType')
X  call s:doautocmd('filetypeindent', 'FileType')
Xendfunction
X
Xfunction! s:lod_cmd(cmd, bang, l1, l2, args, names)
X  call s:lod(a:names, ['ftdetect', 'after/ftdetect', 'plugin', 'after/plugin'])
X  call s:dobufread(a:names)
X  execute printf('%s%s%s %s', (a:l1 == a:l2 ? '' : (a:l1.','.a:l2)), a:cmd, a:bang, a:args)
Xendfunction
X
Xfunction! s:lod_map(map, names, with_prefix, prefix)
X  call s:lod(a:names, ['ftdetect', 'after/ftdetect', 'plugin', 'after/plugin'])
X  call s:dobufread(a:names)
X  let extra = ''
X  while 1
X    let c = getchar(0)
X    if c == 0
X      break
X    endif
X    let extra .= nr2char(c)
X  endwhile
X
X  if a:with_prefix
X    let prefix = v:count ? v:count : ''
X    let prefix .= '"'.v:register.a:prefix
X    if mode(1) == 'no'
X      if v:operator == 'c'
X        let prefix = "\<esc>" . prefix
X      endif
X      let prefix .= v:operator
X    endif
X    call feedkeys(prefix, 'n')
X  endif
X  call feedkeys(substitute(a:map, '^<Plug>', "\<Plug>", '') . extra)
Xendfunction
X
Xfunction! plug#(repo, ...)
X  if a:0 > 1
X    return s:err('Invalid number of arguments (1..2)')
X  endif
X
X  try
X    let repo = s:trim(a:repo)
X    let opts = a:0 == 1 ? s:parse_options(a:1) : s:base_spec
X    let name = get(opts, 'as', fnamemodify(repo, ':t:s?\.git$??'))
X    let spec = extend(s:infer_properties(name, repo), opts)
X    if !has_key(g:plugs, name)
X      call add(g:plugs_order, name)
X    endif
X    let g:plugs[name] = spec
X    let s:loaded[name] = get(s:loaded, name, 0)
X  catch
X    return s:err(v:exception)
X  endtry
Xendfunction
X
Xfunction! s:parse_options(arg)
X  let opts = copy(s:base_spec)
X  let type = type(a:arg)
X  if type == s:TYPE.string
X    let opts.tag = a:arg
X  elseif type == s:TYPE.dict
X    call extend(opts, a:arg)
X    if has_key(opts, 'dir')
X      let opts.dir = s:dirpath(expand(opts.dir))
X    endif
X  else
X    throw 'Invalid argument type (expected: string or dictionary)'
X  endif
X  return opts
Xendfunction
X
Xfunction! s:infer_properties(name, repo)
X  let repo = a:repo
X  if s:is_local_plug(repo)
X    return { 'dir': s:dirpath(expand(repo)) }
X  else
X    if repo =~ ':'
X      let uri = repo
X    else
X      if repo !~ '/'
X        let repo = 'vim-scripts/'. repo
X      endif
X      let fmt = get(g:, 'plug_url_format', 'https://git::@github.com/%s.git')
X      let uri = printf(fmt, repo)
X    endif
X    return { 'dir': s:dirpath(g:plug_home.'/'.a:name), 'uri': uri }
X  endif
Xendfunction
X
Xfunction! s:install(force, names)
X  call s:update_impl(0, a:force, a:names)
Xendfunction
X
Xfunction! s:update(force, names)
X  call s:update_impl(1, a:force, a:names)
Xendfunction
X
Xfunction! plug#helptags()
X  if !exists('g:plugs')
X    return s:err('plug#begin was not called')
X  endif
X  for spec in values(g:plugs)
X    let docd = join([spec.dir, 'doc'], '/')
X    if isdirectory(docd)
X      silent! execute 'helptags' s:esc(docd)
X    endif
X  endfor
X  return 1
Xendfunction
X
Xfunction! s:syntax()
X  syntax clear
X  syntax region plug1 start=/\%1l/ end=/\%2l/ contains=plugNumber
X  syntax region plug2 start=/\%2l/ end=/\%3l/ contains=plugBracket,plugX
X  syn match plugNumber /[0-9]\+[0-9.]*/ contained
X  syn match plugBracket /[[\]]/ contained
X  syn match plugX /x/ contained
X  syn match plugDash /^-/
X  syn match plugPlus /^+/
X  syn match plugStar /^*/
X  syn match plugMessage /\(^- \)\@<=.*/
X  syn match plugName /\(^- \)\@<=[^ ]*:/
X  syn match plugSha /\%(: \)\@<=[0-9a-f]\{4,}$/
X  syn match plugTag /(tag: [^)]\+)/
X  syn match plugInstall /\(^+ \)\@<=[^:]*/
X  syn match plugUpdate /\(^* \)\@<=[^:]*/
X  syn match plugCommit /^  \X*[0-9a-f]\{7,9} .*/ contains=plugRelDate,plugEdge,plugTag
X  syn match plugEdge /^  \X\+$/
X  syn match plugEdge /^  \X*/ contained nextgroup=plugSha
X  syn match plugSha /[0-9a-f]\{7,9}/ contained
X  syn match plugRelDate /([^)]*)$/ contained
X  syn match plugNotLoaded /(not loaded)$/
X  syn match plugError /^x.*/
X  syn region plugDeleted start=/^\~ .*/ end=/^\ze\S/
X  syn match plugH2 /^.*:\n-\+$/
X  syn keyword Function PlugInstall PlugStatus PlugUpdate PlugClean
X  hi def link plug1       Title
X  hi def link plug2       Repeat
X  hi def link plugH2      Type
X  hi def link plugX       Exception
X  hi def link plugBracket Structure
X  hi def link plugNumber  Number
X
X  hi def link plugDash    Special
X  hi def link plugPlus    Constant
X  hi def link plugStar    Boolean
X
X  hi def link plugMessage Function
X  hi def link plugName    Label
X  hi def link plugInstall Function
X  hi def link plugUpdate  Type
X
X  hi def link plugError   Error
X  hi def link plugDeleted Ignore
X  hi def link plugRelDate Comment
X  hi def link plugEdge    PreProc
X  hi def link plugSha     Identifier
X  hi def link plugTag     Constant
X
X  hi def link plugNotLoaded Comment
Xendfunction
X
Xfunction! s:lpad(str, len)
X  return a:str . repeat(' ', a:len - len(a:str))
Xendfunction
X
Xfunction! s:lines(msg)
X  return split(a:msg, "[\r\n]")
Xendfunction
X
Xfunction! s:lastline(msg)
X  return get(s:lines(a:msg), -1, '')
Xendfunction
X
Xfunction! s:new_window()
X  execute get(g:, 'plug_window', 'vertical topleft new')
Xendfunction
X
Xfunction! s:plug_window_exists()
X  let buflist = tabpagebuflist(s:plug_tab)
X  return !empty(buflist) && index(buflist, s:plug_buf) >= 0
Xendfunction
X
Xfunction! s:switch_in()
X  if !s:plug_window_exists()
X    return 0
X  endif
X
X  if winbufnr(0) != s:plug_buf
X    let s:pos = [tabpagenr(), winnr(), winsaveview()]
X    execute 'normal!' s:plug_tab.'gt'
X    let winnr = bufwinnr(s:plug_buf)
X    execute winnr.'wincmd w'
X    call add(s:pos, winsaveview())
X  else
X    let s:pos = [winsaveview()]
X  endif
X
X  setlocal modifiable
X  return 1
Xendfunction
X
Xfunction! s:switch_out(...)
X  call winrestview(s:pos[-1])
X  setlocal nomodifiable
X  if a:0 > 0
X    execute a:1
X  endif
X
X  if len(s:pos) > 1
X    execute 'normal!' s:pos[0].'gt'
X    execute s:pos[1] 'wincmd w'
X    call winrestview(s:pos[2])
X  endif
Xendfunction
X
Xfunction! s:finish_bindings()
X  nnoremap <silent> <buffer> R  :call <SID>retry()<cr>
X  nnoremap <silent> <buffer> D  :PlugDiff<cr>
X  nnoremap <silent> <buffer> S  :PlugStatus<cr>
X  nnoremap <silent> <buffer> U  :call <SID>status_update()<cr>
X  xnoremap <silent> <buffer> U  :call <SID>status_update()<cr>
X  nnoremap <silent> <buffer> ]] :silent! call <SID>section('')<cr>
X  nnoremap <silent> <buffer> [[ :silent! call <SID>section('b')<cr>
Xendfunction
X
Xfunction! s:prepare(...)
X  if empty(getcwd())
X    throw 'Invalid current working directory. Cannot proceed.'
X  endif
X
X  for evar in ['$GIT_DIR', '$GIT_WORK_TREE']
X    if exists(evar)
X      throw evar.' detected. Cannot proceed.'
X    endif
X  endfor
X
X  call s:job_abort()
X  if s:switch_in()
X    if b:plug_preview == 1
X      pc
X    endif
X    enew
X  else
X    call s:new_window()
X  endif
X
X  nnoremap <silent> <buffer> q  :if b:plug_preview==1<bar>pc<bar>endif<bar>bd<cr>
X  if a:0 == 0
X    call s:finish_bindings()
X  endif
X  let b:plug_preview = -1
X  let s:plug_tab = tabpagenr()
X  let s:plug_buf = winbufnr(0)
X  call s:assign_name()
X
X  for k in ['<cr>', 'L', 'o', 'X', 'd', 'dd']
X    execute 'silent! unmap <buffer>' k
X  endfor
X  setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline modifiable nospell
X  setf vim-plug
X  if exists('g:syntax_on')
X    call s:syntax()
X  endif
Xendfunction
X
Xfunction! s:assign_name()
X  " Assign buffer name
X  let prefix = '[Plugins]'
X  let name   = prefix
X  let idx    = 2
X  while bufexists(name)
X    let name = printf('%s (%s)', prefix, idx)
X    let idx = idx + 1
X  endwhile
X  silent! execute 'f' fnameescape(name)
Xendfunction
X
Xfunction! s:chsh(swap)
X  let prev = [&shell, &shellredir]
X  if !s:is_win && a:swap
X    set shell=sh shellredir=>%s\ 2>&1
X  endif
X  return prev
Xendfunction
X
Xfunction! s:bang(cmd, ...)
X  try
X    let [sh, shrd] = s:chsh(a:0)
X    " FIXME: Escaping is incomplete. We could use shellescape with eval,
X    "        but it won't work on Windows.
X    let cmd = a:0 ? s:with_cd(a:cmd, a:1) : a:cmd
X    let g:_plug_bang = '!'.escape(cmd, '#!%')
X    execute "normal! :execute g:_plug_bang\<cr>\<cr>"
X  finally
X    unlet g:_plug_bang
X    let [&shell, &shellredir] = [sh, shrd]
X  endtry
X  return v:shell_error ? 'Exit status: ' . v:shell_error : ''
Xendfunction
X
Xfunction! s:regress_bar()
X  let bar = substitute(getline(2)[1:-2], '.*\zs=', 'x', '')
X  call s:progress_bar(2, bar, len(bar))
Xendfunction
X
Xfunction! s:is_updated(dir)
X  return !empty(s:system_chomp('git log --pretty=format:"%h" "HEAD...HEAD@{1}"', a:dir))
Xendfunction
X
Xfunction! s:do(pull, force, todo)
X  for [name, spec] in items(a:todo)
X    if !isdirectory(spec.dir)
X      continue
X    endif
X    let installed = has_key(s:update.new, name)
X    let updated = installed ? 0 :
X      \ (a:pull && index(s:update.errors, name) < 0 && s:is_updated(spec.dir))
X    if a:force || installed || updated
X      execute 'cd' s:esc(spec.dir)
X      call append(3, '- Post-update hook for '. name .' ... ')
X      let error = ''
X      let type = type(spec.do)
X      if type == s:TYPE.string
X        if spec.do[0] == ':'
X          if !get(s:loaded, name, 0)
X            let s:loaded[name] = 1
X            call s:reorg_rtp()
X          endif
X          call s:load_plugin(spec)
X          try
X            execute spec.do[1:]
X          catch
X            let error = v:exception
X          endtry
X          if !s:plug_window_exists()
X            cd -
X            throw 'Warning: vim-plug was terminated by the post-update hook of '.name
X          endif
X        else
X          let error = s:bang(spec.do)
X        endif
X      elseif type == s:TYPE.funcref
X        try
X          let status = installed ? 'installed' : (updated ? 'updated' : 'unchanged')
X          call spec.do({ 'name': name, 'status': status, 'force': a:force })
X        catch
X          let error = v:exception
X        endtry
X      else
X        let error = 'Invalid hook type'
X      endif
X      call s:switch_in()
X      call setline(4, empty(error) ? (getline(4) . 'OK')
X                                 \ : ('x' . getline(4)[1:] . error))
X      if !empty(error)
X        call add(s:update.errors, name)
X        call s:regress_bar()
X      endif
X      cd -
X    endif
X  endfor
Xendfunction
X
Xfunction! s:hash_match(a, b)
X  return stridx(a:a, a:b) == 0 || stridx(a:b, a:a) == 0
Xendfunction
X
Xfunction! s:checkout(spec)
X  let sha = a:spec.commit
X  let output = s:system('git rev-parse HEAD', a:spec.dir)
X  if !v:shell_error && !s:hash_match(sha, s:lines(output)[0])
X    let output = s:system(
X          \ 'git fetch --depth 999999 && git checkout '.s:esc(sha).' --', a:spec.dir)
X  endif
X  return output
Xendfunction
X
Xfunction! s:finish(pull)
X  let new_frozen = len(filter(keys(s:update.new), 'g:plugs[v:val].frozen'))
X  if new_frozen
X    let s = new_frozen > 1 ? 's' : ''
X    call append(3, printf('- Installed %d frozen plugin%s', new_frozen, s))
X  endif
X  call append(3, '- Finishing ... ') | 4
X  redraw
X  call plug#helptags()
X  call plug#end()
X  call setline(4, getline(4) . 'Done!')
X  redraw
X  let msgs = []
X  if !empty(s:update.errors)
X    call add(msgs, "Press 'R' to retry.")
X  endif
X  if a:pull && len(s:update.new) < len(filter(getline(5, '$'),
X                \ "v:val =~ '^- ' && stridx(v:val, 'Already up-to-date') < 0"))
X    call add(msgs, "Press 'D' to see the updated changes.")
X  endif
X  echo join(msgs, ' ')
X  call s:finish_bindings()
Xendfunction
X
Xfunction! s:retry()
X  if empty(s:update.errors)
X    return
X  endif
X  echo
X  call s:update_impl(s:update.pull, s:update.force,
X        \ extend(copy(s:update.errors), [s:update.threads]))
Xendfunction
X
Xfunction! s:is_managed(name)
X  return has_key(g:plugs[a:name], 'uri')
Xendfunction
X
Xfunction! s:names(...)
X  return sort(filter(keys(g:plugs), 'stridx(v:val, a:1) == 0 && s:is_managed(v:val)'))
Xendfunction
X
Xfunction! s:check_ruby()
X  silent! ruby require 'thread'; VIM::command("let g:plug_ruby = '#{RUBY_VERSION}'")
X  if !exists('g:plug_ruby')
X    redraw!
X    return s:warn('echom', 'Warning: Ruby interface is broken')
X  endif
X  let ruby_version = split(g:plug_ruby, '\.')
X  unlet g:plug_ruby
X  return s:version_requirement(ruby_version, [1, 8, 7])
Xendfunction
X
Xfunction! s:update_impl(pull, force, args) abort
X  let sync = index(a:args, '--sync') >= 0 || has('vim_starting')
X  let args = filter(copy(a:args), 'v:val != "--sync"')
X  let threads = (len(args) > 0 && args[-1] =~ '^[1-9][0-9]*$') ?
X                  \ remove(args, -1) : get(g:, 'plug_threads', 16)
X
X  let managed = filter(copy(g:plugs), 's:is_managed(v:key)')
X  let todo = empty(args) ? filter(managed, '!v:val.frozen || !isdirectory(v:val.dir)') :
X                         \ filter(managed, 'index(args, v:key) >= 0')
X
X  if empty(todo)
X    return s:warn('echo', 'No plugin to '. (a:pull ? 'update' : 'install'))
X  endif
X
X  if !s:is_win && s:git_version_requirement(2, 3)
X    let s:git_terminal_prompt = exists('$GIT_TERMINAL_PROMPT') ? $GIT_TERMINAL_PROMPT : ''
X    let $GIT_TERMINAL_PROMPT = 0
X    for plug in values(todo)
X      let plug.uri = substitute(plug.uri,
X            \ '^https://git::@github\.com', 'https://github.com', '')
X    endfor
X  endif
X
X  if !isdirectory(g:plug_home)
X    try
X      call mkdir(g:plug_home, 'p')
X    catch
X      return s:err(printf('Invalid plug directory: %s. '.
X              \ 'Try to call plug#begin with a valid directory', g:plug_home))
X    endtry
X  endif
X
X  if has('nvim') && !exists('*jobwait') && threads > 1
X    call s:warn('echom', '[vim-plug] Update Neovim for parallel installer')
X  endif
X
X  let use_job = s:nvim || s:vim8
X  let python = (has('python') || has('python3')) && !use_job
X  let ruby = has('ruby') && !use_job && (v:version >= 703 || v:version == 702 && has('patch374')) && !(s:is_win && has('gui_running')) && threads > 1 && s:check_ruby()
X
X  let s:update = {
X    \ 'start':   reltime(),
X    \ 'all':     todo,
X    \ 'todo':    copy(todo),
X    \ 'errors':  [],
X    \ 'pull':    a:pull,
X    \ 'force':   a:force,
X    \ 'new':     {},
X    \ 'threads': (python || ruby || use_job) ? min([len(todo), threads]) : 1,
X    \ 'bar':     '',
X    \ 'fin':     0
X  \ }
X
X  call s:prepare(1)
X  call append(0, ['', ''])
X  normal! 2G
X  silent! redraw
X
X  let s:clone_opt = get(g:, 'plug_shallow', 1) ?
X        \ '--depth 1' . (s:git_version_requirement(1, 7, 10) ? ' --no-single-branch' : '') : ''
X
X  " Python version requirement (>= 2.7)
X  if python && !has('python3') && !ruby && !use_job && s:update.threads > 1
X    redir => pyv
X    silent python import platform; print platform.python_version()
X    redir END
X    let python = s:version_requirement(
X          \ map(split(split(pyv)[0], '\.'), 'str2nr(v:val)'), [2, 6])
X  endif
X
X  if (python || ruby) && s:update.threads > 1
X    try
X      let imd = &imd
X      if s:mac_gui
X        set noimd
X      endif
X      if ruby
X        call s:update_ruby()
X      else
X        call s:update_python()
X      endif
X    catch
X      let lines = getline(4, '$')
X      let printed = {}
X      silent! 4,$d _
X      for line in lines
X        let name = s:extract_name(line, '.', '')
X        if empty(name) || !has_key(printed, name)
X          call append('$', line)
X          if !empty(name)
X            let printed[name] = 1
X            if line[0] == 'x' && index(s:update.errors, name) < 0
X              call add(s:update.errors, name)
X            end
X          endif
X        endif
X      endfor
X    finally
X      let &imd = imd
X      call s:update_finish()
X    endtry
X  else
X    call s:update_vim()
X    while use_job && sync
X      sleep 100m
X      if s:update.fin
X        break
X      endif
X    endwhile
X  endif
Xendfunction
X
Xfunction! s:log4(name, msg)
X  call setline(4, printf('- %s (%s)', a:msg, a:name))
X  redraw
Xendfunction
X
Xfunction! s:update_finish()
X  if exists('s:git_terminal_prompt')
X    let $GIT_TERMINAL_PROMPT = s:git_terminal_prompt
X  endif
X  if s:switch_in()
X    call append(3, '- Updating ...') | 4
X    for [name, spec] in items(filter(copy(s:update.all), 'index(s:update.errors, v:key) < 0 && (s:update.force || s:update.pull || has_key(s:update.new, v:key))'))
X      let [pos, _] = s:logpos(name)
X      if !pos
X        continue
X      endif
X      if has_key(spec, 'commit')
X        call s:log4(name, 'Checking out '.spec.commit)
X        let out = s:checkout(spec)
X      elseif has_key(spec, 'tag')
X        let tag = spec.tag
X        if tag =~ '\*'
X          let tags = s:lines(s:system('git tag --list '.string(tag).' --sort -version:refname 2>&1', spec.dir))
X          if !v:shell_error && !empty(tags)
X            let tag = tags[0]
X            call s:log4(name, printf('Latest tag for %s -> %s', spec.tag, tag))
X            call append(3, '')
X          endif
X        endif
X        call s:log4(name, 'Checking out '.tag)
X        let out = s:system('git checkout -q '.s:esc(tag).' -- 2>&1', spec.dir)
X      else
X        let branch = s:esc(get(spec, 'branch', 'master'))
X        call s:log4(name, 'Merging origin/'.branch)
X        let out = s:system('git checkout -q '.branch.' -- 2>&1'
X              \. (has_key(s:update.new, name) ? '' : ('&& git merge --ff-only origin/'.branch.' 2>&1')), spec.dir)
X      endif
X      if !v:shell_error && filereadable(spec.dir.'/.gitmodules') &&
X            \ (s:update.force || has_key(s:update.new, name) || s:is_updated(spec.dir))
X        call s:log4(name, 'Updating submodules. This may take a while.')
X        let out .= s:bang('git submodule update --init --recursive 2>&1', spec.dir)
X      endif
X      let msg = s:format_message(v:shell_error ? 'x': '-', name, out)
X      if v:shell_error
X        call add(s:update.errors, name)
X        call s:regress_bar()
X        silent execute pos 'd _'
X        call append(4, msg) | 4
X      elseif !empty(out)
X        call setline(pos, msg[0])
X      endif
X      redraw
X    endfor
X    silent 4 d _
X    try
X      call s:do(s:update.pull, s:update.force, filter(copy(s:update.all), 'index(s:update.errors, v:key) < 0 && has_key(v:val, "do")'))
X    catch
X      call s:warn('echom', v:exception)
X      call s:warn('echo', '')
X      return
X    endtry
X    call s:finish(s:update.pull)
X    call setline(1, 'Updated. Elapsed time: ' . split(reltimestr(reltime(s:update.start)))[0] . ' sec.')
X    call s:switch_out('normal! gg')
X  endif
Xendfunction
X
Xfunction! s:job_abort()
X  if (!s:nvim && !s:vim8) || !exists('s:jobs')
X    return
X  endif
X
X  for [name, j] in items(s:jobs)
X    if s:nvim
X      silent! call jobstop(j.jobid)
X    elseif s:vim8
X      silent! call job_stop(j.jobid)
X    endif
X    if j.new
X      call s:system('rm -rf ' . s:shellesc(g:plugs[name].dir))
X    endif
X  endfor
X  let s:jobs = {}
Xendfunction
X
Xfunction! s:last_non_empty_line(lines)
X  let len = len(a:lines)
X  for idx in range(len)
X    let line = a:lines[len-idx-1]
X    if !empty(line)
X      return line
X    endif
X  endfor
X  return ''
Xendfunction
X
Xfunction! s:job_out_cb(self, data) abort
X  let self = a:self
X  let data = remove(self.lines, -1) . a:data
X  let lines = map(split(data, "\n", 1), 'split(v:val, "\r", 1)[-1]')
X  call extend(self.lines, lines)
X  " To reduce the number of buffer updates
X  let self.tick = get(self, 'tick', -1) + 1
X  if !self.running || self.tick % len(s:jobs) == 0
X    let bullet = self.running ? (self.new ? '+' : '*') : (self.error ? 'x' : '-')
X    let result = self.error ? join(self.lines, "\n") : s:last_non_empty_line(self.lines)
X    call s:log(bullet, self.name, result)
X  endif
Xendfunction
X
Xfunction! s:job_exit_cb(self, data) abort
X  let a:self.running = 0
X  let a:self.error = a:data != 0
X  call s:reap(a:self.name)
X  call s:tick()
Xendfunction
X
Xfunction! s:job_cb(fn, job, ch, data)
X  if !s:plug_window_exists() " plug window closed
X    return s:job_abort()
X  endif
X  call call(a:fn, [a:job, a:data])
Xendfunction
X
Xfunction! s:nvim_cb(job_id, data, event) dict abort
X  return a:event == 'stdout' ?
X    \ s:job_cb('s:job_out_cb',  self, 0, join(a:data, "\n")) :
X    \ s:job_cb('s:job_exit_cb', self, 0, a:data)
Xendfunction
X
Xfunction! s:spawn(name, cmd, opts)
X  let job = { 'name': a:name, 'running': 1, 'error': 0, 'lines': [''],
X            \ 'new': get(a:opts, 'new', 0) }
X  let s:jobs[a:name] = job
X  let argv = add(s:is_win ? ['cmd', '/c'] : ['sh', '-c'],
X               \ has_key(a:opts, 'dir') ? s:with_cd(a:cmd, a:opts.dir) : a:cmd)
X
X  if s:nvim
X    call extend(job, {
X    \ 'on_stdout': function('s:nvim_cb'),
X    \ 'on_exit':   function('s:nvim_cb'),
X    \ })
X    let jid = jobstart(argv, job)
X    if jid > 0
X      let job.jobid = jid
X    else
X      let job.running = 0
X      let job.error   = 1
X      let job.lines   = [jid < 0 ? argv[0].' is not executable' :
X            \ 'Invalid arguments (or job table is full)']
X    endif
X  elseif s:vim8
X    let jid = job_start(s:is_win ? join(argv, ' ') : argv, {
X    \ 'out_cb':   function('s:job_cb', ['s:job_out_cb',  job]),
X    \ 'exit_cb':  function('s:job_cb', ['s:job_exit_cb', job]),
X    \ 'out_mode': 'raw'
X    \})
X    if job_status(jid) == 'run'
X      let job.jobid = jid
X    else
X      let job.running = 0
X      let job.error   = 1
X      let job.lines   = ['Failed to start job']
X    endif
X  else
X    let params = has_key(a:opts, 'dir') ? [a:cmd, a:opts.dir] : [a:cmd]
X    let job.lines = s:lines(call('s:system', params))
X    let job.error = v:shell_error != 0
X    let job.running = 0
X  endif
Xendfunction
X
Xfunction! s:reap(name)
X  let job = s:jobs[a:name]
X  if job.error
X    call add(s:update.errors, a:name)
X  elseif get(job, 'new', 0)
X    let s:update.new[a:name] = 1
X  endif
X  let s:update.bar .= job.error ? 'x' : '='
X
X  let bullet = job.error ? 'x' : '-'
X  let result = job.error ? join(job.lines, "\n") : s:last_non_empty_line(job.lines)
X  call s:log(bullet, a:name, empty(result) ? 'OK' : result)
X  call s:bar()
X
X  call remove(s:jobs, a:name)
Xendfunction
X
Xfunction! s:bar()
X  if s:switch_in()
X    let total = len(s:update.all)
X    call setline(1, (s:update.pull ? 'Updating' : 'Installing').
X          \ ' plugins ('.len(s:update.bar).'/'.total.')')
X    call s:progress_bar(2, s:update.bar, total)
X    call s:switch_out()
X  endif
Xendfunction
X
Xfunction! s:logpos(name)
X  for i in range(4, line('$'))
X    if getline(i) =~# '^[-+x*] '.a:name.':'
X      for j in range(i + 1, line('$'))
X        if getline(j) !~ '^ '
X          return [i, j - 1]
X        endif
X      endfor
X      return [i, i]
X    endif
X  endfor
X  return [0, 0]
Xendfunction
X
Xfunction! s:log(bullet, name, lines)
X  if s:switch_in()
X    let [b, e] = s:logpos(a:name)
X    if b > 0
X      silent execute printf('%d,%d d _', b, e)
X      if b > winheight('.')
X        let b = 4
X      endif
X    else
X      let b = 4
X    endif
X    " FIXME For some reason, nomodifiable is set after :d in vim8
X    setlocal modifiable
X    call append(b - 1, s:format_message(a:bullet, a:name, a:lines))
X    call s:switch_out()
X  endif
Xendfunction
X
Xfunction! s:update_vim()
X  let s:jobs = {}
X
X  call s:bar()
X  call s:tick()
Xendfunction
X
Xfunction! s:tick()
X  let pull = s:update.pull
X  let prog = s:progress_opt(s:nvim || s:vim8)
Xwhile 1 " Without TCO, Vim stack is bound to explode
X  if empty(s:update.todo)
X    if empty(s:jobs) && !s:update.fin
X      call s:update_finish()
X      let s:update.fin = 1
X    endif
X    return
X  endif
X
X  let name = keys(s:update.todo)[0]
X  let spec = remove(s:update.todo, name)
X  let new  = !isdirectory(spec.dir)
X
X  call s:log(new ? '+' : '*', name, pull ? 'Updating ...' : 'Installing ...')
X  redraw
X
X  let has_tag = has_key(spec, 'tag')
X  if !new
X    let [error, _] = s:git_validate(spec, 0)
X    if empty(error)
X      if pull
X        let fetch_opt = (has_tag && !empty(globpath(spec.dir, '.git/shallow'))) ? '--depth 99999999' : ''
X        call s:spawn(name, printf('git fetch %s %s 2>&1', fetch_opt, prog), { 'dir': spec.dir })
X      else
X        let s:jobs[name] = { 'running': 0, 'lines': ['Already installed'], 'error': 0 }
X      endif
X    else
X      let s:jobs[name] = { 'running': 0, 'lines': s:lines(error), 'error': 1 }
X    endif
X  else
X    call s:spawn(name,
X          \ printf('git clone %s %s %s %s 2>&1',
X          \ has_tag ? '' : s:clone_opt,
X          \ prog,
X          \ s:shellesc(spec.uri),
X          \ s:shellesc(s:trim(spec.dir))), { 'new': 1 })
X  endif
X
X  if !s:jobs[name].running
X    call s:reap(name)
X  endif
X  if len(s:jobs) >= s:update.threads
X    break
X  endif
Xendwhile
Xendfunction
X
Xfunction! s:update_python()
Xlet py_exe = has('python') ? 'python' : 'python3'
Xexecute py_exe "<< EOF"
Ximport datetime
Ximport functools
Ximport os
Xtry:
X  import queue
Xexcept ImportError:
X  import Queue as queue
Ximport random
Ximport re
Ximport shutil
Ximport signal
Ximport subprocess
Ximport tempfile
Ximport threading as thr
Ximport time
Ximport traceback
Ximport vim
X
XG_NVIM = vim.eval("has('nvim')") == '1'
XG_PULL = vim.eval('s:update.pull') == '1'
XG_RETRIES = int(vim.eval('get(g:, "plug_retries", 2)')) + 1
XG_TIMEOUT = int(vim.eval('get(g:, "plug_timeout", 60)'))
XG_CLONE_OPT = vim.eval('s:clone_opt')
XG_PROGRESS = vim.eval('s:progress_opt(1)')
XG_LOG_PROB = 1.0 / int(vim.eval('s:update.threads'))
XG_STOP = thr.Event()
XG_IS_WIN = vim.eval('s:is_win') == '1'
X
Xclass PlugError(Exception):
X  def __init__(self, msg):
X    self.msg = msg
Xclass CmdTimedOut(PlugError):
X  pass
Xclass CmdFailed(PlugError):
X  pass
Xclass InvalidURI(PlugError):
X  pass
Xclass Action(object):
X  INSTALL, UPDATE, ERROR, DONE = ['+', '*', 'x', '-']
X
Xclass Buffer(object):
X  def __init__(self, lock, num_plugs, is_pull):
X    self.bar = ''
X    self.event = 'Updating' if is_pull else 'Installing'
X    self.lock = lock
X    self.maxy = int(vim.eval('winheight(".")'))
X    self.num_plugs = num_plugs
X
X  def __where(self, name):
X    """ Find first line with name in current buffer. Return line num. """
X    found, lnum = False, 0
X    matcher = re.compile('^[-+x*] {0}:'.format(name))
X    for line in vim.current.buffer:
X      if matcher.search(line) is not None:
X        found = True
X        break
X      lnum += 1
X
X    if not found:
X      lnum = -1
X    return lnum
X
X  def header(self):
X    curbuf = vim.current.buffer
X    curbuf[0] = self.event + ' plugins ({0}/{1})'.format(len(self.bar), self.num_plugs)
X
X    num_spaces = self.num_plugs - len(self.bar)
X    curbuf[1] = '[{0}{1}]'.format(self.bar, num_spaces * ' ')
X
X    with self.lock:
X      vim.command('normal! 2G')
X      vim.command('redraw')
X
X  def write(self, action, name, lines):
X    first, rest = lines[0], lines[1:]
X    msg = ['{0} {1}{2}{3}'.format(action, name, ': ' if first else '', first)]
X    msg.extend(['    ' + line for line in rest])
X
X    try:
X      if action == Action.ERROR:
X        self.bar += 'x'
X        vim.command("call add(s:update.errors, '{0}')".format(name))
X      elif action == Action.DONE:
X        self.bar += '='
X
X      curbuf = vim.current.buffer
X      lnum = self.__where(name)
X      if lnum != -1: # Found matching line num
X        del curbuf[lnum]
X        if lnum > self.maxy and action in set([Action.INSTALL, Action.UPDATE]):
X          lnum = 3
X      else:
X        lnum = 3
X      curbuf.append(msg, lnum)
X
X      self.header()
X    except vim.error:
X      pass
X
Xclass Command(object):
X  CD = 'cd /d' if G_IS_WIN else 'cd'
X
X  def __init__(self, cmd, cmd_dir=None, timeout=60, cb=None, clean=None):
X    self.cmd = cmd
X    if cmd_dir:
X      self.cmd = '{0} {1} && {2}'.format(Command.CD, cmd_dir, self.cmd)
X    self.timeout = timeout
X    self.callback = cb if cb else (lambda msg: None)
X    self.clean = clean if clean else (lambda: None)
X    self.proc = None
X
X  @property
X  def alive(self):
X    """ Returns true only if command still running. """
X    return self.proc and self.proc.poll() is None
X
X  def execute(self, ntries=3):
X    """ Execute the command with ntries if CmdTimedOut.
X        Returns the output of the command if no Exception.
X    """
X    attempt, finished, limit = 0, False, self.timeout
X
X    while not finished:
X      try:
X        attempt += 1
X        result = self.try_command()
X        finished = True
X        return result
X      except CmdTimedOut:
X        if attempt != ntries:
X          self.notify_retry()
X          self.timeout += limit
X        else:
X          raise
X
X  def notify_retry(self):
X    """ Retry required for command, notify user. """
X    for count in range(3, 0, -1):
X      if G_STOP.is_set():
X        raise KeyboardInterrupt
X      msg = 'Timeout. Will retry in {0} second{1} ...'.format(
X            count, 's' if count != 1 else '')
X      self.callback([msg])
X      time.sleep(1)
X    self.callback(['Retrying ...'])
X
X  def try_command(self):
X    """ Execute a cmd & poll for callback. Returns list of output.
X        Raises CmdFailed   -> return code for Popen isn't 0
X        Raises CmdTimedOut -> command exceeded timeout without new output
X    """
X    first_line = True
X
X    try:
X      tfile = tempfile.NamedTemporaryFile(mode='w+b')
X      preexec_fn = not G_IS_WIN and os.setsid or None
X      self.proc = subprocess.Popen(self.cmd, stdout=tfile,
X                                   stderr=subprocess.STDOUT,
X                                   stdin=subprocess.PIPE, shell=True,
X                                   preexec_fn=preexec_fn)
X      thrd = thr.Thread(target=(lambda proc: proc.wait()), args=(self.proc,))
X      thrd.start()
X
X      thread_not_started = True
X      while thread_not_started:
X        try:
X          thrd.join(0.1)
X          thread_not_started = False
X        except RuntimeError:
X          pass
X
X      while self.alive:
X        if G_STOP.is_set():
X          raise KeyboardInterrupt
X
X        if first_line or random.random() < G_LOG_PROB:
X          first_line = False
X          line = '' if G_IS_WIN else nonblock_read(tfile.name)
X          if line:
X            self.callback([line])
X
X        time_diff = time.time() - os.path.getmtime(tfile.name)
X        if time_diff > self.timeout:
X          raise CmdTimedOut(['Timeout!'])
X
X        thrd.join(0.5)
X
X      tfile.seek(0)
X      result = [line.decode('utf-8', 'replace').rstrip() for line in tfile]
X
X      if self.proc.returncode != 0:
X        raise CmdFailed([''] + result)
X
X      return result
X    except:
X      self.terminate()
X      raise
X
X  def terminate(self):
X    """ Terminate process and cleanup. """
X    if self.alive:
X      if G_IS_WIN:
X        os.kill(self.proc.pid, signal.SIGINT)
X      else:
X        os.killpg(self.proc.pid, signal.SIGTERM)
X    self.clean()
X
Xclass Plugin(object):
X  def __init__(self, name, args, buf_q, lock):
X    self.name = name
X    self.args = args
X    self.buf_q = buf_q
X    self.lock = lock
X    self.tag = args.get('tag', 0)
X
X  def manage(self):
X    try:
X      if os.path.exists(self.args['dir']):
X        self.update()
X      else:
X        self.install()
X        with self.lock:
X          thread_vim_command("let s:update.new['{0}'] = 1".format(self.name))
X    except PlugError as exc:
X      self.write(Action.ERROR, self.name, exc.msg)
X    except KeyboardInterrupt:
X      G_STOP.set()
X      self.write(Action.ERROR, self.name, ['Interrupted!'])
X    except:
X      # Any exception except those above print stack trace
X      msg = 'Trace:\n{0}'.format(traceback.format_exc().rstrip())
X      self.write(Action.ERROR, self.name, msg.split('\n'))
X      raise
X
X  def install(self):
X    target = self.args['dir']
X    if target[-1] == '\\':
X      target = target[0:-1]
X
X    def clean(target):
X      def _clean():
X        try:
X          shutil.rmtree(target)
X        except OSError:
X          pass
X      return _clean
X
X    self.write(Action.INSTALL, self.name, ['Installing ...'])
X    callback = functools.partial(self.write, Action.INSTALL, self.name)
X    cmd = 'git clone {0} {1} {2} {3} 2>&1'.format(
X          '' if self.tag else G_CLONE_OPT, G_PROGRESS, self.args['uri'],
X          esc(target))
X    com = Command(cmd, None, G_TIMEOUT, callback, clean(target))
X    result = com.execute(G_RETRIES)
X    self.write(Action.DONE, self.name, result[-1:])
X
X  def repo_uri(self):
X    cmd = 'git rev-parse --abbrev-ref HEAD 2>&1 && git config -f .git/config remote.origin.url'
X    command = Command(cmd, self.args['dir'], G_TIMEOUT,)
X    result = command.execute(G_RETRIES)
X    return result[-1]
X
X  def update(self):
X    actual_uri = self.repo_uri()
X    expect_uri = self.args['uri']
X    regex = re.compile(r'^(?:\w+://)?(?:[^@/]*@)?([^:/]*(?::[0-9]*)?)[:/](.*?)(?:\.git)?/?$')
X    ma = regex.match(actual_uri)
X    mb = regex.match(expect_uri)
X    if ma is None or mb is None or ma.groups() != mb.groups():
X      msg = ['',
X             'Invalid URI: {0}'.format(actual_uri),
X             'Expected     {0}'.format(expect_uri),
X             'PlugClean required.']
X      raise InvalidURI(msg)
X
X    if G_PULL:
X      self.write(Action.UPDATE, self.name, ['Updating ...'])
X      callback = functools.partial(self.write, Action.UPDATE, self.name)
X      fetch_opt = '--depth 99999999' if self.tag and os.path.isfile(os.path.join(self.args['dir'], '.git/shallow')) else ''
X      cmd = 'git fetch {0} {1} 2>&1'.format(fetch_opt, G_PROGRESS)
X      com = Command(cmd, self.args['dir'], G_TIMEOUT, callback)
X      result = com.execute(G_RETRIES)
X      self.write(Action.DONE, self.name, result[-1:])
X    else:
X      self.write(Action.DONE, self.name, ['Already installed'])
X
X  def write(self, action, name, msg):
X    self.buf_q.put((action, name, msg))
X
Xclass PlugThread(thr.Thread):
X  def __init__(self, tname, args):
X    super(PlugThread, self).__init__()
X    self.tname = tname
X    self.args = args
X
X  def run(self):
X    thr.current_thread().name = self.tname
X    buf_q, work_q, lock = self.args
X
X    try:
X      while not G_STOP.is_set():
X        name, args = work_q.get_nowait()
X        plug = Plugin(name, args, buf_q, lock)
X        plug.manage()
X        work_q.task_done()
X    except queue.Empty:
X      pass
X
Xclass RefreshThread(thr.Thread):
X  def __init__(self, lock):
X    super(RefreshThread, self).__init__()
X    self.lock = lock
X    self.running = True
X
X  def run(self):
X    while self.running:
X      with self.lock:
X        thread_vim_command('noautocmd normal! a')
X      time.sleep(0.33)
X
X  def stop(self):
X    self.running = False
X
Xif G_NVIM:
X  def thread_vim_command(cmd):
X    vim.session.threadsafe_call(lambda: vim.command(cmd))
Xelse:
X  def thread_vim_command(cmd):
X    vim.command(cmd)
X
Xdef esc(name):
X  return '"' + name.replace('"', '\"') + '"'
X
Xdef nonblock_read(fname):
X  """ Read a file with nonblock flag. Return the last line. """
X  fread = os.open(fname, os.O_RDONLY | os.O_NONBLOCK)
X  buf = os.read(fread, 100000).decode('utf-8', 'replace')
X  os.close(fread)
X
X  line = buf.rstrip('\r\n')
X  left = max(line.rfind('\r'), line.rfind('\n'))
X  if left != -1:
X    left += 1
X    line = line[left:]
X
X  return line
X
Xdef main():
X  thr.current_thread().name = 'main'
X  nthreads = int(vim.eval('s:update.threads'))
X  plugs = vim.eval('s:update.todo')
X  mac_gui = vim.eval('s:mac_gui') == '1'
X
X  lock = thr.Lock()
X  buf = Buffer(lock, len(plugs), G_PULL)
X  buf_q, work_q = queue.Queue(), queue.Queue()
X  for work in plugs.items():
X    work_q.put(work)
X
X  start_cnt = thr.active_count()
X  for num in range(nthreads):
X    tname = 'PlugT-{0:02}'.format(num)
X    thread = PlugThread(tname, (buf_q, work_q, lock))
X    thread.start()
X  if mac_gui:
X    rthread = RefreshThread(lock)
X    rthread.start()
X
X  while not buf_q.empty() or thr.active_count() != start_cnt:
X    try:
X      action, name, msg = buf_q.get(True, 0.25)
X      buf.write(action, name, ['OK'] if not msg else msg)
X      buf_q.task_done()
X    except queue.Empty:
X      pass
X    except KeyboardInterrupt:
X      G_STOP.set()
X
X  if mac_gui:
X    rthread.stop()
X    rthread.join()
X
Xmain()
XEOF
Xendfunction
X
Xfunction! s:update_ruby()
X  ruby << EOF
X  module PlugStream
X    SEP = ["\r", "\n", nil]
X    def get_line
X      buffer = ''
X      loop do
X        char = readchar rescue return
X        if SEP.include? char.chr
X          buffer << $/
X          break
X        else
X          buffer << char
X        end
X      end
X      buffer
X    end
X  end unless defined?(PlugStream)
X
X  def esc arg
X    %["#{arg.gsub('"', '\"')}"]
X  end
X
X  def killall pid
X    pids = [pid]
X    if /mswin|mingw|bccwin/ =~ RUBY_PLATFORM
X      pids.each { |pid| Process.kill 'INT', pid.to_i rescue nil }
X    else
X      unless `which pgrep 2> /dev/null`.empty?
X        children = pids
X        until children.empty?
X          children = children.map { |pid|
X            `pgrep -P #{pid}`.lines.map { |l| l.chomp }
X          }.flatten
X          pids += children
X        end
X      end
X      pids.each { |pid| Process.kill 'TERM', pid.to_i rescue nil }
X    end
X  end
X
X  def compare_git_uri a, b
X    regex = %r{^(?:\w+://)?(?:[^@/]*@)?([^:/]*(?::[0-9]*)?)[:/](.*?)(?:\.git)?/?$}
X    regex.match(a).to_a.drop(1) == regex.match(b).to_a.drop(1)
X  end
X
X  require 'thread'
X  require 'fileutils'
X  require 'timeout'
X  running = true
X  iswin = VIM::evaluate('s:is_win').to_i == 1
X  pull  = VIM::evaluate('s:update.pull').to_i == 1
X  base  = VIM::evaluate('g:plug_home')
X  all   = VIM::evaluate('s:update.todo')
X  limit = VIM::evaluate('get(g:, "plug_timeout", 60)')
X  tries = VIM::evaluate('get(g:, "plug_retries", 2)') + 1
X  nthr  = VIM::evaluate('s:update.threads').to_i
X  maxy  = VIM::evaluate('winheight(".")').to_i
X  vim7  = VIM::evaluate('v:version').to_i <= 703 && RUBY_PLATFORM =~ /darwin/
X  cd    = iswin ? 'cd /d' : 'cd'
X  tot   = VIM::evaluate('len(s:update.todo)') || 0
X  bar   = ''
X  skip  = 'Already installed'
X  mtx   = Mutex.new
X  take1 = proc { mtx.synchronize { running && all.shift } }
X  logh  = proc {
X    cnt = bar.length
X    $curbuf[1] = "#{pull ? 'Updating' : 'Installing'} plugins (#{cnt}/#{tot})"
X    $curbuf[2] = '[' + bar.ljust(tot) + ']'
X    VIM::command('normal! 2G')
X    VIM::command('redraw')
X  }
X  where = proc { |name| (1..($curbuf.length)).find { |l| $curbuf[l] =~ /^[-+x*] #{name}:/ } }
X  log   = proc { |name, result, type|
X    mtx.synchronize do
X      ing  = ![true, false].include?(type)
X      bar += type ? '=' : 'x' unless ing
X      b = case type
X          when :install  then '+' when :update then '*'
X          when true, nil then '-' else
X            VIM::command("call add(s:update.errors, '#{name}')")
X            'x'
X          end
X      result =
X        if type || type.nil?
X          ["#{b} #{name}: #{result.lines.to_a.last || 'OK'}"]
X        elsif result =~ /^Interrupted|^Timeout/
X          ["#{b} #{name}: #{result}"]
X        else
X          ["#{b} #{name}"] + result.lines.map { |l| "    " << l }
X        end
X      if lnum = where.call(name)
X        $curbuf.delete lnum
X        lnum = 4 if ing && lnum > maxy
X      end
X      result.each_with_index do |line, offset|
X        $curbuf.append((lnum || 4) - 1 + offset, line.gsub(/\e\[./, '').chomp)
X      end
X      logh.call
X    end
X  }
X  bt = proc { |cmd, name, type, cleanup|
X    tried = timeout = 0
X    begin
X      tried += 1
X      timeout += limit
X      fd = nil
X      data = ''
X      if iswin
X        Timeout::timeout(timeout) do
X          tmp = VIM::evaluate('tempname()')
X          system("(#{cmd}) > #{tmp}")
X          data = File.read(tmp).chomp
X          File.unlink tmp rescue nil
X        end
X      else
X        fd = IO.popen(cmd).extend(PlugStream)
X        first_line = true
X        log_prob = 1.0 / nthr
X        while line = Timeout::timeout(timeout) { fd.get_line }
X          data << line
X          log.call name, line.chomp, type if name && (first_line || rand < log_prob)
X          first_line = false
X        end
X        fd.close
X      end
X      [$? == 0, data.chomp]
X    rescue Timeout::Error, Interrupt => e
X      if fd && !fd.closed?
X        killall fd.pid
X        fd.close
X      end
X      cleanup.call if cleanup
X      if e.is_a?(Timeout::Error) && tried < tries
X        3.downto(1) do |countdown|
X          s = countdown > 1 ? 's' : ''
X          log.call name, "Timeout. Will retry in #{countdown} second#{s} ...", type
X          sleep 1
X        end
X        log.call name, 'Retrying ...', type
X        retry
X      end
X      [false, e.is_a?(Interrupt) ? "Interrupted!" : "Timeout!"]
X    end
X  }
X  main = Thread.current
X  threads = []
X  watcher = Thread.new {
X    if vim7
X      while VIM::evaluate('getchar(1)')
X        sleep 0.1
X      end
X    else
X      require 'io/console' # >= Ruby 1.9
X      nil until IO.console.getch == 3.chr
X    end
X    mtx.synchronize do
X      running = false
X      threads.each { |t| t.raise Interrupt } unless vim7
X    end
X    threads.each { |t| t.join rescue nil }
X    main.kill
X  }
X  refresh = Thread.new {
X    while true
X      mtx.synchronize do
X        break unless running
X        VIM::command('noautocmd normal! a')
X      end
X      sleep 0.2
X    end
X  } if VIM::evaluate('s:mac_gui') == 1
X
X  clone_opt = VIM::evaluate('s:clone_opt')
X  progress = VIM::evaluate('s:progress_opt(1)')
X  nthr.times do
X    mtx.synchronize do
X      threads << Thread.new {
X        while pair = take1.call
X          name = pair.first
X          dir, uri, tag = pair.last.values_at *%w[dir uri tag]
X          exists = File.directory? dir
X          ok, result =
X            if exists
X              chdir = "#{cd} #{iswin ? dir : esc(dir)}"
X              ret, data = bt.call "#{chdir} && git rev-parse --abbrev-ref HEAD 2>&1 && git config -f .git/config remote.origin.url", nil, nil, nil
X              current_uri = data.lines.to_a.last
X              if !ret
X                if data =~ /^Interrupted|^Timeout/
X                  [false, data]
X                else
X                  [false, [data.chomp, "PlugClean required."].join($/)]
X                end
X              elsif !compare_git_uri(current_uri, uri)
X                [false, ["Invalid URI: #{current_uri}",
X                         "Expected:    #{uri}",
X                         "PlugClean required."].join($/)]
X              else
X                if pull
X                  log.call name, 'Updating ...', :update
X                  fetch_opt = (tag && File.exist?(File.join(dir, '.git/shallow'))) ? '--depth 99999999' : ''
X                  bt.call "#{chdir} && git fetch #{fetch_opt} #{progress} 2>&1", name, :update, nil
X                else
X                  [true, skip]
X                end
X              end
X            else
X              d = esc dir.sub(%r{[\\/]+$}, '')
X              log.call name, 'Installing ...', :install
X              bt.call "git clone #{clone_opt unless tag} #{progress} #{uri} #{d} 2>&1", name, :install, proc {
X                FileUtils.rm_rf dir
X              }
X            end
X          mtx.synchronize { VIM::command("let s:update.new['#{name}'] = 1") } if !exists && ok
X          log.call name, result, ok
X        end
X      } if running
X    end
X  end
X  threads.each { |t| t.join rescue nil }
X  logh.call
X  refresh.kill if refresh
X  watcher.kill
XEOF
Xendfunction
X
Xfunction! s:shellesc(arg)
X  return '"'.escape(a:arg, '"').'"'
Xendfunction
X
Xfunction! s:glob_dir(path)
X  return map(filter(s:glob(a:path, '**'), 'isdirectory(v:val)'), 's:dirpath(v:val)')
Xendfunction
X
Xfunction! s:progress_bar(line, bar, total)
X  call setline(a:line, '[' . s:lpad(a:bar, a:total) . ']')
Xendfunction
X
Xfunction! s:compare_git_uri(a, b)
X  " See `git help clone'
X  " https:// [user@] github.com[:port] / junegunn/vim-plug [.git]
X  "          [git@]  github.com[:port] : junegunn/vim-plug [.git]
X  " file://                            / junegunn/vim-plug        [/]
X  "                                    / junegunn/vim-plug        [/]
X  let pat = '^\%(\w\+://\)\='.'\%([^@/]*@\)\='.'\([^:/]*\%(:[0-9]*\)\=\)'.'[:/]'.'\(.\{-}\)'.'\%(\.git\)\=/\?$'
X  let ma = matchlist(a:a, pat)
X  let mb = matchlist(a:b, pat)
X  return ma[1:2] ==# mb[1:2]
Xendfunction
X
Xfunction! s:format_message(bullet, name, message)
X  if a:bullet != 'x'
X    return [printf('%s %s: %s', a:bullet, a:name, s:lastline(a:message))]
X  else
X    let lines = map(s:lines(a:message), '"    ".v:val')
X    return extend([printf('x %s:', a:name)], lines)
X  endif
Xendfunction
X
Xfunction! s:with_cd(cmd, dir)
X  return printf('cd%s %s && %s', s:is_win ? ' /d' : '', s:shellesc(a:dir), a:cmd)
Xendfunction
X
Xfunction! s:system(cmd, ...)
X  try
X    let [sh, shrd] = s:chsh(1)
X    let cmd = a:0 > 0 ? s:with_cd(a:cmd, a:1) : a:cmd
X    return system(s:is_win ? '('.cmd.')' : cmd)
X  finally
X    let [&shell, &shellredir] = [sh, shrd]
X  endtry
Xendfunction
X
Xfunction! s:system_chomp(...)
X  let ret = call('s:system', a:000)
X  return v:shell_error ? '' : substitute(ret, '\n$', '', '')
Xendfunction
X
Xfunction! s:git_validate(spec, check_branch)
X  let err = ''
X  if isdirectory(a:spec.dir)
X    let result = s:lines(s:system('git rev-parse --abbrev-ref HEAD 2>&1 && git config -f .git/config remote.origin.url', a:spec.dir))
X    let remote = result[-1]
X    if v:shell_error
X      let err = join([remote, 'PlugClean required.'], "\n")
X    elseif !s:compare_git_uri(remote, a:spec.uri)
X      let err = join(['Invalid URI: '.remote,
X                    \ 'Expected:    '.a:spec.uri,
X                    \ 'PlugClean required.'], "\n")
X    elseif a:check_branch && has_key(a:spec, 'commit')
X      let result = s:lines(s:system('git rev-parse HEAD 2>&1', a:spec.dir))
X      let sha = result[-1]
X      if v:shell_error
X        let err = join(add(result, 'PlugClean required.'), "\n")
X      elseif !s:hash_match(sha, a:spec.commit)
X        let err = join([printf('Invalid HEAD (expected: %s, actual: %s)',
X                              \ a:spec.commit[:6], sha[:6]),
X                      \ 'PlugUpdate required.'], "\n")
X      endif
X    elseif a:check_branch
X      let branch = result[0]
X      " Check tag
X      if has_key(a:spec, 'tag')
X        let tag = s:system_chomp('git describe --exact-match --tags HEAD 2>&1', a:spec.dir)
X        if a:spec.tag !=# tag
X          let err = printf('Invalid tag: %s (expected: %s). Try PlugUpdate.',
X                \ (empty(tag) ? 'N/A' : tag), a:spec.tag)
X        endif
X      " Check branch
X      elseif a:spec.branch !=# branch
X        let err = printf('Invalid branch: %s (expected: %s). Try PlugUpdate.',
X              \ branch, a:spec.branch)
X      endif
X      if empty(err)
X        let [ahead, behind] = split(s:lastline(s:system(printf(
X              \ 'git rev-list --count --left-right HEAD...origin/%s',
X              \ a:spec.branch), a:spec.dir)), '\t')
X        if !v:shell_error && ahead
X          if behind
X            " Only mention PlugClean if diverged, otherwise it's likely to be
X            " pushable (and probably not that messed up).
X            let err = printf(
X                  \ "Diverged from origin/%s (%d commit(s) ahead and %d commit(s) behind!\n"
X                  \ .'Backup local changes and run PlugClean and PlugUpdate to reinstall it.', a:spec.branch, ahead, behind)
X          else
X            let err = printf("Ahead of origin/%s by %d commit(s).\n"
X                  \ .'Cannot update until local changes are pushed.',
X                  \ a:spec.branch, ahead)
X          endif
X        endif
X      endif
X    endif
X  else
X    let err = 'Not found'
X  endif
X  return [err, err =~# 'PlugClean']
Xendfunction
X
Xfunction! s:rm_rf(dir)
X  if isdirectory(a:dir)
X    call s:system((s:is_win ? 'rmdir /S /Q ' : 'rm -rf ') . s:shellesc(a:dir))
X  endif
Xendfunction
X
Xfunction! s:clean(force)
X  call s:prepare()
X  call append(0, 'Searching for invalid plugins in '.g:plug_home)
X  call append(1, '')
X
X  " List of valid directories
X  let dirs = []
X  let errs = {}
X  let [cnt, total] = [0, len(g:plugs)]
X  for [name, spec] in items(g:plugs)
X    if !s:is_managed(name)
X      call add(dirs, spec.dir)
X    else
X      let [err, clean] = s:git_validate(spec, 1)
X      if clean
X        let errs[spec.dir] = s:lines(err)[0]
X      else
X        call add(dirs, spec.dir)
X      endif
X    endif
X    let cnt += 1
X    call s:progress_bar(2, repeat('=', cnt), total)
X    normal! 2G
X    redraw
X  endfor
X
X  let allowed = {}
X  for dir in dirs
X    let allowed[s:dirpath(fnamemodify(dir, ':h:h'))] = 1
X    let allowed[dir] = 1
X    for child in s:glob_dir(dir)
X      let allowed[child] = 1
X    endfor
X  endfor
X
X  let todo = []
X  let found = sort(s:glob_dir(g:plug_home))
X  while !empty(found)
X    let f = remove(found, 0)
X    if !has_key(allowed, f) && isdirectory(f)
X      call add(todo, f)
X      call append(line('$'), '- ' . f)
X      if has_key(errs, f)
X        call append(line('$'), '    ' . errs[f])
X      endif
X      let found = filter(found, 'stridx(v:val, f) != 0')
X    end
X  endwhile
X
X  4
X  redraw
X  if empty(todo)
X    call append(line('$'), 'Already clean.')
X  else
X    let s:clean_count = 0
X    call append(3, ['Directories to delete:', ''])
X    redraw!
X    if a:force || s:ask_no_interrupt('Delete all directories?')
X      call s:delete([6, line('$')], 1)
X    else
X      call setline(4, 'Cancelled.')
X      nnoremap <silent> <buffer> d :set opfunc=<sid>delete_op<cr>g@
X      nmap     <silent> <buffer> dd d_
X      xnoremap <silent> <buffer> d :<c-u>call <sid>delete_op(visualmode(), 1)<cr>
X      echo 'Delete the lines (d{motion}) to delete the corresponding directories'
X    endif
X  endif
X  4
X  setlocal nomodifiable
Xendfunction
X
Xfunction! s:delete_op(type, ...)
X  call s:delete(a:0 ? [line("'<"), line("'>")] : [line("'["), line("']")], 0)
Xendfunction
X
Xfunction! s:delete(range, force)
X  let [l1, l2] = a:range
X  let force = a:force
X  while l1 <= l2
X    let line = getline(l1)
X    if line =~ '^- ' && isdirectory(line[2:])
X      execute l1
X      redraw!
X      let answer = force ? 1 : s:ask('Delete '.line[2:].'?', 1)
X      let force = force || answer > 1
X      if answer
X        call s:rm_rf(line[2:])
X        setlocal modifiable
X        call setline(l1, '~'.line[1:])
X        let s:clean_count += 1
X        call setline(4, printf('Removed %d directories.', s:clean_count))
X        setlocal nomodifiable
X      endif
X    endif
X    let l1 += 1
X  endwhile
Xendfunction
X
Xfunction! s:upgrade()
X  echo 'Downloading the latest version of vim-plug'
X  redraw
X  let tmp = tempname()
X  let new = tmp . '/plug.vim'
X
X  try
X    let out = s:system(printf('git clone --depth 1 %s %s', s:plug_src, tmp))
X    if v:shell_error
X      return s:err('Error upgrading vim-plug: '. out)
X    endif
X
X    if readfile(s:me) ==# readfile(new)
X      echo 'vim-plug is already up-to-date'
X      return 0
X    else
X      call rename(s:me, s:me . '.old')
X      call rename(new, s:me)
X      unlet g:loaded_plug
X      echo 'vim-plug has been upgraded'
X      return 1
X    endif
X  finally
X    silent! call s:rm_rf(tmp)
X  endtry
Xendfunction
X
Xfunction! s:upgrade_specs()
X  for spec in values(g:plugs)
X    let spec.frozen = get(spec, 'frozen', 0)
X  endfor
Xendfunction
X
Xfunction! s:status()
X  call s:prepare()
X  call append(0, 'Checking plugins')
X  call append(1, '')
X
X  let ecnt = 0
X  let unloaded = 0
X  let [cnt, total] = [0, len(g:plugs)]
X  for [name, spec] in items(g:plugs)
X    if has_key(spec, 'uri')
X      if isdirectory(spec.dir)
X        let [err, _] = s:git_validate(spec, 1)
X        let [valid, msg] = [empty(err), empty(err) ? 'OK' : err]
X      else
X        let [valid, msg] = [0, 'Not found. Try PlugInstall.']
X      endif
X    else
X      if isdirectory(spec.dir)
X        let [valid, msg] = [1, 'OK']
X      else
X        let [valid, msg] = [0, 'Not found.']
X      endif
X    endif
X    let cnt += 1
X    let ecnt += !valid
X    " `s:loaded` entry can be missing if PlugUpgraded
X    if valid && get(s:loaded, name, -1) == 0
X      let unloaded = 1
X      let msg .= ' (not loaded)'
X    endif
X    call s:progress_bar(2, repeat('=', cnt), total)
X    call append(3, s:format_message(valid ? '-' : 'x', name, msg))
X    normal! 2G
X    redraw
X  endfor
X  call setline(1, 'Finished. '.ecnt.' error(s).')
X  normal! gg
X  setlocal nomodifiable
X  if unloaded
X    echo "Press 'L' on each line to load plugin, or 'U' to update"
X    nnoremap <silent> <buffer> L :call <SID>status_load(line('.'))<cr>
X    xnoremap <silent> <buffer> L :call <SID>status_load(line('.'))<cr>
X  end
Xendfunction
X
Xfunction! s:extract_name(str, prefix, suffix)
X  return matchstr(a:str, '^'.a:prefix.' \zs[^:]\+\ze:.*'.a:suffix.'$')
Xendfunction
X
Xfunction! s:status_load(lnum)
X  let line = getline(a:lnum)
X  let name = s:extract_name(line, '-', '(not loaded)')
X  if !empty(name)
X    call plug#load(name)
X    setlocal modifiable
X    call setline(a:lnum, substitute(line, ' (not loaded)$', '', ''))
X    setlocal nomodifiable
X  endif
Xendfunction
X
Xfunction! s:status_update() range
X  let lines = getline(a:firstline, a:lastline)
X  let names = filter(map(lines, 's:extract_name(v:val, "[x-]", "")'), '!empty(v:val)')
X  if !empty(names)
X    echo
X    execute 'PlugUpdate' join(names)
X  endif
Xendfunction
X
Xfunction! s:is_preview_window_open()
X  silent! wincmd P
X  if &previewwindow
X    wincmd p
X    return 1
X  endif
Xendfunction
X
Xfunction! s:find_name(lnum)
X  for lnum in reverse(range(1, a:lnum))
X    let line = getline(lnum)
X    if empty(line)
X      return ''
X    endif
X    let name = s:extract_name(line, '-', '')
X    if !empty(name)
X      return name
X    endif
X  endfor
X  return ''
Xendfunction
X
Xfunction! s:preview_commit()
X  if b:plug_preview < 0
X    let b:plug_preview = !s:is_preview_window_open()
X  endif
X
X  let sha = matchstr(getline('.'), '^  \X*\zs[0-9a-f]\{7,9}')
X  if empty(sha)
X    return
X  endif
X
X  let name = s:find_name(line('.'))
X  if empty(name) || !has_key(g:plugs, name) || !isdirectory(g:plugs[name].dir)
X    return
X  endif
X
X  if exists('g:plug_pwindow') && !s:is_preview_window_open()
X    execute g:plug_pwindow
X    execute 'e' sha
X  else
X    execute 'pedit' sha
X    wincmd P
X  endif
X  setlocal previewwindow filetype=git buftype=nofile nobuflisted modifiable
X  try
X    let [sh, shrd] = s:chsh(1)
X    execute 'silent %!cd' s:shellesc(g:plugs[name].dir) '&& git show --no-color --pretty=medium' sha
X  finally
X    let [&shell, &shellredir] = [sh, shrd]
X  endtry
X  setlocal nomodifiable
X  nnoremap <silent> <buffer> q :q<cr>
X  wincmd p
Xendfunction
X
Xfunction! s:section(flags)
X  call search('\(^[x-] \)\@<=[^:]\+:', a:flags)
Xendfunction
X
Xfunction! s:format_git_log(line)
X  let indent = '  '
X  let tokens = split(a:line, nr2char(1))
X  if len(tokens) != 5
X    return indent.substitute(a:line, '\s*$', '', '')
X  endif
X  let [graph, sha, refs, subject, date] = tokens
X  let tag = matchstr(refs, 'tag: [^,)]\+')
X  let tag = empty(tag) ? ' ' : ' ('.tag.') '
X  return printf('%s%s%s%s%s (%s)', indent, graph, sha, tag, subject, date)
Xendfunction
X
Xfunction! s:append_ul(lnum, text)
X  call append(a:lnum, ['', a:text, repeat('-', len(a:text))])
Xendfunction
X
Xfunction! s:diff()
X  call s:prepare()
X  call append(0, ['Collecting changes ...', ''])
X  let cnts = [0, 0]
X  let bar = ''
X  let total = filter(copy(g:plugs), 's:is_managed(v:key) && isdirectory(v:val.dir)')
X  call s:progress_bar(2, bar, len(total))
X  for origin in [1, 0]
X    let plugs = reverse(sort(items(filter(copy(total), (origin ? '' : '!').'(has_key(v:val, "commit") || has_key(v:val, "tag"))'))))
X    if empty(plugs)
X      continue
X    endif
X    call s:append_ul(2, origin ? 'Pending updates:' : 'Last update:')
X    for [k, v] in plugs
X      let range = origin ? '..origin/'.v.branch : 'HEAD@{1}..'
X      let diff = s:system_chomp('git log --graph --color=never --pretty=format:"%x01%h%x01%d%x01%s%x01%cr" '.s:shellesc(range), v.dir)
X      if !empty(diff)
X        let ref = has_key(v, 'tag') ? (' (tag: '.v.tag.')') : has_key(v, 'commit') ? (' '.v.commit) : ''
X        call append(5, extend(['', '- '.k.':'.ref], map(s:lines(diff), 's:format_git_log(v:val)')))
X        let cnts[origin] += 1
X      endif
X      let bar .= '='
X      call s:progress_bar(2, bar, len(total))
X      normal! 2G
X      redraw
X    endfor
X    if !cnts[origin]
X      call append(5, ['', 'N/A'])
X    endif
X  endfor
X  call setline(1, printf('%d plugin(s) updated.', cnts[0])
X        \ . (cnts[1] ? printf(' %d plugin(s) have pending updates.', cnts[1]) : ''))
X
X  if cnts[0] || cnts[1]
X    nnoremap <silent> <buffer> <cr> :silent! call <SID>preview_commit()<cr>
X    nnoremap <silent> <buffer> o    :silent! call <SID>preview_commit()<cr>
X  endif
X  if cnts[0]
X    nnoremap <silent> <buffer> X :call <SID>revert()<cr>
X    echo "Press 'X' on each block to revert the update"
X  endif
X  normal! gg
X  setlocal nomodifiable
Xendfunction
X
Xfunction! s:revert()
X  if search('^Pending updates', 'bnW')
X    return
X  endif
X
X  let name = s:find_name(line('.'))
X  if empty(name) || !has_key(g:plugs, name) ||
X    \ input(printf('Revert the update of %s? (y/N) ', name)) !~? '^y'
X    return
X  endif
X
X  call s:system('git reset --hard HEAD@{1} && git checkout '.s:esc(g:plugs[name].branch).' --', g:plugs[name].dir)
X  setlocal modifiable
X  normal! "_dap
X  setlocal nomodifiable
X  echo 'Reverted'
Xendfunction
X
Xfunction! s:snapshot(force, ...) abort
X  call s:prepare()
X  setf vim
X  call append(0, ['" Generated by vim-plug',
X                \ '" '.strftime("%c"),
X                \ '" :source this file in vim to restore the snapshot',
X                \ '" or execute: vim -S snapshot.vim',
X                \ '', '', 'PlugUpdate!'])
X  1
X  let anchor = line('$') - 3
X  let names = sort(keys(filter(copy(g:plugs),
X        \'has_key(v:val, "uri") && !has_key(v:val, "commit") && isdirectory(v:val.dir)')))
X  for name in reverse(names)
X    let sha = s:system_chomp('git rev-parse --short HEAD', g:plugs[name].dir)
X    if !empty(sha)
X      call append(anchor, printf("silent! let g:plugs['%s'].commit = '%s'", name, sha))
X      redraw
X    endif
X  endfor
X
X  if a:0 > 0
X    let fn = expand(a:1)
X    if filereadable(fn) && !(a:force || s:ask(a:1.' already exists. Overwrite?'))
X      return
X    endif
X    call writefile(getline(1, '$'), fn)
X    echo 'Saved as '.a:1
X    silent execute 'e' s:esc(fn)
X    setf vim
X  endif
Xendfunction
X
Xfunction! s:split_rtp()
X  return split(&rtp, '\\\@<!,')
Xendfunction
X
Xlet s:first_rtp = s:escrtp(get(s:split_rtp(), 0, ''))
Xlet s:last_rtp  = s:escrtp(get(s:split_rtp(), -1, ''))
X
Xif exists('g:plugs')
X  let g:plugs_order = get(g:, 'plugs_order', keys(g:plugs))
X  call s:upgrade_specs()
X  call s:define_commands()
Xendif
X
Xlet &cpo = s:cpo_save
Xunlet s:cpo_save
END-of-./.vim/autoload/plug.vim
echo c - ./.vim/colors
mkdir -p ./.vim/colors > /dev/null 2>&1
echo x - ./.vim/colors/nbari-colors.vim
sed 's/^X//' >./.vim/colors/nbari-colors.vim << 'END-of-./.vim/colors/nbari-colors.vim'
X" nbari-colors
X
Xhi clear
Xsyntax reset
X
Xlet g:colors_name = "nbari-colors"
X
X" Standard
Xhi Comment         term=bold ctermfg=243
Xhi Conditional     ctermfg=250
Xhi Constant        term=underline ctermfg=173
Xhi Define          ctermfg=139
Xhi Error           term=reverse ctermfg=16 ctermbg=9
Xhi Function        ctermfg=109
Xhi Identifier      term=underline ctermfg=167
Xhi Ignore          ctermfg=0
Xhi Include         ctermfg=109
Xhi Operator        ctermfg=109
Xhi PreProc         term=underline ctermfg=139
Xhi Repeat          ctermfg=250
Xhi Special         term=bold ctermfg=250
Xhi Statement       term=bold ctermfg=250
Xhi String          ctermfg=143
Xhi Structure       ctermfg=139
Xhi Todo            term=standout ctermfg=243 ctermbg=235
Xhi Type            term=underline ctermfg=109
Xhi Underlined      term=underline cterm=underline ctermfg=81
X
X" Vim
Xhi ColorColumn     term=reverse ctermbg=236
Xhi CursorColumn    term=reverse ctermbg=236
Xhi CursorLine      term=bold cterm=bold ctermbg=236
Xhi CursorLineNr    term=bold ctermfg=012 gui=bold
Xhi Directory       term=bold ctermfg=109
Xhi ErrorMsg        term=standout ctermfg=167 ctermbg=235
Xhi FoldColumn      term=standout ctermfg=14 ctermbg=235
Xhi Folded          term=standout ctermfg=243 ctermbg=235
Xhi IncSearch       term=reverse cterm=reverse
Xhi LineNr          term=underline ctermfg=239
Xhi MatchParen      term=reverse ctermbg=239
Xhi ModeMsg         term=bold cterm=bold ctermfg=143
Xhi MoreMsg         term=bold ctermfg=143
Xhi NonText         term=bold ctermfg=239
Xhi Normal          ctermfg=250 ctermbg=235
Xhi Pmenu           ctermfg=250 ctermbg=239
Xhi PmenuSbar       ctermbg=248
Xhi PmenuSel        cterm=reverse ctermfg=250 ctermbg=239
Xhi PmenuThumb      cterm=reverse
Xhi Question        term=standout ctermfg=143
Xhi Search          term=reverse ctermfg=235 ctermbg=222
Xhi SignColumn      term=standout ctermfg=14 ctermbg=235
Xhi SpecialKey      term=bold ctermfg=239
Xhi SpellBad        term=reverse ctermbg=52
Xhi SpellCap        term=reverse ctermbg=12
Xhi SpellLocal      term=underline ctermbg=14
Xhi SpellRare       term=reverse ctermbg=55
Xhi StatusLine      term=bold,reverse cterm=reverse ctermfg=235 ctermbg=214
Xhi StatusLineNC    term=reverse cterm=reverse ctermfg=235 ctermbg=250
Xhi CtrlPMode2      ctermbg=235 ctermfg=214
Xhi TabLine         term=underline cterm=reverse ctermfg=240 ctermbg=250
Xhi TabLineFill     term=reverse cterm=reverse ctermfg=240 ctermbg=250
Xhi TabLineSel      term=bold cterm=bold
Xhi Title           term=bold ctermfg=243
Xhi VertSplit       cterm=NONE ctermfg=235 ctermbg=NONE
Xhi Visual          term=reverse ctermbg=239
Xhi WarningMsg      term=standout ctermfg=167
Xhi WildMenu        term=standout ctermfg=0 ctermbg=11
Xhi vimCommand      ctermfg=167
X
X" C
Xhi cConditional    ctermfg=139
Xhi cRepeat         ctermfg=139
Xhi cStorageClass   ctermfg=139
Xhi cType           ctermfg=222
X
X" PHP
Xhi phpClasses      ctermfg=110
Xhi phpConditional  ctermfg=139
Xhi phpConstants    ctermfg=231
Xhi phpFunctions    ctermfg=137
Xhi phpIdentifier   ctermfg=167
Xhi phpInclude      ctermfg=167
Xhi phpKeyword      ctermfg=139
Xhi phpMemberSelector  ctermfg=250
Xhi phpMethodsVar   ctermfg=110
Xhi phpNumber       ctermfg=222
Xhi phpOperator     ctermfg=245
Xhi phpParent       ctermfg=245
Xhi phpRegion       ctermfg=109
Xhi phpRepeat       ctermfg=139
Xhi phpSpecial      ctermfg=222
Xhi phpStatement    ctermfg=139
Xhi phpStringSingle  ctermfg=253
Xhi phpType         ctermfg=114
Xhi phpVarSelector  ctermfg=173
X
X" Ruby
Xhi rubyAccess      ctermfg=222
Xhi rubyAttribute   ctermfg=109
Xhi rubyConditional  ctermfg=139
Xhi rubyConstant    ctermfg=222
Xhi rubyControl     ctermfg=139
Xhi rubyCurlyBlock  ctermfg=173
Xhi rubyException   ctermfg=139
Xhi rubyInclude     ctermfg=109
Xhi rubyInterpolationDelimiter  ctermfg=173
Xhi rubyLocalVariableOrMethod  ctermfg=173
Xhi rubyRepeat      ctermfg=139
Xhi rubyStringDelimiter  ctermfg=143
Xhi rubySymbol      ctermfg=143
X
X" Python
Xhi pythonBinNumber  ctermfg=222
Xhi pythonBoolean   ctermfg=173
Xhi pythonBytesEscape  ctermfg=173
Xhi pythonConditional  ctermfg=173
Xhi pythonDot       ctermfg=167
Xhi pythonExClass   ctermfg=173
Xhi pythonException  ctermfg=139
Xhi pythonFloat     ctermfg=222
Xhi pythonFunction  ctermfg=139
Xhi pythonHexNumber  ctermfg=222
Xhi pythonImport    ctermfg=167
Xhi pythonNumber    ctermfg=222
Xhi pythonOctNumber  ctermfg=222
Xhi pythonPreCondit  ctermfg=167
Xhi pythonRepeat    ctermfg=173
Xhi pythonStatement  ctermfg=110
Xhi pythonStrFormatting  ctermfg=114
X
X" JavaScript
Xhi jEffects        ctermfg=110
Xhi jEvents         ctermfg=110
Xhi jForms          ctermfg=114
Xhi jFunc           ctermfg=139
Xhi jManipulation   ctermfg=110
Xhi jQuery          ctermfg=222
Xhi javaScriptBoolean  ctermfg=167
Xhi javaScriptBraces  ctermfg=167
Xhi javaScriptConditional  ctermfg=139
Xhi javaScriptDOMObjects  ctermfg=114
Xhi javaScriptEndColons  ctermfg=245
Xhi javaScriptExceptions  ctermfg=110
Xhi javaScriptFuncArg  ctermfg=173
Xhi javaScriptFuncDef  ctermfg=110
Xhi javaScriptFuncKeyword  ctermfg=139
Xhi javaScriptGlobalObjects  ctermfg=109
Xhi javaScriptIdentifier  ctermfg=114
Xhi javaScriptMember  ctermfg=173
Xhi javaScriptNumber  ctermfg=222
Xhi javaScriptOpSymbols  ctermfg=173
Xhi javaScriptOperator  ctermfg=222
Xhi javaScriptParens  ctermfg=245
Xhi javaScriptRepeat  ctermfg=139
Xhi javaScriptStatement  ctermfg=139
Xhi javaScriptStringD  ctermfg=143
Xhi javaScriptStringS  ctermfg=253
X
X" HTML
Xhi htmlArg         ctermfg=167
Xhi htmlScriptTag   ctermfg=167
Xhi htmlTag         ctermfg=167
Xhi htmlTagName     ctermfg=167
X
X" Diff
Xhi diffAdded       ctermfg=143
Xhi DiffAdd         term=bold ctermfg=255 ctermbg=22
Xhi DiffChange      term=bold ctermfg=255 ctermbg=24
Xhi DiffDelete      term=bold ctermfg=235 ctermbg=9
Xhi DiffText        term=reverse cterm=bold ctermfg=255 ctermbg=124
Xhi diffRemoved     ctermfg=167
X
X" ShowMarks
Xhi ShowMarksHLl    ctermfg=173 ctermbg=235
Xhi ShowMarksHLo    ctermfg=139 ctermbg=235
Xhi ShowMarksHLu    ctermfg=222 ctermbg=235
Xhi ShowMarksHLm    ctermfg=109 ctermbg=235
X
X" Cucumber
Xhi cucumberGiven   ctermfg=109
Xhi cucumberGivenAnd  ctermfg=109
X
X" Go
Xhi goBuiltins      ctermfg=139
Xhi goComment       ctermfg=243
Xhi goComplexes     ctermfg=167
Xhi goConditional   ctermfg=139
Xhi goConstants     ctermfg=173
Xhi goDeclType      ctermfg=222
Xhi goDeclaration   ctermfg=139
Xhi goDirective     ctermfg=167
Xhi goEscapeC       ctermfg=173
Xhi goField         ctermfg=072
Xhi goFloats        ctermfg=167
Xhi goFormatSpecifier  ctermfg=114
Xhi goFunction      ctermfg=231
Xhi goMethod        ctermfg=110
Xhi goOperator      ctermfg=109
Xhi goPointerOperator ctermfg=202
Xhi goRawString     ctermfg=012
Xhi goReceiverType  ctermfg=072
Xhi goRepeat        ctermfg=111
Xhi goSignedInts    ctermfg=167
Xhi goStatement     ctermfg=139
Xhi goString        ctermfg=143
Xhi goStructDef     ctermfg=137
Xhi goTodo          ctermfg=222
Xhi goType          ctermfg=167
Xhi goTypeConstructor ctermfg=222
Xhi goTypeDecl      ctermfg=139
Xhi goTypeName      ctermfg=072
Xhi goUnsignedInts  ctermfg=167
X
X" Rust
Xhi rustAssert      ctermfg=72
Xhi rustAttribute   ctermfg=167
Xhi rustBoolean     ctermfg=173
Xhi rustCharacter   ctermfg=143
Xhi rustCommentLine ctermfg=243
Xhi rustConditional ctermfg=139
Xhi rustDecNumber   ctermfg=173
Xhi rustEnumVariant ctermfg=167
Xhi rustEscape      ctermfg=173
Xhi rustExternCrate ctermfg=222
Xhi rustFuncCall    ctermfg=110
Xhi rustFuncName    ctermfg=231
Xhi rustIdentifier  ctermfg=137
Xhi rustKeyword     ctermfg=139
Xhi rustMacro       ctermfg=72
Xhi rustModPath     ctermfg=167
Xhi rustModPathSep  ctermfg=102
Xhi rustRepeat      ctermfg=111
Xhi rustSigil       ctermfg=167
Xhi rustStorage     ctermfg=102
Xhi rustStructure   ctermfg=222
Xhi rustTrait       ctermfg=178
Xhi rustType        ctermfg=167
Xhi rustPanic       ctermfg=72
Xhi rustLifetime    ctermfg=222
X
X" Lua
Xhi luaCond         ctermfg=139
Xhi luaCondElseif   ctermfg=139
Xhi luaCondEnd      ctermfg=139
Xhi luaCondStart    ctermfg=139
Xhi luaRepeat       ctermfg=139
Xhi luaStatement    ctermfg=139
X
X" SH
Xhi shCommandSub    ctermfg=167
Xhi shConditional   ctermfg=111
Xhi shCtrlSeq       ctermfg=167
Xhi shHereDoc       ctermfg=243
Xhi shRange         ctermfg=110
Xhi shRedir         ctermfg=110
Xhi shSet           ctermfg=167
Xhi shStatement     ctermfg=139
Xhi shTestOpr       ctermfg=173
X
X" ZSH
Xhi zshConditional  ctermfg=111
Xhi zshCommands     ctermfg=167
Xhi zshVariableDef  ctermfg=137
X
X
Xset background=dark
END-of-./.vim/colors/nbari-colors.vim
echo x - ./.vim/filetype.vim
sed 's/^X//' >./.vim/filetype.vim << 'END-of-./.vim/filetype.vim'
X" adjust the path to your nginx
Xau BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif
X
X" adjust the path to your ansible playbooks
Xau BufRead,BufNewFile ~/ansible/*.yml,~/ansible/*/*.yml if &ft == '' | setfiletype ansible | endif
END-of-./.vim/filetype.vim
echo c - ./.vim/syntax
mkdir -p ./.vim/syntax > /dev/null 2>&1
echo x - ./.vim/syntax/haproxy.vim
sed 's/^X//' >./.vim/syntax/haproxy.vim << 'END-of-./.vim/syntax/haproxy.vim'
X" Vim syntax file
X" Language:    HAproxy
X" Maintainer:  Bruno Michel <brmichel@free.fr>
X" Last Change: Mar 30, 2007
X" Version:     0.3
X" URL:         http://haproxy.1wt.eu/
X
X" For version 5.x: Clear all syntax items
X" For version 6.x: Quit when a syntax file was already loaded
Xif version < 600
X	syntax clear
Xelseif exists("b:current_syntax")
X	finish
Xendif
X
Xif version >= 600
X	setlocal iskeyword=_,-,a-z,A-Z,48-57
Xelse
X	set iskeyword=_,-,a-z,A-Z,48-57
Xendif
X
X
X" Escaped chars
Xsyn match   hapEscape    +\\\(\\\| \|n\|r\|t\|#\|x\x\x\)+
X
X" Comments
Xsyn match   hapComment   /#.*$/ contains=hapTodo
Xsyn keyword hapTodo      contained TODO FIXME XXX
Xsyn case ignore
X
X" Sections
Xsyn match   hapSection   /^\s*\(global\|defaults\)/
Xsyn match   hapSection   /^\s*\(listen\|frontend\|backend\|ruleset\)/         skipwhite nextgroup=hapSectLabel
Xsyn match   hapSectLabel /\S\+/                                               skipwhite nextgroup=hapIp1 contained
Xsyn match   hapIp1       /\(\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}\)\?:\d\{1,5}/        nextgroup=hapIp2 contained
Xsyn match   hapIp2       /,\(\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}\)\?:\d\{1,5}/hs=s+1 nextgroup=hapIp2 contained
X
X" Parameters
Xsyn keyword hapParam     chroot cliexp clitimeout contimeout
Xsyn keyword hapParam     daemon debug disabled
Xsyn keyword hapParam     enabled
Xsyn keyword hapParam     fullconn
Xsyn keyword hapParam     gid grace
Xsyn keyword hapParam     maxconn monitor-uri
Xsyn keyword hapParam     nbproc noepoll nopoll
Xsyn keyword hapParam     pidfile
Xsyn keyword hapParam     quiet
Xsyn keyword hapParam     redispatch retries
Xsyn keyword hapParam     reqallow  reqdel  reqdeny  reqpass  reqtarpit  skipwhite nextgroup=hapRegexp
Xsyn keyword hapParam     reqiallow reqidel reqideny reqipass reqitarpit skipwhite nextgroup=hapRegexp
Xsyn keyword hapParam     rspdel  rspdeny    skipwhite nextgroup=hapRegexp
Xsyn keyword hapParam     rspidel rspideny   skipwhite nextgroup=hapRegexp
Xsyn keyword hapParam     reqsetbe reqisetbe skipwhite nextgroup=hapRegexp2
Xsyn keyword hapParam     reqadd reqiadd rspadd rspiadd
Xsyn keyword hapParam     server source srvexp srvtimeout
Xsyn keyword hapParam     uid ulimit-n
Xsyn keyword hapParam     reqrep reqirep rsprep rspirep    skipwhite nextgroup=hapRegexp
Xsyn keyword hapParam     errorloc errorloc302 errorloc303 skipwhite nextgroup=hapStatus
Xsyn keyword hapParam     default_backend                  skipwhite nextgroup=hapSectLabel
Xsyn keyword hapParam     appsession  skipwhite nextgroup=hapAppSess
Xsyn keyword hapParam     bind        skipwhite nextgroup=hapIp1
Xsyn keyword hapParam     balance     skipwhite nextgroup=hapBalance
Xsyn keyword hapParam     cookie      skipwhite nextgroup=hapCookieNam
Xsyn keyword hapParam     capture     skipwhite nextgroup=hapCapture
Xsyn keyword hapParam     dispatch    skipwhite nextgroup=hapIpPort
Xsyn keyword hapParam     source      skipwhite nextgroup=hapIpPort
Xsyn keyword hapParam     mode        skipwhite nextgroup=hapMode
Xsyn keyword hapParam     monitor-net skipwhite nextgroup=hapMonitorN
Xsyn keyword hapParam     option      skipwhite nextgroup=hapOption
Xsyn keyword hapParam     stats       skipwhite nextgroup=hapStats
Xsyn keyword hapParam     server      skipwhite nextgroup=hapServerN
Xsyn keyword hapParam     source      skipwhite nextgroup=hapServerEOL
Xsyn keyword hapParam     log         skipwhite nextgroup=hapGLog,hapLogIp
X
X" Options and additional parameters
Xsyn keyword hapAppSess   contained len timeout
Xsyn keyword hapBalance   contained roundrobin source
Xsyn keyword hapLen       contained len
Xsyn keyword hapGLog      contained global
Xsyn keyword hapMode      contained http tcp health
Xsyn keyword hapOption    contained abortonclose allbackups checkcache clitcpka dontlognull forceclose forwardfor
Xsyn keyword hapOption    contained httpchk httpclose httplog keepalive logasap persist srvtcpka ssl-hello-chk
Xsyn keyword hapOption    contained tcplog tcpka tcpsplice
Xsyn keyword hapStats     contained uri realm auth scope enable
Xsyn keyword hapLogFac    contained kern user mail daemon auth syslog lpr news nextgroup=hapLogLvl skipwhite
Xsyn keyword hapLogFac    contained uucp cron auth2 ftp ntp audit alert cron2  nextgroup=hapLogLvl skipwhite
Xsyn keyword hapLogFac    contained local0 local1 local2 local3 local4 local5 local6 local7 nextgroup=hapLogLvl skipwhite
Xsyn keyword hapLogLvl    contained emerg alert crit err warning notice info debug
Xsyn keyword hapCookieKey contained rewrite insert nocache postonly indirect prefix nextgroup=hapCookieKey skipwhite
Xsyn keyword hapCapture   contained cookie nextgroup=hapNameLen skipwhite
Xsyn keyword hapCapture   contained request response nextgroup=hapHeader skipwhite
Xsyn keyword hapHeader    contained header nextgroup=hapNameLen skipwhite
Xsyn keyword hapSrvKey    contained backup cookie check inter rise fall port source minconn maxconn weight usesrc
Xsyn match   hapStatus    contained /\d\{3}/
Xsyn match   hapMonitorN  contained /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}\(\/\d\{1,2}\)\?/
Xsyn match   hapLogIp     contained /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}/   nextgroup=hapLogFac skipwhite
Xsyn match   hapIpPort    contained /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}:\d\{1,5}/
Xsyn match   hapServerAd  contained /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}\(:[+-]\?\d\{1,5}\)\?/ nextgroup=hapSrvEOL skipwhite
Xsyn match   hapNameLen   contained /\S\+/ nextgroup=hapLen       skipwhite
Xsyn match   hapCookieNam contained /\S\+/ nextgroup=hapCookieKey skipwhite
Xsyn match   hapServerN   contained /\S\+/ nextgroup=hapServerAd  skipwhite
Xsyn region  hapSrvEOL    contained start=/\S/ end=/$/ contains=hapSrvKey
Xsyn region  hapRegexp    contained start=/\S/ end=/\(\s\|$\)/ skip=/\\ / nextgroup=hapRegRepl skipwhite
Xsyn region  hapRegRepl   contained start=/\S/ end=/$/ contains=hapComment,hapEscape,hapBackRef
Xsyn region  hapRegexp2   contained start=/\S/ end=/\(\s\|$\)/ skip=/\\ / nextgroup=hapSectLabel skipwhite
Xsyn match   hapBackref   contained /\\\d/
X
X
X" Transparent is a Vim keyword, so we need a regexp to match it
Xsyn match   hapParam     +transparent+
Xsyn match   hapOption    +transparent+ contained
X
X
X" Define the default highlighting.
X" For version 5.7 and earlier: only when not done already
X" For version 5.8 and later: only when an item doesn't have highlighting yet
Xif version < 508
X	command -nargs=+ HiLink hi link <args>
Xelse
X	command -nargs=+ HiLink hi def link <args>
Xendif
X
XHiLink      hapEscape    SpecialChar
XHiLink      hapBackRef   Special
XHiLink      hapComment   Comment
XHiLink      hapTodo      Todo
XHiLink      hapSection   Constant
XHiLink      hapSectLabel Identifier
XHiLink      hapParam     Keyword
X
XHiLink      hapRegexp    String
XHiLink      hapRegexp2   hapRegexp
XHiLink      hapIp1       Number
XHiLink      hapIp2       hapIp1
XHiLink      hapLogIp     hapIp1
XHiLink      hapIpPort    hapIp1
XHiLink      hapMonitorN  hapIp1
XHiLink      hapServerAd  hapIp1
XHiLink      hapStatus    Number
X
XHiLink      hapOption    Operator
XHiLink      hapAppSess   hapOption
XHiLink      hapBalance   hapOption
XHiLink      hapCapture   hapOption
XHiLink      hapCookieKey hapOption
XHiLink      hapHeader    hapOption
XHiLink      hapGLog      hapOption
XHiLink      hapLogFac    hapOption
XHiLink      hapLogLvl    hapOption
XHiLink      hapMode      hapOption
XHiLink      hapStats     hapOption
XHiLink      hapLen       hapOption
XHiLink      hapSrvKey    hapOption
X
X
Xdelcommand HiLink
X
Xlet b:current_syntax = "haproxy"
X" vim: ts=8
END-of-./.vim/syntax/haproxy.vim
echo x - ./.vim/syntax/jquery.vim
sed 's/^X//' >./.vim/syntax/jquery.vim << 'END-of-./.vim/syntax/jquery.vim'
X" Vim syntax file
X" Language:    jQuery
X" Maintainer:  Bruno Michel <brmichel@free.fr>
X" Last Change: May 28th, 2011
X" Version:     0.5.2
X" URL:         http://api.jquery.com/
X
Xif version < 600
X  syntax clear
Xelseif exists("b:current_syntax")
X  finish
Xendif
X
Xif !exists("main_syntax")
X  let main_syntax = 'javascript'
Xendif
X
Xru! syntax/javascript.vim
Xunlet b:current_syntax
X
Xsyn match   jQuery          /jQuery\|\$/
X
X
Xsyn match   jFunc           /\.\w\+(\@=/ contains=@jFunctions
X
Xsyn cluster jFunctions      contains=jAjax,jAttributes,jCore,jCSS,jData,jDeferred,jDimensions,jEffects,jEvents,jManipulation,jMiscellaneous,jOffset,jProperties,jTraversing,jUtilities
Xsyn keyword jAjax           contained ajaxComplete ajaxError ajaxSend ajaxStart ajaxStop ajaxSuccess
Xsyn keyword jAjax           contained param serialize serializeArray
Xsyn keyword jAjax           contained ajax ajaxPrefilter ajaxSetup ajaxSettings ajaxTransport
Xsyn keyword jAjax           contained get getJSON getScript load post
Xsyn keyword jAttributes     contained addClass attr hasClass prop removeAttr removeClass removeProp toggleClass val
Xsyn keyword jCore           contained holdReady noConflict sub when
Xsyn keyword jCSS            contained css cssHooks
Xsyn keyword jData           contained clearQueue data dequeue hasData queue removeData
Xsyn keyword jDeferred       contained Deferred always done fail isRejected isResolved pipe promise reject rejectWith resolved resolveWith then
Xsyn keyword jDimensions     contained height innerHeight innerWidth outerHeight outerWidth width
Xsyn keyword jEffects        contained hide show toggle
Xsyn keyword jEffects        contained animate delay stop
Xsyn keyword jEffects        contained fadeIn fadeOut fadeTo fadeToggle
Xsyn keyword jEffects        contained slideDown slideToggle slideUp
Xsyn keyword jEvents         contained error resize scroll
Xsyn keyword jEvents         contained ready unload
Xsyn keyword jEvents         contained bind delegate die live one proxy trigger triggerHandler unbind undelegate
Xsyn keyword jEvents         contained Event currentTarget isDefaultPrevented isImmediatePropagationStopped isPropagationStopped namespace pageX pageY preventDefault relatedTarget result stopImmediatePropagation stopPropagation target timeStamp which
Xsyn keyword jEvents         contained blur change focus select submit
Xsyn keyword jEvents         contained focusin focusout keydown keypress keyup
Xsyn keyword jEvents         contained click dblclick hover mousedown mouseenter mouseleave mousemove mouseout mouseover mouseup
Xsyn keyword jManipulation   contained clone
Xsyn keyword jManipulation   contained unwrap wrap wrapAll wrapInner
Xsyn keyword jManipulation   contained append appendTo html preprend prependTo text
Xsyn keyword jManipulation   contained after before insertAfter insertBefore
Xsyn keyword jManipulation   contained detach empty remove
Xsyn keyword jManipulation   contained replaceAll replaceWith
Xsyn keyword jMiscellaneous  contained index size toArray
Xsyn keyword jOffset         contained offset offsetParent position scrollTop scrollLeft
Xsyn keyword jProperties     contained browser context fx.interval fx.off length selector support
Xsyn keyword jTraversing     contained eq filter first has is last map not slice
Xsyn keyword jTraversing     contained add andSelf contents end
Xsyn keyword jTraversing     contained children closest find next nextAll nextUntil parent parents parentsUntil prev prevAll prevUntil siblings
Xsyn keyword jUtilities      contained each extend globalEval grep inArray isArray isEmptyObject isFunction isPlainObject isWindow isXMLDoc makeArray merge noop now parseJSON parseXML trim type unique
X
X
Xsyn region  javaScriptStringD          start=+"+  skip=+\\\\\|\\"+  end=+"\|$+  contains=javaScriptSpecial,@htmlPreproc,@jSelectors
Xsyn region  javaScriptStringS          start=+'+  skip=+\\\\\|\\'+  end=+'\|$+  contains=javaScriptSpecial,@htmlPreproc,@jSelectors
X
Xsyn cluster jSelectors      contains=jId,jClass,jOperators,jBasicFilters,jContentFilters,jVisibility,jChildFilters,jForms,jFormFilters
Xsyn match   jId             contained /#[0-9A-Za-z_\-]\+/
Xsyn match   jClass          contained /\.[0-9A-Za-z_\-]\+/
Xsyn match   jOperators      contained /*\|>\|+\|-\|\~/
Xsyn match   jBasicFilters   contained /:\(animated\|eq\|even\|first\|focus\|gt\|header\|last\|lt\|not\|odd\)/
Xsyn match   jChildFilters   contained /:\(first\|last\|nth\|only\)-child/
Xsyn match   jContentFilters contained /:\(contains\|empty\|has\|parent\)/
Xsyn match   jForms          contained /:\(button\|checkbox\|checked\|disabled\|enabled\|file\|image\|input\|password\|radio\|reset\|selected\|submit\|text\)/
Xsyn match   jVisibility     contained /:\(hidden\|visible\)/
X
X
X" Define the default highlighting.
X" For version 5.7 and earlier: only when not done already
X" For version 5.8 and later: only when an item doesn't have highlighting yet
Xif version >= 508 || !exists("did_lisp_syntax_inits")
X  if version < 508
X    let did_lisp_syntax_inits = 1
X    command -nargs=+ HiLink hi link <args>
X  else
X    command -nargs=+ HiLink hi def link <args>
X  endif
X
X  HiLink jQuery          Constant
X
X  HiLink jAjax           Function
X  HiLink jAttributes     Function
X  HiLink jCore           Function
X  HiLink jCSS            Function
X  HiLink jData           Function
X  HiLink jDeferred       Function
X  HiLink jDimensions     Function
X  HiLink jEffects        Function
X  HiLink jEvents         Function
X  HiLink jManipulation   Function
X  HiLink jMiscellaneous  Function
X  HiLink jOffset         Function
X  HiLink jProperties     Function
X  HiLink jTraversing     Function
X  HiLink jUtilities      Function
X
X  HiLink jId             Identifier
X  HiLink jClass          Constant
X  HiLink jOperators      Special
X  HiLink jBasicFilters   Statement
X  HiLink jContentFilters Statement
X  HiLink jVisibility     Statement
X  HiLink jChildFilters   Statement
X  HiLink jForms          Statement
X  HiLink jFormFilters    Statement
X
X  delcommand HiLink
Xendif
X
X
Xlet b:current_syntax = 'jquery'
END-of-./.vim/syntax/jquery.vim
echo x - ./.vim/syntax/nginx.vim
sed 's/^X//' >./.vim/syntax/nginx.vim << 'END-of-./.vim/syntax/nginx.vim'
X" Vim syntax file
X" Language: nginx.conf
X
Xif exists("b:current_syntax")
X  finish
Xend
X
Xsetlocal iskeyword+=.
Xsetlocal iskeyword+=/
Xsetlocal iskeyword+=:
X
Xsyn match ngxVariable '\$\w\w*'
Xsyn match ngxVariableBlock '\$\w\w*' contained
Xsyn match ngxVariableString '\$\w\w*' contained
Xsyn region ngxBlock start=+^+ end=+{+ contains=ngxComment,ngxDirectiveBlock,ngxVariableBlock,ngxString oneline
Xsyn region ngxString start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=ngxVariableString oneline
Xsyn region ngxString start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=ngxVariableString oneline
Xsyn match ngxComment ' *#.*$'
X
Xsyn keyword ngxBoolean on
Xsyn keyword ngxBoolean off
X
Xsyn keyword ngxDirectiveBlock http         contained
Xsyn keyword ngxDirectiveBlock mail         contained
Xsyn keyword ngxDirectiveBlock events       contained
Xsyn keyword ngxDirectiveBlock server       contained
Xsyn keyword ngxDirectiveBlock types        contained
Xsyn keyword ngxDirectiveBlock location     contained
Xsyn keyword ngxDirectiveBlock upstream     contained
Xsyn keyword ngxDirectiveBlock charset_map  contained
Xsyn keyword ngxDirectiveBlock limit_except contained
Xsyn keyword ngxDirectiveBlock if           contained
Xsyn keyword ngxDirectiveBlock geo          contained
Xsyn keyword ngxDirectiveBlock map          contained
X
Xsyn keyword ngxDirectiveImportant include
Xsyn keyword ngxDirectiveImportant root
Xsyn keyword ngxDirectiveImportant server
Xsyn keyword ngxDirectiveImportant server_name
Xsyn keyword ngxDirectiveImportant listen
Xsyn keyword ngxDirectiveImportant internal
Xsyn keyword ngxDirectiveImportant proxy_pass
Xsyn keyword ngxDirectiveImportant memcached_pass
Xsyn keyword ngxDirectiveImportant fastcgi_pass
Xsyn keyword ngxDirectiveImportant try_files
X
Xsyn keyword ngxDirectiveControl break
Xsyn keyword ngxDirectiveControl return
Xsyn keyword ngxDirectiveControl rewrite
Xsyn keyword ngxDirectiveControl set
X
Xsyn keyword ngxDirectiveError error_page
Xsyn keyword ngxDirectiveError post_action
X
Xsyn keyword ngxDirectiveDeprecated connections
Xsyn keyword ngxDirectiveDeprecated imap
Xsyn keyword ngxDirectiveDeprecated open_file_cache_retest
Xsyn keyword ngxDirectiveDeprecated optimize_server_names
Xsyn keyword ngxDirectiveDeprecated satisfy_any
X
Xsyn keyword ngxDirective accept_mutex
Xsyn keyword ngxDirective accept_mutex_delay
Xsyn keyword ngxDirective access_log
Xsyn keyword ngxDirective add_after_body
Xsyn keyword ngxDirective add_before_body
Xsyn keyword ngxDirective add_header
Xsyn keyword ngxDirective addition_types
Xsyn keyword ngxDirective aio
Xsyn keyword ngxDirective alias
Xsyn keyword ngxDirective allow
Xsyn keyword ngxDirective ancient_browser
Xsyn keyword ngxDirective ancient_browser_value
Xsyn keyword ngxDirective auth_basic
Xsyn keyword ngxDirective auth_basic_user_file
Xsyn keyword ngxDirective auth_http
Xsyn keyword ngxDirective auth_http_header
Xsyn keyword ngxDirective auth_http_timeout
Xsyn keyword ngxDirective autoindex
Xsyn keyword ngxDirective autoindex_exact_size
Xsyn keyword ngxDirective autoindex_localtime
Xsyn keyword ngxDirective charset
Xsyn keyword ngxDirective charset_types
Xsyn keyword ngxDirective client_body_buffer_size
Xsyn keyword ngxDirective client_body_in_file_only
Xsyn keyword ngxDirective client_body_in_single_buffer
Xsyn keyword ngxDirective client_body_temp_path
Xsyn keyword ngxDirective client_body_timeout
Xsyn keyword ngxDirective client_header_buffer_size
Xsyn keyword ngxDirective client_header_timeout
Xsyn keyword ngxDirective client_max_body_size
Xsyn keyword ngxDirective connection_pool_size
Xsyn keyword ngxDirective create_full_put_path
Xsyn keyword ngxDirective daemon
Xsyn keyword ngxDirective dav_access
Xsyn keyword ngxDirective dav_methods
Xsyn keyword ngxDirective debug_connection
Xsyn keyword ngxDirective debug_points
Xsyn keyword ngxDirective default_type
Xsyn keyword ngxDirective degradation
Xsyn keyword ngxDirective degrade
Xsyn keyword ngxDirective deny
Xsyn keyword ngxDirective devpoll_changes
Xsyn keyword ngxDirective devpoll_events
Xsyn keyword ngxDirective directio
Xsyn keyword ngxDirective directio_alignment
Xsyn keyword ngxDirective empty_gif
Xsyn keyword ngxDirective env
Xsyn keyword ngxDirective epoll_events
Xsyn keyword ngxDirective error_log
Xsyn keyword ngxDirective eventport_events
Xsyn keyword ngxDirective expires
Xsyn keyword ngxDirective fastcgi_bind
Xsyn keyword ngxDirective fastcgi_buffer_size
Xsyn keyword ngxDirective fastcgi_buffers
Xsyn keyword ngxDirective fastcgi_busy_buffers_size
Xsyn keyword ngxDirective fastcgi_cache
Xsyn keyword ngxDirective fastcgi_cache_key
Xsyn keyword ngxDirective fastcgi_cache_methods
Xsyn keyword ngxDirective fastcgi_cache_min_uses
Xsyn keyword ngxDirective fastcgi_cache_path
Xsyn keyword ngxDirective fastcgi_cache_use_stale
Xsyn keyword ngxDirective fastcgi_cache_valid
Xsyn keyword ngxDirective fastcgi_catch_stderr
Xsyn keyword ngxDirective fastcgi_connect_timeout
Xsyn keyword ngxDirective fastcgi_hide_header
Xsyn keyword ngxDirective fastcgi_ignore_client_abort
Xsyn keyword ngxDirective fastcgi_ignore_headers
Xsyn keyword ngxDirective fastcgi_index
Xsyn keyword ngxDirective fastcgi_intercept_errors
Xsyn keyword ngxDirective fastcgi_max_temp_file_size
Xsyn keyword ngxDirective fastcgi_next_upstream
Xsyn keyword ngxDirective fastcgi_param
Xsyn keyword ngxDirective fastcgi_pass_header
Xsyn keyword ngxDirective fastcgi_pass_request_body
Xsyn keyword ngxDirective fastcgi_pass_request_headers
Xsyn keyword ngxDirective fastcgi_read_timeout
Xsyn keyword ngxDirective fastcgi_send_lowat
Xsyn keyword ngxDirective fastcgi_send_timeout
Xsyn keyword ngxDirective fastcgi_split_path_info
Xsyn keyword ngxDirective fastcgi_store
Xsyn keyword ngxDirective fastcgi_store_access
Xsyn keyword ngxDirective fastcgi_temp_file_write_size
Xsyn keyword ngxDirective fastcgi_temp_path
Xsyn keyword ngxDirective fastcgi_upstream_fail_timeout
Xsyn keyword ngxDirective fastcgi_upstream_max_fails
Xsyn keyword ngxDirective flv
Xsyn keyword ngxDirective geoip_city
Xsyn keyword ngxDirective geoip_country
Xsyn keyword ngxDirective google_perftools_profiles
Xsyn keyword ngxDirective gzip
Xsyn keyword ngxDirective gzip_buffers
Xsyn keyword ngxDirective gzip_comp_level
Xsyn keyword ngxDirective gzip_disable
Xsyn keyword ngxDirective gzip_hash
Xsyn keyword ngxDirective gzip_http_version
Xsyn keyword ngxDirective gzip_min_length
Xsyn keyword ngxDirective gzip_no_buffer
Xsyn keyword ngxDirective gzip_proxied
Xsyn keyword ngxDirective gzip_static
Xsyn keyword ngxDirective gzip_types
Xsyn keyword ngxDirective gzip_vary
Xsyn keyword ngxDirective gzip_window
Xsyn keyword ngxDirective if_modified_since
Xsyn keyword ngxDirective ignore_invalid_headers
Xsyn keyword ngxDirective image_filter
Xsyn keyword ngxDirective image_filter_buffer
Xsyn keyword ngxDirective image_filter_jpeg_quality
Xsyn keyword ngxDirective image_filter_transparency
Xsyn keyword ngxDirective imap_auth
Xsyn keyword ngxDirective imap_capabilities
Xsyn keyword ngxDirective imap_client_buffer
Xsyn keyword ngxDirective index
Xsyn keyword ngxDirective ip_hash
Xsyn keyword ngxDirective keepalive_requests
Xsyn keyword ngxDirective keepalive_timeout
Xsyn keyword ngxDirective kqueue_changes
Xsyn keyword ngxDirective kqueue_events
Xsyn keyword ngxDirective large_client_header_buffers
Xsyn keyword ngxDirective limit_conn
Xsyn keyword ngxDirective limit_conn_log_level
Xsyn keyword ngxDirective limit_rate
Xsyn keyword ngxDirective limit_rate_after
Xsyn keyword ngxDirective limit_req
Xsyn keyword ngxDirective limit_req_log_level
Xsyn keyword ngxDirective limit_req_zone
Xsyn keyword ngxDirective limit_zone
Xsyn keyword ngxDirective lingering_time
Xsyn keyword ngxDirective lingering_timeout
Xsyn keyword ngxDirective lock_file
Xsyn keyword ngxDirective log_format
Xsyn keyword ngxDirective log_not_found
Xsyn keyword ngxDirective log_subrequest
Xsyn keyword ngxDirective map_hash_bucket_size
Xsyn keyword ngxDirective map_hash_max_size
Xsyn keyword ngxDirective master_process
Xsyn keyword ngxDirective memcached_bind
Xsyn keyword ngxDirective memcached_buffer_size
Xsyn keyword ngxDirective memcached_connect_timeout
Xsyn keyword ngxDirective memcached_next_upstream
Xsyn keyword ngxDirective memcached_read_timeout
Xsyn keyword ngxDirective memcached_send_timeout
Xsyn keyword ngxDirective memcached_upstream_fail_timeout
Xsyn keyword ngxDirective memcached_upstream_max_fails
Xsyn keyword ngxDirective merge_slashes
Xsyn keyword ngxDirective min_delete_depth
Xsyn keyword ngxDirective modern_browser
Xsyn keyword ngxDirective modern_browser_value
Xsyn keyword ngxDirective msie_padding
Xsyn keyword ngxDirective msie_refresh
Xsyn keyword ngxDirective multi_accept
Xsyn keyword ngxDirective open_file_cache
Xsyn keyword ngxDirective open_file_cache_errors
Xsyn keyword ngxDirective open_file_cache_events
Xsyn keyword ngxDirective open_file_cache_min_uses
Xsyn keyword ngxDirective open_file_cache_valid
Xsyn keyword ngxDirective open_log_file_cache
Xsyn keyword ngxDirective output_buffers
Xsyn keyword ngxDirective override_charset
Xsyn keyword ngxDirective perl
Xsyn keyword ngxDirective perl_modules
Xsyn keyword ngxDirective perl_require
Xsyn keyword ngxDirective perl_set
Xsyn keyword ngxDirective pid
Xsyn keyword ngxDirective pop3_auth
Xsyn keyword ngxDirective pop3_capabilities
Xsyn keyword ngxDirective port_in_redirect
Xsyn keyword ngxDirective postpone_gzipping
Xsyn keyword ngxDirective postpone_output
Xsyn keyword ngxDirective protocol
Xsyn keyword ngxDirective proxy
Xsyn keyword ngxDirective proxy_bind
Xsyn keyword ngxDirective proxy_buffer
Xsyn keyword ngxDirective proxy_buffer_size
Xsyn keyword ngxDirective proxy_buffering
Xsyn keyword ngxDirective proxy_buffers
Xsyn keyword ngxDirective proxy_busy_buffers_size
Xsyn keyword ngxDirective proxy_cache
Xsyn keyword ngxDirective proxy_cache_key
Xsyn keyword ngxDirective proxy_cache_methods
Xsyn keyword ngxDirective proxy_cache_min_uses
Xsyn keyword ngxDirective proxy_cache_path
Xsyn keyword ngxDirective proxy_cache_use_stale
Xsyn keyword ngxDirective proxy_cache_valid
Xsyn keyword ngxDirective proxy_connect_timeout
Xsyn keyword ngxDirective proxy_headers_hash_bucket_size
Xsyn keyword ngxDirective proxy_headers_hash_max_size
Xsyn keyword ngxDirective proxy_hide_header
Xsyn keyword ngxDirective proxy_ignore_client_abort
Xsyn keyword ngxDirective proxy_ignore_headers
Xsyn keyword ngxDirective proxy_intercept_errors
Xsyn keyword ngxDirective proxy_max_temp_file_size
Xsyn keyword ngxDirective proxy_method
Xsyn keyword ngxDirective proxy_next_upstream
Xsyn keyword ngxDirective proxy_pass_error_message
Xsyn keyword ngxDirective proxy_pass_header
Xsyn keyword ngxDirective proxy_pass_request_body
Xsyn keyword ngxDirective proxy_pass_request_headers
Xsyn keyword ngxDirective proxy_read_timeout
Xsyn keyword ngxDirective proxy_redirect
Xsyn keyword ngxDirective proxy_send_lowat
Xsyn keyword ngxDirective proxy_send_timeout
Xsyn keyword ngxDirective proxy_set_body
Xsyn keyword ngxDirective proxy_set_header
Xsyn keyword ngxDirective proxy_ssl_session_reuse
Xsyn keyword ngxDirective proxy_store
Xsyn keyword ngxDirective proxy_store_access
Xsyn keyword ngxDirective proxy_temp_file_write_size
Xsyn keyword ngxDirective proxy_temp_path
Xsyn keyword ngxDirective proxy_timeout
Xsyn keyword ngxDirective proxy_upstream_fail_timeout
Xsyn keyword ngxDirective proxy_upstream_max_fails
Xsyn keyword ngxDirective random_index
Xsyn keyword ngxDirective read_ahead
Xsyn keyword ngxDirective real_ip_header
Xsyn keyword ngxDirective recursive_error_pages
Xsyn keyword ngxDirective request_pool_size
Xsyn keyword ngxDirective reset_timedout_connection
Xsyn keyword ngxDirective resolver
Xsyn keyword ngxDirective resolver_timeout
Xsyn keyword ngxDirective rewrite_log
Xsyn keyword ngxDirective rtsig_overflow_events
Xsyn keyword ngxDirective rtsig_overflow_test
Xsyn keyword ngxDirective rtsig_overflow_threshold
Xsyn keyword ngxDirective rtsig_signo
Xsyn keyword ngxDirective satisfy
Xsyn keyword ngxDirective secure_link_secret
Xsyn keyword ngxDirective send_lowat
Xsyn keyword ngxDirective send_timeout
Xsyn keyword ngxDirective sendfile
Xsyn keyword ngxDirective sendfile_max_chunk
Xsyn keyword ngxDirective server_name_in_redirect
Xsyn keyword ngxDirective server_names_hash_bucket_size
Xsyn keyword ngxDirective server_names_hash_max_size
Xsyn keyword ngxDirective server_tokens
Xsyn keyword ngxDirective set_real_ip_from
Xsyn keyword ngxDirective smtp_auth
Xsyn keyword ngxDirective smtp_capabilities
Xsyn keyword ngxDirective smtp_client_buffer
Xsyn keyword ngxDirective smtp_greeting_delay
Xsyn keyword ngxDirective so_keepalive
Xsyn keyword ngxDirective source_charset
Xsyn keyword ngxDirective ssi
Xsyn keyword ngxDirective ssi_ignore_recycled_buffers
Xsyn keyword ngxDirective ssi_min_file_chunk
Xsyn keyword ngxDirective ssi_silent_errors
Xsyn keyword ngxDirective ssi_types
Xsyn keyword ngxDirective ssi_value_length
Xsyn keyword ngxDirective ssl
Xsyn keyword ngxDirective ssl_certificate
Xsyn keyword ngxDirective ssl_certificate_key
Xsyn keyword ngxDirective ssl_ciphers
Xsyn keyword ngxDirective ssl_client_certificate
Xsyn keyword ngxDirective ssl_crl
Xsyn keyword ngxDirective ssl_dhparam
Xsyn keyword ngxDirective ssl_engine
Xsyn keyword ngxDirective ssl_prefer_server_ciphers
Xsyn keyword ngxDirective ssl_protocols
Xsyn keyword ngxDirective ssl_session_cache
Xsyn keyword ngxDirective ssl_session_timeout
Xsyn keyword ngxDirective ssl_verify_client
Xsyn keyword ngxDirective ssl_verify_depth
Xsyn keyword ngxDirective starttls
Xsyn keyword ngxDirective stub_status
Xsyn keyword ngxDirective sub_filter
Xsyn keyword ngxDirective sub_filter_once
Xsyn keyword ngxDirective sub_filter_types
Xsyn keyword ngxDirective tcp_nodelay
Xsyn keyword ngxDirective tcp_nopush
Xsyn keyword ngxDirective thread_stack_size
Xsyn keyword ngxDirective timeout
Xsyn keyword ngxDirective timer_resolution
Xsyn keyword ngxDirective types_hash_bucket_size
Xsyn keyword ngxDirective types_hash_max_size
Xsyn keyword ngxDirective underscores_in_headers
Xsyn keyword ngxDirective uninitialized_variable_warn
Xsyn keyword ngxDirective use
Xsyn keyword ngxDirective user
Xsyn keyword ngxDirective userid
Xsyn keyword ngxDirective userid_domain
Xsyn keyword ngxDirective userid_expires
Xsyn keyword ngxDirective userid_mark
Xsyn keyword ngxDirective userid_name
Xsyn keyword ngxDirective userid_p3p
Xsyn keyword ngxDirective userid_path
Xsyn keyword ngxDirective userid_service
Xsyn keyword ngxDirective valid_referers
Xsyn keyword ngxDirective variables_hash_bucket_size
Xsyn keyword ngxDirective variables_hash_max_size
Xsyn keyword ngxDirective worker_connections
Xsyn keyword ngxDirective worker_cpu_affinity
Xsyn keyword ngxDirective worker_priority
Xsyn keyword ngxDirective worker_processes
Xsyn keyword ngxDirective worker_rlimit_core
Xsyn keyword ngxDirective worker_rlimit_nofile
Xsyn keyword ngxDirective worker_rlimit_sigpending
Xsyn keyword ngxDirective worker_threads
Xsyn keyword ngxDirective working_directory
Xsyn keyword ngxDirective xclient
Xsyn keyword ngxDirective xml_entities
Xsyn keyword ngxDirective xslt_stylesheet
Xsyn keyword ngxDirective xslt_types
X
X" 3rd party module list:
X" http://wiki.nginx.org/Nginx3rdPartyModules
X
X" Accept Language Module <http://wiki.nginx.org/NginxAcceptLanguageModule>
X" Parses the Accept-Language header and gives the most suitable locale from a list of supported locales.
Xsyn keyword ngxDirectiveThirdParty set_from_accept_language
X
X" Access Key Module <http://wiki.nginx.org/NginxHttpAccessKeyModule>
X" Denies access unless the request URL contains an access key. 
Xsyn keyword ngxDirectiveThirdParty accesskey
Xsyn keyword ngxDirectiveThirdParty accesskey_arg
Xsyn keyword ngxDirectiveThirdParty accesskey_hashmethod
Xsyn keyword ngxDirectiveThirdParty accesskey_signature
X
X" Auth PAM Module <http://web.iti.upv.es/~sto/nginx/>
X" HTTP Basic Authentication using PAM.
Xsyn keyword ngxDirectiveThirdParty auth_pam
Xsyn keyword ngxDirectiveThirdParty auth_pam_service_name
X
X" Cache Purge Module <http://labs.frickle.com/nginx_ngx_cache_purge/>
X" Module adding ability to purge content from FastCGI and proxy caches.
Xsyn keyword ngxDirectiveThirdParty fastcgi_cache_purge
Xsyn keyword ngxDirectiveThirdParty proxy_cache_purge
X
X" Chunkin Module <http://wiki.nginx.org/NginxHttpChunkinModule>
X" HTTP 1.1 chunked-encoding request body support for Nginx.
Xsyn keyword ngxDirectiveThirdParty chunkin
Xsyn keyword ngxDirectiveThirdParty chunkin_keepalive
Xsyn keyword ngxDirectiveThirdParty chunkin_max_chunks_per_buf
Xsyn keyword ngxDirectiveThirdParty chunkin_resume
X
X" Circle GIF Module <http://wiki.nginx.org/NginxHttpCircleGifModule>
X" Generates simple circle images with the colors and size specified in the URL.
Xsyn keyword ngxDirectiveThirdParty circle_gif
Xsyn keyword ngxDirectiveThirdParty circle_gif_max_radius
Xsyn keyword ngxDirectiveThirdParty circle_gif_min_radius
Xsyn keyword ngxDirectiveThirdParty circle_gif_step_radius
X
X" Drizzle Module <http://github.com/chaoslawful/drizzle-nginx-module>
X" Make nginx talk directly to mysql, drizzle, and sqlite3 by libdrizzle.
Xsyn keyword ngxDirectiveThirdParty drizzle_connect_timeout
Xsyn keyword ngxDirectiveThirdParty drizzle_dbname
Xsyn keyword ngxDirectiveThirdParty drizzle_keepalive
Xsyn keyword ngxDirectiveThirdParty drizzle_module_header
Xsyn keyword ngxDirectiveThirdParty drizzle_pass
Xsyn keyword ngxDirectiveThirdParty drizzle_query
Xsyn keyword ngxDirectiveThirdParty drizzle_recv_cols_timeout
Xsyn keyword ngxDirectiveThirdParty drizzle_recv_rows_timeout
Xsyn keyword ngxDirectiveThirdParty drizzle_send_query_timeout
Xsyn keyword ngxDirectiveThirdParty drizzle_server
X
X" Echo Module <http://wiki.nginx.org/NginxHttpEchoModule>
X" Brings 'echo', 'sleep', 'time', 'exec' and more shell-style goodies to Nginx config file.
Xsyn keyword ngxDirectiveThirdParty echo
Xsyn keyword ngxDirectiveThirdParty echo_after_body
Xsyn keyword ngxDirectiveThirdParty echo_before_body
Xsyn keyword ngxDirectiveThirdParty echo_blocking_sleep
Xsyn keyword ngxDirectiveThirdParty echo_duplicate
Xsyn keyword ngxDirectiveThirdParty echo_end
Xsyn keyword ngxDirectiveThirdParty echo_exec
Xsyn keyword ngxDirectiveThirdParty echo_flush
Xsyn keyword ngxDirectiveThirdParty echo_foreach_split
Xsyn keyword ngxDirectiveThirdParty echo_location
Xsyn keyword ngxDirectiveThirdParty echo_location_async
Xsyn keyword ngxDirectiveThirdParty echo_read_request_body
Xsyn keyword ngxDirectiveThirdParty echo_request_body
Xsyn keyword ngxDirectiveThirdParty echo_reset_timer
Xsyn keyword ngxDirectiveThirdParty echo_sleep
Xsyn keyword ngxDirectiveThirdParty echo_subrequest
Xsyn keyword ngxDirectiveThirdParty echo_subrequest_async
X
X" Events Module <http://docs.dutov.org/nginx_modules_events_en.html>
X" Privides options for start/stop events.
Xsyn keyword ngxDirectiveThirdParty on_start
Xsyn keyword ngxDirectiveThirdParty on_stop
X
X" EY Balancer Module <http://github.com/ry/nginx-ey-balancer>
X" Adds a request queue to Nginx that allows the limiting of concurrent requests passed to the upstream.
Xsyn keyword ngxDirectiveThirdParty max_connections
Xsyn keyword ngxDirectiveThirdParty max_connections_max_queue_length
Xsyn keyword ngxDirectiveThirdParty max_connections_queue_timeout
X
X" Fancy Indexes Module <https://connectical.com/projects/ngx-fancyindex/wiki>
X" Like the built-in autoindex module, but fancier.
Xsyn keyword ngxDirectiveThirdParty fancyindex
Xsyn keyword ngxDirectiveThirdParty fancyindex_exact_size
Xsyn keyword ngxDirectiveThirdParty fancyindex_footer
Xsyn keyword ngxDirectiveThirdParty fancyindex_header
Xsyn keyword ngxDirectiveThirdParty fancyindex_localtime
Xsyn keyword ngxDirectiveThirdParty fancyindex_readme
Xsyn keyword ngxDirectiveThirdParty fancyindex_readme_mode
X
X" GeoIP Module (DEPRECATED) <http://wiki.nginx.org/NginxHttp3rdPartyGeoIPModule>
X" Country code lookups via the MaxMind GeoIP API.
Xsyn keyword ngxDirectiveThirdParty geoip_country_file
X
X" Headers More Module <http://wiki.nginx.org/NginxHttpHeadersMoreModule>
X" Set and clear input and output headers...more than "add"!
Xsyn keyword ngxDirectiveThirdParty more_clear_headers
Xsyn keyword ngxDirectiveThirdParty more_clear_input_headers
Xsyn keyword ngxDirectiveThirdParty more_set_headers
Xsyn keyword ngxDirectiveThirdParty more_set_input_headers
X
X" HTTP Push Module <http://pushmodule.slact.net/>
X" Turn Nginx into an adept long-polling HTTP Push (Comet) server.
Xsyn keyword ngxDirectiveThirdParty push_buffer_size
Xsyn keyword ngxDirectiveThirdParty push_listener
Xsyn keyword ngxDirectiveThirdParty push_message_timeout
Xsyn keyword ngxDirectiveThirdParty push_queue_messages
Xsyn keyword ngxDirectiveThirdParty push_sender
X
X" HTTP Redis Module <http://people.FreeBSD.ORG/~osa/ngx_http_redis-0.3.1.tar.gz>>
X" Redis <http://code.google.com/p/redis/> support.>
Xsyn keyword ngxDirectiveThirdParty redis_bind
Xsyn keyword ngxDirectiveThirdParty redis_buffer_size
Xsyn keyword ngxDirectiveThirdParty redis_connect_timeout
Xsyn keyword ngxDirectiveThirdParty redis_next_upstream
Xsyn keyword ngxDirectiveThirdParty redis_pass
Xsyn keyword ngxDirectiveThirdParty redis_read_timeout
Xsyn keyword ngxDirectiveThirdParty redis_send_timeout
X
X" HTTP JavaScript Module <http://wiki.github.com/kung-fu-tzu/ngx_http_js_module>
X" Embedding SpiderMonkey. Nearly full port on Perl module.
Xsyn keyword ngxDirectiveThirdParty js
Xsyn keyword ngxDirectiveThirdParty js_filter
Xsyn keyword ngxDirectiveThirdParty js_filter_types
Xsyn keyword ngxDirectiveThirdParty js_load
Xsyn keyword ngxDirectiveThirdParty js_maxmem
Xsyn keyword ngxDirectiveThirdParty js_require
Xsyn keyword ngxDirectiveThirdParty js_set
Xsyn keyword ngxDirectiveThirdParty js_utf8
X
X" Log Request Speed <http://wiki.nginx.org/NginxHttpLogRequestSpeed>
X" Log the time it took to process each request.
Xsyn keyword ngxDirectiveThirdParty log_request_speed_filter
Xsyn keyword ngxDirectiveThirdParty log_request_speed_filter_timeout
X
X" Memc Module <http://wiki.nginx.org/NginxHttpMemcModule>
X" An extended version of the standard memcached module that supports set, add, delete, and many more memcached commands.
Xsyn keyword ngxDirectiveThirdParty memc_buffer_size
Xsyn keyword ngxDirectiveThirdParty memc_cmds_allowed
Xsyn keyword ngxDirectiveThirdParty memc_connect_timeout
Xsyn keyword ngxDirectiveThirdParty memc_flags_to_last_modified
Xsyn keyword ngxDirectiveThirdParty memc_next_upstream
Xsyn keyword ngxDirectiveThirdParty memc_pass
Xsyn keyword ngxDirectiveThirdParty memc_read_timeout
Xsyn keyword ngxDirectiveThirdParty memc_send_timeout
Xsyn keyword ngxDirectiveThirdParty memc_upstream_fail_timeout
Xsyn keyword ngxDirectiveThirdParty memc_upstream_max_fails
X
X" Mogilefs Module <http://www.grid.net.ru/nginx/mogilefs.en.html>
X" Implements a MogileFS client, provides a replace to the Perlbal reverse proxy of the original MogileFS.
Xsyn keyword ngxDirectiveThirdParty mogilefs_connect_timeout
Xsyn keyword ngxDirectiveThirdParty mogilefs_domain
Xsyn keyword ngxDirectiveThirdParty mogilefs_methods
Xsyn keyword ngxDirectiveThirdParty mogilefs_noverify
Xsyn keyword ngxDirectiveThirdParty mogilefs_pass
Xsyn keyword ngxDirectiveThirdParty mogilefs_read_timeout
Xsyn keyword ngxDirectiveThirdParty mogilefs_send_timeout
Xsyn keyword ngxDirectiveThirdParty mogilefs_tracker
X
X" MP4 Streaming Lite Module <http://wiki.nginx.org/NginxMP4StreamingLite>
X" Will seek to a certain time within H.264/MP4 files when provided with a 'start' parameter in the URL. 
Xsyn keyword ngxDirectiveThirdParty mp4
X
X" Nginx Notice Module <http://xph.us/software/nginx-notice/>
X" Serve static file to POST requests.
Xsyn keyword ngxDirectiveThirdParty notice
Xsyn keyword ngxDirectiveThirdParty notice_type
X
X" Phusion Passenger <http://www.modrails.com/documentation.html>
X" Easy and robust deployment of Ruby on Rails application on Apache and Nginx webservers.
Xsyn keyword ngxDirectiveThirdParty passenger_base_uri
Xsyn keyword ngxDirectiveThirdParty passenger_default_user
Xsyn keyword ngxDirectiveThirdParty passenger_enabled
Xsyn keyword ngxDirectiveThirdParty passenger_log_level
Xsyn keyword ngxDirectiveThirdParty passenger_max_instances_per_app
Xsyn keyword ngxDirectiveThirdParty passenger_max_pool_size
Xsyn keyword ngxDirectiveThirdParty passenger_pool_idle_time
Xsyn keyword ngxDirectiveThirdParty passenger_root
Xsyn keyword ngxDirectiveThirdParty passenger_ruby
Xsyn keyword ngxDirectiveThirdParty passenger_use_global_queue
Xsyn keyword ngxDirectiveThirdParty passenger_user_switching
Xsyn keyword ngxDirectiveThirdParty rack_env
Xsyn keyword ngxDirectiveThirdParty rails_app_spawner_idle_time
Xsyn keyword ngxDirectiveThirdParty rails_env
Xsyn keyword ngxDirectiveThirdParty rails_framework_spawner_idle_time
Xsyn keyword ngxDirectiveThirdParty rails_spawn_method
X
X" RDS JSON Module <http://github.com/agentzh/rds-json-nginx-module>
X" Help ngx_drizzle and other DBD modules emit JSON data.
Xsyn keyword ngxDirectiveThirdParty rds_json
Xsyn keyword ngxDirectiveThirdParty rds_json_content_type
Xsyn keyword ngxDirectiveThirdParty rds_json_format
Xsyn keyword ngxDirectiveThirdParty rds_json_ret
X
X" RRD Graph Module <http://wiki.nginx.org/NginxNgx_rrd_graph>
X" This module provides an HTTP interface to RRDtool's graphing facilities.
Xsyn keyword ngxDirectiveThirdParty rrd_graph
Xsyn keyword ngxDirectiveThirdParty rrd_graph_root
X
X" Secure Download <http://wiki.nginx.org/NginxHttpSecureDownload>
X" Create expiring links.
Xsyn keyword ngxDirectiveThirdParty secure_download
Xsyn keyword ngxDirectiveThirdParty secure_download_fail_location
Xsyn keyword ngxDirectiveThirdParty secure_download_path_mode
Xsyn keyword ngxDirectiveThirdParty secure_download_secret
X
X" SlowFS Cache Module <http://labs.frickle.com/nginx_ngx_slowfs_cache/>
X" Module adding ability to cache static files.
Xsyn keyword ngxDirectiveThirdParty slowfs_big_file_size
Xsyn keyword ngxDirectiveThirdParty slowfs_cache
Xsyn keyword ngxDirectiveThirdParty slowfs_cache_key
Xsyn keyword ngxDirectiveThirdParty slowfs_cache_min_uses
Xsyn keyword ngxDirectiveThirdParty slowfs_cache_path
Xsyn keyword ngxDirectiveThirdParty slowfs_cache_purge
Xsyn keyword ngxDirectiveThirdParty slowfs_cache_valid
Xsyn keyword ngxDirectiveThirdParty slowfs_temp_path
X
X" Strip Module <http://wiki.nginx.org/NginxHttpStripModule>
X" Whitespace remover.
Xsyn keyword ngxDirectiveThirdParty strip
X
X" Substitutions Module <http://wiki.nginx.org/NginxHttpSubsModule>
X" A filter module which can do both regular expression and fixed string substitutions on response bodies.
Xsyn keyword ngxDirectiveThirdParty subs_filter
Xsyn keyword ngxDirectiveThirdParty subs_filter_types
X
X" Supervisord Module <http://labs.frickle.com/nginx_ngx_supervisord/>
X" Module providing nginx with API to communicate with supervisord and manage (start/stop) backends on-demand.
Xsyn keyword ngxDirectiveThirdParty supervisord
Xsyn keyword ngxDirectiveThirdParty supervisord_inherit_backend_status
Xsyn keyword ngxDirectiveThirdParty supervisord_name
Xsyn keyword ngxDirectiveThirdParty supervisord_start
Xsyn keyword ngxDirectiveThirdParty supervisord_stop
X
X" Upload Module <http://www.grid.net.ru/nginx/upload.en.html>
X" Parses multipart/form-data allowing arbitrary handling of uploaded files.
Xsyn keyword ngxDirectiveThirdParty upload_aggregate_form_field
Xsyn keyword ngxDirectiveThirdParty upload_buffer_size
Xsyn keyword ngxDirectiveThirdParty upload_cleanup
Xsyn keyword ngxDirectiveThirdParty upload_limit_rate
Xsyn keyword ngxDirectiveThirdParty upload_max_file_size
Xsyn keyword ngxDirectiveThirdParty upload_max_output_body_len
Xsyn keyword ngxDirectiveThirdParty upload_max_part_header_len
Xsyn keyword ngxDirectiveThirdParty upload_pass
Xsyn keyword ngxDirectiveThirdParty upload_pass_args
Xsyn keyword ngxDirectiveThirdParty upload_pass_form_field
Xsyn keyword ngxDirectiveThirdParty upload_set_form_field
Xsyn keyword ngxDirectiveThirdParty upload_store
Xsyn keyword ngxDirectiveThirdParty upload_store_access
X
X" Upload Progress Module <http://wiki.nginx.org/NginxHttpUploadProgressModule>
X" Tracks and reports upload progress.
Xsyn keyword ngxDirectiveThirdParty report_uploads
Xsyn keyword ngxDirectiveThirdParty track_uploads
Xsyn keyword ngxDirectiveThirdParty upload_progress
Xsyn keyword ngxDirectiveThirdParty upload_progress_content_type
Xsyn keyword ngxDirectiveThirdParty upload_progress_header
Xsyn keyword ngxDirectiveThirdParty upload_progress_json_output
Xsyn keyword ngxDirectiveThirdParty upload_progress_template
X
X" Upstream Fair Balancer <http://wiki.nginx.org/NginxHttpUpstreamFairModule>
X" Sends an incoming request to the least-busy backend server, rather than distributing requests round-robin.
Xsyn keyword ngxDirectiveThirdParty fair
Xsyn keyword ngxDirectiveThirdParty upstream_fair_shm_size
X
X" Upstream Consistent Hash <http://wiki.nginx.org/NginxHttpUpstreamConsistentHash>
X" Select backend based on Consistent hash ring.
Xsyn keyword ngxDirectiveThirdParty consistent_hash
X
X" Upstream Hash Module <http://wiki.nginx.org/NginxHttpUpstreamRequestHashModule>
X" Provides simple upstream load distribution by hashing a configurable variable.
Xsyn keyword ngxDirectiveThirdParty hash
Xsyn keyword ngxDirectiveThirdParty hash_again
X
X" XSS Module <http://github.com/agentzh/xss-nginx-module>
X" Native support for cross-site scripting (XSS) in an nginx.
Xsyn keyword ngxDirectiveThirdParty xss_callback_arg
Xsyn keyword ngxDirectiveThirdParty xss_get
Xsyn keyword ngxDirectiveThirdParty xss_input_types
Xsyn keyword ngxDirectiveThirdParty xss_output_type
X
X" highlight
X
Xhi link ngxComment Comment
Xhi link ngxVariable Identifier
Xhi link ngxVariableBlock Identifier
Xhi link ngxVariableString PreProc
Xhi link ngxBlock Normal
Xhi link ngxString String
X
Xhi link ngxBoolean Boolean
Xhi link ngxDirectiveBlock Statement
Xhi link ngxDirectiveImportant Type
Xhi link ngxDirectiveControl Keyword
Xhi link ngxDirectiveError Constant
Xhi link ngxDirectiveDeprecated Error
Xhi link ngxDirective Identifier
Xhi link ngxDirectiveThirdParty Special
X
Xlet b:current_syntax = "nginx"
END-of-./.vim/syntax/nginx.vim
echo x - ./.vim/syntax/php.vim
sed 's/^X//' >./.vim/syntax/php.vim << 'END-of-./.vim/syntax/php.vim'
X" Vim syntax file
X" Language: PHP 5.3 & up
X" Maintainer: Paul Garvin <paul@paulgarvin.net>
X" Contributor: Stan Angeloff <stanimir@angeloff.name>
X" URL: https://github.com/StanAngeloff/php.vim
X"
X" Former Maintainer:  Peter Hodge <toomuchphp-vim@yahoo.com>
X" Former URL: http://www.vim.org/scripts/script.php?script_id=1571
X"
X" Note: All of the switches for VIM 5.X and 6.X compatability were removed.
X"       DO NOT USE THIS FILE WITH A VERSION OF VIM < 7.0.
X"
X" Note: If you are using a colour terminal with dark background, you will probably find
X"       the 'elflord' colorscheme is much better for PHP's syntax than the default
X"       colourscheme, because elflord's colours will better highlight the break-points
X"       (Statements) in your code.
X"
X" Options:  php_sql_query = 1  for SQL syntax highlighting inside strings
X"           php_html_in_strings = 1  for HTML syntax highlighting inside strings
X"           php_parent_error_close = 1  for highlighting parent error ] or )
X"           php_parent_error_open = 1  for skipping an php end tag,
X"                                      if there exists an open ( or [ without a closing one
X"           php_no_shorttags = 1  don't sync <? ?> as php
X"           php_folding = 1  for folding classes and functions
X"           php_sync_method = x
X"                             x=-1 to sync by search ( default )
X"                             x>0 to sync at least x lines backwards
X"                             x=0 to sync from start
X"
X" Note:
X" Setting php_folding=1 will match a closing } by comparing the indent
X" before the class or function keyword with the indent of a matching }.
X" Setting php_folding=2 will match all of pairs of {,} ( see known
X" bugs ii )
X"
X" Known Bugs:
X"  - setting  php_parent_error_close  on  and  php_parent_error_open  off
X"    has these two leaks:
X"     i) A closing ) or ] inside a string match to the last open ( or [
X"        before the string, when the the closing ) or ] is on the same line
X"        where the string started. In this case a following ) or ] after
X"        the string would be highlighted as an error, what is incorrect.
X"    ii) Same problem if you are setting php_folding = 2 with a closing
X"        } inside an string on the first line of this string.
X"
X"  - A double-quoted string like this:
X"      "$foo->someVar->someOtherVar->bar"
X"    will highight '->someOtherVar->bar' as though they will be parsed
X"    as object member variables, but PHP only recognizes the first
X"    object member variable ($foo->someVar).
X
X
Xif exists("b:current_syntax")
X  finish
Xendif
X
Xif !exists("main_syntax")
X  let main_syntax = 'php'
Xendif
X
Xruntime! syntax/html.vim
Xunlet! b:current_syntax
X" HTML syntax file turns on spelling for all top level words, we attempt to turn off
Xsyntax spell default
X
X" Set sync method if none declared
Xif !exists("php_sync_method")
X  if exists("php_minlines")
X    let php_sync_method=php_minlines
X  else
X    let php_sync_method=-1
X  endif
Xendif
X
Xsyn cluster htmlPreproc add=phpRegion
X
X" Use MySQL as the default SQL syntax file.
X" See https://github.com/StanAngeloff/php.vim/pull/1
Xif !exists('b:sql_type_override') && !exists('g:sql_type_default')
X  let b:sql_type_override='mysql'
Xendif
Xsyn include @sqlTop syntax/sql.vim
X
Xsyn sync clear
Xunlet! b:current_syntax
Xsyn cluster sqlTop remove=sqlString,sqlComment
Xif exists("php_sql_query")
X  syn cluster phpAddStrings contains=@sqlTop
Xendif
X
Xif exists("php_html_in_strings")
X  syn cluster phpAddStrings add=@htmlTop
Xendif
X
Xsyn case match
X
X" Superglobals
Xsyn keyword phpSuperglobals GLOBALS _GET _POST _REQUEST _FILES _COOKIE _SERVER _SESSION _ENV HTTP_RAW_POST_DATA php_errormsg http_response_header argc argv contained
X
X" Magic Constants
Xsyn keyword phpMagicConstants __LINE__ __FILE__ __DIR__ __FUNCTION__ __CLASS__ __METHOD__ __NAMESPACE__ contained
X
X" $_SERVER Variables
Xsyn keyword phpServerVars GATEWAY_INTERFACE SERVER_NAME SERVER_SOFTWARE SERVER_PROTOCOL REQUEST_METHOD QUERY_STRING DOCUMENT_ROOT HTTP_ACCEPT HTTP_ACCEPT_CHARSET HTTP_ENCODING HTTP_ACCEPT_LANGUAGE HTTP_CONNECTION HTTP_HOST HTTP_REFERER HTTP_USER_AGENT REMOTE_ADDR REMOTE_PORT SCRIPT_FILENAME SERVER_ADMIN SERVER_PORT SERVER_SIGNATURE PATH_TRANSLATED SCRIPT_NAME REQUEST_URI PHP_SELF contained
X
X" === BEGIN BUILTIN FUNCTIONS, CLASSES, AND CONSTANTS ===================================
X
Xsyn case match
X
X" Core
Xsyn keyword phpConstants E_ERROR E_RECOVERABLE_ERROR E_WARNING E_PARSE E_NOTICE E_STRICT E_DEPRECATED E_CORE_ERROR E_CORE_WARNING E_COMPILE_ERROR E_COMPILE_WARNING E_USER_ERROR E_USER_WARNING E_USER_NOTICE E_USER_DEPRECATED E_ALL DEBUG_BACKTRACE_PROVIDE_OBJECT DEBUG_BACKTRACE_IGNORE_ARGS TRUE FALSE NULL ZEND_THREAD_SAFE ZEND_DEBUG_BUILD PHP_VERSION PHP_MAJOR_VERSION PHP_MINOR_VERSION PHP_RELEASE_VERSION PHP_EXTRA_VERSION PHP_VERSION_ID PHP_ZTS PHP_DEBUG PHP_OS PHP_SAPI DEFAULT_INCLUDE_PATH PEAR_INSTALL_DIR PEAR_EXTENSION_DIR PHP_EXTENSION_DIR PHP_PREFIX PHP_BINDIR PHP_MANDIR PHP_LIBDIR PHP_DATADIR PHP_SYSCONFDIR PHP_LOCALSTATEDIR PHP_CONFIG_FILE_PATH PHP_CONFIG_FILE_SCAN_DIR PHP_SHLIB_SUFFIX PHP_EOL PHP_MAXPATHLEN PHP_INT_MAX PHP_INT_SIZE PHP_BINARY PHP_OUTPUT_HANDLER_START PHP_OUTPUT_HANDLER_WRITE PHP_OUTPUT_HANDLER_FLUSH PHP_OUTPUT_HANDLER_CLEAN PHP_OUTPUT_HANDLER_FINAL PHP_OUTPUT_HANDLER_CONT PHP_OUTPUT_HANDLER_END PHP_OUTPUT_HANDLER_CLEANABLE PHP_OUTPUT_HANDLER_FLUSHABLE PHP_OUTPUT_HANDLER_REMOVABLE PHP_OUTPUT_HANDLER_STDFLAGS PHP_OUTPUT_HANDLER_STARTED PHP_OUTPUT_HANDLER_DISABLED UPLOAD_ERR_OK UPLOAD_ERR_INI_SIZE UPLOAD_ERR_FORM_SIZE UPLOAD_ERR_PARTIAL UPLOAD_ERR_NO_FILE UPLOAD_ERR_NO_TMP_DIR UPLOAD_ERR_CANT_WRITE UPLOAD_ERR_EXTENSION STDIN STDOUT STDERR contained
X
X" curl
Xsyn keyword phpConstants CURLOPT_AUTOREFERER CURLOPT_BINARYTRANSFER CURLOPT_BUFFERSIZE CURLOPT_CAINFO CURLOPT_CAPATH CURLOPT_CLOSEPOLICY CURLOPT_CONNECTTIMEOUT CURLOPT_COOKIE CURLOPT_COOKIEFILE CURLOPT_COOKIEJAR CURLOPT_COOKIESESSION CURLOPT_CRLF CURLOPT_CUSTOMREQUEST CURLOPT_DNS_CACHE_TIMEOUT CURLOPT_DNS_USE_GLOBAL_CACHE CURLOPT_EGDSOCKET CURLOPT_ENCODING CURLOPT_FAILONERROR CURLOPT_FILE CURLOPT_FILETIME CURLOPT_FOLLOWLOCATION CURLOPT_FORBID_REUSE CURLOPT_FRESH_CONNECT CURLOPT_FTPAPPEND CURLOPT_FTPLISTONLY CURLOPT_FTPPORT CURLOPT_FTP_USE_EPRT CURLOPT_FTP_USE_EPSV CURLOPT_HEADER CURLOPT_HEADERFUNCTION CURLOPT_HTTP200ALIASES CURLOPT_HTTPGET CURLOPT_HTTPHEADER CURLOPT_HTTPPROXYTUNNEL CURLOPT_HTTP_VERSION CURLOPT_INFILE CURLOPT_INFILESIZE CURLOPT_INTERFACE CURLOPT_KRB4LEVEL CURLOPT_LOW_SPEED_LIMIT CURLOPT_LOW_SPEED_TIME CURLOPT_MAXCONNECTS CURLOPT_MAXREDIRS CURLOPT_NETRC CURLOPT_NOBODY CURLOPT_NOPROGRESS CURLOPT_NOSIGNAL CURLOPT_PORT CURLOPT_POST CURLOPT_POSTFIELDS CURLOPT_POSTQUOTE CURLOPT_PREQUOTE CURLOPT_PRIVATE CURLOPT_PROGRESSFUNCTION CURLOPT_PROXY CURLOPT_PROXYPORT CURLOPT_PROXYTYPE CURLOPT_PROXYUSERPWD CURLOPT_PUT CURLOPT_QUOTE CURLOPT_RANDOM_FILE CURLOPT_RANGE CURLOPT_READDATA CURLOPT_READFUNCTION CURLOPT_REFERER CURLOPT_RESUME_FROM CURLOPT_RETURNTRANSFER CURLOPT_SHARE CURLOPT_SSLCERT CURLOPT_SSLCERTPASSWD CURLOPT_SSLCERTTYPE CURLOPT_SSLENGINE CURLOPT_SSLENGINE_DEFAULT CURLOPT_SSLKEY CURLOPT_SSLKEYPASSWD CURLOPT_SSLKEYTYPE CURLOPT_SSLVERSION CURLOPT_SSL_CIPHER_LIST CURLOPT_SSL_VERIFYHOST CURLOPT_SSL_VERIFYPEER CURLOPT_STDERR CURLOPT_TELNETOPTIONS CURLOPT_TIMECONDITION CURLOPT_TIMEOUT CURLOPT_TIMEVALUE CURLOPT_TRANSFERTEXT CURLOPT_UNRESTRICTED_AUTH CURLOPT_UPLOAD CURLOPT_URL CURLOPT_USERAGENT CURLOPT_USERPWD CURLOPT_VERBOSE CURLOPT_WRITEFUNCTION CURLOPT_WRITEHEADER CURLCLOSEPOLICY_CALLBACK CURLCLOSEPOLICY_LEAST_RECENTLY_USED CURLCLOSEPOLICY_LEAST_TRAFFIC CURLCLOSEPOLICY_OLDEST CURLCLOSEPOLICY_SLOWEST CURLE_ABORTED_BY_CALLBACK CURLE_BAD_CALLING_ORDER CURLE_BAD_CONTENT_ENCODING CURLE_BAD_DOWNLOAD_RESUME CURLE_BAD_FUNCTION_ARGUMENT CURLE_BAD_PASSWORD_ENTERED CURLE_COULDNT_CONNECT CURLE_COULDNT_RESOLVE_HOST CURLE_COULDNT_RESOLVE_PROXY CURLE_FAILED_INIT CURLE_FILE_COULDNT_READ_FILE CURLE_FTP_ACCESS_DENIED CURLE_FTP_BAD_DOWNLOAD_RESUME CURLE_FTP_CANT_GET_HOST CURLE_FTP_CANT_RECONNECT CURLE_FTP_COULDNT_GET_SIZE CURLE_FTP_COULDNT_RETR_FILE CURLE_FTP_COULDNT_SET_ASCII CURLE_FTP_COULDNT_SET_BINARY CURLE_FTP_COULDNT_STOR_FILE CURLE_FTP_COULDNT_USE_REST CURLE_FTP_PARTIAL_FILE CURLE_FTP_PORT_FAILED CURLE_FTP_QUOTE_ERROR CURLE_FTP_USER_PASSWORD_INCORRECT CURLE_FTP_WEIRD_227_FORMAT CURLE_FTP_WEIRD_PASS_REPLY CURLE_FTP_WEIRD_PASV_REPLY CURLE_FTP_WEIRD_SERVER_REPLY CURLE_FTP_WEIRD_USER_REPLY CURLE_FTP_WRITE_ERROR CURLE_FUNCTION_NOT_FOUND CURLE_GOT_NOTHING CURLE_HTTP_NOT_FOUND CURLE_HTTP_PORT_FAILED CURLE_HTTP_POST_ERROR CURLE_HTTP_RANGE_ERROR CURLE_HTTP_RETURNED_ERROR CURLE_LDAP_CANNOT_BIND CURLE_LDAP_SEARCH_FAILED CURLE_LIBRARY_NOT_FOUND CURLE_MALFORMAT_USER CURLE_OBSOLETE CURLE_OK CURLE_OPERATION_TIMEDOUT CURLE_OPERATION_TIMEOUTED CURLE_OUT_OF_MEMORY CURLE_PARTIAL_FILE CURLE_READ_ERROR CURLE_RECV_ERROR CURLE_SEND_ERROR CURLE_SHARE_IN_USE CURLE_SSL_CACERT CURLE_SSL_CERTPROBLEM CURLE_SSL_CIPHER CURLE_SSL_CONNECT_ERROR CURLE_SSL_ENGINE_NOTFOUND CURLE_SSL_ENGINE_SETFAILED CURLE_SSL_PEER_CERTIFICATE CURLE_TELNET_OPTION_SYNTAX CURLE_TOO_MANY_REDIRECTS CURLE_UNKNOWN_TELNET_OPTION CURLE_UNSUPPORTED_PROTOCOL CURLE_URL_MALFORMAT CURLE_URL_MALFORMAT_USER CURLE_WRITE_ERROR CURLINFO_CONNECT_TIME CURLINFO_CONTENT_LENGTH_DOWNLOAD CURLINFO_CONTENT_LENGTH_UPLOAD CURLINFO_CONTENT_TYPE CURLINFO_EFFECTIVE_URL CURLINFO_FILETIME CURLINFO_HEADER_OUT CURLINFO_HEADER_SIZE CURLINFO_HTTP_CODE CURLINFO_LASTONE CURLINFO_NAMELOOKUP_TIME CURLINFO_PRETRANSFER_TIME CURLINFO_PRIVATE CURLINFO_REDIRECT_COUNT CURLINFO_REDIRECT_TIME CURLINFO_REQUEST_SIZE CURLINFO_SIZE_DOWNLOAD CURLINFO_SIZE_UPLOAD CURLINFO_SPEED_DOWNLOAD CURLINFO_SPEED_UPLOAD CURLINFO_SSL_VERIFYRESULT CURLINFO_STARTTRANSFER_TIME CURLINFO_TOTAL_TIME CURLMSG_DONE CURLVERSION_NOW CURLM_BAD_EASY_HANDLE CURLM_BAD_HANDLE CURLM_CALL_MULTI_PERFORM CURLM_INTERNAL_ERROR CURLM_OK CURLM_OUT_OF_MEMORY CURLPROXY_HTTP CURLPROXY_SOCKS4 CURLPROXY_SOCKS5 CURLSHOPT_NONE CURLSHOPT_SHARE CURLSHOPT_UNSHARE CURL_HTTP_VERSION_1_0 CURL_HTTP_VERSION_1_1 CURL_HTTP_VERSION_NONE CURL_LOCK_DATA_COOKIE CURL_LOCK_DATA_DNS CURL_LOCK_DATA_SSL_SESSION CURL_NETRC_IGNORED CURL_NETRC_OPTIONAL CURL_NETRC_REQUIRED CURL_SSLVERSION_DEFAULT CURL_SSLVERSION_SSLv2 CURL_SSLVERSION_SSLv3 CURL_SSLVERSION_TLSv1 CURL_TIMECOND_IFMODSINCE CURL_TIMECOND_IFUNMODSINCE CURL_TIMECOND_LASTMOD CURL_TIMECOND_NONE CURL_VERSION_IPV6 CURL_VERSION_KERBEROS4 CURL_VERSION_LIBZ CURL_VERSION_SSL CURLOPT_HTTPAUTH CURLAUTH_ANY CURLAUTH_ANYSAFE CURLAUTH_BASIC CURLAUTH_DIGEST CURLAUTH_GSSNEGOTIATE CURLAUTH_NONE CURLAUTH_NTLM CURLINFO_HTTP_CONNECTCODE CURLOPT_FTP_CREATE_MISSING_DIRS CURLOPT_PROXYAUTH CURLE_FILESIZE_EXCEEDED CURLE_LDAP_INVALID_URL CURLINFO_HTTPAUTH_AVAIL CURLINFO_RESPONSE_CODE CURLINFO_PROXYAUTH_AVAIL CURLOPT_FTP_RESPONSE_TIMEOUT CURLOPT_IPRESOLVE CURLOPT_MAXFILESIZE CURL_IPRESOLVE_V4 CURL_IPRESOLVE_V6 CURL_IPRESOLVE_WHATEVER CURLE_FTP_SSL_FAILED CURLFTPSSL_ALL CURLFTPSSL_CONTROL CURLFTPSSL_NONE CURLFTPSSL_TRY CURLOPT_FTP_SSL CURLOPT_NETRC_FILE CURLFTPAUTH_DEFAULT CURLFTPAUTH_SSL CURLFTPAUTH_TLS CURLOPT_FTPSSLAUTH CURLOPT_FTP_ACCOUNT CURLOPT_TCP_NODELAY CURLINFO_OS_ERRNO CURLINFO_NUM_CONNECTS CURLINFO_SSL_ENGINES CURLINFO_COOKIELIST CURLOPT_COOKIELIST CURLOPT_IGNORE_CONTENT_LENGTH CURLOPT_FTP_SKIP_PASV_IP CURLOPT_FTP_FILEMETHOD CURLOPT_CONNECT_ONLY CURLOPT_LOCALPORT CURLOPT_LOCALPORTRANGE CURLFTPMETHOD_MULTICWD CURLFTPMETHOD_NOCWD CURLFTPMETHOD_SINGLECWD CURLINFO_FTP_ENTRY_PATH CURLOPT_FTP_ALTERNATIVE_TO_USER CURLOPT_MAX_RECV_SPEED_LARGE CURLOPT_MAX_SEND_SPEED_LARGE CURLOPT_SSL_SESSIONID_CACHE CURLMOPT_PIPELINING CURLE_SSH CURLOPT_FTP_SSL_CCC CURLOPT_SSH_AUTH_TYPES CURLOPT_SSH_PRIVATE_KEYFILE CURLOPT_SSH_PUBLIC_KEYFILE CURLFTPSSL_CCC_ACTIVE CURLFTPSSL_CCC_NONE CURLFTPSSL_CCC_PASSIVE CURLOPT_CONNECTTIMEOUT_MS CURLOPT_HTTP_CONTENT_DECODING CURLOPT_HTTP_TRANSFER_DECODING CURLOPT_TIMEOUT_MS CURLMOPT_MAXCONNECTS CURLOPT_KRBLEVEL CURLOPT_NEW_DIRECTORY_PERMS CURLOPT_NEW_FILE_PERMS CURLOPT_APPEND CURLOPT_DIRLISTONLY CURLOPT_USE_SSL CURLUSESSL_ALL CURLUSESSL_CONTROL CURLUSESSL_NONE CURLUSESSL_TRY CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 CURLOPT_PROXY_TRANSFER_MODE CURLPAUSE_ALL CURLPAUSE_CONT CURLPAUSE_RECV CURLPAUSE_RECV_CONT CURLPAUSE_SEND CURLPAUSE_SEND_CONT CURL_READFUNC_PAUSE CURL_WRITEFUNC_PAUSE CURLINFO_REDIRECT_URL CURLINFO_APPCONNECT_TIME CURLINFO_PRIMARY_IP CURLOPT_ADDRESS_SCOPE CURLOPT_CRLFILE CURLOPT_ISSUERCERT CURLOPT_KEYPASSWD CURLSSH_AUTH_ANY CURLSSH_AUTH_DEFAULT CURLSSH_AUTH_HOST CURLSSH_AUTH_KEYBOARD CURLSSH_AUTH_NONE CURLSSH_AUTH_PASSWORD CURLSSH_AUTH_PUBLICKEY CURLINFO_CERTINFO CURLOPT_CERTINFO CURLOPT_PASSWORD CURLOPT_POSTREDIR CURLOPT_PROXYPASSWORD CURLOPT_PROXYUSERNAME CURLOPT_USERNAME CURLAUTH_DIGEST_IE CURLINFO_CONDITION_UNMET CURLOPT_NOPROXY CURLOPT_PROTOCOLS CURLOPT_REDIR_PROTOCOLS CURLOPT_SOCKS5_GSSAPI_NEC CURLOPT_SOCKS5_GSSAPI_SERVICE CURLOPT_TFTP_BLKSIZE CURLPROTO_ALL CURLPROTO_DICT CURLPROTO_FILE CURLPROTO_FTP CURLPROTO_FTPS CURLPROTO_HTTP CURLPROTO_HTTPS CURLPROTO_LDAP CURLPROTO_LDAPS CURLPROTO_SCP CURLPROTO_SFTP CURLPROTO_TELNET CURLPROTO_TFTP CURLOPT_SSH_KNOWNHOSTS CURLINFO_RTSP_CLIENT_CSEQ CURLINFO_RTSP_CSEQ_RECV CURLINFO_RTSP_SERVER_CSEQ CURLINFO_RTSP_SESSION_ID CURLOPT_FTP_USE_PRET CURLOPT_MAIL_FROM CURLOPT_MAIL_RCPT CURLOPT_RTSP_CLIENT_CSEQ CURLOPT_RTSP_REQUEST CURLOPT_RTSP_SERVER_CSEQ CURLOPT_RTSP_SESSION_ID CURLOPT_RTSP_STREAM_URI CURLOPT_RTSP_TRANSPORT CURLPROTO_IMAP CURLPROTO_IMAPS CURLPROTO_POP3 CURLPROTO_POP3S CURLPROTO_RTSP CURLPROTO_SMTP CURLPROTO_SMTPS CURL_RTSPREQ_ANNOUNCE CURL_RTSPREQ_DESCRIBE CURL_RTSPREQ_GET_PARAMETER CURL_RTSPREQ_OPTIONS CURL_RTSPREQ_PAUSE CURL_RTSPREQ_PLAY CURL_RTSPREQ_RECEIVE CURL_RTSPREQ_RECORD CURL_RTSPREQ_SETUP CURL_RTSPREQ_SET_PARAMETER CURL_RTSPREQ_TEARDOWN CURLINFO_LOCAL_IP CURLINFO_LOCAL_PORT CURLINFO_PRIMARY_PORT CURLOPT_FNMATCH_FUNCTION CURLOPT_WILDCARDMATCH CURLPROTO_RTMP CURLPROTO_RTMPE CURLPROTO_RTMPS CURLPROTO_RTMPT CURLPROTO_RTMPTE CURLPROTO_RTMPTS CURL_FNMATCHFUNC_FAIL CURL_FNMATCHFUNC_MATCH CURL_FNMATCHFUNC_NOMATCH CURLPROTO_GOPHER CURLAUTH_ONLY CURLOPT_RESOLVE CURLOPT_TLSAUTH_PASSWORD CURLOPT_TLSAUTH_TYPE CURLOPT_TLSAUTH_USERNAME CURL_TLSAUTH_SRP CURLOPT_ACCEPT_ENCODING CURLOPT_TRANSFER_ENCODING CURLGSSAPI_DELEGATION_FLAG CURLGSSAPI_DELEGATION_POLICY_FLAG CURLOPT_GSSAPI_DELEGATION CURLOPT_ACCEPTTIMEOUT_MS CURLOPT_DNS_SERVERS CURLOPT_SAFE_UPLOAD contained
X
X" date
Xsyn keyword phpConstants DATE_ATOM DATE_COOKIE DATE_ISO8601 DATE_RFC822 DATE_RFC850 DATE_RFC1036 DATE_RFC1123 DATE_RFC2822 DATE_RFC3339 DATE_RSS DATE_W3C SUNFUNCS_RET_TIMESTAMP SUNFUNCS_RET_STRING SUNFUNCS_RET_DOUBLE ATOM COOKIE ISO8601 RFC822 RFC850 RFC1036 RFC1123 RFC2822 RFC3339 RSS W3C AFRICA AMERICA ANTARCTICA ARCTIC ASIA ATLANTIC AUSTRALIA EUROPE INDIAN PACIFIC UTC ALL ALL_WITH_BC PER_COUNTRY EXCLUDE_START_DATE contained
X
X" dom
Xsyn keyword phpConstants XML_ELEMENT_NODE XML_ATTRIBUTE_NODE XML_TEXT_NODE XML_CDATA_SECTION_NODE XML_ENTITY_REF_NODE XML_ENTITY_NODE XML_PI_NODE XML_COMMENT_NODE XML_DOCUMENT_NODE XML_DOCUMENT_TYPE_NODE XML_DOCUMENT_FRAG_NODE XML_NOTATION_NODE XML_HTML_DOCUMENT_NODE XML_DTD_NODE XML_ELEMENT_DECL_NODE XML_ATTRIBUTE_DECL_NODE XML_ENTITY_DECL_NODE XML_NAMESPACE_DECL_NODE XML_LOCAL_NAMESPACE XML_ATTRIBUTE_CDATA XML_ATTRIBUTE_ID XML_ATTRIBUTE_IDREF XML_ATTRIBUTE_IDREFS XML_ATTRIBUTE_ENTITY XML_ATTRIBUTE_NMTOKEN XML_ATTRIBUTE_NMTOKENS XML_ATTRIBUTE_ENUMERATION XML_ATTRIBUTE_NOTATION DOM_PHP_ERR DOM_INDEX_SIZE_ERR DOMSTRING_SIZE_ERR DOM_HIERARCHY_REQUEST_ERR DOM_WRONG_DOCUMENT_ERR DOM_INVALID_CHARACTER_ERR DOM_NO_DATA_ALLOWED_ERR DOM_NO_MODIFICATION_ALLOWED_ERR DOM_NOT_FOUND_ERR DOM_NOT_SUPPORTED_ERR DOM_INUSE_ATTRIBUTE_ERR DOM_INVALID_STATE_ERR DOM_SYNTAX_ERR DOM_INVALID_MODIFICATION_ERR DOM_NAMESPACE_ERR DOM_INVALID_ACCESS_ERR DOM_VALIDATION_ERR contained
X
X" hash
Xsyn keyword phpConstants HASH_HMAC MHASH_CRC32 MHASH_MD5 MHASH_SHA1 MHASH_HAVAL256 MHASH_RIPEMD160 MHASH_TIGER MHASH_GOST MHASH_CRC32B MHASH_HAVAL224 MHASH_HAVAL192 MHASH_HAVAL160 MHASH_HAVAL128 MHASH_TIGER128 MHASH_TIGER160 MHASH_MD4 MHASH_SHA256 MHASH_ADLER32 MHASH_SHA224 MHASH_SHA512 MHASH_SHA384 MHASH_WHIRLPOOL MHASH_RIPEMD128 MHASH_RIPEMD256 MHASH_RIPEMD320 MHASH_SNEFRU256 MHASH_MD2 MHASH_FNV132 MHASH_FNV1A32 MHASH_FNV164 MHASH_FNV1A64 MHASH_JOAAT contained
X
X" iconv
Xsyn keyword phpConstants ICONV_IMPL ICONV_VERSION ICONV_MIME_DECODE_STRICT ICONV_MIME_DECODE_CONTINUE_ON_ERROR contained
X
X" json
Xsyn keyword phpConstants JSON_HEX_TAG JSON_HEX_AMP JSON_HEX_APOS JSON_HEX_QUOT JSON_FORCE_OBJECT JSON_NUMERIC_CHECK JSON_UNESCAPED_SLASHES JSON_PRETTY_PRINT JSON_UNESCAPED_UNICODE JSON_PARTIAL_OUTPUT_ON_ERROR JSON_ERROR_NONE JSON_ERROR_DEPTH JSON_ERROR_STATE_MISMATCH JSON_ERROR_CTRL_CHAR JSON_ERROR_SYNTAX JSON_ERROR_UTF8 JSON_ERROR_RECURSION JSON_ERROR_INF_OR_NAN JSON_ERROR_UNSUPPORTED_TYPE JSON_OBJECT_AS_ARRAY JSON_BIGINT_AS_STRING contained
X
X" libxml
Xsyn keyword phpConstants LIBXML_VERSION LIBXML_DOTTED_VERSION LIBXML_LOADED_VERSION LIBXML_NOENT LIBXML_DTDLOAD LIBXML_DTDATTR LIBXML_DTDVALID LIBXML_NOERROR LIBXML_NOWARNING LIBXML_NOBLANKS LIBXML_XINCLUDE LIBXML_NSCLEAN LIBXML_NOCDATA LIBXML_NONET LIBXML_PEDANTIC LIBXML_COMPACT LIBXML_NOXMLDECL LIBXML_PARSEHUGE LIBXML_NOEMPTYTAG LIBXML_HTML_NOIMPLIED LIBXML_HTML_NODEFDTD LIBXML_ERR_NONE LIBXML_ERR_WARNING LIBXML_ERR_ERROR LIBXML_ERR_FATAL contained
X
X" mbstring
Xsyn keyword phpConstants MB_OVERLOAD_MAIL MB_OVERLOAD_STRING MB_OVERLOAD_REGEX MB_CASE_UPPER MB_CASE_LOWER MB_CASE_TITLE contained
X
X" mcrypt
Xsyn keyword phpConstants MCRYPT_ENCRYPT MCRYPT_DECRYPT MCRYPT_DEV_RANDOM MCRYPT_DEV_URANDOM MCRYPT_RAND MCRYPT_3DES MCRYPT_ARCFOUR_IV MCRYPT_ARCFOUR MCRYPT_BLOWFISH MCRYPT_BLOWFISH_COMPAT MCRYPT_CAST_128 MCRYPT_CAST_256 MCRYPT_CRYPT MCRYPT_DES MCRYPT_ENIGNA MCRYPT_GOST MCRYPT_LOKI97 MCRYPT_PANAMA MCRYPT_RC2 MCRYPT_RIJNDAEL_128 MCRYPT_RIJNDAEL_192 MCRYPT_RIJNDAEL_256 MCRYPT_SAFER64 MCRYPT_SAFER128 MCRYPT_SAFERPLUS MCRYPT_SERPENT MCRYPT_THREEWAY MCRYPT_TRIPLEDES MCRYPT_TWOFISH MCRYPT_WAKE MCRYPT_XTEA MCRYPT_IDEA MCRYPT_MARS MCRYPT_RC6 MCRYPT_SKIPJACK MCRYPT_MODE_CBC MCRYPT_MODE_CFB MCRYPT_MODE_ECB MCRYPT_MODE_NOFB MCRYPT_MODE_OFB MCRYPT_MODE_STREAM contained
X
X" mysql
Xsyn keyword phpConstants MYSQL_ASSOC MYSQL_NUM MYSQL_BOTH MYSQL_CLIENT_COMPRESS MYSQL_CLIENT_SSL MYSQL_CLIENT_INTERACTIVE MYSQL_CLIENT_IGNORE_SPACE contained
X
X" mysqli
Xsyn keyword phpConstants MYSQLI_READ_DEFAULT_GROUP MYSQLI_READ_DEFAULT_FILE MYSQLI_OPT_CONNECT_TIMEOUT MYSQLI_OPT_LOCAL_INFILE MYSQLI_INIT_COMMAND MYSQLI_OPT_NET_CMD_BUFFER_SIZE MYSQLI_OPT_NET_READ_BUFFER_SIZE MYSQLI_OPT_INT_AND_FLOAT_NATIVE MYSQLI_OPT_SSL_VERIFY_SERVER_CERT MYSQLI_SERVER_PUBLIC_KEY MYSQLI_CLIENT_SSL MYSQLI_CLIENT_COMPRESS MYSQLI_CLIENT_INTERACTIVE MYSQLI_CLIENT_IGNORE_SPACE MYSQLI_CLIENT_NO_SCHEMA MYSQLI_CLIENT_FOUND_ROWS MYSQLI_STORE_RESULT MYSQLI_USE_RESULT MYSQLI_ASYNC MYSQLI_ASSOC MYSQLI_NUM MYSQLI_BOTH MYSQLI_STMT_ATTR_UPDATE_MAX_LENGTH MYSQLI_STMT_ATTR_CURSOR_TYPE MYSQLI_CURSOR_TYPE_NO_CURSOR MYSQLI_CURSOR_TYPE_READ_ONLY MYSQLI_CURSOR_TYPE_FOR_UPDATE MYSQLI_CURSOR_TYPE_SCROLLABLE MYSQLI_STMT_ATTR_PREFETCH_ROWS MYSQLI_NOT_NULL_FLAG MYSQLI_PRI_KEY_FLAG MYSQLI_UNIQUE_KEY_FLAG MYSQLI_MULTIPLE_KEY_FLAG MYSQLI_BLOB_FLAG MYSQLI_UNSIGNED_FLAG MYSQLI_ZEROFILL_FLAG MYSQLI_AUTO_INCREMENT_FLAG MYSQLI_TIMESTAMP_FLAG MYSQLI_SET_FLAG MYSQLI_NUM_FLAG MYSQLI_PART_KEY_FLAG MYSQLI_GROUP_FLAG MYSQLI_ENUM_FLAG MYSQLI_BINARY_FLAG MYSQLI_NO_DEFAULT_VALUE_FLAG MYSQLI_ON_UPDATE_NOW_FLAG MYSQLI_TYPE_DECIMAL MYSQLI_TYPE_TINY MYSQLI_TYPE_SHORT MYSQLI_TYPE_LONG MYSQLI_TYPE_FLOAT MYSQLI_TYPE_DOUBLE MYSQLI_TYPE_NULL MYSQLI_TYPE_TIMESTAMP MYSQLI_TYPE_LONGLONG MYSQLI_TYPE_INT24 MYSQLI_TYPE_DATE MYSQLI_TYPE_TIME MYSQLI_TYPE_DATETIME MYSQLI_TYPE_YEAR MYSQLI_TYPE_NEWDATE MYSQLI_TYPE_ENUM MYSQLI_TYPE_SET MYSQLI_TYPE_TINY_BLOB MYSQLI_TYPE_MEDIUM_BLOB MYSQLI_TYPE_LONG_BLOB MYSQLI_TYPE_BLOB MYSQLI_TYPE_VAR_STRING MYSQLI_TYPE_STRING MYSQLI_TYPE_CHAR MYSQLI_TYPE_INTERVAL MYSQLI_TYPE_GEOMETRY MYSQLI_TYPE_NEWDECIMAL MYSQLI_TYPE_BIT MYSQLI_SET_CHARSET_NAME MYSQLI_SET_CHARSET_DIR MYSQLI_NO_DATA MYSQLI_DATA_TRUNCATED MYSQLI_REPORT_INDEX MYSQLI_REPORT_ERROR MYSQLI_REPORT_STRICT MYSQLI_REPORT_ALL MYSQLI_REPORT_OFF MYSQLI_DEBUG_TRACE_ENABLED MYSQLI_SERVER_QUERY_NO_GOOD_INDEX_USED MYSQLI_SERVER_QUERY_NO_INDEX_USED MYSQLI_SERVER_QUERY_WAS_SLOW MYSQLI_SERVER_PS_OUT_PARAMS MYSQLI_REFRESH_GRANT MYSQLI_REFRESH_LOG MYSQLI_REFRESH_TABLES MYSQLI_REFRESH_HOSTS MYSQLI_REFRESH_STATUS MYSQLI_REFRESH_THREADS MYSQLI_REFRESH_SLAVE MYSQLI_REFRESH_MASTER MYSQLI_REFRESH_BACKUP_LOG MYSQLI_OPT_CAN_HANDLE_EXPIRED_PASSWORDS MYSQLI_TRANS_START_WITH_CONSISTENT_SNAPSHOT MYSQLI_TRANS_START_READ_WRITE MYSQLI_TRANS_START_READ_ONLY MYSQLI_TRANS_COR_AND_CHAIN MYSQLI_TRANS_COR_AND_NO_CHAIN MYSQLI_TRANS_COR_RELEASE MYSQLI_TRANS_COR_NO_RELEASE contained
X
X" openssl
Xsyn keyword phpConstants OPENSSL_VERSION_TEXT OPENSSL_VERSION_NUMBER X509_PURPOSE_SSL_CLIENT X509_PURPOSE_SSL_SERVER X509_PURPOSE_NS_SSL_SERVER X509_PURPOSE_SMIME_SIGN X509_PURPOSE_SMIME_ENCRYPT X509_PURPOSE_CRL_SIGN X509_PURPOSE_ANY OPENSSL_ALGO_SHA1 OPENSSL_ALGO_MD5 OPENSSL_ALGO_MD4 OPENSSL_ALGO_DSS1 OPENSSL_ALGO_SHA224 OPENSSL_ALGO_SHA256 OPENSSL_ALGO_SHA384 OPENSSL_ALGO_SHA512 OPENSSL_ALGO_RMD160 PKCS7_DETACHED PKCS7_TEXT PKCS7_NOINTERN PKCS7_NOVERIFY PKCS7_NOCHAIN PKCS7_NOCERTS PKCS7_NOATTR PKCS7_BINARY PKCS7_NOSIGS OPENSSL_PKCS1_PADDING OPENSSL_SSLV23_PADDING OPENSSL_NO_PADDING OPENSSL_PKCS1_OAEP_PADDING OPENSSL_CIPHER_RC2_40 OPENSSL_CIPHER_RC2_128 OPENSSL_CIPHER_RC2_64 OPENSSL_CIPHER_DES OPENSSL_CIPHER_3DES OPENSSL_CIPHER_AES_128_CBC OPENSSL_CIPHER_AES_192_CBC OPENSSL_CIPHER_AES_256_CBC OPENSSL_KEYTYPE_RSA OPENSSL_KEYTYPE_DSA OPENSSL_KEYTYPE_DH OPENSSL_KEYTYPE_EC OPENSSL_RAW_DATA OPENSSL_ZERO_PADDING OPENSSL_TLSEXT_SERVER_NAME contained
X
X" pcre
Xsyn keyword phpConstants PREG_PATTERN_ORDER PREG_SET_ORDER PREG_OFFSET_CAPTURE PREG_SPLIT_NO_EMPTY PREG_SPLIT_DELIM_CAPTURE PREG_SPLIT_OFFSET_CAPTURE PREG_GREP_INVERT PREG_NO_ERROR PREG_INTERNAL_ERROR PREG_BACKTRACK_LIMIT_ERROR PREG_RECURSION_LIMIT_ERROR PREG_BAD_UTF8_ERROR PREG_BAD_UTF8_OFFSET_ERROR PCRE_VERSION contained
X
X" PDO
Xsyn keyword phpConstants PARAM_BOOL PARAM_NULL PARAM_INT PARAM_STR PARAM_LOB PARAM_STMT PARAM_INPUT_OUTPUT PARAM_EVT_ALLOC PARAM_EVT_FREE PARAM_EVT_EXEC_PRE PARAM_EVT_EXEC_POST PARAM_EVT_FETCH_PRE PARAM_EVT_FETCH_POST PARAM_EVT_NORMALIZE FETCH_LAZY FETCH_ASSOC FETCH_NUM FETCH_BOTH FETCH_OBJ FETCH_BOUND FETCH_COLUMN FETCH_CLASS FETCH_INTO FETCH_FUNC FETCH_GROUP FETCH_UNIQUE FETCH_KEY_PAIR FETCH_CLASSTYPE FETCH_SERIALIZE FETCH_PROPS_LATE FETCH_NAMED ATTR_AUTOCOMMIT ATTR_PREFETCH ATTR_TIMEOUT ATTR_ERRMODE ATTR_SERVER_VERSION ATTR_CLIENT_VERSION ATTR_SERVER_INFO ATTR_CONNECTION_STATUS ATTR_CASE ATTR_CURSOR_NAME ATTR_CURSOR ATTR_ORACLE_NULLS ATTR_PERSISTENT ATTR_STATEMENT_CLASS ATTR_FETCH_TABLE_NAMES ATTR_FETCH_CATALOG_NAMES ATTR_DRIVER_NAME ATTR_STRINGIFY_FETCHES ATTR_MAX_COLUMN_LEN ATTR_EMULATE_PREPARES ATTR_DEFAULT_FETCH_MODE ERRMODE_SILENT ERRMODE_WARNING ERRMODE_EXCEPTION CASE_NATURAL CASE_LOWER CASE_UPPER NULL_NATURAL NULL_EMPTY_STRING NULL_TO_STRING ERR_NONE FETCH_ORI_NEXT FETCH_ORI_PRIOR FETCH_ORI_FIRST FETCH_ORI_LAST FETCH_ORI_ABS FETCH_ORI_REL CURSOR_FWDONLY CURSOR_SCROLL contained
X
X" Phar
Xsyn keyword phpConstants CURRENT_MODE_MASK CURRENT_AS_PATHNAME CURRENT_AS_FILEINFO CURRENT_AS_SELF KEY_MODE_MASK KEY_AS_PATHNAME FOLLOW_SYMLINKS KEY_AS_FILENAME NEW_CURRENT_AND_KEY OTHER_MODE_MASK SKIP_DOTS UNIX_PATHS BZ2 GZ NONE PHAR TAR ZIP COMPRESSED PHP PHPS MD5 OPENSSL SHA1 SHA256 SHA512 contained
X
X" Reflection
Xsyn keyword phpConstants IS_DEPRECATED IS_STATIC IS_PUBLIC IS_PROTECTED IS_PRIVATE IS_ABSTRACT IS_FINAL IS_IMPLICIT_ABSTRACT IS_EXPLICIT_ABSTRACT contained
X
X" session
Xsyn keyword phpConstants PHP_SESSION_DISABLED PHP_SESSION_NONE PHP_SESSION_ACTIVE contained
X
X" sockets
Xsyn keyword phpConstants AF_UNIX AF_INET AF_INET6 SOCK_STREAM SOCK_DGRAM SOCK_RAW SOCK_SEQPACKET SOCK_RDM MSG_OOB MSG_WAITALL MSG_CTRUNC MSG_TRUNC MSG_PEEK MSG_DONTROUTE MSG_EOR MSG_EOF MSG_DONTWAIT SO_DEBUG SO_REUSEADDR SO_REUSEPORT SO_KEEPALIVE SO_DONTROUTE SO_LINGER SO_BROADCAST SO_OOBINLINE SO_SNDBUF SO_RCVBUF SO_SNDLOWAT SO_RCVLOWAT SO_SNDTIMEO SO_RCVTIMEO SO_TYPE SO_ERROR SOL_SOCKET SOMAXCONN TCP_NODELAY PHP_NORMAL_READ PHP_BINARY_READ MCAST_JOIN_GROUP MCAST_LEAVE_GROUP IP_MULTICAST_IF IP_MULTICAST_TTL IP_MULTICAST_LOOP IPV6_MULTICAST_IF IPV6_MULTICAST_HOPS IPV6_MULTICAST_LOOP SOCKET_EPERM SOCKET_ENOENT SOCKET_EINTR SOCKET_EIO SOCKET_ENXIO SOCKET_E2BIG SOCKET_EBADF SOCKET_EAGAIN SOCKET_ENOMEM SOCKET_EACCES SOCKET_EFAULT SOCKET_ENOTBLK SOCKET_EBUSY SOCKET_EEXIST SOCKET_EXDEV SOCKET_ENODEV SOCKET_ENOTDIR SOCKET_EISDIR SOCKET_EINVAL SOCKET_ENFILE SOCKET_EMFILE SOCKET_ENOTTY SOCKET_ENOSPC SOCKET_ESPIPE SOCKET_EROFS SOCKET_EMLINK SOCKET_EPIPE SOCKET_ENAMETOOLONG SOCKET_ENOLCK SOCKET_ENOSYS SOCKET_ENOTEMPTY SOCKET_ELOOP SOCKET_EWOULDBLOCK SOCKET_ENOMSG SOCKET_EIDRM SOCKET_ENOSTR SOCKET_ENODATA SOCKET_ETIME SOCKET_ENOSR SOCKET_EREMOTE SOCKET_ENOLINK SOCKET_EPROTO SOCKET_EMULTIHOP SOCKET_EBADMSG SOCKET_EUSERS SOCKET_ENOTSOCK SOCKET_EDESTADDRREQ SOCKET_EMSGSIZE SOCKET_EPROTOTYPE SOCKET_ENOPROTOOPT SOCKET_EPROTONOSUPPORT SOCKET_ESOCKTNOSUPPORT SOCKET_EOPNOTSUPP SOCKET_EPFNOSUPPORT SOCKET_EAFNOSUPPORT SOCKET_EADDRINUSE SOCKET_EADDRNOTAVAIL SOCKET_ENETDOWN SOCKET_ENETUNREACH SOCKET_ENETRESET SOCKET_ECONNABORTED SOCKET_ECONNRESET SOCKET_ENOBUFS SOCKET_EISCONN SOCKET_ENOTCONN SOCKET_ESHUTDOWN SOCKET_ETOOMANYREFS SOCKET_ETIMEDOUT SOCKET_ECONNREFUSED SOCKET_EHOSTDOWN SOCKET_EHOSTUNREACH SOCKET_EALREADY SOCKET_EINPROGRESS SOCKET_EDQUOT IPPROTO_IP IPPROTO_IPV6 SOL_TCP SOL_UDP IPV6_UNICAST_HOPS IPV6_RECVTCLASS IPV6_TCLASS SCM_RIGHTS contained
X
X" SPL
Xsyn keyword phpConstants LEAVES_ONLY SELF_FIRST CHILD_FIRST CATCH_GET_CHILD CALL_TOSTRING TOSTRING_USE_KEY TOSTRING_USE_CURRENT TOSTRING_USE_INNER FULL_CACHE USE_KEY MATCH GET_MATCH ALL_MATCHES SPLIT REPLACE BYPASS_CURRENT BYPASS_KEY PREFIX_LEFT PREFIX_MID_HAS_NEXT PREFIX_MID_LAST PREFIX_END_HAS_NEXT PREFIX_END_LAST PREFIX_RIGHT STD_PROP_LIST ARRAY_AS_PROPS CHILD_ARRAYS_ONLY CURRENT_MODE_MASK CURRENT_AS_PATHNAME CURRENT_AS_FILEINFO CURRENT_AS_SELF KEY_MODE_MASK KEY_AS_PATHNAME FOLLOW_SYMLINKS KEY_AS_FILENAME NEW_CURRENT_AND_KEY OTHER_MODE_MASK SKIP_DOTS UNIX_PATHS DROP_NEW_LINE READ_AHEAD SKIP_EMPTY READ_CSV IT_MODE_LIFO IT_MODE_FIFO IT_MODE_DELETE IT_MODE_KEEP EXTR_BOTH EXTR_PRIORITY EXTR_DATA MIT_NEED_ANY MIT_NEED_ALL MIT_KEYS_NUMERIC MIT_KEYS_ASSOC contained
X
X" sqlite3
Xsyn keyword phpConstants SQLITE3_ASSOC SQLITE3_NUM SQLITE3_BOTH SQLITE3_INTEGER SQLITE3_FLOAT SQLITE3_TEXT SQLITE3_BLOB SQLITE3_NULL SQLITE3_OPEN_READONLY SQLITE3_OPEN_READWRITE SQLITE3_OPEN_CREATE contained
X
X" standard
Xsyn keyword phpConstants CONNECTION_ABORTED CONNECTION_NORMAL CONNECTION_TIMEOUT INI_USER INI_PERDIR INI_SYSTEM INI_ALL INI_SCANNER_NORMAL INI_SCANNER_RAW PHP_URL_SCHEME PHP_URL_HOST PHP_URL_PORT PHP_URL_USER PHP_URL_PASS PHP_URL_PATH PHP_URL_QUERY PHP_URL_FRAGMENT PHP_QUERY_RFC1738 PHP_QUERY_RFC3986 M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4 M_1_PI M_2_PI M_SQRTPI M_2_SQRTPI M_LNPI M_EULER M_SQRT2 M_SQRT1_2 M_SQRT3 INF NAN PHP_ROUND_HALF_UP PHP_ROUND_HALF_DOWN PHP_ROUND_HALF_EVEN PHP_ROUND_HALF_ODD INFO_GENERAL INFO_CREDITS INFO_CONFIGURATION INFO_MODULES INFO_ENVIRONMENT INFO_VARIABLES INFO_LICENSE INFO_ALL CREDITS_GROUP CREDITS_GENERAL CREDITS_SAPI CREDITS_MODULES CREDITS_DOCS CREDITS_FULLPAGE CREDITS_QA CREDITS_ALL HTML_SPECIALCHARS HTML_ENTITIES ENT_COMPAT ENT_QUOTES ENT_NOQUOTES ENT_IGNORE ENT_SUBSTITUTE ENT_DISALLOWED ENT_HTML401 ENT_XML1 ENT_XHTML ENT_HTML5 STR_PAD_LEFT STR_PAD_RIGHT STR_PAD_BOTH PATHINFO_DIRNAME PATHINFO_BASENAME PATHINFO_EXTENSION PATHINFO_FILENAME CHAR_MAX LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_ALL LC_MESSAGES SEEK_SET SEEK_CUR SEEK_END LOCK_SH LOCK_EX LOCK_UN LOCK_NB STREAM_NOTIFY_CONNECT STREAM_NOTIFY_AUTH_REQUIRED STREAM_NOTIFY_AUTH_RESULT STREAM_NOTIFY_MIME_TYPE_IS STREAM_NOTIFY_FILE_SIZE_IS STREAM_NOTIFY_REDIRECTED STREAM_NOTIFY_PROGRESS STREAM_NOTIFY_FAILURE STREAM_NOTIFY_COMPLETED STREAM_NOTIFY_RESOLVE STREAM_NOTIFY_SEVERITY_INFO STREAM_NOTIFY_SEVERITY_WARN STREAM_NOTIFY_SEVERITY_ERR STREAM_FILTER_READ STREAM_FILTER_WRITE STREAM_FILTER_ALL STREAM_CLIENT_PERSISTENT STREAM_CLIENT_ASYNC_CONNECT STREAM_CLIENT_CONNECT STREAM_CRYPTO_METHOD_SSLv2_CLIENT STREAM_CRYPTO_METHOD_SSLv3_CLIENT STREAM_CRYPTO_METHOD_SSLv23_CLIENT STREAM_CRYPTO_METHOD_TLS_CLIENT STREAM_CRYPTO_METHOD_SSLv2_SERVER STREAM_CRYPTO_METHOD_SSLv3_SERVER STREAM_CRYPTO_METHOD_SSLv23_SERVER STREAM_CRYPTO_METHOD_TLS_SERVER STREAM_SHUT_RD STREAM_SHUT_WR STREAM_SHUT_RDWR STREAM_PF_INET STREAM_PF_INET6 STREAM_PF_UNIX STREAM_IPPROTO_IP STREAM_IPPROTO_TCP STREAM_IPPROTO_UDP STREAM_IPPROTO_ICMP STREAM_IPPROTO_RAW STREAM_SOCK_STREAM STREAM_SOCK_DGRAM STREAM_SOCK_RAW STREAM_SOCK_SEQPACKET STREAM_SOCK_RDM STREAM_PEEK STREAM_OOB STREAM_SERVER_BIND STREAM_SERVER_LISTEN FILE_USE_INCLUDE_PATH FILE_IGNORE_NEW_LINES FILE_SKIP_EMPTY_LINES FILE_APPEND FILE_NO_DEFAULT_CONTEXT FILE_TEXT FILE_BINARY FNM_NOESCAPE FNM_PATHNAME FNM_PERIOD FNM_CASEFOLD PSFS_PASS_ON PSFS_FEED_ME PSFS_ERR_FATAL PSFS_FLAG_NORMAL PSFS_FLAG_FLUSH_INC PSFS_FLAG_FLUSH_CLOSE PASSWORD_DEFAULT PASSWORD_BCRYPT PASSWORD_BCRYPT_DEFAULT_COST ABDAY_1 ABDAY_2 ABDAY_3 ABDAY_4 ABDAY_5 ABDAY_6 ABDAY_7 DAY_1 DAY_2 DAY_3 DAY_4 DAY_5 DAY_6 DAY_7 ABMON_1 ABMON_2 ABMON_3 ABMON_4 ABMON_5 ABMON_6 ABMON_7 ABMON_8 ABMON_9 ABMON_10 ABMON_11 ABMON_12 MON_1 MON_2 MON_3 MON_4 MON_5 MON_6 MON_7 MON_8 MON_9 MON_10 MON_11 MON_12 AM_STR PM_STR D_T_FMT D_FMT T_FMT T_FMT_AMPM ERA ERA_D_T_FMT ERA_D_FMT ERA_T_FMT ALT_DIGITS CRNCYSTR RADIXCHAR THOUSEP YESEXPR NOEXPR YESSTR NOSTR CODESET CRYPT_SALT_LENGTH CRYPT_STD_DES CRYPT_EXT_DES CRYPT_MD5 CRYPT_BLOWFISH CRYPT_SHA256 CRYPT_SHA512 DIRECTORY_SEPARATOR PATH_SEPARATOR SCANDIR_SORT_ASCENDING SCANDIR_SORT_DESCENDING SCANDIR_SORT_NONE GLOB_BRACE GLOB_MARK GLOB_NOSORT GLOB_NOCHECK GLOB_NOESCAPE GLOB_ERR GLOB_ONLYDIR GLOB_AVAILABLE_FLAGS LOG_EMERG LOG_ALERT LOG_CRIT LOG_ERR LOG_WARNING LOG_NOTICE LOG_INFO LOG_DEBUG LOG_KERN LOG_USER LOG_MAIL LOG_DAEMON LOG_AUTH LOG_SYSLOG LOG_LPR LOG_NEWS LOG_UUCP LOG_CRON LOG_AUTHPRIV LOG_LOCAL0 LOG_LOCAL1 LOG_LOCAL2 LOG_LOCAL3 LOG_LOCAL4 LOG_LOCAL5 LOG_LOCAL6 LOG_LOCAL7 LOG_PID LOG_CONS LOG_ODELAY LOG_NDELAY LOG_NOWAIT LOG_PERROR EXTR_OVERWRITE EXTR_SKIP EXTR_PREFIX_SAME EXTR_PREFIX_ALL EXTR_PREFIX_INVALID EXTR_PREFIX_IF_EXISTS EXTR_IF_EXISTS EXTR_REFS SORT_ASC SORT_DESC SORT_REGULAR SORT_NUMERIC SORT_STRING SORT_LOCALE_STRING SORT_NATURAL SORT_FLAG_CASE CASE_LOWER CASE_UPPER COUNT_NORMAL COUNT_RECURSIVE ASSERT_ACTIVE ASSERT_CALLBACK ASSERT_BAIL ASSERT_WARNING ASSERT_QUIET_EVAL STREAM_USE_PATH STREAM_IGNORE_URL STREAM_REPORT_ERRORS STREAM_MUST_SEEK STREAM_URL_STAT_LINK STREAM_URL_STAT_QUIET STREAM_MKDIR_RECURSIVE STREAM_IS_URL STREAM_OPTION_BLOCKING STREAM_OPTION_READ_TIMEOUT STREAM_OPTION_READ_BUFFER STREAM_OPTION_WRITE_BUFFER STREAM_BUFFER_NONE STREAM_BUFFER_LINE STREAM_BUFFER_FULL STREAM_CAST_AS_STREAM STREAM_CAST_FOR_SELECT STREAM_META_TOUCH STREAM_META_OWNER STREAM_META_OWNER_NAME STREAM_META_GROUP STREAM_META_GROUP_NAME STREAM_META_ACCESS IMAGETYPE_GIF IMAGETYPE_JPEG IMAGETYPE_PNG IMAGETYPE_SWF IMAGETYPE_PSD IMAGETYPE_BMP IMAGETYPE_TIFF_II IMAGETYPE_TIFF_MM IMAGETYPE_JPC IMAGETYPE_JP2 IMAGETYPE_JPX IMAGETYPE_JB2 IMAGETYPE_IFF IMAGETYPE_WBMP IMAGETYPE_JPEG2000 IMAGETYPE_XBM IMAGETYPE_ICO IMAGETYPE_UNKNOWN IMAGETYPE_COUNT DNS_A DNS_NS DNS_CNAME DNS_SOA DNS_PTR DNS_HINFO DNS_MX DNS_TXT DNS_SRV DNS_NAPTR DNS_AAAA DNS_A6 DNS_ANY DNS_ALL contained
X
X" tokenizer
Xsyn keyword phpConstants T_REQUIRE_ONCE T_REQUIRE T_EVAL T_INCLUDE_ONCE T_INCLUDE T_LOGICAL_OR T_LOGICAL_XOR T_LOGICAL_AND T_PRINT T_SR_EQUAL T_SL_EQUAL T_XOR_EQUAL T_OR_EQUAL T_AND_EQUAL T_MOD_EQUAL T_CONCAT_EQUAL T_DIV_EQUAL T_MUL_EQUAL T_MINUS_EQUAL T_PLUS_EQUAL T_BOOLEAN_OR T_BOOLEAN_AND T_IS_NOT_IDENTICAL T_IS_IDENTICAL T_IS_NOT_EQUAL T_IS_EQUAL T_IS_GREATER_OR_EQUAL T_IS_SMALLER_OR_EQUAL T_SR T_SL T_INSTANCEOF T_UNSET_CAST T_BOOL_CAST T_OBJECT_CAST T_ARRAY_CAST T_STRING_CAST T_DOUBLE_CAST T_INT_CAST T_DEC T_INC T_CLONE T_NEW T_EXIT T_IF T_ELSEIF T_ELSE T_ENDIF T_LNUMBER T_DNUMBER T_STRING T_STRING_VARNAME T_VARIABLE T_NUM_STRING T_INLINE_HTML T_CHARACTER T_BAD_CHARACTER T_ENCAPSED_AND_WHITESPACE T_CONSTANT_ENCAPSED_STRING T_ECHO T_DO T_WHILE T_ENDWHILE T_FOR T_ENDFOR T_FOREACH T_ENDFOREACH T_DECLARE T_ENDDECLARE T_AS T_SWITCH T_ENDSWITCH T_CASE T_DEFAULT T_BREAK T_CONTINUE T_GOTO T_FUNCTION T_CONST T_RETURN T_YIELD T_TRY T_CATCH T_FINALLY T_THROW T_USE T_INSTEADOF T_GLOBAL T_PUBLIC T_PROTECTED T_PRIVATE T_FINAL T_ABSTRACT T_STATIC T_VAR T_UNSET T_ISSET T_EMPTY T_HALT_COMPILER T_CLASS T_TRAIT T_INTERFACE T_EXTENDS T_IMPLEMENTS T_OBJECT_OPERATOR T_DOUBLE_ARROW T_LIST T_ARRAY T_CALLABLE T_CLASS_C T_TRAIT_C T_METHOD_C T_FUNC_C T_LINE T_FILE T_COMMENT T_DOC_COMMENT T_OPEN_TAG T_OPEN_TAG_WITH_ECHO T_CLOSE_TAG T_WHITESPACE T_START_HEREDOC T_END_HEREDOC T_DOLLAR_OPEN_CURLY_BRACES T_CURLY_OPEN T_PAAMAYIM_NEKUDOTAYIM T_NAMESPACE T_NS_C T_DIR T_NS_SEPARATOR T_DOUBLE_COLON contained
X
X" xml
Xsyn keyword phpConstants XML_ERROR_NONE XML_ERROR_NO_MEMORY XML_ERROR_SYNTAX XML_ERROR_NO_ELEMENTS XML_ERROR_INVALID_TOKEN XML_ERROR_UNCLOSED_TOKEN XML_ERROR_PARTIAL_CHAR XML_ERROR_TAG_MISMATCH XML_ERROR_DUPLICATE_ATTRIBUTE XML_ERROR_JUNK_AFTER_DOC_ELEMENT XML_ERROR_PARAM_ENTITY_REF XML_ERROR_UNDEFINED_ENTITY XML_ERROR_RECURSIVE_ENTITY_REF XML_ERROR_ASYNC_ENTITY XML_ERROR_BAD_CHAR_REF XML_ERROR_BINARY_ENTITY_REF XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF XML_ERROR_MISPLACED_XML_PI XML_ERROR_UNKNOWN_ENCODING XML_ERROR_INCORRECT_ENCODING XML_ERROR_UNCLOSED_CDATA_SECTION XML_ERROR_EXTERNAL_ENTITY_HANDLING XML_OPTION_CASE_FOLDING XML_OPTION_TARGET_ENCODING XML_OPTION_SKIP_TAGSTART XML_OPTION_SKIP_WHITE XML_SAX_IMPL contained
X
X" xmlreader
Xsyn keyword phpConstants NONE ELEMENT ATTRIBUTE TEXT CDATA ENTITY_REF ENTITY PI COMMENT DOC DOC_TYPE DOC_FRAGMENT NOTATION WHITESPACE SIGNIFICANT_WHITESPACE END_ELEMENT END_ENTITY XML_DECLARATION LOADDTD DEFAULTATTRS VALIDATE SUBST_ENTITIES contained
X
X" zip
Xsyn keyword phpConstants CREATE EXCL CHECKCONS OVERWRITE FL_NOCASE FL_NODIR FL_COMPRESSED FL_UNCHANGED CM_DEFAULT CM_STORE CM_SHRINK CM_REDUCE_1 CM_REDUCE_2 CM_REDUCE_3 CM_REDUCE_4 CM_IMPLODE CM_DEFLATE CM_DEFLATE64 CM_PKWARE_IMPLODE CM_BZIP2 CM_LZMA CM_TERSE CM_LZ77 CM_WAVPACK CM_PPMD ER_OK ER_MULTIDISK ER_RENAME ER_CLOSE ER_SEEK ER_READ ER_WRITE ER_CRC ER_ZIPCLOSED ER_NOENT ER_EXISTS ER_OPEN ER_TMPOPEN ER_ZLIB ER_MEMORY ER_CHANGED ER_COMPNOTSUPP ER_EOF ER_INVAL ER_NOZIP ER_INTERNAL ER_INCONS ER_REMOVE ER_DELETED contained
X
Xsyn case ignore
X
X" bcmath
Xsyn keyword phpFunctions bcadd bcsub bcmul bcdiv bcmod bcpow bcsqrt bcscale bccomp bcpowmod contained
X" bz2
Xsyn keyword phpFunctions bzopen bzread bzwrite bzflush bzclose bzerrno bzerrstr bzerror bzcompress bzdecompress contained
X" Core
Xsyn keyword phpFunctions zend_version func_num_args func_get_arg func_get_args strlen strcmp strncmp strcasecmp strncasecmp each error_reporting define defined get_class get_called_class get_parent_class method_exists property_exists class_exists interface_exists trait_exists function_exists class_alias get_included_files get_required_files is_subclass_of is_a get_class_vars get_object_vars get_class_methods trigger_error user_error set_error_handler restore_error_handler set_exception_handler restore_exception_handler get_declared_classes get_declared_traits get_declared_interfaces get_defined_functions get_defined_vars create_function get_resource_type get_loaded_extensions extension_loaded get_extension_funcs get_defined_constants debug_backtrace debug_print_backtrace gc_collect_cycles gc_enabled gc_enable gc_disable contained
Xsyn keyword phpClasses stdClass Traversable IteratorAggregate Iterator ArrayAccess Serializable Exception ErrorException Closure Generator contained
X
X" curl
Xsyn keyword phpFunctions curl_init curl_copy_handle curl_version curl_setopt curl_setopt_array curl_exec curl_getinfo curl_error curl_errno curl_close curl_strerror curl_multi_strerror curl_reset curl_escape curl_unescape curl_pause curl_multi_init curl_multi_add_handle curl_multi_remove_handle curl_multi_select curl_multi_exec curl_multi_getcontent curl_multi_info_read curl_multi_close curl_multi_setopt curl_share_init curl_share_close curl_share_setopt curl_file_create contained
Xsyn keyword phpClasses CURLFile contained
X
X" date
Xsyn keyword phpFunctions strtotime date idate gmdate mktime gmmktime checkdate strftime gmstrftime time localtime getdate date_create date_create_immutable date_create_from_format date_create_immutable_from_format date_parse date_parse_from_format date_get_last_errors date_format date_modify date_add date_sub date_timezone_get date_timezone_set date_offset_get date_diff date_time_set date_date_set date_isodate_set date_timestamp_set date_timestamp_get timezone_open timezone_name_get timezone_name_from_abbr timezone_offset_get timezone_transitions_get timezone_location_get timezone_identifiers_list timezone_abbreviations_list timezone_version_get date_interval_create_from_date_string date_interval_format date_default_timezone_set date_default_timezone_get date_sunrise date_sunset date_sun_info contained
Xsyn keyword phpClasses DateTimeInterface DateTime DateTimeImmutable DateTimeZone DateInterval DatePeriod contained
X
X" dom
Xsyn keyword phpFunctions dom_import_simplexml contained
Xsyn keyword phpClasses DOMException DOMStringList DOMNameList DOMImplementationList DOMImplementationSource DOMImplementation DOMNode DOMNameSpaceNode DOMDocumentFragment DOMDocument DOMNodeList DOMNamedNodeMap DOMCharacterData DOMAttr DOMElement DOMText DOMComment DOMTypeinfo DOMUserDataHandler DOMDomError DOMErrorHandler DOMLocator DOMConfiguration DOMCdataSection DOMDocumentType DOMNotation DOMEntity DOMEntityReference DOMProcessingInstruction DOMStringExtend DOMXPath contained
X
X" ereg
Xsyn keyword phpFunctions ereg ereg_replace eregi eregi_replace split spliti sql_regcase contained
X" hash
Xsyn keyword phpFunctions hash hash_file hash_hmac hash_hmac_file hash_init hash_update hash_update_stream hash_update_file hash_final hash_copy hash_algos hash_pbkdf2 mhash_keygen_s2k mhash_get_block_size mhash_get_hash_name mhash_count mhash contained
X" iconv
Xsyn keyword phpFunctions iconv iconv_get_encoding iconv_set_encoding iconv_strlen iconv_substr iconv_strpos iconv_strrpos iconv_mime_encode iconv_mime_decode iconv_mime_decode_headers contained
X" json
Xsyn keyword phpFunctions json_encode json_decode json_last_error json_last_error_msg contained
Xsyn keyword phpClasses JsonSerializable contained
X
X" libxml
Xsyn keyword phpFunctions libxml_set_streams_context libxml_use_internal_errors libxml_get_last_error libxml_clear_errors libxml_get_errors libxml_disable_entity_loader libxml_set_external_entity_loader contained
Xsyn keyword phpClasses LibXMLError contained
X
X" mbstring
Xsyn keyword phpFunctions mb_convert_case mb_strtoupper mb_strtolower mb_language mb_internal_encoding mb_http_input mb_http_output mb_detect_order mb_substitute_character mb_parse_str mb_output_handler mb_preferred_mime_name mb_strlen mb_strpos mb_strrpos mb_stripos mb_strripos mb_strstr mb_strrchr mb_stristr mb_strrichr mb_substr_count mb_substr mb_strcut mb_strwidth mb_strimwidth mb_convert_encoding mb_detect_encoding mb_list_encodings mb_encoding_aliases mb_convert_kana mb_encode_mimeheader mb_decode_mimeheader mb_convert_variables mb_encode_numericentity mb_decode_numericentity mb_send_mail mb_get_info mb_check_encoding mb_regex_encoding mb_regex_set_options mb_ereg mb_eregi mb_ereg_replace mb_eregi_replace mb_ereg_replace_callback mb_split mb_ereg_match mb_ereg_search mb_ereg_search_pos mb_ereg_search_regs mb_ereg_search_init mb_ereg_search_getregs mb_ereg_search_getpos mb_ereg_search_setpos mbregex_encoding mbereg mberegi mbereg_replace mberegi_replace mbsplit mbereg_match mbereg_search mbereg_search_pos mbereg_search_regs mbereg_search_init mbereg_search_getregs mbereg_search_getpos mbereg_search_setpos contained
X" mcrypt
Xsyn keyword phpFunctions mcrypt_ecb mcrypt_cbc mcrypt_cfb mcrypt_ofb mcrypt_get_key_size mcrypt_get_block_size mcrypt_get_cipher_name mcrypt_create_iv mcrypt_list_algorithms mcrypt_list_modes mcrypt_get_iv_size mcrypt_encrypt mcrypt_decrypt mcrypt_module_open mcrypt_generic_init mcrypt_generic mdecrypt_generic mcrypt_generic_end mcrypt_generic_deinit mcrypt_enc_self_test mcrypt_enc_is_block_algorithm_mode mcrypt_enc_is_block_algorithm mcrypt_enc_is_block_mode mcrypt_enc_get_block_size mcrypt_enc_get_key_size mcrypt_enc_get_supported_key_sizes mcrypt_enc_get_iv_size mcrypt_enc_get_algorithms_name mcrypt_enc_get_modes_name mcrypt_module_self_test mcrypt_module_is_block_algorithm_mode mcrypt_module_is_block_algorithm mcrypt_module_is_block_mode mcrypt_module_get_algo_block_size mcrypt_module_get_algo_key_size mcrypt_module_get_supported_key_sizes mcrypt_module_close contained
X" mhash
X" mysql
Xsyn keyword phpFunctions mysql_connect mysql_pconnect mysql_close mysql_select_db mysql_query mysql_unbuffered_query mysql_db_query mysql_list_dbs mysql_list_tables mysql_list_fields mysql_list_processes mysql_error mysql_errno mysql_affected_rows mysql_insert_id mysql_result mysql_num_rows mysql_num_fields mysql_fetch_row mysql_fetch_array mysql_fetch_assoc mysql_fetch_object mysql_data_seek mysql_fetch_lengths mysql_fetch_field mysql_field_seek mysql_free_result mysql_field_name mysql_field_table mysql_field_len mysql_field_type mysql_field_flags mysql_escape_string mysql_real_escape_string mysql_stat mysql_thread_id mysql_client_encoding mysql_ping mysql_get_client_info mysql_get_host_info mysql_get_proto_info mysql_get_server_info mysql_info mysql_set_charset mysql mysql_fieldname mysql_fieldtable mysql_fieldlen mysql_fieldtype mysql_fieldflags mysql_selectdb mysql_freeresult mysql_numfields mysql_numrows mysql_listdbs mysql_listtables mysql_listfields mysql_db_name mysql_dbname mysql_tablename mysql_table_name contained
X" mysqli
Xsyn keyword phpFunctions mysqli_affected_rows mysqli_autocommit mysqli_begin_transaction mysqli_change_user mysqli_character_set_name mysqli_close mysqli_commit mysqli_connect mysqli_connect_errno mysqli_connect_error mysqli_data_seek mysqli_dump_debug_info mysqli_debug mysqli_errno mysqli_error mysqli_error_list mysqli_stmt_execute mysqli_execute mysqli_fetch_field mysqli_fetch_fields mysqli_fetch_field_direct mysqli_fetch_lengths mysqli_fetch_all mysqli_fetch_array mysqli_fetch_assoc mysqli_fetch_object mysqli_fetch_row mysqli_field_count mysqli_field_seek mysqli_field_tell mysqli_free_result mysqli_get_connection_stats mysqli_get_client_stats mysqli_get_charset mysqli_get_client_info mysqli_get_client_version mysqli_get_host_info mysqli_get_proto_info mysqli_get_server_info mysqli_get_server_version mysqli_get_warnings mysqli_init mysqli_info mysqli_insert_id mysqli_kill mysqli_more_results mysqli_multi_query mysqli_next_result mysqli_num_fields mysqli_num_rows mysqli_options mysqli_ping mysqli_poll mysqli_prepare mysqli_report mysqli_query mysqli_real_connect mysqli_real_escape_string mysqli_real_query mysqli_reap_async_query mysqli_release_savepoint mysqli_rollback mysqli_savepoint mysqli_select_db mysqli_set_charset mysqli_stmt_affected_rows mysqli_stmt_attr_get mysqli_stmt_attr_set mysqli_stmt_bind_param mysqli_stmt_bind_result mysqli_stmt_close mysqli_stmt_data_seek mysqli_stmt_errno mysqli_stmt_error mysqli_stmt_error_list mysqli_stmt_fetch mysqli_stmt_field_count mysqli_stmt_free_result mysqli_stmt_get_result mysqli_stmt_get_warnings mysqli_stmt_init mysqli_stmt_insert_id mysqli_stmt_more_results mysqli_stmt_next_result mysqli_stmt_num_rows mysqli_stmt_param_count mysqli_stmt_prepare mysqli_stmt_reset mysqli_stmt_result_metadata mysqli_stmt_send_long_data mysqli_stmt_store_result mysqli_stmt_sqlstate mysqli_sqlstate mysqli_ssl_set mysqli_stat mysqli_store_result mysqli_thread_id mysqli_thread_safe mysqli_use_result mysqli_warning_count mysqli_refresh mysqli_escape_string mysqli_set_opt contained
Xsyn keyword phpClasses mysqli_sql_exception mysqli_driver mysqli mysqli_warning mysqli_result mysqli_stmt contained
X
X" openssl
Xsyn keyword phpFunctions openssl_pkey_free openssl_pkey_new openssl_pkey_export openssl_pkey_export_to_file openssl_pkey_get_private openssl_pkey_get_public openssl_pkey_get_details openssl_free_key openssl_get_privatekey openssl_get_publickey openssl_x509_read openssl_x509_free openssl_x509_parse openssl_x509_checkpurpose openssl_x509_check_private_key openssl_x509_export openssl_x509_export_to_file openssl_pkcs12_export openssl_pkcs12_export_to_file openssl_pkcs12_read openssl_csr_new openssl_csr_export openssl_csr_export_to_file openssl_csr_sign openssl_csr_get_subject openssl_csr_get_public_key openssl_digest openssl_encrypt openssl_decrypt openssl_cipher_iv_length openssl_sign openssl_verify openssl_seal openssl_open openssl_pkcs7_verify openssl_pkcs7_decrypt openssl_pkcs7_sign openssl_pkcs7_encrypt openssl_private_encrypt openssl_private_decrypt openssl_public_encrypt openssl_public_decrypt openssl_get_md_methods openssl_get_cipher_methods openssl_dh_compute_key openssl_random_pseudo_bytes openssl_error_string contained
X" pcre
Xsyn keyword phpFunctions preg_match preg_match_all preg_replace preg_replace_callback preg_filter preg_split preg_quote preg_grep preg_last_error contained
X" PDO
Xsyn keyword phpFunctions pdo_drivers contained
Xsyn keyword phpClasses PDOException PDO PDOStatement PDORow contained
X
X" Phar
Xsyn keyword phpClasses PharException Phar PharData PharFileInfo contained
X
X" Reflection
Xsyn keyword phpClasses ReflectionException Reflection Reflector ReflectionFunctionAbstract ReflectionFunction ReflectionParameter ReflectionMethod ReflectionClass ReflectionObject ReflectionProperty ReflectionExtension ReflectionZendExtension contained
X
X" session
Xsyn keyword phpFunctions session_name session_module_name session_save_path session_id session_regenerate_id session_decode session_encode session_start session_destroy session_unset session_set_save_handler session_cache_limiter session_cache_expire session_set_cookie_params session_get_cookie_params session_write_close session_status session_register_shutdown session_commit contained
Xsyn keyword phpClasses SessionHandlerInterface SessionIdInterface SessionHandler contained
X
X" SimpleXML
Xsyn keyword phpFunctions simplexml_load_file simplexml_load_string simplexml_import_dom contained
Xsyn keyword phpClasses SimpleXMLElement SimpleXMLIterator contained
X
X" sockets
Xsyn keyword phpFunctions socket_select socket_create socket_create_listen socket_create_pair socket_accept socket_set_nonblock socket_set_block socket_listen socket_close socket_write socket_read socket_getsockname socket_getpeername socket_connect socket_strerror socket_bind socket_recv socket_send socket_recvfrom socket_sendto socket_get_option socket_set_option socket_shutdown socket_last_error socket_clear_error socket_import_stream socket_sendmsg socket_recvmsg socket_cmsg_space socket_getopt socket_setopt contained
X" SPL
Xsyn keyword phpFunctions spl_classes spl_autoload spl_autoload_extensions spl_autoload_register spl_autoload_unregister spl_autoload_functions spl_autoload_call class_parents class_implements class_uses spl_object_hash iterator_to_array iterator_count iterator_apply contained
Xsyn keyword phpClasses LogicException BadFunctionCallException BadMethodCallException DomainException InvalidArgumentException LengthException OutOfRangeException RuntimeException OutOfBoundsException OverflowException RangeException UnderflowException UnexpectedValueException RecursiveIterator RecursiveIteratorIterator OuterIterator IteratorIterator FilterIterator RecursiveFilterIterator CallbackFilterIterator RecursiveCallbackFilterIterator ParentIterator Countable SeekableIterator LimitIterator CachingIterator RecursiveCachingIterator NoRewindIterator AppendIterator InfiniteIterator RegexIterator RecursiveRegexIterator EmptyIterator RecursiveTreeIterator ArrayObject ArrayIterator RecursiveArrayIterator SplFileInfo DirectoryIterator FilesystemIterator RecursiveDirectoryIterator GlobIterator SplFileObject SplTempFileObject SplDoublyLinkedList SplQueue SplStack SplHeap SplMinHeap SplMaxHeap SplPriorityQueue SplFixedArray SplObserver SplSubject SplObjectStorage MultipleIterator contained
X
X" sqlite3
Xsyn keyword phpClasses SQLite3 SQLite3Stmt SQLite3Result contained
X
X" standard
Xsyn keyword phpFunctions constant bin2hex hex2bin sleep usleep time_nanosleep time_sleep_until strptime flush wordwrap htmlspecialchars htmlentities html_entity_decode htmlspecialchars_decode get_html_translation_table sha1 sha1_file md5 md5_file crc32 iptcparse iptcembed getimagesize getimagesizefromstring image_type_to_mime_type image_type_to_extension phpinfo phpversion phpcredits php_sapi_name php_uname php_ini_scanned_files php_ini_loaded_file strnatcmp strnatcasecmp substr_count strspn strcspn strtok strtoupper strtolower strpos stripos strrpos strripos strrev hebrev hebrevc nl2br basename dirname pathinfo stripslashes stripcslashes strstr stristr strrchr str_shuffle str_word_count str_split strpbrk substr_compare strcoll money_format substr substr_replace quotemeta ucfirst lcfirst ucwords strtr addslashes addcslashes rtrim str_replace str_ireplace str_repeat count_chars chunk_split trim ltrim strip_tags similar_text explode implode join setlocale localeconv nl_langinfo soundex levenshtein chr ord parse_str str_getcsv str_pad chop strchr sprintf printf vprintf vsprintf fprintf vfprintf sscanf fscanf parse_url urlencode urldecode rawurlencode rawurldecode http_build_query readlink linkinfo symlink link unlink exec system escapeshellcmd escapeshellarg passthru shell_exec proc_open proc_close proc_terminate proc_get_status proc_nice rand srand getrandmax mt_rand mt_srand mt_getrandmax getservbyname getservbyport getprotobyname getprotobynumber getmyuid getmygid getmypid getmyinode getlastmod base64_decode base64_encode password_hash password_get_info password_needs_rehash password_verify convert_uuencode convert_uudecode abs ceil floor round sin cos tan asin acos atan atanh atan2 sinh cosh tanh asinh acosh expm1 log1p pi is_finite is_nan is_infinite pow exp log log10 sqrt hypot deg2rad rad2deg bindec hexdec octdec decbin decoct dechex base_convert number_format fmod inet_ntop inet_pton ip2long long2ip getenv putenv getopt sys_getloadavg microtime gettimeofday getrusage uniqid quoted_printable_decode quoted_printable_encode convert_cyr_string get_current_user set_time_limit header_register_callback get_cfg_var magic_quotes_runtime set_magic_quotes_runtime get_magic_quotes_gpc get_magic_quotes_runtime error_log error_get_last call_user_func call_user_func_array call_user_method call_user_method_array forward_static_call forward_static_call_array serialize unserialize var_dump var_export debug_zval_dump print_r memory_get_usage memory_get_peak_usage register_shutdown_function register_tick_function unregister_tick_function highlight_file show_source highlight_string php_strip_whitespace ini_get ini_get_all ini_set ini_alter ini_restore get_include_path set_include_path restore_include_path setcookie setrawcookie header header_remove headers_sent headers_list http_response_code connection_aborted connection_status ignore_user_abort parse_ini_file parse_ini_string is_uploaded_file move_uploaded_file gethostbyaddr gethostbyname gethostbynamel gethostname dns_check_record checkdnsrr dns_get_mx getmxrr dns_get_record intval floatval doubleval strval boolval gettype settype is_null is_resource is_bool is_long is_float is_int is_integer is_double is_real is_numeric is_string is_array is_object is_scalar is_callable pclose popen readfile rewind rmdir umask fclose feof fgetc fgets fgetss fread fopen fpassthru ftruncate fstat fseek ftell fflush fwrite fputs mkdir rename copy tempnam tmpfile file file_get_contents file_put_contents stream_select stream_context_create stream_context_set_params stream_context_get_params stream_context_set_option stream_context_get_options stream_context_get_default stream_context_set_default stream_filter_prepend stream_filter_append stream_filter_remove stream_socket_client stream_socket_server stream_socket_accept stream_socket_get_name stream_socket_recvfrom stream_socket_sendto stream_socket_enable_crypto stream_socket_shutdown stream_socket_pair stream_copy_to_stream stream_get_contents stream_supports_lock fgetcsv fputcsv flock get_meta_tags stream_set_read_buffer stream_set_write_buffer set_file_buffer stream_set_chunk_size set_socket_blocking stream_set_blocking socket_set_blocking stream_get_meta_data stream_get_line stream_wrapper_register stream_register_wrapper stream_wrapper_unregister stream_wrapper_restore stream_get_wrappers stream_get_transports stream_resolve_include_path stream_is_local get_headers stream_set_timeout socket_set_timeout socket_get_status realpath fnmatch fsockopen pfsockopen pack unpack get_browser crypt opendir closedir chdir getcwd rewinddir readdir dir scandir glob fileatime filectime filegroup fileinode filemtime fileowner fileperms filesize filetype file_exists is_writable is_writeable is_readable is_executable is_file is_dir is_link stat lstat chown chgrp lchown lchgrp chmod touch clearstatcache disk_total_space disk_free_space diskfreespace realpath_cache_size realpath_cache_get mail ezmlm_hash openlog syslog closelog lcg_value metaphone ob_start ob_flush ob_clean ob_end_flush ob_end_clean ob_get_flush ob_get_clean ob_get_length ob_get_level ob_get_status ob_get_contents ob_implicit_flush ob_list_handlers ksort krsort natsort natcasesort asort arsort sort rsort usort uasort uksort shuffle array_walk array_walk_recursive count end prev next reset current key min max in_array array_search extract compact array_fill array_fill_keys range array_multisort array_push array_pop array_shift array_unshift array_splice array_slice array_merge array_merge_recursive array_replace array_replace_recursive array_keys array_values array_count_values array_column array_reverse array_reduce array_pad array_flip array_change_key_case array_rand array_unique array_intersect array_intersect_key array_intersect_ukey array_uintersect array_intersect_assoc array_uintersect_assoc array_intersect_uassoc array_uintersect_uassoc array_diff array_diff_key array_diff_ukey array_udiff array_diff_assoc array_udiff_assoc array_diff_uassoc array_udiff_uassoc array_sum array_product array_filter array_map array_chunk array_combine array_key_exists pos sizeof key_exists assert assert_options version_compare ftok str_rot13 stream_get_filters stream_filter_register stream_bucket_make_writeable stream_bucket_prepend stream_bucket_append stream_bucket_new output_add_rewrite_var output_reset_rewrite_vars sys_get_temp_dir contained
Xsyn keyword phpClasses __PHP_Incomplete_Class php_user_filter Directory contained
X
X" tokenizer
Xsyn keyword phpFunctions token_get_all token_name contained
X" xml
Xsyn keyword phpFunctions xml_parser_create xml_parser_create_ns xml_set_object xml_set_element_handler xml_set_character_data_handler xml_set_processing_instruction_handler xml_set_default_handler xml_set_unparsed_entity_decl_handler xml_set_notation_decl_handler xml_set_external_entity_ref_handler xml_set_start_namespace_decl_handler xml_set_end_namespace_decl_handler xml_parse xml_parse_into_struct xml_get_error_code xml_error_string xml_get_current_line_number xml_get_current_column_number xml_get_current_byte_index xml_parser_free xml_parser_set_option xml_parser_get_option utf8_encode utf8_decode contained
X" xmlreader
Xsyn keyword phpClasses XMLReader contained
X
X" xmlwriter
Xsyn keyword phpFunctions xmlwriter_open_uri xmlwriter_open_memory xmlwriter_set_indent xmlwriter_set_indent_string xmlwriter_start_comment xmlwriter_end_comment xmlwriter_start_attribute xmlwriter_end_attribute xmlwriter_write_attribute xmlwriter_start_attribute_ns xmlwriter_write_attribute_ns xmlwriter_start_element xmlwriter_end_element xmlwriter_full_end_element xmlwriter_start_element_ns xmlwriter_write_element xmlwriter_write_element_ns xmlwriter_start_pi xmlwriter_end_pi xmlwriter_write_pi xmlwriter_start_cdata xmlwriter_end_cdata xmlwriter_write_cdata xmlwriter_text xmlwriter_write_raw xmlwriter_start_document xmlwriter_end_document xmlwriter_write_comment xmlwriter_start_dtd xmlwriter_end_dtd xmlwriter_write_dtd xmlwriter_start_dtd_element xmlwriter_end_dtd_element xmlwriter_write_dtd_element xmlwriter_start_dtd_attlist xmlwriter_end_dtd_attlist xmlwriter_write_dtd_attlist xmlwriter_start_dtd_entity xmlwriter_end_dtd_entity xmlwriter_write_dtd_entity xmlwriter_output_memory xmlwriter_flush contained
Xsyn keyword phpClasses XMLWriter contained
X
X" zip
Xsyn keyword phpFunctions zip_open zip_close zip_read zip_entry_open zip_entry_close zip_entry_read zip_entry_filesize zip_entry_name zip_entry_compressedsize zip_entry_compressionmethod contained
Xsyn keyword phpClasses ZipArchive contained
X
X
X
X" === END BUILTIN FUNCTIONS, CLASSES, AND CONSTANTS =====================================
X
X" The following is needed afterall it seems.
Xsyntax keyword phpClasses containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier,phpMethodsVar
X
X" Control Structures
Xsyn keyword phpStatement if else elseif while do for foreach break switch case default continue return goto as endif endwhile endfor endforeach endswitch declare endeclare contained
X
X" Class Keywords
Xsyn keyword phpType class abstract extends interface implements static final var public private protected const trait contained
X
X" Magic Methods
Xsyn keyword phpStatement __construct __destruct __call __callStatic __get __set __isset __unset __sleep __wakeup __toString __invoke __set_state __clone contained
X
X" Exception Keywords
Xsyn keyword phpStatement try catch throw contained
X
X" Language Constructs
Xsyn keyword phpStatement die exit eval empty isset unset list instanceof insteadof contained
X
X" These special keywords have traditionally received special colors
Xsyn keyword phpSpecial function echo print new clone contained
X
X" Include & friends
Xsyn keyword phpInclude include include_once require require_once namespace use contained
X
X" Types
Xsyn keyword phpType bool[ean] int[eger] real double float string array object null self parent global this stdClass callable contained
X
X" Operator
Xsyn match phpOperator       "[-=+%^&|*!.~?:]" contained display
Xsyn match phpOperator       "[-+*/%^&|.]="  contained display
Xsyn match phpOperator       "/[^*/]"me=e-1  contained display
Xsyn match phpOperator       "\$"  contained display
Xsyn match phpOperator       "&&\|\<and\>" contained display
Xsyn match phpOperator       "||\|\<x\=or\>" contained display
Xsyn match phpOperator       "[!=<>]=" contained display
Xsyn match phpOperator       "[<>]"  contained display
Xsyn match phpMemberSelector "->"  contained display
Xsyn match phpVarSelector    "\$"  contained display
X" highlight object variables inside strings
Xsyn match phpMethodsVar     "->\h\w*" contained contains=phpMethods,phpMemberSelector display containedin=phpStringDouble
X
X" Identifier
Xsyn match  phpIdentifier         "$\h\w*"  contained contains=phpEnvVar,phpIntVar,phpVarSelector display
Xsyn match  phpIdentifierSimply   "${\h\w*}"  contains=phpOperator,phpParent  contained display
Xsyn region phpIdentifierComplex  matchgroup=phpParent start="{\$"rs=e-1 end="}"  contains=phpIdentifier,phpMemberSelector,phpVarSelector,phpIdentifierArray contained extend
Xsyn region phpIdentifierArray    matchgroup=phpParent start="\[" end="]" contains=@phpClInside contained
X
X" Boolean
Xsyn keyword phpBoolean true false  contained
X
X" Number
Xsyn match phpNumber "-\=\<\d\+\>" contained display
Xsyn match phpNumber "\<0x\x\{1,8}\>"  contained display
Xsyn match phpNumber "\<0b[01]\+\>"    contained display
X
X" Float
Xsyn match phpNumber "\(-\=\<\d+\|-\=\)\.\d\+\>" contained display
X
X" SpecialChar
Xsyn match phpSpecialChar "\\[fnrtv\\]" contained display
Xsyn match phpSpecialChar "\\\d\{3}"  contained contains=phpOctalError display
Xsyn match phpSpecialChar "\\x\x\{2}" contained display
X" corrected highlighting for an escaped '\$' inside a double-quoted string
Xsyn match phpSpecialChar "\\\$"  contained display
Xsyn match phpSpecialChar +\\"+   contained display
Xsyn match phpStrEsc      "\\\\"  contained display
Xsyn match phpStrEsc      "\\'"   contained display
X
X" Error
Xsyn match phpOctalError "[89]"  contained display
Xif exists("php_parent_error_close")
X  syn match phpParentError "[)\]}]"  contained display
Xendif
X
X" Todo
Xsyn keyword phpTodo todo fixme xxx note contained
X
X" Comment
Xif exists("php_parent_error_open")
X  syn region phpComment start="/\*" end="\*/" contained contains=phpTodo,@Spell
Xelse
X  syn region phpComment start="/\*" end="\*/" contained contains=phpTodo,@Spell extend
Xendif
Xif version >= 600
X  syn match phpComment  "#.\{-}\(?>\|$\)\@="  contained contains=phpTodo,@Spell
X  syn match phpComment  "//.\{-}\(?>\|$\)\@=" contained contains=phpTodo,@Spell
Xelse
X  syn match phpComment  "#.\{-}$" contained contains=phpTodo,@Spell
X  syn match phpComment  "#.\{-}?>"me=e-2  contained contains=phpTodo,@Spell
X  syn match phpComment  "//.\{-}$"  contained contains=phpTodo,@Spell
X  syn match phpComment  "//.\{-}?>"me=e-2 contained contains=phpTodo,@Spell
Xendif
X
X" String
Xif exists("php_parent_error_open")
X  syn region phpStringDouble matchgroup=None start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@Spell,@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex,phpStrEsc contained keepend
X  syn region phpBacktick matchgroup=None start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@Spell,@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex,phpStrEsc contained keepend
X  syn region phpStringSingle matchgroup=None start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@Spell,@phpAddStrings,phpStrEsc contained keepend
Xelse
X  syn region phpStringDouble matchgroup=None start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@Spell,@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex,phpStrEsc contained extend keepend
X  syn region phpBacktick matchgroup=None start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@Spell,@phpAddStrings,phpIdentifier,phpSpecialChar,phpIdentifierSimply,phpIdentifierComplex,phpStrEsc contained extend keepend
X  syn region phpStringSingle matchgroup=None start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@Spell,@phpAddStrings,phpStrEsc contained keepend extend
Xendif
X
X" HereDoc
X  syn case match
X  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@<=\z(\I\i*\)$" end="^\z1\(;\=$\)\@=" contained contains=@Spell,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
X  syn region phpHereDoc matchgroup=Delimiter start=+\(<<<\)\@<="\z(\I\i*\)"$+ end="^\z1\(;\=$\)\@=" contained contains=@Spell,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
X" including HTML,JavaScript,SQL even if not enabled via options
X  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@<=\z(\(\I\i*\)\=\(html\)\c\(\i*\)\)$" end="^\z1\(;\=$\)\@="  contained contains=@htmlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
X  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@<=\z(\(\I\i*\)\=\(sql\)\c\(\i*\)\)$" end="^\z1\(;\=$\)\@=" contained contains=@sqlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
X  syn region phpHereDoc matchgroup=Delimiter start="\(<<<\)\@<=\z(\(\I\i*\)\=\(javascript\)\c\(\i*\)\)$" end="^\z1\(;\=$\)\@="  contained contains=@htmlJavascript,phpIdentifierSimply,phpIdentifier,phpIdentifierComplex,phpSpecialChar,phpMethodsVar,phpStrEsc keepend extend
X  syn case ignore
X
X" NowDoc
X  syn region phpNowDoc matchgroup=Delimiter start=+\(<<<\)\@<='\z(\I\i*\)'$+ end="^\z1\(;\=$\)\@=" contained keepend extend
X
X" Parent
Xif exists("php_parent_error_close") || exists("php_parent_error_open")
X  syn match  phpParent "[{}]"  contained
X  syn region phpParent matchgroup=Delimiter start="(" end=")"  contained contains=@phpClInside transparent
X  syn region phpParent matchgroup=Delimiter start="\[" end="\]"  contained contains=@phpClInside transparent
X  if !exists("php_parent_error_close")
X    syn match phpParent "[\])]" contained
X  endif
Xelse
X  syn match phpParent "[({[\]})]" contained
Xendif
X
X" Clusters
Xsyn cluster phpClConst contains=phpFunctions,phpClasses,phpIdentifier,phpStatement,phpOperator,phpStringSingle,phpStringDouble,phpBacktick,phpNumber,phpType,phpBoolean,phpStructure,phpMethodsVar,phpConstants,phpException,phpSuperglobals,phpMagicConstants,phpServerVars
Xsyn cluster phpClInside contains=@phpClConst,phpComment,phpParent,phpParentError,phpInclude,phpHereDoc,phpNowDoc
Xsyn cluster phpClFunction contains=@phpClInside,phpDefine,phpParentError,phpStorageClass,phpSpecial
Xsyn cluster phpClTop contains=@phpClFunction,phpFoldFunction,phpFoldClass,phpFoldInterface,phpFoldTry,phpFoldCatch
X
X" Php Region
Xif exists("php_parent_error_open")
X  syn region phpRegion matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpClTop
Xelse
X  syn region phpRegion matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpClTop keepend
Xendif
X
X" Fold
Xif exists("php_folding") && php_folding==1
X" match one line constructs here and skip them at folding
X  syn keyword phpSCKeyword  abstract final private protected public static  contained
X  syn keyword phpFCKeyword  function  contained
X  syn match phpDefine "\(\s\|^\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\(\s\+.*[;}]\)\@="  contained contains=phpSCKeyword
X  syn match phpStructure "\(\s\|^\)\(abstract\s\+\|final\s\+\)*class\(\s\+.*}\)\@="  contained
X  syn match phpStructure "\(\s\|^\)interface\(\s\+.*}\)\@="  contained
X  syn match phpException "\(\s\|^\)try\(\s\+.*}\)\@="  contained
X  syn match phpException "\(\s\|^\)catch\(\s\+.*}\)\@="  contained
X
X  set foldmethod=syntax
X  syn region phpFoldHtmlInside matchgroup=Delimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
X  syn region phpFoldFunction matchgroup=Storageclass start="^\z(\s*\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\s\([^};]*$\)\@="rs=e-9 matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldHtmlInside,phpFCKeyword contained transparent fold extend
X  syn region phpFoldFunction matchgroup=Define start="^function\s\([^};]*$\)\@=" matchgroup=Delimiter end="^}" contains=@phpClFunction,phpFoldHtmlInside contained transparent fold extend
X  syn region phpFoldClass matchgroup=Structure start="^\z(\s*\)\(abstract\s\+\|final\s\+\)*class\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction,phpSCKeyword contained transparent fold extend
X  syn region phpFoldInterface matchgroup=Structure start="^\z(\s*\)interface\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
X  syn region phpFoldCatch matchgroup=Exception start="^\z(\s*\)catch\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
X  syn region phpFoldTry matchgroup=Exception start="^\z(\s*\)try\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
Xelseif exists("php_folding") && php_folding==2
X  set foldmethod=syntax
X  syn region phpFoldHtmlInside matchgroup=Delimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
X  syn region phpParent matchgroup=Delimiter start="{" end="}"  contained contains=@phpClFunction,phpFoldHtmlInside transparent fold
Xendif
X
X" Sync
Xif php_sync_method==-1
X  syn sync match phpRegionSync grouphere phpRegion "^\s*<?\(php\)\=\s*$"
X  syn sync match phpRegionSync grouphere NONE "^\s*?>\s*$"
X  syn sync match phpRegionSync grouphere NONE "^\s*%>\s*$"
X  syn sync match phpRegionSync grouphere phpRegion "function\s.*(.*\$"
Xelseif php_sync_method>0
X  exec "syn sync minlines=" . php_sync_method
Xelse
X  exec "syn sync fromstart"
Xendif
X
X" Define the default highlighting.
X" For version 5.8 and later: only when an item doesn't have highlighting yet
Xif !exists("did_php_syn_inits")
X
X  hi def link phpComment          Comment
X  hi def link phpSuperglobals     Constant
X  hi def link phpMagicConstants   Constant
X  hi def link phpServerVars       Constant
X  hi def link phpConstants        Constant
X  hi def link phpBoolean          Constant
X  hi def link phpNumber           Constant
X  hi def link phpStringSingle     String
X  hi def link phpStringDouble     String
X  hi def link phpBacktick         String
X  hi def link phpHereDoc          String
X  hi def link phpNowDoc           String
X  hi def link phpFunctions        Identifier
X  hi def link phpClasses          Identifier
X  hi def link phpMethods          Identifier
X  hi def link phpIdentifier       Identifier
X  hi def link phpIdentifierSimply Identifier
X  hi def link phpStatement        Statement
X  hi def link phpStructure        Statement
X  hi def link phpException        Statement
X  hi def link phpOperator         Operator
X  hi def link phpVarSelector      Operator
X  hi def link phpInclude          PreProc
X  hi def link phpDefine           PreProc
X  hi def link phpSpecial          PreProc
X  hi def link phpFCKeyword        PreProc
X  hi def link phpType             Type
X  hi def link phpSCKeyword        Type
X  hi def link phpMemberSelector   Type
X  hi def link phpSpecialChar      Special
X  hi def link phpStrEsc           Special
X  hi def link phpParent           Special
X  hi def link phpParentError      Error
X  hi def link phpOctalError       Error
X  hi def link phpTodo             Todo
X
Xendif
X
Xlet b:current_syntax = "php"
X
Xif main_syntax == 'php'
X  unlet main_syntax
Xendif
X
X" vim: ts=8 sts=2 sw=2 expandtab
END-of-./.vim/syntax/php.vim
echo x - ./.vimrc
sed 's/^X//' >./.vimrc << 'END-of-./.vimrc'
Xset binary
Xset nocompatible
Xset autowrite
Xset wildmenu
X
Xif empty(glob('~/.vim/autoload/plug.vim'))
X  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
X    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
X  autocmd VimEnter * PlugInstall | source $MYVIMRC
Xendif
X
Xcall plug#begin('~/.vim/plugged')
X" vim plugins
XPlug 'Chiel92/vim-autoformat'
XPlug 'SirVer/ultisnips'
XPlug 'airblade/vim-gitgutter'
XPlug 'benmills/vimux'
XPlug 'benmills/vimux-golang', { 'for': 'go' }
XPlug 'cespare/vim-toml', { 'for': 'toml' }
XPlug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
XPlug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
XPlug 'groenewege/vim-less', { 'for': 'less' }
XPlug 'hdima/python-syntax'
XPlug 'honza/vim-snippets'
XPlug 'jelera/vim-javascript-syntax'
XPlug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
XPlug 'junegunn/fzf.vim'
XPlug 'kana/vim-submode'
XPlug 'mitsuhiko/vim-jinja', { 'for': ['yaml', 'sls'] }
XPlug 'plasticboy/vim-markdown', { 'for': 'markdown' }
XPlug 'rust-lang/rust.vim', { 'for': 'rust' }
XPlug 'saltstack/salt-vim', { 'for': 'sls' }
XPlug 'scrooloose/nerdcommenter'
XPlug 'scrooloose/nerdtree',  { 'on':  'NERDTreeToggle' }
XPlug 'scrooloose/syntastic'
XPlug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
XPlug 'tpope/vim-fugitive'
XPlug 'tpope/vim-haml', { 'for': ['haml', 'sass', 'scss'] }
XPlug 'tpope/vim-surround'
Xcall plug#end()
X
Xcolorscheme nbari-colors
X
X" change the mapleader from \ to ,
Xlet mapleader=","
X
X" Encoding
Xset encoding=utf8 nobomb
Xset fillchars=vert:│
X
X" set up the stuff for color highlighing in an xterm
X" mac os X t_co=16
Xset t_Co=256
X" ctrl+v+Esc
Xset t_Sf=[3%dm
Xset t_Sb=[[4%dm
X
X" Vim will never flash the screen
Xset t_vb=
X
X" Terminal title
Xset title
X
X" Search history and undo level
Xset history=1000
Xset undolevels=1000
X
X" Auto reload file on external change
Xset autoread
X
X" Syntax highlight
Xsyntax on
X
X" set old regex engine
X" if version > 703
X"    set re=1
X" endif
X
Xset noinsertmode
Xset number
Xset relativenumber
Xset hlsearch
Xnnoremap <leader><space> :noh<CR>
Xset listchars=tab:▸\ ,eol:¬,trail:·
X
X" Ignore case on search
Xset ignorecase
Xset smartcase
X
X" Allow us to backspace before an insert
Xset backspace=2
X
X" Standard file
Xset ffs=unix
X
X" No backups
Xset nobackup
Xset nowb
Xset noswapfile
X
X" Spaces instead of tabs
Xset tabstop=4
Xset shiftwidth=4
Xset expandtab
Xset autoindent
Xset softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE"
Xset shiftround    " round indent to multiple of 'shiftwidth'
Xset smarttab
X
X" create new tab
Xnnoremap <leader>t :tabnew<CR>
X
X" Show the ruler for editing
Xset ruler
X
X" Turn off the mouse in the xterm
Xset mouse=
X
X" Show the command in the status line
Xset showcmd
X
X" Always have a status line
Xset laststatus=2
X
X" save on losing focus
Xau FocusLost * :wa
X
X" Delete trailing white spaces on close
X"\( ... Start a match group
X"$\n .. Match a new line (end-of-line character followed by a carriage return).
X"\) ... End the match group
X"\+ ... Allow any number of occurrences of this group (one or more).
X"\%$ .. Match the end of the file
Xau BufWritePre,FileWritePre * %s/\s\+$//e | %s/\r$//e | %s#\($\n\)\+\%$##e
X
X" associate *.tpl with php filetype
Xau BufRead,BufNewFile *.tpl set ft=php
X
X" associate *.json with json filetype
Xau BufRead,BufNewFile *.json set ft=json syntax=javascript
X
X" associate jquery.*.js
Xau BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
X
X" associate *.jinja with jinja filetype
Xau BufRead,BufNewFile *.jinja set ft=jinja
Xau BufRead,BufNewFile *.j2 set ft=jinja
X
X" enable cold folding
Xau FileType javascript call JavaScriptFold()
X
X" Split windows vertically
Xmap <F11> <C-W>v
X
X" NERDTree
Xnnoremap <leader>n :NERDTreeToggle<CR>
Xlet g:NERDTreeDirArrowExpandable = '▸'
Xlet g:NERDTreeDirArrowCollapsible = '▾'
X
X" folding settings za
Xset foldmethod=indent   "fold based on indent
Xset foldnestmax=10      "deepest fold is 10 levels
Xset nofoldenable        "dont fold by default
Xset foldlevel=1         "this is just what i use
X
X" mapping of space bar to open/close
Xnnoremap <space> za
X
X" status line
X" set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)
X
Xif has('statusline')
X  "hi User1 ctermfg=012 ctermbg=016
X  "hi User2 ctermfg=172 ctermbg=016
X  "hi User3 ctermfg=015 ctermbg=016
X  hi User1 ctermfg=012
X  hi User2 ctermfg=172
X  hi User3 ctermfg=015
X
X  set statusline=\ "                            " start with one space
X  set statusline+=%1*                           " use color 1
X  set statusline+=\%f                           " file name
X  set statusline+=%2*                            " switch back to statusline highlight
X  set statusline+=\ %m%r%w%h\                   " flags
X  set statusline+=%*                            " switch back to statusline highlight
X  set statusline+=%=                            " ident to the right
X  set statusline+=%{&fileformat}\               " file format
X  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}\  " encoding
X  set statusline+=%{strlen(&ft)?&ft:'none'}\    " filetype
X  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
X  set statusline+=%3*                           " use color 2
X  set statusline+=[%l,%v][%p%%]\                " cursor position/offset
X  set statusline+=%*                            " switch back to statusline highlight
Xendif
X
X" syntastic
Xlet g:syntastic_error_symbol='✗'
Xlet g:syntastic_warning_symbol='⚠'
Xlet g:syntastic_javascript_checkers = ['closurecompiler', 'jsl']
Xlet g:syntastic_javascript_closurecompiler_path = "/usr/local/share/closure-compiler/compiler.jar"
Xlet g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
Xlet g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
Xhi SyntasticErrorSign ctermfg=red ctermbg=none
Xhi SyntasticWarningSign ctermfg=yellow ctermbg=none
Xhi SyntasticErrorLine   ctermbg=52
Xhi SyntasticWarningLine ctermbg=58
X
Xset wildignore+=*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,*.pyc
X
X" Autoformat
Xnnoremap <leader>ff :Autoformat<CR>
X" Test this to check if autopep8 working
X" echo "print 'coração niño'" | autopep8 -
Xlet g:formatdef_autopep8 = '"autopep8 - --aggressive --indent-size 4"'
X
X" vim-php-cs-fixer
Xlet g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
Xlet g:php_cs_fixer_fixers_list = "indentation,linefeed,trailing_spaces,eof_ending,extra_empty_lines,controls_spaces,unused_use,phpdoc_params,visibility,return,braces,include,short_tag,php_closing_tag,psr0,elseif"
Xnnoremap <silent><leader>pc :call PhpCsFixerFixFile()<CR>
X
X" Autocomplete PHP
Xau FileType php set omnifunc=phpcomplete#CompletePHP
Xau FileType python set omnifunc=pythoncomplete#Complete
Ximap <leader><tab> <c-x><c-o>
X
X" Python ident
Xau FileType python set ts=8 sts=4 et sw=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
X
X" abbreviations
Xinoreabbr datee  <c-r>=strftime("%F")<CR>
X
X" cursorline
X:nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
X
X" :h last-position-jump
Xau BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
X
X" map quick quit
Xmap <leader>qq :qa!<CR>
X
X" easy resize
Xcall submode#enter_with('h/l', 'n', '', '<C-w>h', '<C-w><')
Xcall submode#enter_with('h/l', 'n', '', '<C-w>l', '<C-w>>')
Xcall submode#map('h/l', 'n', '', 'h', '<C-w><')
Xcall submode#map('h/l', 'n', '', 'l', '<C-w>>')
Xcall submode#enter_with('j/k', 'n', '', '<C-w>j', '<C-w>-')
Xcall submode#enter_with('j/k', 'n', '', '<C-w>k', '<C-w>+')
Xcall submode#map('j/k', 'n', '', 'j', '<C-w>-')
Xcall submode#map('j/k', 'n', '', 'k', '<C-w>+')
X
X" scroll
Xcall submode#enter_with('sj', 'n', '', '<leader>j', '<C-d>')
Xcall submode#enter_with('sk', 'n', '', '<leader>k', '<C-u>')
Xcall submode#map('sj', 'n', '', 'j', '<C-d>')
Xcall submode#map('sk', 'n', '', 'k', '<C-u>')
X
X" tmux compatible splits
Xnnoremap <C-w>" <C-w>s
Xnnoremap <C-w>% <C-w>v
Xnnoremap <C-w>! <C-w>T
X
X" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are
X" no more windows in that direction, forwards the operation to tmux.
Xif exists('$TMUX')
X  let s:tmux_is_last_pane = 0
X  au WinEnter * let s:tmux_is_last_pane = 0
X
X  " Like `wincmd` but also change tmux panes instead of vim windows when needed.
X  function s:TmuxWinCmd(direction, tmuxdir)
X    let nr = winnr()
X    " try to switch windows within vim
X    exec 'wincmd ' . a:direction
X    " Forward the switch panes command to tmux if:
X    " we tried switching windows in vim but it didn't have effect.
X    if nr == winnr()
X      let cmd = 'tmux select-pane -' . a:tmuxdir
X      call system(cmd)
X      let s:tmux_is_last_pane = 1
X      echo cmd
X    else
X      let s:tmux_is_last_pane = 0
X    endif
X  endfunction
X
X  " navigate between split windows/tmux panes
X  map <c-h> :call <SID>TmuxWinCmd('h', 'L')<cr>
X  map <c-j> :call <SID>TmuxWinCmd('j', 'D')<cr>
X  map <c-k> :call <SID>TmuxWinCmd('k', 'U')<cr>
X  map <c-l> :call <SID>TmuxWinCmd('l', 'R')<cr>
Xelse
X  nnoremap <C-h> <C-w>h
X  nnoremap <C-j> <C-w>j
X  nnoremap <C-k> <C-w>k
X  nnoremap <C-l> <C-w>l
Xendif
X
X" switches delimitMate on and off
Xnnoremap <leader>d :DelimitMateSwitch<CR>
X
Xif executable("par")
X  set formatprg=par\ -w80
Xendif
X
X" wrap text
Xmap <leader>w {v}!par -w80<CR>
Xvmap <leader>w !par -w80<CR>
X
X" Diff current buffer and the original file
Xnnoremap <leader>di :w !diff % -<CR>
X
X" Ag
Xnnoremap <leader>a :Ag<CR>
X
X" underline
Xnnoremap <leader>1 yypVr=
Xnnoremap <leader>2 yypVr-
Xnnoremap <leader>3 yypVr.
Xnnoremap <leader>0 :put = \"# ----------------------------------------------------------------------------\"<CR>
X
X" toogle hex
Xlet $in_hex=0
Xfunction HexMe()
X  set binary
X  set noeol
X  if $in_hex > 0
X    :%!xxd -r
X    let $in_hex=0
X  else
X    :%!xxd
X    let $in_hex=1
X  endif
Xendfunction
Xnnoremap <leader>hex :call HexMe()<CR>
X
X" enable all syntax highlighting features
Xlet python_highlight_all = 1
X
X" keyword information
Xnnoremap <leader>ski :set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}<CR>
Xnnoremap <leader>ki :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
X
X" syntax jquery
Xnnoremap <leader>jq :set syntax=jquery<CR>
X
X" replace tabs with spaces
Xnnoremap <leader>rt :%s/\t/  /g<CR>
X
X" spell
Xnnoremap <leader>s :setlocal spell!<CR>
Xset spelllang=en
X
X" vim-marker
Xlet g:vim_markdown_folding_disabled=1
X
X" Compile LessCSS on save
Xautocmd BufWritePost,FileWritePost *.less :silent !lessc --clean-css % %:p:r.css
X
X" Compile SASS scss on save
Xnnoremap <leader>sc :!node-sass --output-style compressed % "%:p:r.css"<CR>
X
X" Compile script.src.js -> script.min.js
Xnnoremap <leader>jc :execute "!java -jar " . g:syntastic_javascript_closurecompiler_path . ' --js='. expand('%') . ' --js_output_file=' . expand('%:r:r') . '.min.js'<CR>
X
X" prety json
Xnnoremap <leader>pj :%!python -m json.tool<CR>
X
X" found no ASCII
X" Once you're on a particular one, use ga
X" to determine the ASCII value of the character in question, and
Xnnoremap <leader>xa :/[^\x00-\x7F]<CR>
X"
X" sh
Xset shell=/bin/sh
X
X" go
Xau FileType go nmap <leader>r <Plug>(go-run)
Xau FileType go nmap <leader>b <Plug>(go-build)
Xau FileType go nmap <leader>t <Plug>(go-test)
Xau FileType go nmap <leader>gd <Plug>(go-doc-browser)
Xlet g:go_highlight_functions = 1
Xlet g:go_highlight_methods = 1
Xlet g:go_highlight_structs = 1
Xlet g:go_highlight_operators = 1
Xlet g:go_highlight_build_constraints = 1
X
X" diff highlights
Xautocmd FileType * if &diff | setlocal syntax= | endif
X
X" vertical 3-way diff
Xset diffopt=vertical
X
X" txt strikeout ~~ (background black) ~~
Xau BufRead,BufNewFile *.txt   syntax match StrikeoutMatch /\~\~.*\~\~/
Xhi def  StrikeoutColor   ctermbg=016 ctermfg=black
Xhi link StrikeoutMatch StrikeoutColor
X
X" habit breaking
Xnnoremap <up>    <nop>
Xnnoremap <down>  <nop>
Xnnoremap <left>  <nop>
Xnnoremap <right> <nop>
Xinoremap <up>    <nop>
Xinoremap <down>  <nop>
Xinoremap <left>  <nop>
Xinoremap <right> <nop>
X
X" moving aroung in command mode
Xcnoremap <c-h> <left>
Xcnoremap <c-j> <down>
Xcnoremap <c-k> <up>
Xcnoremap <c-l> <right>
X
X" golang
Xau FileType go nmap <leader>r <Plug>(go-run)
Xau FileType go nmap <leader>b <Plug>(go-build)
Xau FileType go nmap <leader>t :wa<CR> :GolangTestCurrentPackage<CR>
Xau FileType go nmap <leader>c <Plug>(go-coverage-toggle)
Xau FileType go nmap <leader>cb <Plug>(go-coverage-browser)
Xau FileType go nmap <leader>ds <Plug>(go-def-split)
Xau FileType go nmap <leader>dv <Plug>(go-def-vertical)
Xau FileType go nmap <leader>dt <Plug>(go-def-tab)
Xau FileType go nmap <leader>i <Plug>(go-info)
Xlet g:go_list_type = "quickfix"
Xlet g:go_fmt_command = "goimports"
Xlet g:go_highlight_functions = 1
Xlet g:go_highlight_methods = 1
Xlet g:go_highlight_fields = 1
Xlet g:go_highlight_types = 1
Xlet g:go_highlight_operators = 1
Xlet g:go_highlight_build_constraints = 1
Xlet g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
X
X" sh as bash
Xlet g:is_bash=1
X
X" cargo install ripgrep
Xif executable("rg")
X    set grepprg=rg\ --vimgrep\ --no-heading
X    set grepformat=%f:%l:%c:%m,%f:%l:%m
Xendif
X
X" ctrl-p, buffers, history using fzf
Xnnoremap <c-p> :Files<CR>
Xnnoremap <leader>, :Buffers<CR>
Xnnoremap <leader>h :History<CR>
END-of-./.vimrc
echo c - ./.zsh
mkdir -p ./.zsh > /dev/null 2>&1
echo c - ./.zsh/functions
mkdir -p ./.zsh/functions > /dev/null 2>&1
echo x - ./.zsh/functions/async
sed 's/^X//' >./.zsh/functions/async << 'END-of-./.zsh/functions/async'
X#!/usr/bin/env zsh
X
X#
X# zsh-async
X#
X# version: 1.5.0
X# author: Mathias Fredriksson
X# url: https://github.com/mafredri/zsh-async
X#
X
X# Produce debug output from zsh-async when set to 1.
XASYNC_DEBUG=${ASYNC_DEBUG:-0}
X
X# Wrapper for jobs executed by the async worker, gives output in parseable format with execution time
X_async_job() {
X	# Disable xtrace as it would mangle the output.
X	setopt localoptions noxtrace
X
X	# Store start time as double precision (+E disables scientific notation)
X	float -F duration=$EPOCHREALTIME
X
X	# Run the command and capture both stdout (`eval`) and stderr (`cat`) in
X	# separate subshells. When the command is complete, we grab write lock
X	# (mutex token) and output everything except stderr inside the command
X	# block, after the command block has completed, the stdin for `cat` is
X	# closed, causing stderr to be appended with a $'\0' at the end to mark the
X	# end of output from this job.
X	local stdout stderr ret tok
X	{
X		stdout=$(eval "$@")
X		ret=$?
X		duration=$(( EPOCHREALTIME - duration ))  # Calculate duration.
X
X		# Grab mutex lock, stalls until token is available.
X		read -r -k 1 -p tok || exit 1
X
X		# Return output (<job_name> <return_code> <stdout> <duration> <stderr>).
X		print -r -n - ${(q)1} $ret ${(q)stdout} $duration
X	} 2> >(stderr=$(cat) && print -r -n - " "${(q)stderr}$'\0')
X
X	# Unlock mutex by inserting a token.
X	print -n -p $tok
X}
X
X# The background worker manages all tasks and runs them without interfering with other processes
X_async_worker() {
X	# Reset all options to defaults inside async worker.
X	emulate -R zsh
X
X	# Make sure monitor is unset to avoid printing the
X	# pids of child processes.
X	unsetopt monitor
X
X	# Redirect stderr to `/dev/null` in case unforseen errors produced by the
X	# worker. For example: `fork failed: resource temporarily unavailable`.
X	# Some older versions of zsh might also print malloc errors (know to happen
X	# on at least zsh 5.0.2 and 5.0.8) likely due to kill signals.
X	exec 2>/dev/null
X
X	# When a zpty is deleted (using -d) all the zpty instances created before
X	# the one being deleted receive a SIGHUP, unless we catch it, the async
X	# worker would simply exit (stop working) even though visible in the list
X	# of zpty's (zpty -L).
X	TRAPHUP() {
X		return 0  # Return 0, indicating signal was handled.
X	}
X
X	local -A storage
X	local unique=0
X	local notify_parent=0
X	local parent_pid=0
X	local coproc_pid=0
X	local processing=0
X
X	local -a zsh_hooks zsh_hook_functions
X	zsh_hooks=(chpwd periodic precmd preexec zshexit zshaddhistory)
X	zsh_hook_functions=(${^zsh_hooks}_functions)
X	unfunction $zsh_hooks &>/dev/null   # Deactivate all zsh hooks inside the worker.
X	unset $zsh_hook_functions           # And hooks with registered functions.
X	unset zsh_hooks zsh_hook_functions  # Cleanup.
X
X	child_exit() {
X		local -a pids
X		pids=(${${(v)jobstates##*:*:}%\=*})
X
X		# If coproc (cat) is the only child running, we close it to avoid
X		# leaving it running indefinitely and cluttering the process tree.
X		if  (( ! processing )) && [[ $#pids = 1 ]] && [[ $coproc_pid = $pids[1] ]]; then
X			coproc :
X			coproc_pid=0
X		fi
X
X		# On older version of zsh (pre 5.2) we notify the parent through a
X		# SIGWINCH signal because `zpty` did not return a file descriptor (fd)
X		# prior to that.
X		if (( notify_parent )); then
X			# We use SIGWINCH for compatibility with older versions of zsh
X			# (pre 5.1.1) where other signals (INFO, ALRM, USR1, etc.) could
X			# cause a deadlock in the shell under certain circumstances.
X			kill -WINCH $parent_pid
X		fi
X	}
X
X	# Register a SIGCHLD trap to handle the completion of child processes.
X	trap child_exit CHLD
X
X	# Process option parameters passed to worker
X	while getopts "np:u" opt; do
X		case $opt in
X			n) notify_parent=1;;
X			p) parent_pid=$OPTARG;;
X			u) unique=1;;
X		esac
X	done
X
X	killjobs() {
X		local tok
X		local -a pids
X		pids=(${${(v)jobstates##*:*:}%\=*})
X
X		# No need to send SIGHUP if no jobs are running.
X		(( $#pids == 0 )) && continue
X		(( $#pids == 1 )) && [[ $coproc_pid = $pids[1] ]] && continue
X
X		# Grab lock to prevent half-written output in case a child
X		# process is in the middle of writing to stdin during kill.
X		(( coproc_pid )) && read -r -k 1 -p tok
X
X		kill -HUP -$$  # Send to entire process group.
X		coproc :       # Quit coproc.
X		coproc_pid=0   # Reset pid.
X	}
X
X	local request
X	local -a cmd
X	while :; do
X		# Wait for jobs sent by async_job.
X		read -r -d $'\0' request || {
X			# Since we handle SIGHUP above (and thus do not know when `zpty -d`)
X			# occurs, a failure to read probably indicates that stdin has
X			# closed. This is why we propagate the signal to all children and
X			# exit manually.
X			kill -HUP -$$  # Send SIGHUP to all jobs.
X			exit 0
X		}
X
X		# Check for non-job commands sent to worker
X		case $request in
X			_unset_trap) notify_parent=0; continue;;
X			_killjobs)   killjobs; continue;;
X		esac
X
X		# Parse the request using shell parsing (z) to allow commands
X		# to be parsed from single strings and multi-args alike.
X		cmd=("${(z)request}")
X
X		# Name of the job (first argument).
X		local job=$cmd[1]
X
X		# If worker should perform unique jobs
X		if (( unique )); then
X			# Check if a previous job is still running, if yes, let it finnish
X			for pid in ${${(v)jobstates##*:*:}%\=*}; do
X				if [[ ${storage[$job]} == $pid ]]; then
X					continue 2
X				fi
X			done
X		fi
X
X		# Guard against closing coproc from trap before command has started.
X		processing=1
X
X		# Because we close the coproc after the last job has completed, we must
X		# recreate it when there are no other jobs running.
X		if (( ! coproc_pid )); then
X			# Use coproc as a mutex for synchronized output between children.
X			coproc cat
X			coproc_pid="$!"
X			# Insert token into coproc
X			print -n -p "t"
X		fi
X
X		# Run job in background, completed jobs are printed to stdout.
X		_async_job $cmd &
X		# Store pid because zsh job manager is extremely unflexible (show jobname as non-unique '$job')...
X		storage[$job]="$!"
X
X		processing=0  # Disable guard.
X	done
X}
X
X#
X#  Get results from finnished jobs and pass it to the to callback function. This is the only way to reliably return the
X#  job name, return code, output and execution time and with minimal effort.
X#
X# usage:
X# 	async_process_results <worker_name> <callback_function>
X#
X# callback_function is called with the following parameters:
X# 	$1 = job name, e.g. the function passed to async_job
X# 	$2 = return code
X# 	$3 = resulting stdout from execution
X# 	$4 = execution time, floating point e.g. 2.05 seconds
X# 	$5 = resulting stderr from execution
X#
Xasync_process_results() {
X	setopt localoptions noshwordsplit
X
X	local worker=$1
X	local callback=$2
X	local caller=$3
X	local -a items
X	local null=$'\0' data
X	integer -l len pos num_processed
X
X	typeset -gA ASYNC_PROCESS_BUFFER
X
X	# Read output from zpty and parse it if available.
X	while zpty -r -t $worker data 2>/dev/null; do
X		ASYNC_PROCESS_BUFFER[$worker]+=$data
X		len=${#ASYNC_PROCESS_BUFFER[$worker]}
X		pos=${ASYNC_PROCESS_BUFFER[$worker][(i)$null]}  # Get index of NULL-character (delimiter).
X
X		# Keep going until we find a NULL-character.
X		if (( ! len )) || (( pos > len )); then
X			continue
X		fi
X
X		while (( pos <= len )); do
X			# Take the content from the beginning, until the NULL-character and
X			# perform shell parsing (z) and unquoting (Q) as an array (@).
X			items=("${(@Q)${(z)ASYNC_PROCESS_BUFFER[$worker][1,$pos-1]}}")
X
X			# Remove the extracted items from the buffer.
X			ASYNC_PROCESS_BUFFER[$worker]=${ASYNC_PROCESS_BUFFER[$worker][$pos+1,$len]}
X
X			if (( $#items == 5 )); then
X				$callback "${(@)items}"  # Send all parsed items to the callback.
X			else
X				# In case of corrupt data, invoke callback with *async* as job
X				# name, non-zero exit status and an error message on stderr.
X				$callback "async" 1 "" 0 "$0:$LINENO: error: bad format, got ${#items} items (${(@q)items})"
X			fi
X
X			(( num_processed++ ))
X
X			len=${#ASYNC_PROCESS_BUFFER[$worker]}
X			if (( len > 1 )); then
X				pos=${ASYNC_PROCESS_BUFFER[$worker][(i)$null]}  # Get index of NULL-character (delimiter).
X			fi
X		done
X	done
X
X	(( num_processed )) && return 0
X
X	# Avoid printing exit value when `setopt printexitvalue` is active.`
X	[[ $caller = trap || $caller = watcher ]] && return 0
X
X	# No results were processed
X	return 1
X}
X
X# Watch worker for output
X_async_zle_watcher() {
X	setopt localoptions noshwordsplit
X	typeset -gA ASYNC_PTYS ASYNC_CALLBACKS
X	local worker=$ASYNC_PTYS[$1]
X	local callback=$ASYNC_CALLBACKS[$worker]
X
X	if [[ -n $callback ]]; then
X		async_process_results $worker $callback watcher
X	fi
X}
X
X#
X# Start a new asynchronous job on specified worker, assumes the worker is running.
X#
X# usage:
X# 	async_job <worker_name> <my_function> [<function_params>]
X#
Xasync_job() {
X	setopt localoptions noshwordsplit
X
X	local worker=$1; shift
X
X	local -a cmd
X	cmd=("$@")
X	if (( $#cmd > 1 )); then
X		cmd=(${(q)cmd})  # Quote special characters in multi argument commands.
X	fi
X
X	zpty -w $worker $cmd$'\0'
X}
X
X# This function traps notification signals and calls all registered callbacks
X_async_notify_trap() {
X	setopt localoptions noshwordsplit
X
X	for k in ${(k)ASYNC_CALLBACKS}; do
X		async_process_results $k ${ASYNC_CALLBACKS[$k]} trap
X	done
X}
X
X#
X# Register a callback for completed jobs. As soon as a job is finnished, async_process_results will be called with the
X# specified callback function. This requires that a worker is initialized with the -n (notify) option.
X#
X# usage:
X# 	async_register_callback <worker_name> <callback_function>
X#
Xasync_register_callback() {
X	setopt localoptions noshwordsplit nolocaltraps
X
X	typeset -gA ASYNC_CALLBACKS
X	local worker=$1; shift
X
X	ASYNC_CALLBACKS[$worker]="$*"
X
X	# Enable trap when the ZLE watcher is unavailable, allows
X	# workers to notify (via -n) when a job is done.
X	if [[ ! -o interactive ]] || [[ ! -o zle ]]; then
X		trap '_async_notify_trap' WINCH
X	fi
X}
X
X#
X# Unregister the callback for a specific worker.
X#
X# usage:
X# 	async_unregister_callback <worker_name>
X#
Xasync_unregister_callback() {
X	typeset -gA ASYNC_CALLBACKS
X
X	unset "ASYNC_CALLBACKS[$1]"
X}
X
X#
X# Flush all current jobs running on a worker. This will terminate any and all running processes under the worker, use
X# with caution.
X#
X# usage:
X# 	async_flush_jobs <worker_name>
X#
Xasync_flush_jobs() {
X	setopt localoptions noshwordsplit
X
X	local worker=$1; shift
X
X	# Check if the worker exists
X	zpty -t $worker &>/dev/null || return 1
X
X	# Send kill command to worker
X	async_job $worker "_killjobs"
X
X	# Clear the zpty buffer.
X	local junk
X	if zpty -r -t $worker junk '*'; then
X		(( ASYNC_DEBUG )) && print -n "async_flush_jobs $worker: ${(V)junk}"
X		while zpty -r -t $worker junk '*'; do
X			(( ASYNC_DEBUG )) && print -n "${(V)junk}"
X		done
X		(( ASYNC_DEBUG )) && print
X	fi
X
X	# Finally, clear the process buffer in case of partially parsed responses.
X	typeset -gA ASYNC_PROCESS_BUFFER
X	unset "ASYNC_PROCESS_BUFFER[$worker]"
X}
X
X#
X# Start a new async worker with optional parameters, a worker can be told to only run unique tasks and to notify a
X# process when tasks are complete.
X#
X# usage:
X# 	async_start_worker <worker_name> [-u] [-n] [-p <pid>]
X#
X# opts:
X# 	-u unique (only unique job names can run)
X# 	-n notify through SIGWINCH signal
X# 	-p pid to notify (defaults to current pid)
X#
Xasync_start_worker() {
X	setopt localoptions noshwordsplit
X
X	local worker=$1; shift
X	zpty -t $worker &>/dev/null && return
X
X	typeset -gA ASYNC_PTYS
X	typeset -h REPLY
X	typeset has_xtrace=0
X
X	# Make sure async worker is started without xtrace
X	# (the trace output interferes with the worker).
X	[[ -o xtrace ]] && {
X		has_xtrace=1
X		unsetopt xtrace
X	}
X
X	if (( ! ASYNC_ZPTY_RETURNS_FD )) && [[ -o interactive ]] && [[ -o zle ]]; then
X		# When zpty doesn't return a file descriptor (on older versions of zsh)
X		# we try to guess it anyway.
X		integer -l zptyfd
X		exec {zptyfd}>&1  # Open a new file descriptor (above 10).
X		exec {zptyfd}>&-  # Close it so it's free to be used by zpty.
X	fi
X
X	zpty -b $worker _async_worker -p $$ $@ || {
X		async_stop_worker $worker
X		return 1
X	}
X
X	# Re-enable it if it was enabled, for debugging.
X	(( has_xtrace )) && setopt xtrace
X
X	if [[ $ZSH_VERSION < 5.0.8 ]]; then
X		# For ZSH versions older than 5.0.8 we delay a bit to give
X		# time for the worker to start before issuing commands,
X		# otherwise it will not be ready to receive them.
X		sleep 0.001
X	fi
X
X	if [[ -o interactive ]] && [[ -o zle ]]; then
X		if (( ! ASYNC_ZPTY_RETURNS_FD )); then
X			REPLY=$zptyfd  # Use the guessed value for the file desciptor.
X		fi
X
X		ASYNC_PTYS[$REPLY]=$worker        # Map the file desciptor to the worker.
X		zle -F $REPLY _async_zle_watcher  # Register the ZLE handler.
X
X		# Disable trap in favor of ZLE handler when notify is enabled (-n).
X		async_job $worker _unset_trap
X	fi
X}
X
X#
X# Stop one or multiple workers that are running, all unfetched and incomplete work will be lost.
X#
X# usage:
X# 	async_stop_worker <worker_name_1> [<worker_name_2>]
X#
Xasync_stop_worker() {
X	setopt localoptions noshwordsplit
X
X	local ret=0
X	for worker in $@; do
X		# Find and unregister the zle handler for the worker
X		for k v in ${(@kv)ASYNC_PTYS}; do
X			if [[ $v == $worker ]]; then
X				zle -F $k
X				unset "ASYNC_PTYS[$k]"
X			fi
X		done
X		async_unregister_callback $worker
X		zpty -d $worker 2>/dev/null || ret=$?
X
X		# Clear any partial buffers.
X		typeset -gA ASYNC_PROCESS_BUFFER
X		unset "ASYNC_PROCESS_BUFFER[$worker]"
X	done
X
X	return $ret
X}
X
X#
X# Initialize the required modules for zsh-async. To be called before using the zsh-async library.
X#
X# usage:
X# 	async_init
X#
Xasync_init() {
X	(( ASYNC_INIT_DONE )) && return
X	ASYNC_INIT_DONE=1
X
X	zmodload zsh/zpty
X	zmodload zsh/datetime
X
X	# Check if zsh/zpty returns a file descriptor or not,
X	# shell must also be interactive with zle enabled.
X	ASYNC_ZPTY_RETURNS_FD=0
X	[[ -o interactive ]] && [[ -o zle ]] && {
X		typeset -h REPLY
X		zpty _async_test :
X		(( REPLY )) && ASYNC_ZPTY_RETURNS_FD=1
X		zpty -d _async_test
X	}
X}
X
Xasync() {
X	async_init
X}
X
Xasync "$@"
END-of-./.zsh/functions/async
echo x - ./.zsh/functions/pure_prompt
sed 's/^X//' >./.zsh/functions/pure_prompt << 'END-of-./.zsh/functions/pure_prompt'
X# Pure
X# by Sindre Sorhus
X# https://github.com/sindresorhus/pure
X# MIT License
X
X# For my own and others sanity
X# git:
X# %b => current branch
X# %a => current action (rebase/merge)
X# prompt:
X# %F => color dict
X# %f => reset color
X# %~ => current path
X# %* => time
X# %n => username
X# %m => shortname host
X# %(?..) => prompt conditional - %(condition.true.false)
X# terminal codes:
X# \e7   => save cursor position
X# \e[2A => move cursor 2 lines up
X# \e[1G => go to position 1 in terminal
X# \e8   => restore cursor position
X# \e[K  => clears everything after the cursor on the current line
X# \e[2K => clear everything on the current line
X
X
X# turns seconds into human readable time
X# 165392 => 1d 21h 56m 32s
X# https://github.com/sindresorhus/pretty-time-zsh
Xprompt_pure_human_time_to_var() {
X	local human=" " total_seconds=$1 var=$2
X	local days=$(( total_seconds / 60 / 60 / 24 ))
X	local hours=$(( total_seconds / 60 / 60 % 24 ))
X	local minutes=$(( total_seconds / 60 % 60 ))
X	local seconds=$(( total_seconds % 60 ))
X	(( days > 0 )) && human+="${days}d "
X	(( hours > 0 )) && human+="${hours}h "
X	(( minutes > 0 )) && human+="${minutes}m "
X	human+="${seconds}s"
X
X	# store human readable time in variable as specified by caller
X	typeset -g "${var}"="${human}"
X}
X
X# stores (into prompt_pure_cmd_exec_time) the exec time of the last command if set threshold was exceeded
Xprompt_pure_check_cmd_exec_time() {
X	integer elapsed
X	(( elapsed = EPOCHSECONDS - ${prompt_pure_cmd_timestamp:-$EPOCHSECONDS} ))
X	prompt_pure_cmd_exec_time=
X	(( elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5} )) && {
X		prompt_pure_human_time_to_var $elapsed "prompt_pure_cmd_exec_time"
X	}
X}
X
Xprompt_pure_clear_screen() {
X	# enable output to terminal
X	zle -I
X	# clear screen and move cursor to (0, 0)
X	print -n '\e[2J\e[0;0H'
X	# print preprompt
X	prompt_pure_preprompt_render precmd
X}
X
Xprompt_pure_check_git_arrows() {
X	# reset git arrows
X	prompt_pure_git_arrows=
X
X	# check if there is an upstream configured for this branch
X	command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return
X
X	local arrow_status
X	# check git left and right arrow_status
X	arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"
X	# exit if the command failed
X	(( !$? )) || return
X
X	# left and right are tab-separated, split on tab and store as array
X	arrow_status=(${(ps:\t:)arrow_status})
X	local arrows left=${arrow_status[1]} right=${arrow_status[2]}
X
X	(( ${right:-0} > 0 )) && arrows+="${PURE_GIT_DOWN_ARROW:-⇣}"
X	(( ${left:-0} > 0 )) && arrows+="${PURE_GIT_UP_ARROW:-⇡}"
X
X	[[ -n $arrows ]] && prompt_pure_git_arrows=" ${arrows}"
X}
X
Xprompt_pure_set_title() {
X	# tell the terminal we are setting the title
X	print -n '\e]0;'
X	# show hostname if connected through ssh
X	[[ -n $SSH_CONNECTION ]] && print -Pn '(%m) '
X	case $1 in
X		expand-prompt)
X			print -Pn $2;;
X		ignore-escape)
X			print -rn $2;;
X	esac
X	# end set title
X	print -n '\a'
X}
X
Xprompt_pure_preexec() {
X	# attempt to detect and prevent prompt_pure_async_git_fetch from interfering with user initiated git or hub fetch
X	[[ $2 =~ (git|hub)\ .*(pull|fetch) ]] && async_flush_jobs 'prompt_pure'
X
X	prompt_pure_cmd_timestamp=$EPOCHSECONDS
X
X	# shows the current dir and executed command in the title while a process is active
X	prompt_pure_set_title 'ignore-escape' "$PWD:t: $2"
X}
X
X# string length ignoring ansi escapes
Xprompt_pure_string_length_to_var() {
X	local str=$1 var=$2 length
X	# perform expansion on str and check length
X	length=$(( ${#${(S%%)str//(\%([KF1]|)\{*\}|\%[Bbkf])}} ))
X
X	# store string length in variable as specified by caller
X	typeset -g "${var}"="${length}"
X}
X
Xprompt_pure_apply_rprompt() {
X   str='%F{8}%*%f'
X   pos=$(( COLUMNS - 7 ))
X   print -Pn "\e7\e[1A\e[${pos}G${str}\e8"
X}
X
Xprompt_pure_preprompt_render() {
X	# check that no command is currently running, the preprompt will otherwise be rendered in the wrong place
X	[[ -n ${prompt_pure_cmd_timestamp+x} && "$1" != "precmd" ]] && return
X
X	# set color for git branch/dirty status, change color if dirty checking has been delayed
X	local git_color=yellow
X	[[ -n ${prompt_pure_git_last_dirty_check_timestamp+x} ]] && git_color=196
X
X	# construct preprompt, beginning with path
X	local preprompt="${prompt_pure_username} %F{074}%~%f"
X
X	# git info
X    local git_branch=$vcs_info_msg_0_
X
X    # if branch = master | merge <--- color in red for master & merge
X    [[ ${git_branch//[[:space:]]} == (*"|merge"|"master") ]] && git_branch=" %F{160}${git_branch//[[:space:]]}%f"
X
X    preprompt+="%F{$git_color}${git_branch}%F{1}${prompt_pure_git_dirty}%f"
X
X	# git pull/push arrows
X	preprompt+="%F{cyan}${prompt_pure_git_arrows}%f"
X	# execution time
X	preprompt+="%F{red}${prompt_pure_cmd_exec_time}%f"
X
X	# if executing through precmd, do not perform fancy terminal editing
X	if [[ "$1" == "precmd" ]]; then
X		print -P "${preprompt}"
X	else
X		# only redraw if preprompt has changed
X		[[ "${prompt_pure_last_preprompt}" != "${preprompt}" ]] || return
X
X		# calculate length of preprompt and store it locally in preprompt_length
X		integer preprompt_length lines
X		prompt_pure_string_length_to_var "${preprompt}" "preprompt_length"
X
X		# calculate number of preprompt lines for redraw purposes
X		(( lines = ( preprompt_length - 1 ) / COLUMNS + 1 ))
X
X		# calculate previous preprompt lines to figure out how the new preprompt should behave
X		integer last_preprompt_length last_lines
X		prompt_pure_string_length_to_var "${prompt_pure_last_preprompt}" "last_preprompt_length"
X		(( last_lines = ( last_preprompt_length - 1 ) / COLUMNS + 1 ))
X
X		# clr_prev_preprompt erases visual artifacts from previous preprompt
X		local clr_prev_preprompt
X		if (( last_lines > lines )); then
X			# move cursor up by last_lines, clear the line and move it down by one line
X			clr_prev_preprompt="\e[${last_lines}A\e[2K\e[1B"
X			while (( last_lines - lines > 1 )); do
X				# clear the line and move cursor down by one
X				clr_prev_preprompt+='\e[2K\e[1B'
X				(( last_lines-- ))
X			done
X
X			# move cursor into correct position for preprompt update
X			clr_prev_preprompt+="\e[${lines}B"
X		# create more space for preprompt if new preprompt has more lines than last
X		elif (( last_lines < lines )); then
X			# move cursor using newlines because ansi cursor movement can't push the cursor beyond the last line
X			printf $'\n'%.0s {1..$(( lines - last_lines ))}
X		fi
X
X		# disable clearing of line if last char of preprompt is last column of terminal
X		local clr='\e[K'
X		(( COLUMNS * lines == preprompt_length )) && clr=
X
X		# modify previous preprompt
X		print -Pn "\e7${clr_prev_preprompt}\e[${lines}A\e[1G${preprompt}${clr}\e8"
X
X		# redraw prompt (also resets cursor position)
X		zle && zle .reset-prompt
X	fi
X
X    prompt_pure_apply_rprompt
X
X	# store previous preprompt for comparison
X	prompt_pure_last_preprompt=$preprompt
X}
X
Xprompt_pure_precmd() {
X	# check exec time and store it in a variable
X	prompt_pure_check_cmd_exec_time
X
X	# by making sure that prompt_pure_cmd_timestamp is defined here the async functions are prevented from interfering
X	# with the initial preprompt rendering
X	prompt_pure_cmd_timestamp=
X
X	# check for git arrows
X	prompt_pure_check_git_arrows
X
X	# shows the full path in the title
X	prompt_pure_set_title 'expand-prompt' '%~'
X
X	# get vcs info
X	vcs_info
X
X	# preform async git dirty check and fetch
X	prompt_pure_async_tasks
X
X	# print the preprompt
X	prompt_pure_preprompt_render "precmd"
X
X	# remove the prompt_pure_cmd_timestamp, indicating that precmd has completed
X	unset prompt_pure_cmd_timestamp
X}
X
X# fastest possible way to check if repo is dirty
Xprompt_pure_async_git_dirty() {
X	local untracked_dirty=$1; shift
X
X	# use cd -q to avoid side effects of changing directory, e.g. chpwd hooks
X	builtin cd -q "$*"
X
X	[[ "$(command git rev-parse --is-inside-work-tree 2>/dev/null)" == "true" ]] || return
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
X    local GIT_STATUS="$(git status --porcelain | awk -v ORS=", " 'NR>0{arr[$1]++}END{for (a in arr) print a, arr[a]}' | sed 's/, $//g')"
X    [[ ! -z "${GIT_STATUS// }" ]] && GIT_STATE="$GIT_STATE %F{5}[$GIT_STATUS]"
X
X    if ! git diff --cached --quiet 2> /dev/null; then
X        GIT_STATE="$GIT_STATE %F{7}[staged]"
X    fi
X
X    echo $GIT_STATE
X}
X
Xprompt_pure_async_git_fetch() {
X	# use cd -q to avoid side effects of changing directory, e.g. chpwd hooks
X	builtin cd -q "$*"
X
X	# set GIT_TERMINAL_PROMPT=0 to disable auth prompting for git fetch (git 2.3+)
X	GIT_TERMINAL_PROMPT=0 command git -c gc.auto=0 fetch
X}
X
Xprompt_pure_async_tasks() {
X	# initialize async worker
X	((!${prompt_pure_async_init:-0})) && {
X		async_start_worker "prompt_pure" -u -n
X		async_register_callback "prompt_pure" prompt_pure_async_callback
X		prompt_pure_async_init=1
X	}
X
X	# store working_tree without the "x" prefix
X	local working_tree="${vcs_info_msg_1_#x}"
X
X	# check if the working tree changed (prompt_pure_current_working_tree is prefixed by "x")
X	if [[ ${prompt_pure_current_working_tree#x} != $working_tree ]]; then
X		# stop any running async jobs
X		async_flush_jobs "prompt_pure"
X
X		# reset git preprompt variables, switching working tree
X		unset prompt_pure_git_dirty
X		unset prompt_pure_git_last_dirty_check_timestamp
X
X		# set the new working tree and prefix with "x" to prevent the creation of a named path by AUTO_NAME_DIRS
X		prompt_pure_current_working_tree="x${working_tree}"
X	fi
X
X	# only perform tasks inside git working tree
X	[[ -n $working_tree ]] || return
X
X	# do not preform git fetch if it is disabled or working_tree == HOME
X	if (( ${PURE_GIT_PULL:-1} )) && [[ $working_tree != $HOME ]]; then
X		# tell worker to do a git fetch
X		async_job "prompt_pure" prompt_pure_async_git_fetch "${working_tree}"
X	fi
X
X	# if dirty checking is sufficiently fast, tell worker to check it again, or wait for timeout
X	integer time_since_last_dirty_check=$(( EPOCHSECONDS - ${prompt_pure_git_last_dirty_check_timestamp:-0} ))
X	if (( time_since_last_dirty_check > ${PURE_GIT_DELAY_DIRTY_CHECK:-1800} )); then
X		unset prompt_pure_git_last_dirty_check_timestamp
X		# check check if there is anything to pull
X		async_job "prompt_pure" prompt_pure_async_git_dirty "${PURE_GIT_UNTRACKED_DIRTY:-1}" "${working_tree}"
X	fi
X}
X
Xprompt_pure_async_callback() {
X	local job=$1
X	local output=$3
X	local exec_time=$4
X
X	case "${job}" in
X		prompt_pure_async_git_dirty)
X			prompt_pure_git_dirty=$output
X			prompt_pure_preprompt_render
X
X			# When prompt_pure_git_last_dirty_check_timestamp is set, the git info is displayed in a different color.
X			# To distinguish between a "fresh" and a "cached" result, the preprompt is rendered before setting this
X			# variable. Thus, only upon next rendering of the preprompt will the result appear in a different color.
X			(( $exec_time > 2 )) && prompt_pure_git_last_dirty_check_timestamp=$EPOCHSECONDS
X			;;
X		prompt_pure_async_git_fetch)
X			prompt_pure_check_git_arrows
X			prompt_pure_preprompt_render
X			;;
X	esac
X}
X
Xprompt_pure_setup() {
X	# prevent percentage showing up
X	# if output doesn't end with a newline
X	export PROMPT_EOL_MARK=''
X
X	prompt_opts=(subst percent)
X
X	zmodload zsh/datetime
X	zmodload zsh/zle
X	autoload -Uz add-zsh-hook
X	autoload -Uz vcs_info
X	autoload -Uz async && async
X
X	add-zsh-hook precmd prompt_pure_precmd
X	add-zsh-hook preexec prompt_pure_preexec
X
X	zstyle ':vcs_info:*' enable git
X	zstyle ':vcs_info:*' use-simple true
X	# only export two msg variables from vcs_info
X	zstyle ':vcs_info:*' max-exports 2
X	# vcs_info_msg_0_ = ' %b' (for branch)
X	# vcs_info_msg_1_ = 'x%R' git top level (%R), x-prefix prevents creation of a named path (AUTO_NAME_DIRS)
X	zstyle ':vcs_info:git*' formats ' %b' 'x%R'
X	zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'
X
X	# if the user has not registered a custom zle widget for clear-screen,
X	# override the builtin one so that the preprompt is displayed correctly when
X	# ^L is issued.
X	if [[ $widgets[clear-screen] == 'builtin' ]]; then
X		zle -N clear-screen prompt_pure_clear_screen
X	fi
X
X	prompt_pure_username='%F{2}%n'
X
X	# show username@host if logged in through SSH
X	[[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username=' %F{2}%n%F{8}@%M%f'
X
X	# show username@host if root, with username in red
X	[[ $UID -eq 0 ]] && prompt_pure_username='%F{1}%n%F{242}@%M' && PURE_PROMPT_SYMBOL='%F{3}#'
X
X	# prompt turns red if the previous command didn't exit with 0
X	PROMPT="%(?.%F{5}.%F{1})${PURE_PROMPT_SYMBOL:-$}%f "
X}
X
Xprompt_pure_setup "$@"
END-of-./.zsh/functions/pure_prompt
echo c - ./.zsh/plugins
mkdir -p ./.zsh/plugins > /dev/null 2>&1
echo x - ./.zsh/plugins/git-flow-completion.zsh
sed 's/^X//' >./.zsh/plugins/git-flow-completion.zsh << 'END-of-./.zsh/plugins/git-flow-completion.zsh'
X#!zsh
X
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
X				'delete:Delete a release branch.'
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
echo x - ./.zshenv
sed 's/^X//' >./.zshenv << 'END-of-./.zshenv'
X# ----------------------------------------------------------------------------
X# Put custom alias, vars here
X# ----------------------------------------------------------------------------
X
Xexport ANSIBLE_HOSTS=~/ansible/hosts
Xexport ANSIBLE_CONFIG=~/ansible/ansible.cfg
Xexport ANSIBLE_RETRY_FILES_ENABLE=0
X
X# The next line updates PATH for the Google Cloud SDK.
Xif [[  -a ~/google-cloud-sdk/path.zsh.inc ]]; then
X    source ~/google-cloud-sdk/path.zsh.inc
Xfi
X
X
X# The next line enables shell command completion for gcloud.
Xif [[ -a ~/google-cloud-sdk/completion.zsh.inc ]]; then
X    source ~/google-cloud-sdk/completion.zsh.inc
Xfi
X
X# App Engine
Xif [[ -d ~/go_appengine ]]; then
X    export PATH=$HOME/go_appengine:$PATH
Xfi
END-of-./.zshenv
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
X# vim mode
X# ----------------------------------------------------------------------------
Xbindkey -v
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
Xexport PATH="$HOME/Library/Python/2.7/bin:$HOME/node_modules/.bin:/opt/local/bin:/usr/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/share/bin:$HOME/projects/go/bin:$HOME/.cargo/bin:$PATH"
X# remove duplicates in the PATH
Xtypeset -U PATH
Xexport CLICOLOR=1
X
X# Do we need Linux or BSD Style?
Xif ls --color -d . &>/dev/null 2>&1
Xthen
X    # Linux Style
X    alias ls='ls --color=tty'
Xelse
X    # BSD Style
X    export LSCOLORS="Exfxcxdxbxegedabagacad"
Xfi
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
XHISTSIZE=1000
XSAVEHIST=1000
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
Xzstyle ':completion::complete:*' cache-path "$HOME/.zcache"
Xzstyle ':completion:*' use-ip true
Xzstyle ':completion:*:matches' group 'yes'
Xzstyle ':completion:*:options' description 'yes'
Xzstyle ':completion:*:options' auto-description '%d'
Xzstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
Xzstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
Xzstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
Xzstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
Xzstyle ':completion:*:default' list-prompt '%S%M matches%s'
Xzstyle ':completion:*' format ' %F{yellow}-- %d --%f'
Xzstyle ':completion:*' group-name ''
Xzstyle ':completion:*' verbose yes
Xzstyle ':completion:*' file-sort modification
X# Don't prompt for a huge list, page it!
Xzstyle ':completion:*:default' list-prompt '%S%M matches%s'
X# kill
Xzstyle ':completion:*:kill:*' force-list always
Xzstyle ':completion:*:kill:*' menu yes select
Xzstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)[ 0-9:]#([^ ]#)*=01;38=01;31=01;30'
X# Rehash when completing commands
Xzstyle ":completion:*:commands" rehash 1
X# ls colors
Xzstyle ':completion:*' list-colors 'di=94:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
X
X# ----------------------------------------------------------------------------
X# alias
X# ----------------------------------------------------------------------------
Xalias active='grep -Ev "^($|#)"'
Xalias c='clear'
Xalias cp='cp -i'
X# copy with rsync
Xalias cpr="rsync --delete --archive --numeric-ids --human-readable --verbose --info=progress2"
Xalias cpu='top -o cpu'
X# clean dropbox conflicted files
Xalias dropboxclean="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -f {} \;"
X# flush dns
Xalias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
X# clean gdrive
Xalias gdriveclean="find . -iname '*\[Conflict\]' -exec rm -f {} \;"
Xalias gdrive='cd ~/Google\ Drive'
Xalias git_empty='git commit -m "empty commit" --allow-empty'
Xalias gu='find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull \;'
Xalias dev='git checkout develop'
Xalias dh='dirs -v'
Xalias h='history'
Xalias j='jobs -l'
Xalias l='pwd -P; ls -lhaGF'
Xalias less='less -FSRX'
Xalias ll='ls -AlF'
Xalias master='git checkout master'
Xalias mem='top -o vsize'
Xalias mv='mv -i'
Xalias myip="dig @ns1.google.com -t txt o-o.myaddr.l.google.com +short"
Xalias path='echo -e ${PATH//:/\\n}'
Xalias pg='ps auxwww | grep -v "grep" | grep --color=auto'
Xalias pro='cd ~/projects'
Xalias pscpu='ps aux | sort -r -nk 3,3 | head -n 10'
Xalias psmem='ps aux | sort -r -nk 4 | head -n 10'
Xalias pyclean='find . -iname "*.py[co]" -exec rm -f {} +;'
Xalias pyserv="python -m SimpleHTTPServer"
Xalias rm='rm -i'
Xalias svi='sudo vim'
Xalias ssh-tunnel='ssh -C2qTnN -D 8080'
Xalias tmp='cd ~/tmp'
X# git log
Xalias gl="git log --decorate --graph --oneline --all --date=short --pretty=format:'%C(bold blue)%ad%Creset %C(yellow)%h%Creset%C(auto)%d%Creset %s %C(dim magenta)<%an>%Creset %C(dim green)(%ar)%Creset'"
Xalias gd="echo master diff:; git diff --name-status master develop"
X# tmux
Xalias t="tmux -2 attach -d || tmux -2 new"
Xcompdef t=tmux
Xalias tl='tmux list-sessions'
Xalias tn='tmux -2 new'
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
Xalias connected='lsof -i | grep -E "(LISTEN|ESTABLISHED)"'
X
X# checksum
Xchecksum() {
X    [[ -a $1 ]] && openssl dgst -sha256 $1
X}
X
X# get currect active interface
Xiface(){
X    route get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}';
X}
X
X# tmux
Xts() {
X    tmux switch -t $1
X}
X
X# tmux open command in new window
Xtc() {
X    tmux new-window $1
X}
X
X# get PID/PGID/PPID/SID to certain process or pid:
Xpgid() {
X    ps -ejf | egrep "STIME | $1" | grep -v egrep
X}
X
Xget_headers_GET() {
X    # curl -k -i -L -s -H "Accept-Encoding: gzip,deflate" -A "nbari - [$(date -u '+%FT%T')]" -D - $1 -o /dev/null
X    curl -i -L -s -H "Accept-Encoding: gzip,deflate" -A "nbari - [$(date -u '+%FT%T')]" -D - $1 -o /dev/null
X}
X
Xget_headers() {
X    curl -I -L -H "Accept-Encoding: gzip,deflate" -H "Origin: http://example.com" -H "Access-Control-Request-Method: GET" $1
X}
X
Xget_options() {
X    curl -I -L -X OPTIONS -H "Origin: http://example.com" -H "Access-Control-Request-Method: GET" -H "Access-Control-Request-Headers: X-Requested-With" $1
X}
X
Xget_akamai() {
X    curl -I -L -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-extracted-values, akamai-x-get-nonces, akamai-x-get-ssl-client-session-id, akamai-x-get-true-cache-key, akamai-x-serial-no, akamai-x-get-request-id, akamai-x-request-trace, akamai-x--meta-trace, akama-xi-get-extracted-values" $1
X}
X
Xchrome() {
X    open -a "Google Chrome" "http://www.google.com/search?q=$1";
X}
X
Xpman () {
X    man -t "${1}" | open -f -a /Applications/Preview.app
X}
X
Xset_env() {
X    if [ -r $PWD/.zsh_config ]; then
X        source $PWD/.zsh_config
X        print -P -- %F{2}Ok%f
X    else
X        print -P -- %F{9}No .zsh_config found%f
X    fi
X}
X
Xenc () {
X   [[ ! -z $1 ]] && gpg --symmetric --cipher-algo TWOFISH $1
X}
X
Xmkdir_ansible_roles() {
X    echo "ansible-galaxy init <name_of_role> --force"
X}
X
Xgpg_encrypt() {
X    echo "gpg --output file.gpg --encrypt --recipient user@email.com file.txt & gpg --output file.txt --decrypt file.gpg"
X}
X
Xwttr() {
X    curl "wttr.in/${1:-berlin}"
X}
X
X# ----------------------------------------------------------------------------
X# Kill all process that match $1
X# ----------------------------------------------------------------------------
Xkill9() {
X    for pid in `ps aux | grep -v "grep" | grep "$@" | awk '{print $2}'`; do
X        kill -9 $pid && echo "Killed ${pid}"
X    done
X}
X
X# ----------------------------------------------------------------------------
X# sync .dotfiles
X# ----------------------------------------------------------------------------
Xsync-dotfiles() {
X   [[ ! -z $1 ]] && tar chf - -C${HOME} .zsh .zshrc .vim .vimrc .tmux.conf .cshrc | pv | ssh $1 "tar mxf - -C ~/"
X}
X
X# ----------------------------------------------------------------------------
X# ssh+tmux
X# ----------------------------------------------------------------------------
Xexport AUTOSSH_POLL=15
Xs() {
X  [[ ! -z $1 ]] && autossh -M 0 -t $1 "tmux -2 attach -t $USER$2 -d || tmux -2 new -s $USER$2"
X}
Xcompdef s=ssh
X
X# ----------------------------------------------------------------------------
X# set ssh-agent
X# ----------------------------------------------------------------------------
Xset-ssh-agent () {
X    SSH_AGENT_PID=$(ps ax | grep -c "[s]sh-agent")
X    if [[ ! -z "${SSH_AGENT_PID// }" ]]; then
X        for agent in /tmp/ssh-*/agent.*; do
X            export SSH_AUTH_SOCK=$agent
X            if ssh-add -l 2>&1 > /dev/null; then
X                echo Found working SSH Agent:
X                ssh-add -l
X                return
X            fi
X        done
X    fi
X    pkill ssh-agent; eval `ssh-agent`; ssh-add ~/.ssh/id_rsa
X}
X
X# ----------------------------------------------------------------------------
X# whois
X# ----------------------------------------------------------------------------
Xiwhois() {
X    resolver="whois.geek.nz"
X    tld=`echo ${@: -1} | awk -F "." '{print $NF}'`
X    whois -h ${tld}.${resolver} "$@" ;
X}
X
X# ----------------------------------------------------------------------------
X# csh history
X# ----------------------------------------------------------------------------
Xautoload -U up-line-or-beginning-search
Xautoload -U down-line-or-beginning-search
Xzle -N up-line-or-beginning-search
Xzle -N down-line-or-beginning-search
Xbindkey -M vicmd 'k' up-line-or-beginning-search # Up
Xbindkey -M vicmd 'j' down-line-or-beginning-search # Down
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
X# Edit command using vim - hit ESC and then v
X# emacs mode:  Ctrl-x e -  bindkey '^Xe' edit-command-line
X# ----------------------------------------------------------------------------
Xexport KEYTIMEOUT=1
Xautoload edit-command-line
Xzle -N edit-command-line
Xbindkey -M vicmd v edit-command-line
X
X# ----------------------------------------------------------------------------
X# prompt
X# ----------------------------------------------------------------------------
Xautoload -U pure_prompt && pure_prompt
XTMOUT=1
XTRAPALRM() {
X    prompt_pure_apply_rprompt
X}
X
X# ----------------------------------------------------------------------------
X# tmux
X# ----------------------------------------------------------------------------
Xif hash tmux &> /dev/null; then
X    if [ -z "$TMUX" ]; then
X        tmux -2 new
X    elif [[ $(who am i) =~ '\([-a-zA-Z0-9\.]+\)$' ]] || [ ! -z "$SSH_CONNECTION" ] || [ ! -z "$REMOTEHOST" ]; then
X        tmux set-option -g status-right '#[fg=colour003][ #H - #[fg=colour111]#(uname) #[fg=colour003]]#[fg=colour231]#(uptime | grep -o "...user.*")' > /dev/null
X        tmux set-option -g status-position bottom > /dev/null
X        tmux set-option -g window-status-current-bg colour071 > /dev/null
X        tmux has-session || tmux -2 new
X    fi
Xfi
X
Xunsetopt prompt_cr
X
X# delete coplete for android
X# compdef -d adb
Xeval "$(direnv hook zsh)"
X
X# --files: List files that would be searched but do not search
X# --no-ignore: Do not respect .gitignore, etc...
X# --hidden: Search hidden files and folders
X# --follow: Follow symlinks
X# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
Xexport FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
Xexport FZF_TMUX=1
X[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
END-of-./.zshrc
exit

