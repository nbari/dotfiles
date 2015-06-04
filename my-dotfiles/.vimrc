set binary
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/Vundle.vim'

" vim plugins
Plugin 'Chiel92/vim-autoformat'
Plugin 'Raimondi/delimitMate'
Plugin 'airblade/vim-gitgutter'
Plugin 'chase/vim-ansible-yaml'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'hdima/python-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kana/vim-submode'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'msanders/snipmate.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

call vundle#end()

"re-enable filetype
filetype plugin indent on

colorscheme nbari-colors

" change the mapleader from \ to ,
let mapleader=","

" Encoding
set encoding=utf8 nobomb

" set up the stuff for color highlighing in an xterm
" mac os X t_co=16
set t_Co=256
" ctrl+v+Esc
set t_Sf=[3%dm
set t_Sb=[[4%dm

" Vim will never flash the screen
set t_vb=

" Terminal title
set title

" Search history and undo level
set history=1000
set undolevels=1000

" Auto reload file on external change
set autoread

" Syntax highlight
syntax on

" set old regex engine
" if version > 703
"    set re=1
" endif

set noinsertmode
set number
set hlsearch
nnoremap <leader><space> :noh<CR>
set listchars=tab:▸\ ,eol:¬,trail:·

" Ignore case on search
set ignorecase
set smartcase

" Allow us to backspace before an insert
set backspace=2

" Standard file
set ffs=unix

" No backups
set nobackup
set nowb
set noswapfile

" Spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE"
set shiftround    " round indent to multiple of 'shiftwidth'
set smarttab

" create new tab
nnoremap <leader>t :tabnew<CR>

" Show the ruler for editing
set ruler

" Turn off the mouse in the xterm
set mouse=

" Show the command in the status line
set showcmd

" Always have a status line
set laststatus=2

" save on losing focus
au FocusLost * :wa

" Delete trailing white spaces on close
"\( ... Start a match group
"$\n .. Match a new line (end-of-line character followed by a carriage return).
"\) ... End the match group
"\+ ... Allow any number of occurrences of this group (one or more).
"\%$ .. Match the end of the file
au BufWritePre,FileWritePre * %s/\s\+$//e | %s/\r$//e | %s#\($\n\)\+\%$##e

" associate *.tpl with php filetype
au BufRead,BufNewFile *.tpl set ft=php

" associate *.json with json filetype
au BufRead,BufNewFile *.json set ft=json syntax=javascript

" associate jquery.*.js
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" associate *.jinja with jinja filetype
au BufRead,BufNewFile *.jinja set ft=jinja

" enable cold folding
au FileType javascript call JavaScriptFold()

" Split windows vertically
map <F11> <C-W>v

" NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>

" Tagbar
nnoremap <leader>h :TagbarToggle<CR>

" folding settings za
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" mapping of space bar to open/close
nnoremap <space> za

" status line
" set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

if has('statusline')
  hi User1 ctermfg=172 ctermbg=016
  hi User2 ctermfg=015 ctermbg=016
  hi User3 ctermfg=003 ctermbg=016

  set statusline=\ "                            " start with one space
  set statusline+=%1*                           " use color 1
  set statusline+=\%f                           " file name
  set statusline+=%*                            "switch back to statusline highlight
  set statusline+=\ %m%r%w%h\                   " flags
  set statusline+=%=                            " ident to the right
  set statusline+=%{&fileformat}\               " file format
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}\  " encoding
  set statusline+=%{strlen(&ft)?&ft:'none'}\    " filetype
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%2*                           " use color 2
  set statusline+=[%l,%v]\                      " cursor position/offset
  set statusline+=%*                            "switch back to statusline highlight
endif

" syntastic
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_javascript_checkers = ['closurecompiler', 'jsl']
let g:syntastic_javascript_closurecompiler_path = "/usr/local/share/closure-compiler/compiler.jar"
hi SyntasticErrorSign ctermfg=red ctermbg=none
hi SyntasticWarningSign ctermfg=yellow ctermbg=none
hi SyntasticErrorLine   ctermbg=52
hi SyntasticWarningLine ctermbg=58

" CtrlP
let g:ctrlp_working_path_mode = 'c'

set wildignore+=*/.hg/*,*/.svn/*,*/.yardoc/*,*.exe,*.so,*.dat,*.pyc

" Autoformat
nnoremap <leader>ff :Autoformat<CR>
" Test this to check if autopep8 working
" echo "print 'coração niño'" | autopep8 -
let g:formatprg_args_expr_python = '"- --aggressive --aggressive --indent-size 4"'
let g:formatprg_json = "jsonlint"
let g:formatprg_args_json = "--pretty-print"

" vim-php-cs-fixer
let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer"
let g:php_cs_fixer_fixers_list = "indentation,linefeed,trailing_spaces,eof_ending,extra_empty_lines,controls_spaces,unused_use,phpdoc_params,visibility,return,braces,include,short_tag,php_closing_tag,psr0,elseif"
nnoremap <silent><leader>pc :call PhpCsFixerFixFile()<CR>

" Autocomplete PHP
au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType python set omnifunc=pythoncomplete#Complete
imap <leader><tab> <c-x><c-o>

" Python ident
au FileType python set ts=8 sts=4 et sw=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" abbreviations
inoreabbr datee  <c-r>=strftime("%F")<CR>

" cursorline
:nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>

" :h last-position-jump
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" map quick quit
map <leader>qq :qa!<CR>

" easy resize
call submode#enter_with('h/l', 'n', '', '<C-w>h', '<C-w><')
call submode#enter_with('h/l', 'n', '', '<C-w>l', '<C-w>>')
call submode#map('h/l', 'n', '', 'h', '<C-w><')
call submode#map('h/l', 'n', '', 'l', '<C-w>>')
call submode#enter_with('j/k', 'n', '', '<C-w>j', '<C-w>-')
call submode#enter_with('j/k', 'n', '', '<C-w>k', '<C-w>+')
call submode#map('j/k', 'n', '', 'j', '<C-w>-')
call submode#map('j/k', 'n', '', 'k', '<C-w>+')

" scroll
call submode#enter_with('sj', 'n', '', '<leader>j', '<C-d>')
call submode#enter_with('sk', 'n', '', '<leader>k', '<C-u>')
call submode#map('sj', 'n', '', 'j', '<C-d>')
call submode#map('sk', 'n', '', 'k', '<C-u>')

" tmux compatible splits
nnoremap <C-w>" <C-w>s
nnoremap <C-w>% <C-w>v
nnoremap <C-w>! <C-w>T

" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are
" no more windows in that direction, forwards the operation to tmux.
if exists('$TMUX')
  let s:tmux_is_last_pane = 0
  au WinEnter * let s:tmux_is_last_pane = 0

  " Like `wincmd` but also change tmux panes instead of vim windows when needed.
  function s:TmuxWinCmd(direction, tmuxdir)
    let nr = winnr()
    " try to switch windows within vim
    exec 'wincmd ' . a:direction
    " Forward the switch panes command to tmux if:
    " we tried switching windows in vim but it didn't have effect.
    if nr == winnr()
      let cmd = 'tmux select-pane -' . a:tmuxdir
      call system(cmd)
      let s:tmux_is_last_pane = 1
      echo cmd
    else
      let s:tmux_is_last_pane = 0
    endif
  endfunction

  " navigate between split windows/tmux panes
  map <c-h> :call <SID>TmuxWinCmd('h', 'L')<cr>
  map <c-j> :call <SID>TmuxWinCmd('j', 'D')<cr>
  map <c-k> :call <SID>TmuxWinCmd('k', 'U')<cr>
  map <c-l> :call <SID>TmuxWinCmd('l', 'R')<cr>
else
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l
endif

" switches delimitMate on and off
nnoremap <leader>d :DelimitMateSwitch<CR>

if executable("par")
  set formatprg=par\ -w80
endif

" wrap text
map <leader>w {v}!fmt -w80<CR>
vmap <leader>w !fmt -w80<CR>

" Diff current buffer and the original file
nnoremap <leader>di :w !diff % -<CR>

" Ack
nnoremap <leader>a :Ack

" underline
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-
nnoremap <leader>3 yypVr.
nnoremap <leader>0 :put = \"# ----------------------------------------------------------------------------\"<CR>

" toogle hex
let $in_hex=0
function HexMe()
  set binary
  set noeol
  if $in_hex > 0
    :%!xxd -r
    let $in_hex=0
  else
    :%!xxd
    let $in_hex=1
  endif
endfunction
nnoremap <leader>hex :call HexMe()<CR>

" enable all syntax highlighting features
let python_highlight_all = 1

" keyword information
nnoremap <leader>ski :set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}}<CR>
nnoremap <leader>ki :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" syntax jquery
nnoremap <leader>jq :set syntax=jquery<CR>

" replace tabs with spaces
nnoremap <leader>rt :%s/\t/  /g<CR>

" spell
nnoremap <leader>s :setlocal spell!<CR>
set spelllang=en

" vim-marker
let g:vim_markdown_folding_disabled=1

" browse oldfiles
nnoremap <leader>o :browse oldfiles<CR>
nnoremap <leader>l :CtrlPMRU<CR>

" Compile LessCSS on save
autocmd BufWritePost,FileWritePost *.less :silent !lessc --clean-css % %:p:r.css

" Compile script.src.js -> script.min.js
nnoremap <leader>jc :execute "!java -jar " . g:syntastic_javascript_closurecompiler_path . ' --js='. expand('%') . ' --js_output_file=' . expand('%:r:r') . '.min.js'<CR>

" prety json
nnoremap <leader>pj :%!python -m json.tool<CR>

" found no ASCII
" Once you're on a particular one, use ga
" to determine the ASCII value of the character in question, and
nnoremap <leader>xa :/[^\x00-\x7F]<CR>
"
" sh
set shell=/bin/sh

" go
au FileType go nmap <leader>r <Plug>(go-run)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" diff highlights
autocmd FileType * if &diff | setlocal syntax= | endif

" vertical 3-way diff
set diffopt=vertical
