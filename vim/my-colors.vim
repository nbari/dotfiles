" my-colors
" Based on Tomorrow Night - Full Colour and 256 Colour

" Default GUI Colours
let s:foreground = "c5c8c6"
let s:background = "1d1f21"
let s:selection = "373b41"
let s:line = "282a2e"
" let s:comment = "969896"
let s:comment = "808080"
let s:red = "cc6666"
let s:orange = "de935f"
let s:yellow = "f0c674"
let s:green = "b5bd68"
let s:aqua = "8abeb7"
let s:blue = "81a2be"
let s:purple = "b294bb"
let s:window = "4d5057"
let s:identifiers = "7EA7D8"
let s:keywords = "7CC576"
let s:constants = "ffffff"
let s:stringSingle = "E5E5E5"
let s:operators = "979797"
let s:functions = "A67C52"
let s:sky = "7ec0ee"
let s:black = "000000"

" Console 256 Colours
if !has("gui_running")
	let s:background = "303030"
	let s:window = "5e5e5e"
	let s:line = "3a3a3a"
	let s:selection = "585858"
end

hi clear
syntax reset

let g:colors_name = "my-colors"

if has("gui_running") || &t_Co == 88 || &t_Co == 256
	" Returns an approximate grey index for the given grey level
	fun <SID>grey_number(x)
		if &t_Co == 88
			if a:x < 23
				return 0
			elseif a:x < 69
				return 1
			elseif a:x < 103
				return 2
			elseif a:x < 127
				return 3
			elseif a:x < 150
				return 4
			elseif a:x < 173
				return 5
			elseif a:x < 196
				return 6
			elseif a:x < 219
				return 7
			elseif a:x < 243
				return 8
			else
				return 9
			endif
		else
			if a:x < 14
				return 0
			else
				let l:n = (a:x - 8) / 10
				let l:m = (a:x - 8) % 10
				if l:m < 5
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual grey level represented by the grey index
	fun <SID>grey_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 46
			elseif a:n == 2
				return 92
			elseif a:n == 3
				return 115
			elseif a:n == 4
				return 139
			elseif a:n == 5
				return 162
			elseif a:n == 6
				return 185
			elseif a:n == 7
				return 208
			elseif a:n == 8
				return 231
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 8 + (a:n * 10)
			endif
		endif
	endfun

	" Returns the palette index for the given grey index
	fun <SID>grey_colour(n)
		if &t_Co == 88
			if a:n == 0
				return 16
			elseif a:n == 9
				return 79
			else
				return 79 + a:n
			endif
		else
			if a:n == 0
				return 16
			elseif a:n == 25
				return 231
			else
				return 231 + a:n
			endif
		endif
	endfun

	" Returns an approximate colour index for the given colour level
	fun <SID>rgb_number(x)
		if &t_Co == 88
			if a:x < 69
				return 0
			elseif a:x < 172
				return 1
			elseif a:x < 230
				return 2
			else
				return 3
			endif
		else
			if a:x < 75
				return 0
			else
				let l:n = (a:x - 55) / 40
				let l:m = (a:x - 55) % 40
				if l:m < 20
					return l:n
				else
					return l:n + 1
				endif
			endif
		endif
	endfun

	" Returns the actual colour level for the given colour index
	fun <SID>rgb_level(n)
		if &t_Co == 88
			if a:n == 0
				return 0
			elseif a:n == 1
				return 139
			elseif a:n == 2
				return 205
			else
				return 255
			endif
		else
			if a:n == 0
				return 0
			else
				return 55 + (a:n * 40)
			endif
		endif
	endfun

	" Returns the palette index for the given R/G/B colour indices
	fun <SID>rgb_colour(x, y, z)
		if &t_Co == 88
			return 16 + (a:x * 16) + (a:y * 4) + a:z
		else
			return 16 + (a:x * 36) + (a:y * 6) + a:z
		endif
	endfun

	" Returns the palette index to approximate the given R/G/B colour levels
	fun <SID>colour(r, g, b)
		" Get the closest grey
		let l:gx = <SID>grey_number(a:r)
		let l:gy = <SID>grey_number(a:g)
		let l:gz = <SID>grey_number(a:b)

		" Get the closest colour
		let l:x = <SID>rgb_number(a:r)
		let l:y = <SID>rgb_number(a:g)
		let l:z = <SID>rgb_number(a:b)

		if l:gx == l:gy && l:gy == l:gz
			" There are two possibilities
			let l:dgr = <SID>grey_level(l:gx) - a:r
			let l:dgg = <SID>grey_level(l:gy) - a:g
			let l:dgb = <SID>grey_level(l:gz) - a:b
			let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
			let l:dr = <SID>rgb_level(l:gx) - a:r
			let l:dg = <SID>rgb_level(l:gy) - a:g
			let l:db = <SID>rgb_level(l:gz) - a:b
			let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
			if l:dgrey < l:drgb
				" Use the grey
				return <SID>grey_colour(l:gx)
			else
				" Use the colour
				return <SID>rgb_colour(l:x, l:y, l:z)
			endif
		else
			" Only one possibility
			return <SID>rgb_colour(l:x, l:y, l:z)
		endif
	endfun

	" Returns the palette index to approximate the 'rrggbb' hex string
	fun <SID>rgb(rgb)
		let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
		let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
		let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0

		return <SID>colour(l:r, l:g, l:b)
	endfun

	" Sets the highlighting for the given group
	fun <SID>X(group, fg, bg, attr)
		if a:fg != ""
			exec "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
			echo "hi " . a:group . " guifg=#" . a:fg . " ctermfg=" . <SID>rgb(a:fg)
		endif
		if a:bg != ""
			exec "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
			echo "hi " . a:group . " guibg=#" . a:bg . " ctermbg=" . <SID>rgb(a:bg)
		endif
		if a:attr != ""
			exec "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
			echo "hi " . a:group . " gui=" . a:attr . " cterm=" . a:attr
		endif
	endfun

	" Vim Highlighting
	"call <SID>X("Error", "none", s:yellow, "none")
	call <SID>X("ErrorMsg", s:red, s:background, "")
	call <SID>X("Normal", s:foreground, s:background, "")
	call <SID>X("LineNr", s:selection, "", "")
	call <SID>X("NonText", s:selection, "", "")
	call <SID>X("SpecialKey", s:selection, "", "")
	call <SID>X("Search", s:background, s:yellow, "")
	call <SID>X("TabLine", s:window, s:foreground, "reverse")
	call <SID>X("TabLineFill", s:window, s:foreground, "reverse")
	call <SID>X("StatusLine", s:black, s:blue, "reverse")
	call <SID>X("StatusLineNC", s:window, s:foreground, "reverse")
	call <SID>X("VertSplit", s:window, s:window, "none")
	call <SID>X("Visual", "", s:selection, "")
	call <SID>X("Directory", s:blue, "", "")
	call <SID>X("ModeMsg", s:green, "", "")
	call <SID>X("MoreMsg", s:green, "", "")
	call <SID>X("Question", s:green, "", "")
	call <SID>X("WarningMsg", s:red, "", "")
	call <SID>X("MatchParen", "", s:selection, "")
	call <SID>X("Folded", s:comment, s:background, "")
	call <SID>X("FoldColumn", "", s:background, "")
	if version >= 700
		call <SID>X("CursorLine", "", s:line, "none")
		call <SID>X("CursorColumn", "", s:line, "none")
		call <SID>X("PMenu", s:foreground, s:selection, "none")
		call <SID>X("PMenuSel", s:foreground, s:selection, "reverse")
		call <SID>X("SignColumn", "", s:background, "none")
	end
	if version >= 703
		call <SID>X("ColorColumn", "", s:line, "none")
	end

	" Standard Highlighting
	call <SID>X("Comment", s:comment, "", "")
	call <SID>X("Todo", s:comment, s:background, "")
	call <SID>X("Title", s:comment, "", "")
	call <SID>X("Identifier", s:red, "", "none")
	call <SID>X("Statement", s:foreground, "", "")
	call <SID>X("Conditional", s:foreground, "", "")
	call <SID>X("Repeat", s:foreground, "", "")
	call <SID>X("Structure", s:purple, "", "")
	call <SID>X("Function", s:blue, "", "")
	call <SID>X("Constant", s:orange, "", "")
	call <SID>X("String", s:green, "", "")
	call <SID>X("Special", s:foreground, "", "")
	call <SID>X("PreProc", s:purple, "", "")
	call <SID>X("Operator", s:aqua, "", "none")
	call <SID>X("Type", s:blue, "", "none")
	call <SID>X("Define", s:purple, "", "none")
	call <SID>X("Include", s:blue, "", "")
	"call <SID>X("Ignore", "666666", "", "")

	" Vim Highlighting
	call <SID>X("vimCommand", s:red, "", "none")

	" C Highlighting
	call <SID>X("cType", s:yellow, "", "")
	call <SID>X("cStorageClass", s:purple, "", "")
	call <SID>X("cConditional", s:purple, "", "")
	call <SID>X("cRepeat", s:purple, "", "")

	" PHP Highlighting
	call <SID>X("phpClasses", s:identifiers, "", "")
	call <SID>X("phpConditional", s:purple, "", "")
	call <SID>X("phpConstants", s:constants, "", "")
	call <SID>X("phpFunctions", s:functions, "", "")
	call <SID>X("phpIdentifier", s:red, "", "")
	call <SID>X("phpInclude", s:red, "", "")
	call <SID>X("phpKeyword", s:purple, "", "")
	call <SID>X("phpMemberSelector", s:foreground, "", "")
	call <SID>X("phpMethodsVar", s:identifiers, "", "")
	call <SID>X("phpNumber", s:yellow, "", "")
	call <SID>X("phpOperator", s:operators, "", "")
	call <SID>X("phpParent", s:operators, "", "")
	call <SID>X("phpRegion", s:blue, "", "")
	call <SID>X("phpRepeat", s:purple, "", "")
	call <SID>X("phpSpecial", s:yellow, "", "")
	call <SID>X("phpStatement", s:purple, "", "")
	call <SID>X("phpStringSingle", s:stringSingle, "", "")
	call <SID>X("phpType", s:keywords, "", "")
	call <SID>X("phpVarSelector", s:orange, "", "")

	" Ruby Highlighting
	call <SID>X("rubySymbol", s:green, "", "")
	call <SID>X("rubyConstant", s:yellow, "", "")
	call <SID>X("rubyAccess", s:yellow, "", "")
	call <SID>X("rubyAttribute", s:blue, "", "")
	call <SID>X("rubyInclude", s:blue, "", "")
	call <SID>X("rubyLocalVariableOrMethod", s:orange, "", "")
	call <SID>X("rubyCurlyBlock", s:orange, "", "")
	call <SID>X("rubyStringDelimiter", s:green, "", "")
	call <SID>X("rubyInterpolationDelimiter", s:orange, "", "")
	call <SID>X("rubyConditional", s:purple, "", "")
	call <SID>X("rubyRepeat", s:purple, "", "")
	call <SID>X("rubyControl", s:purple, "", "")
	call <SID>X("rubyException", s:purple, "", "")

	" Python Highlighting
	call <SID>X("pythonBinNumber", s:yellow, "", "")
	call <SID>X("pythonBoolean", s:orange, "", "")
	call <SID>X("pythonConditional", s:orange, "", "")
	call <SID>X("pythonDot", s:red, "", "")
	call <SID>X("pythonExClass", s:orange, "", "")
	call <SID>X("pythonException", s:purple, "", "")
	call <SID>X("pythonFloat", s:yellow, "", "")
	call <SID>X("pythonFunction", s:purple, "", "")
	call <SID>X("pythonHexNumber", s:yellow, "", "")
	call <SID>X("pythonImport", s:red, "", "")
	call <SID>X("pythonNumber", s:yellow, "", "")
	call <SID>X("pythonOctNumber", s:yellow, "", "")
	call <SID>X("pythonPreCondit", s:red, "", "")
	call <SID>X("pythonRepeat", s:orange, "", "")
	call <SID>X("pythonStatement", s:identifiers, "", "")
	call <SID>X("pythonStrFormatting", s:keywords, "", "")
	call <SID>X("pythonBytesEscape", s:orange, "", "")

	" JavaScript Highlighting
	call <SID>X("jEffects", s:identifiers, "", "")
	call <SID>X("jEvents", s:identifiers, "", "")
	call <SID>X("jForms", s:keywords, "", "")
	call <SID>X("jFunc", s:purple, "", "")
	call <SID>X("jManipulation", s:identifiers, "", "")
	call <SID>X("jQuery", s:yellow, "", "")
	call <SID>X("javaScriptBoolean", s:red, "", "")
	call <SID>X("javaScriptBraces", s:red, "", "")
	call <SID>X("javaScriptConditional", s:purple, "", "")
	call <SID>X("javaScriptDOMObjects", s:keywords, "", "")
	call <SID>X("javaScriptEndColons", s:operators, "", "")
	call <SID>X("javaScriptExceptions", s:identifiers, "", "")
	call <SID>X("javaScriptFuncArg", s:orange, "", "")
	call <SID>X("javaScriptFuncDef", s:identifiers, "", "")
	call <SID>X("javaScriptFuncKeyword", s:purple, "", "")
	call <SID>X("javaScriptGlobalObjects", s:blue, "", "")
	call <SID>X("javaScriptIdentifier", s:keywords, "", "")
	call <SID>X("javaScriptMember", s:orange, "", "")
	call <SID>X("javaScriptNumber", s:yellow, "", "")
	call <SID>X("javaScriptOpSymbols", s:orange, "", "")
	call <SID>X("javaScriptOperator", s:yellow, "", "")
	call <SID>X("javaScriptParens", s:operators, "", "")
	call <SID>X("javaScriptRepeat", s:purple, "", "")
	call <SID>X("javaScriptStatement", s:purple, "", "")
	call <SID>X("javaScriptStringD", s:green, "", "")
	call <SID>X("javaScriptStringS", s:stringSingle, "", "")

	" HTML Highlighting
	call <SID>X("htmlTag", s:red, "", "")
	call <SID>X("htmlTagName", s:red, "", "")
	call <SID>X("htmlArg", s:red, "", "")
	call <SID>X("htmlScriptTag", s:red, "", "")

	" Diff Highlighting
	call <SID>X("diffAdded", s:green, "", "")
	call <SID>X("diffRemoved", s:red, "", "")

	" ShowMarks Highlighting
	call <SID>X("ShowMarksHLl", s:orange, s:background, "none")
	call <SID>X("ShowMarksHLo", s:purple, s:background, "none")
	call <SID>X("ShowMarksHLu", s:yellow, s:background, "none")
	call <SID>X("ShowMarksHLm", s:aqua, s:background, "none")

	" Cucumber Highlighting
	call <SID>X("cucumberGiven", s:blue, "", "")
	call <SID>X("cucumberGivenAnd", s:blue, "", "")

	" Go Highlighting
	call <SID>X("goDirective", s:red, "", "")
	call <SID>X("goDeclaration", s:purple, "", "")
	call <SID>X("goStatement", s:purple, "", "")
	call <SID>X("goConditional", s:purple, "", "")
	call <SID>X("goConstants", s:orange, "", "")
	call <SID>X("goTodo", s:yellow, "", "")
	call <SID>X("goDeclType", s:yellow, "", "")
	call <SID>X("goBuiltins", s:purple, "", "")
	call <SID>X("goOperator", s:blue, "", "")
	call <SID>X("goFormatSpecifier", s:keywords, "", "")
	call <SID>X("goRepeat", s:sky, "", "")
	call <SID>X("goEscapeC", s:orange, "", "")
	call <SID>X("goMethod", s:identifiers, "", "")
	call <SID>X("goFunction", s:constants, "", "")
	call <SID>X("goStructDef", s:functions, "", "")
	call <SID>X("goType", s:red, "", "")
	call <SID>X("goSignedInts", s:red, "", "")
	call <SID>X("goUnsignedInts", s:red, "", "")
	call <SID>X("goFloats", s:red, "", "")
	call <SID>X("goComplexes", s:red, "", "")
	call <SID>X("goString", s:green, "", "")

	" Lua Highlighting
	call <SID>X("luaStatement", s:purple, "", "")
	call <SID>X("luaRepeat", s:purple, "", "")
	call <SID>X("luaCondStart", s:purple, "", "")
	call <SID>X("luaCondElseif", s:purple, "", "")
	call <SID>X("luaCond", s:purple, "", "")
	call <SID>X("luaCondEnd", s:purple, "", "")

    " Shell
	call <SID>X("shCtrlSeq", s:red, "", "")
	call <SID>X("shConditional", s:sky, "", "")
	call <SID>X("shTestOpr", s:orange, "", "")
	call <SID>X("shStatement", s:purple, "", "")
	call <SID>X("shRedir", s:identifiers, "", "")
	call <SID>X("shSet", s:red, "", "")
	call <SID>X("shHereDoc", s:comment, "", "")
	call <SID>X("shCommandSub", s:red, "", "")
	call <SID>X("shRange", s:identifiers, "", "")

	" Delete Functions
	delf <SID>X
	delf <SID>rgb
	delf <SID>colour
	delf <SID>rgb_colour
	delf <SID>rgb_level
	delf <SID>rgb_number
	delf <SID>grey_colour
	delf <SID>grey_level
	delf <SID>grey_number
endif

set background=dark

" diff highlights
highlight DiffAdd ctermfg=255 ctermbg=022
highlight DiffDelete ctermfg=bg ctermbg=Red
highlight DiffChange ctermfg=255 ctermbg=024
highlight DiffText ctermfg=255 ctermbg=124
