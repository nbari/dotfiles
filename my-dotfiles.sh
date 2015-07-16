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
#	./.vim/colors
#	./.vim/colors/nbari-colors.vim
#	./.vim/filetype.vim
#	./.vim/syntax
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
Xsetenv  EDITOR  vim
Xsetenv  PAGER  less
Xsetenv  BLOCKSIZE  K
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
Xset-window-option -g utf8 on
X
X# vi bindings
Xset-option -g status-key vi
Xset-window-option -g mode-keys vi
X
X# Set the maximum number of lines held in window history.
Xset -g history-limit 1000000
Xset-option -g status-utf8 on
Xset-option -g status-bg "#000000"
Xset-option -g status-fg "#FDB813"
Xset-option -g status-interval 5
Xset-option -g status-right-length 90
Xset-option -g status-right '[ #H ]#[fg=colour012]#(uptime | grep -o "...user.*")'
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
X
X# Smart pane switching with awareness of vim splits
Xbind -n C-h if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-h" "select-pane -L"
Xbind -n C-j if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-j" "select-pane -D"
Xbind -n C-k if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-k" "select-pane -U"
Xbind -n C-l if "[ $(tmux display -p '#{pane_current_command}') = vim ]" "send-keys C-l" "select-pane -R"
X
X# easily toggle synchronization (mnemonic: e is for echo)
Xbind e setw synchronize-panes on
Xbind E setw synchronize-panes off
X
X# open in current_path
Xbind c new-window -c '#{pane_current_path}'
Xbind % split-window -h -c "#{pane_current_path}"
Xbind '"' split-window -c "#{pane_current_path}"
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
Xhi StatusLine      term=bold,reverse cterm=reverse ctermfg=16 ctermbg=109
Xhi StatusLineNC    term=reverse cterm=reverse ctermfg=240 ctermbg=250
Xhi TabLine         term=underline cterm=reverse ctermfg=240 ctermbg=250
Xhi TabLineFill     term=reverse cterm=reverse ctermfg=240 ctermbg=250
Xhi TabLineSel      term=bold cterm=bold
Xhi Title           term=bold ctermfg=243
Xhi VertSplit       term=reverse ctermfg=240 ctermbg=240
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
Xhi goComplexes     ctermfg=167
Xhi goConditional   ctermfg=139
Xhi goConstants     ctermfg=173
Xhi goDeclType      ctermfg=222
Xhi goDeclaration   ctermfg=139
Xhi goDirective     ctermfg=167
Xhi goEscapeC       ctermfg=173
Xhi goFloats        ctermfg=167
Xhi goFormatSpecifier  ctermfg=114
Xhi goFunction      ctermfg=231
Xhi goMethod        ctermfg=110
Xhi goOperator      ctermfg=109
Xhi goRepeat        ctermfg=111
Xhi goSignedInts    ctermfg=167
Xhi goStatement     ctermfg=139
Xhi goString        ctermfg=143
Xhi goStructDef     ctermfg=137
Xhi goTodo          ctermfg=222
Xhi goType          ctermfg=167
Xhi goUnsignedInts  ctermfg=167
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
X
X" Vundle
Xfiletype off
Xset rtp+=~/.vim/bundle/Vundle.vim
Xcall vundle#begin()
X
X" let Vundle manage Vundle
X" required!
XBundle 'gmarik/Vundle.vim'
X
X" vim plugins
XPlugin 'Chiel92/vim-autoformat'
XPlugin 'Raimondi/delimitMate'
XPlugin 'airblade/vim-gitgutter'
XPlugin 'chase/vim-ansible-yaml'
XPlugin 'fatih/vim-go'
XPlugin 'groenewege/vim-less'
XPlugin 'hdima/python-syntax'
XPlugin 'jelera/vim-javascript-syntax'
XPlugin 'kana/vim-submode'
XPlugin 'kien/ctrlp.vim'
XPlugin 'majutsushi/tagbar'
XPlugin 'mileszs/ack.vim'
XPlugin 'mitsuhiko/vim-jinja'
XPlugin 'msanders/snipmate.vim'
XPlugin 'plasticboy/vim-markdown'
XPlugin 'rodjek/vim-puppet'
XPlugin 'saltstack/salt-vim'
XPlugin 'scrooloose/nerdcommenter'
XPlugin 'scrooloose/nerdtree'
XPlugin 'scrooloose/syntastic'
XPlugin 'stephpy/vim-php-cs-fixer'
XPlugin 'tpope/vim-fugitive'
XPlugin 'tpope/vim-surround'
X
Xcall vundle#end()
X
X"re-enable filetype
Xfiletype plugin indent on
X
Xcolorscheme nbari-colors
X
X" change the mapleader from \ to ,
Xlet mapleader=","
X
X" Encoding
Xset encoding=utf8 nobomb
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
X
X" enable cold folding
Xau FileType javascript call JavaScriptFold()
X
X" Split windows vertically
Xmap <F11> <C-W>v
X
X" NERDTree
Xnnoremap <leader>n :NERDTreeToggle<CR>
X
X" Tagbar
Xnnoremap <leader>h :TagbarToggle<CR>
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
X  hi User1 ctermfg=012 ctermbg=016
X  hi User2 ctermfg=172 ctermbg=016
X  hi User3 ctermfg=015 ctermbg=016
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
X  set statusline+=[%l,%v]\                      " cursor position/offset
X  set statusline+=%*                            " switch back to statusline highlight
Xendif
X
X" syntastic
Xlet g:syntastic_error_symbol='✗'
Xlet g:syntastic_warning_symbol='⚠'
Xlet g:syntastic_javascript_checkers = ['closurecompiler', 'jsl']
Xlet g:syntastic_javascript_closurecompiler_path = "/usr/local/share/closure-compiler/compiler.jar"
Xhi SyntasticErrorSign ctermfg=red ctermbg=none
Xhi SyntasticWarningSign ctermfg=yellow ctermbg=none
Xhi SyntasticErrorLine   ctermbg=52
Xhi SyntasticWarningLine ctermbg=58
X
X" CtrlP
Xlet g:ctrlp_working_path_mode = 'c'
X
Xset wildignore+=*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,*.pyc
X
X" Autoformat
Xnnoremap <leader>ff :Autoformat<CR>
X" Test this to check if autopep8 working
X" echo "print 'coração niño'" | autopep8 -
X" let g:formatprg_args_expr_python = '"- --aggressive --aggressive --indent-size 4"'
Xlet g:formatdef_autopep8 = '"- --aggressive --aggressive --indent-size 4"'
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
Xmap <leader>w {v}!fmt -w80<CR>
Xvmap <leader>w !fmt -w80<CR>
X
X" Diff current buffer and the original file
Xnnoremap <leader>di :w !diff % -<CR>
X
X" Ack
Xnnoremap <leader>a :Ack
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
X" browse oldfiles
Xnnoremap <leader>o :browse oldfiles<CR>
Xnnoremap <leader>l :CtrlPMRU<CR>
X
X" Compile LessCSS on save
Xautocmd BufWritePost,FileWritePost *.less :silent !lessc --clean-css % %:p:r.css
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
Xlet g:go_highlight_functions = 1
Xlet g:go_highlight_methods = 1
Xlet g:go_highlight_structs = 1
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
X# version: 0.2.3
X# author: Mathias Fredriksson
X# url: https://github.com/mafredri/zsh-async
X#
X
X# Wrapper for jobs executed by the async worker, gives output in parseable format with execution time
X_async_job() {
X	# store start time
X	local start=$EPOCHREALTIME
X
X	# run the command
X	local out
X	out=$(eval "$@" 2>&1)
X	local ret=$?
X
X	# Grab mutex lock
X	read -ep >/dev/null
X
X	# return output (<job_name> <return_code> <output> <duration>)
X	print -r -N -n -- "$1" "$ret" "$out" $(( $EPOCHREALTIME - $start ))$'\0'
X
X	# Unlock mutex
X	print -p "t"
X}
X
X# The background worker manages all tasks and runs them without interfering with other processes
X_async_worker() {
X	local -A storage
X	local unique=0
X
X	# Process option parameters passed to worker
X	while getopts "np:u" opt; do
X		case "$opt" in
X		# Use SIGWINCH since many others seem to cause zsh to freeze, e.g. ALRM, INFO, etc.
X		n) trap 'kill -WINCH $ASYNC_WORKER_PARENT_PID' CHLD;;
X		p) ASYNC_WORKER_PARENT_PID=$OPTARG;;
X		u) unique=1;;
X		esac
X	done
X
X	# Create a mutex for writing to the terminal through coproc
X	coproc cat
X	# Insert token into coproc
X	print -p "t"
X
X	while read -r cmd; do
X		# Separate on spaces into an array
X		cmd=(${=cmd})
X		local job=$cmd[1]
X
X		# Check for non-job commands sent to worker
X		case "$job" in
X		_killjobs)
X			kill -KILL ${${(v)jobstates##*:*:}%\=*} &>/dev/null
X			continue
X			;;
X		esac
X
X		# If worker should perform unique jobs
X		if ((unique)); then
X			# Check if a previous job is still running, if yes, let it finnish
X			for pid in ${${(v)jobstates##*:*:}%\=*}; do
X				if [[ "${storage[$job]}" == "$pid" ]]; then
X					continue 2
X				fi
X			done
X		fi
X
X		# run task in background
X		_async_job $cmd &
X		# store pid because zsh job manager is extremely unflexible (show jobname as non-unique '$job')...
X		storage[$job]=$!
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
X# 	$3 = resulting output from execution
X# 	$4 = execution time, floating point e.g. 2.05 seconds
X#
Xasync_process_results() {
X	integer count=0
X	local worker=$1
X	local callback=$2
X	local -a items
X	local IFS=$'\0'
X
X	typeset -gA ASYNC_PROCESS_BUFFER
X	# Read output from zpty and parse it if available
X	while zpty -rt "$worker" line 2>/dev/null; do
X		# Remove unwanted \r from output
X		ASYNC_PROCESS_BUFFER[$1]+=${line//$'\r'$'\n'/$'\n'}
X		# Split buffer on null characters, preserve empty elements
X		items=("${(@)=ASYNC_PROCESS_BUFFER[$1]}")
X		# Remove last element since it's due to the return string separator structure
X		items=("${(@)items[1,${#items}-1]}")
X
X		# Continue until we receive all information
X		(( ${#items} % 4 )) && continue
X
X		# Work through all results
X		while (( ${#items} > 0 )); do
X			"$callback" "${(@)=items[1,4]}"
X			shift 4 items
X			count+=1
X		done
X
X		# Empty the buffer
X		ASYNC_PROCESS_BUFFER[$1]=""
X	done
X
X	# If we processed any results, return success
X	(( $count )) && return 0
X
X	# No results were processed
X	return 1
X}
X
X#
X# Start a new asynchronous job on specified worker, assumes the worker is running.
X#
X# usage:
X# 	async_job <worker_name> <my_function> [<function_params>]
X#
Xasync_job() {
X	local worker=$1; shift
X	zpty -w "$worker" "$@"
X}
X
X# This function traps notification signals and calls all registered callbacks
X_async_notify_trap() {
X	for k in ${(k)ASYNC_CALLBACKS}; do
X		async_process_results "${k}" "${ASYNC_CALLBACKS[$k]}"
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
X	typeset -gA ASYNC_CALLBACKS
X	local worker=$1; shift
X
X	ASYNC_CALLBACKS[$worker]="$*"
X
X	trap '_async_notify_trap' WINCH
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
X	local worker=$1; shift
X
X	# Check if the worker exists
X	zpty -t "$worker" &>/dev/null || return 1
X
X	# Send kill command to worker
X	zpty -w "$worker" "_killjobs"
X
X	# Clear all output buffers
X	while zpty -r "$worker" line; do true; done
X
X	# Clear any partial buffers
X	typeset -gA ASYNC_PROCESS_BUFFER
X	ASYNC_PROCESS_BUFFER[$1]=""
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
X	local worker=$1; shift
X	zpty -t "$worker" &>/dev/null || zpty -b "$worker" _async_worker -p $$ "$@" || async_stop_worker "$worker"
X}
X
X#
X# Stop one or multiple workers that are running, all unfetched and incomplete work will be lost.
X#
X# usage:
X# 	async_stop_worker <worker_name_1> [<worker_name_2>]
X#
Xasync_stop_worker() {
X	local ret=0
X	for worker in "$@"; do
X		async_unregister_callback "$worker"
X		zpty -d "$worker" 2>/dev/null || ret=$?
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
X	zmodload zsh/zpty
X	zmodload zsh/datetime
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
X
X
X# turns seconds into human readable time
X# 165392 => 1d 21h 56m 32s
X# https://github.com/sindresorhus/pretty-time-zsh
Xprompt_pure_human_time() {
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
X# displays the exec time of the last command if set threshold was exceeded
Xprompt_pure_check_cmd_exec_time() {
X	local stop=$EPOCHSECONDS
X	local start=${prompt_pure_cmd_timestamp:-$stop}
X	integer elapsed=$stop-$start
X	(($elapsed > ${PURE_CMD_MAX_EXEC_TIME:=5})) && prompt_pure_human_time $elapsed
X}
X
Xprompt_pure_check_git_arrows() {
X	# check if there is an upstream configured for this branch
X	command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return
X
X	local arrows=""
X	(( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
X	(( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
X    [[ "$arrows" == '⇣⇡' ]] && arrows='±'
X	# output the arrows
X	[[ "$arrows" != "" ]] && echo " ${arrows}"
X}
X
Xprompt_pure_preexec() {
X	prompt_pure_cmd_timestamp=$EPOCHSECONDS
X
X	# tell the terminal we are setting the title
X	print -Pn "\e]0;"
X	# show hostname if connected through ssh
X	[[ "$SSH_CONNECTION" != '' ]] && print -Pn "(%m) "
X	# shows the current dir and executed command in the title when a process is active
X	# (use print -r to disable potential evaluation of escape characters in cmd)
X	print -nr "$PWD:t: $2"
X	print -Pn "\a"
X}
X
X# string length ignoring ansi escapes
Xprompt_pure_string_length() {
X	# Subtract one since newline is counted as two characters
X	echo $(( ${#${(S%%)1//(\%([KF1]|)\{*\}|\%[Bbkf])}} - 1 ))
X}
X
Xprompt_pure_preprompt_render() {
X	# check that no command is currently running, the prompt will otherwise be rendered in the wrong place
X	[[ -n ${prompt_pure_cmd_timestamp+x} && "$1" != "precmd" ]] && return
X
X	# set color for git branch/dirty status, change color if dirty checking has been delayed
X	local git_color=yellow
X	[[ -n ${prompt_pure_git_delay_dirty_check+x} ]] && git_color=196
X
X	# construct prompt, beginning with path
X	local prompt="$prompt_pure_username %F{074}%~%f"
X
X	# git info
X    local git_branch=$vcs_info_msg_0_
X
X    # if branch = master | merge
X    [[ ${git_branch//[[:space:]]} == (*"|merge"|"master") ]] && git_branch=" %F{160}${git_branch//[[:space:]]}%f"
X
X	prompt+="%F{$git_color}${git_branch}%F{1}${prompt_pure_git_dirty}%f"
X
X	# git pull/push arrows
X	prompt+="%F{cyan}${prompt_pure_git_arrows}%f"
X	# execution time
X	prompt+="%F{red}${prompt_pure_cmd_exec_time}%f"
X
X	# if executing through precmd, do not perform fancy terminal editing
X	if [[ "$1" == "precmd" ]]; then
X		print -P "\n${prompt}"
X	else
X		# only redraw if prompt has changed
X		[[ "${prompt_pure_last_preprompt}" != "${prompt}" ]] || return
X
X		# calculate length of prompt for redraw purposes
X		local prompt_length=$(prompt_pure_string_length $prompt)
X		local lines=$(( $prompt_length / $COLUMNS + 1 ))
X
X		# disable clearing of line if last char of prompt is last column of terminal
X		local clr="\e[K"
X		(( $prompt_length * $lines == $COLUMNS - 1 )) && clr=""
X
X		# modify previous prompt
X		print -Pn "\e7\e[${lines}A\e[1G${prompt}${clr}\e8"
X	fi
X
X	# store previous prompt for comparison
X	prompt_pure_last_preprompt=$prompt
X}
X
Xprompt_pure_precmd() {
X	# store exec time for when preprompt gets re-rendered
X	prompt_pure_cmd_exec_time=$(prompt_pure_check_cmd_exec_time)
X
X	# by making sure that prompt_pure_cmd_timestamp is defined here the async functions are prevented from interfering
X	# with the initial preprompt rendering
X	prompt_pure_cmd_timestamp=
X
X	# check for git arrows
X	prompt_pure_git_arrows=$(prompt_pure_check_git_arrows)
X
X	# tell the terminal we are setting the title
X	print -Pn "\e]0;"
X	# show hostname if connected through ssh
X	[[ "$SSH_CONNECTION" != '' ]] && print -Pn "(%m) "
X	# shows the full path in the title
X	print -Pn "%~\a"
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
X	cd -q "$*"
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
X	cd -q "$*"
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
X	# get the current git working tree, empty if not inside a git directory
X	local working_tree="$(command git rev-parse --show-toplevel 2>/dev/null)"
X
X	# check if the working tree changed, it is prefixed with "x" to prevent variable resolution in path
X	if [ "${prompt_pure_current_working_tree:-x}" != "x${working_tree}" ]; then
X		# stop any running async jobs
X		async_flush_jobs "prompt_pure"
X
X		# reset git preprompt variables, switching working tree
X		unset prompt_pure_git_dirty
X		unset prompt_pure_git_delay_dirty_check
X
X		# set the new working tree, prefixed with "x"
X		prompt_pure_current_working_tree="x${working_tree}"
X	fi
X
X	# only perform tasks inside git working tree
X	[[ "${working_tree}" != "" ]] || return
X
X    if (( ${PURE_GIT_PULL:-1} )); then
X        # make sure working tree is not $HOME
X        [[ "${working_tree}" != "$HOME" ]] &&
X        # tell worker to do a git fetch
X        async_job "prompt_pure" prompt_pure_async_git_fetch "$working_tree"
X    fi
X
X	# if dirty checking is sufficiently fast, tell worker to check it again, or wait for timeout
X	local dirty_check=$(( $EPOCHSECONDS - ${prompt_pure_git_delay_dirty_check:-0} ))
X	if (( $dirty_check > ${PURE_GIT_DELAY_DIRTY_CHECK:-1800} )); then
X		unset prompt_pure_git_delay_dirty_check
X		# check check if there is anything to pull
X        async_job "prompt_pure" prompt_pure_async_git_dirty "$working_tree"
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
X			# when prompt_pure_git_delay_dirty_check is set, the git info is displayed in a different color, this is why the
X			# prompt is rendered before the variable is (potentially) set
X			(( $exec_time > 2 )) && prompt_pure_git_delay_dirty_check=$EPOCHSECONDS
X			;;
X		prompt_pure_async_git_fetch)
X			prompt_pure_git_arrows=$(prompt_pure_check_git_arrows)
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
X	prompt_opts=(cr subst percent)
X
X	zmodload zsh/datetime
X	autoload -Uz add-zsh-hook
X	autoload -Uz vcs_info
X	autoload -Uz async && async
X
X	add-zsh-hook precmd prompt_pure_precmd
X	add-zsh-hook preexec prompt_pure_preexec
X
X	zstyle ':vcs_info:*' enable git
X	zstyle ':vcs_info:*' use-simple true
X	zstyle ':vcs_info:git*' formats ' %b'
X	zstyle ':vcs_info:git*' actionformats ' %b|%a'
X
X	prompt_pure_username='%F{2}%n'
X
X	# show username@host if logged in through SSH
X	[[ ! -z "$SSH_CONNECTION" ]] && prompt_pure_username='%F{2}%n%F{8}@%M'
X
X	# show username@host if root, with username in red
X	[[ $UID -eq 0 ]] && prompt_pure_username='%F{1}%n%F{242}@%M' && PROMPT_SYMBOL='%F{3}#'
X
X	# prompt turns red if the previous command didn't exit with 0
X	PROMPT="%(?.%F{5}.%F{1})${PROMPT_SYMBOL:-$}%f "
X}
X
Xprompt_pure_setup "$@"
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
Xexport PATH="$HOME/Library/Python/2.7/bin:$HOME/node_modules/.bin:/opt/local/bin:/usr/local/sbin:/usr/X11R6/bin:/usr/local/mysql/bin:/usr/share/bin:$PATH"
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
Xalias cpr="rsync --delay-updates --delete-after --checksum --archive --progress -h"
Xalias cpu='top -o cpu'
X# clean dropbox conflicted files
Xalias dropboxclean="find . -name \*\'s\ conflicted\ copy\ \* -exec rm -f {} \;"
X# clean gdrive
Xalias gdriveclean="find . -iname '*\[Conflict\]' -exec rm -f {} \;"
Xalias dev='git checkout develop'
Xalias dh='dirs -v'
Xalias h='history'
Xalias j='jobs -l'
Xalias l='pwd -P; ls -lhaGF'
Xalias less='less -FSRX'
Xalias ll='ls -ALF'
Xalias master='git checkout master'
Xalias mem='top -o vsize'
Xalias mv='mv -i'
Xalias myip="dig +short myip.opendns.com @resolver1.opendns.com"
Xalias path='echo -e ${PATH//:/\\n}'
Xalias pg='ps auxwww | grep -v "grep" | grep --color=auto'
Xalias pro='cd ~/projects'
Xalias pscpu='ps aux | sort -r -nk 3,3 | head -n 10'
Xalias psmem='ps aux | sort -r -nk 4 | head -n 10'
Xalias pyclean='find . -iname "*.py[co]" -exec rm -f {} +;'
Xalias pyserv="python -m SimpleHTTPServer"
Xalias rm='rm -i'
Xalias svi='sudo vim'
Xalias tmp='cd ~/tmp'
X# git log
Xalias gl="git log --graph --pretty=format:'%C(bold blue)%ad%Creset %C(yellow)%h%Creset%C(auto)%d%Creset %s %C(dim magenta)<%an>%Creset %C(dim green)(%ar)%Creset' --date=short"
Xalias gd="echo master diff:; git diff --name-status master"
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
Xget_headers() {
X    curl -k -I -L -H 'Accept-Encoding: gzip,deflate' $1
X}
X
Xchrome() {
X    open -a "Google Chrome" "http://www.google.com/search?q=$1";
X}
X
Xpman () {
X    man -t "${1}" | open -f -a /Applications/Preview.app
X}
X# ----------------------------------------------------------------------------
X# Kill all process that match $1
X# ----------------------------------------------------------------------------
Xkill9() {
X    for pid in `ps aux | grep -v "grep" | grep "$@" | awk '{print $2}'`
X    do
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
XRPROMPT="%F{8}%*"
X
X# ----------------------------------------------------------------------------
X# tmux
X# ----------------------------------------------------------------------------
Xif hash tmux &> /dev/null; then
X    if [ -z "$TMUX" ]; then
X        tmux has-session || tmux -2 new
X    elif [ ! -z "$SSH_CONNECTION" ]; then
X        tmux set-option -g status-right '#[fg=colour003][ #H - #[fg=colour111]#(uname) #[fg=colour003]]#[fg=colour231]#(uptime | grep -o "...user.*")' > /dev/null
X        tmux set-option -g status-position bottom > /dev/null
X        tmux set-option -g window-status-current-bg colour071 > /dev/null
X    fi
Xfi
X
Xunsetopt prompt_cr
END-of-./.zshrc
exit

