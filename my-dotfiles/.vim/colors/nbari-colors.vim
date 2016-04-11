" nbari-colors

hi clear
syntax reset

let g:colors_name = "nbari-colors"

" Standard
hi Comment         term=bold ctermfg=243
hi Conditional     ctermfg=250
hi Constant        term=underline ctermfg=173
hi Define          ctermfg=139
hi Error           term=reverse ctermfg=16 ctermbg=9
hi Function        ctermfg=109
hi Identifier      term=underline ctermfg=167
hi Ignore          ctermfg=0
hi Include         ctermfg=109
hi Operator        ctermfg=109
hi PreProc         term=underline ctermfg=139
hi Repeat          ctermfg=250
hi Special         term=bold ctermfg=250
hi Statement       term=bold ctermfg=250
hi String          ctermfg=143
hi Structure       ctermfg=139
hi Todo            term=standout ctermfg=243 ctermbg=235
hi Type            term=underline ctermfg=109
hi Underlined      term=underline cterm=underline ctermfg=81

" Vim
hi ColorColumn     term=reverse ctermbg=236
hi CursorColumn    term=reverse ctermbg=236
hi CursorLine      term=bold cterm=bold ctermbg=236
hi Directory       term=bold ctermfg=109
hi ErrorMsg        term=standout ctermfg=167 ctermbg=235
hi FoldColumn      term=standout ctermfg=14 ctermbg=235
hi Folded          term=standout ctermfg=243 ctermbg=235
hi IncSearch       term=reverse cterm=reverse
hi LineNr          term=underline ctermfg=239
hi MatchParen      term=reverse ctermbg=239
hi ModeMsg         term=bold cterm=bold ctermfg=143
hi MoreMsg         term=bold ctermfg=143
hi NonText         term=bold ctermfg=239
hi Normal          ctermfg=250 ctermbg=235
hi Pmenu           ctermfg=250 ctermbg=239
hi PmenuSbar       ctermbg=248
hi PmenuSel        cterm=reverse ctermfg=250 ctermbg=239
hi PmenuThumb      cterm=reverse
hi Question        term=standout ctermfg=143
hi Search          term=reverse ctermfg=235 ctermbg=222
hi SignColumn      term=standout ctermfg=14 ctermbg=235
hi SpecialKey      term=bold ctermfg=239
hi SpellBad        term=reverse ctermbg=52
hi SpellCap        term=reverse ctermbg=12
hi SpellLocal      term=underline ctermbg=14
hi SpellRare       term=reverse ctermbg=55
hi StatusLine      term=bold,reverse cterm=reverse ctermfg=16 ctermbg=109
hi StatusLineNC    term=reverse cterm=reverse ctermfg=240 ctermbg=250
hi TabLine         term=underline cterm=reverse ctermfg=240 ctermbg=250
hi TabLineFill     term=reverse cterm=reverse ctermfg=240 ctermbg=250
hi TabLineSel      term=bold cterm=bold
hi Title           term=bold ctermfg=243
hi VertSplit       term=reverse ctermfg=240 ctermbg=240
hi Visual          term=reverse ctermbg=239
hi WarningMsg      term=standout ctermfg=167
hi WildMenu        term=standout ctermfg=0 ctermbg=11
hi vimCommand      ctermfg=167

" C
hi cConditional    ctermfg=139
hi cRepeat         ctermfg=139
hi cStorageClass   ctermfg=139
hi cType           ctermfg=222

" PHP
hi phpClasses      ctermfg=110
hi phpConditional  ctermfg=139
hi phpConstants    ctermfg=231
hi phpFunctions    ctermfg=137
hi phpIdentifier   ctermfg=167
hi phpInclude      ctermfg=167
hi phpKeyword      ctermfg=139
hi phpMemberSelector  ctermfg=250
hi phpMethodsVar   ctermfg=110
hi phpNumber       ctermfg=222
hi phpOperator     ctermfg=245
hi phpParent       ctermfg=245
hi phpRegion       ctermfg=109
hi phpRepeat       ctermfg=139
hi phpSpecial      ctermfg=222
hi phpStatement    ctermfg=139
hi phpStringSingle  ctermfg=253
hi phpType         ctermfg=114
hi phpVarSelector  ctermfg=173

" Ruby
hi rubyAccess      ctermfg=222
hi rubyAttribute   ctermfg=109
hi rubyConditional  ctermfg=139
hi rubyConstant    ctermfg=222
hi rubyControl     ctermfg=139
hi rubyCurlyBlock  ctermfg=173
hi rubyException   ctermfg=139
hi rubyInclude     ctermfg=109
hi rubyInterpolationDelimiter  ctermfg=173
hi rubyLocalVariableOrMethod  ctermfg=173
hi rubyRepeat      ctermfg=139
hi rubyStringDelimiter  ctermfg=143
hi rubySymbol      ctermfg=143

" Python
hi pythonBinNumber  ctermfg=222
hi pythonBoolean   ctermfg=173
hi pythonBytesEscape  ctermfg=173
hi pythonConditional  ctermfg=173
hi pythonDot       ctermfg=167
hi pythonExClass   ctermfg=173
hi pythonException  ctermfg=139
hi pythonFloat     ctermfg=222
hi pythonFunction  ctermfg=139
hi pythonHexNumber  ctermfg=222
hi pythonImport    ctermfg=167
hi pythonNumber    ctermfg=222
hi pythonOctNumber  ctermfg=222
hi pythonPreCondit  ctermfg=167
hi pythonRepeat    ctermfg=173
hi pythonStatement  ctermfg=110
hi pythonStrFormatting  ctermfg=114

" JavaScript
hi jEffects        ctermfg=110
hi jEvents         ctermfg=110
hi jForms          ctermfg=114
hi jFunc           ctermfg=139
hi jManipulation   ctermfg=110
hi jQuery          ctermfg=222
hi javaScriptBoolean  ctermfg=167
hi javaScriptBraces  ctermfg=167
hi javaScriptConditional  ctermfg=139
hi javaScriptDOMObjects  ctermfg=114
hi javaScriptEndColons  ctermfg=245
hi javaScriptExceptions  ctermfg=110
hi javaScriptFuncArg  ctermfg=173
hi javaScriptFuncDef  ctermfg=110
hi javaScriptFuncKeyword  ctermfg=139
hi javaScriptGlobalObjects  ctermfg=109
hi javaScriptIdentifier  ctermfg=114
hi javaScriptMember  ctermfg=173
hi javaScriptNumber  ctermfg=222
hi javaScriptOpSymbols  ctermfg=173
hi javaScriptOperator  ctermfg=222
hi javaScriptParens  ctermfg=245
hi javaScriptRepeat  ctermfg=139
hi javaScriptStatement  ctermfg=139
hi javaScriptStringD  ctermfg=143
hi javaScriptStringS  ctermfg=253

" HTML
hi htmlArg         ctermfg=167
hi htmlScriptTag   ctermfg=167
hi htmlTag         ctermfg=167
hi htmlTagName     ctermfg=167

" Diff
hi diffAdded       ctermfg=143
hi DiffAdd         term=bold ctermfg=255 ctermbg=22
hi DiffChange      term=bold ctermfg=255 ctermbg=24
hi DiffDelete      term=bold ctermfg=235 ctermbg=9
hi DiffText        term=reverse cterm=bold ctermfg=255 ctermbg=124
hi diffRemoved     ctermfg=167

" ShowMarks
hi ShowMarksHLl    ctermfg=173 ctermbg=235
hi ShowMarksHLo    ctermfg=139 ctermbg=235
hi ShowMarksHLu    ctermfg=222 ctermbg=235
hi ShowMarksHLm    ctermfg=109 ctermbg=235

" Cucumber
hi cucumberGiven   ctermfg=109
hi cucumberGivenAnd  ctermfg=109

" Go
hi goBuiltins      ctermfg=139
hi goComment       ctermfg=243
hi goComplexes     ctermfg=167
hi goConditional   ctermfg=139
hi goConstants     ctermfg=173
hi goDeclType      ctermfg=222
hi goDeclaration   ctermfg=139
hi goDirective     ctermfg=167
hi goEscapeC       ctermfg=173
hi goFloats        ctermfg=167
hi goFormatSpecifier  ctermfg=114
hi goFunction      ctermfg=231
hi goMethod        ctermfg=110
hi goOperator      ctermfg=109
hi goRawString     ctermfg=253
hi goRepeat        ctermfg=111
hi goSignedInts    ctermfg=167
hi goStatement     ctermfg=139
hi goString        ctermfg=143
hi goStructDef     ctermfg=137
hi goTodo          ctermfg=222
hi goType          ctermfg=167
hi goUnsignedInts  ctermfg=167

" Rust
hi rustAttribute   ctermfg=110
hi rustBoolean     ctermfg=173
hi rustCharacter   ctermfg=143
hi rustCommentLine ctermfg=243
hi rustConditional ctermfg=139
hi rustDecNumber   ctermfg=173
hi rustEscape      ctermfg=173
hi rustFuncCall    ctermfg=110
hi rustFuncName    ctermfg=231
hi rustIdentifier  ctermfg=137
hi rustKeyword     ctermfg=139
hi rustMacro       ctermfg=72
hi rustModPath     ctermfg=167
hi rustRepeat      ctermfg=111
hi rustSigil       ctermfg=167
hi rustStorage     ctermfg=102
hi rustStructure   ctermfg=222
hi rustTrait       ctermfg=167
hi rustType        ctermfg=167

" Lua
hi luaCond         ctermfg=139
hi luaCondElseif   ctermfg=139
hi luaCondEnd      ctermfg=139
hi luaCondStart    ctermfg=139
hi luaRepeat       ctermfg=139
hi luaStatement    ctermfg=139

" SH
hi shCommandSub    ctermfg=167
hi shConditional   ctermfg=111
hi shCtrlSeq       ctermfg=167
hi shHereDoc       ctermfg=243
hi shRange         ctermfg=110
hi shRedir         ctermfg=110
hi shSet           ctermfg=167
hi shStatement     ctermfg=139
hi shTestOpr       ctermfg=173

" ZSH
hi zshConditional  ctermfg=111
hi zshCommands     ctermfg=167
hi zshVariableDef  ctermfg=137


set background=dark