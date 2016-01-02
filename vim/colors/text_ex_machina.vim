"
" Text Ex Machina
" ===================
"
" author:   Alex Suraci <i.am@toogeneric.com>
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "text_ex_machina"

" Default Colors
hi Normal       guifg=#E6E6E6   guibg=#151515  ctermfg=7  ctermbg=0
hi NonText      guifg=#3B3A32                  
hi Cursor       guibg=#F8F8F0                  ctermbg=15
hi lCursor      guibg=#F8F8F0                  ctermbg=15
hi MatchParen   guibg=#303030

" Search
hi Search	    guifg=#800000   guibg=#ffae00
hi IncSearch    guifg=#800000   guibg=#ffae00

" Window Elements
hi StatusLine   guifg=#909090   guibg=#121212                          cterm=none
hi StatusLineNC guifg=#121212   guibg=#303030
hi VertSplit    guifg=#131313   guibg=#131313   ctermfg=0  ctermbg=0   cterm=none
hi Folded       guifg=#111111   guibg=#8090a0
hi IncSearch	guifg=#708090   guibg=#f0e68c
hi Pmenu        guifg=#E6E6E6   guibg=#cb2f27
hi SignColumn   guibg=#111111
hi CursorLine   guibg=#181818                                          cterm=none
hi LineNr       guifg=#303030   guibg=#121212

" Specials
hi Todo         guifg=#e50808   guibg=#520000   ctermfg=9  ctermbg=1
hi Title        guifg=#E6E6E6                   ctermfg=7
hi Special      guifg=#E6E6E6                   ctermfg=7

" Syntax Elements
hi String       guifg=#66CCFF                   ctermfg=6
hi Constant     guifg=#AE81FF                   ctermfg=5
hi Number       guifg=#AE81FF                   ctermfg=5
hi Statement    guifg=#636697                   ctermfg=12
hi Function     guifg=#B1F36F                   ctermfg=2
hi PreProc      guifg=#636697                   ctermfg=12
hi Comment      guifg=#333333                   ctermfg=8
hi Type         guifg=#303364                   ctermfg=4
hi Error        guifg=#ffffff   guibg=#ab0000   ctermfg=15  ctermbg=1
hi Identifier   guifg=#E6E6E6                   ctermfg=7
hi Label        guifg=#ff0086                   ctermfg=9
hi Structure    guifg=#636697                   ctermfg=12

hi phpComparison        guifg=#636697           ctermfg=12
hi phpVarSelector       guifg=#E6E6E6           ctermfg=7
hi phpSpecialFunction   guifg=#B1F36F           ctermfg=2
hi phpType              guifg=#B1F36F           ctermfg=2
"hi phpArray             guifg=#B1F36F
hi phpMemberSelector    guifg=#636697           ctermfg=12
hi phpIdentifierConst   guifg=#ff0000           ctermfg=1
hi phpDefineFuncName    guifg=#CCFF66           ctermfg=2
hi phpDefineMethodName  guifg=#CCFF66           ctermfg=2

" Python Highlighting for python.vim
hi pythonCoding guifg=#ff0086
hi pythonRun    guifg=#ff0086
hi pythonBuiltinObj     guifg=#2b6ba2           gui=bold
hi pythonBuiltinFunc    guifg=#2b6ba2           gui=bold
hi pythonException      guifg=#ee0000           gui=bold
hi pythonExClass        guifg=#66cd66           gui=bold
hi pythonSpaceError     guibg=#270000
hi pythonDocTest    guifg=#2f5f49
hi pythonDocTest2   guifg=#3b916a
hi pythonFunction   guifg=#ee0000               gui=bold
hi pythonClass      guifg=#ff0086               gui=bold

" JavaScript Highlighting
hi javaScript                guifg=#E6E6E6               ctermfg=7
hi javaScriptRegexpString    guifg=#aa6600               ctermfg=1
hi javaScriptDocComment      guifg=#aaaaaa               ctermfg=8
hi javaScriptCssStyles       guifg=#dd7700               
hi javaScriptDomElemFuncs    guifg=#66cd66
hi javaScriptHtmlElemFuncs   guifg=#dd7700
hi javaScriptLabel           guifg=#00bdec   gui=italic
hi javaScriptPrototype       guifg=#00bdec
hi javaScriptConditional     guifg=#636697   gui=bold    ctermfg=12
hi javaScriptRepeat          guifg=#ff0007   gui=bold
hi javaScriptFunction        guifg=#636697   gui=bold    ctermfg=12
hi javaScriptBraces          guifg=#E6E6E6
hi javaScriptNumber          guifg=#AE81FF

" CSS Highlighting
hi cssBraces                guifg=#ffffff               ctermfg=15
hi cssTagName               guifg=#303364               ctermfg=4
hi cssClassName             guifg=#636697               ctermfg=12
hi cssIdentifier            guifg=#636697               ctermfg=12
hi cssBoxProp               guifg=#3FE200               ctermfg=7
hi cssColorProp             guifg=#3FE200               ctermfg=7
hi cssTextProp              guifg=#3FE200               ctermfg=7
hi cssFontProp              guifg=#3FE200               ctermfg=7
hi cssRenderProp            guifg=#3FE200               ctermfg=7
hi cssBoxAttr               guifg=#ffffff               ctermfg=2
hi cssRenderAttr            guifg=#ffffff               ctermfg=2
hi cssCommonAttr            guifg=#ffffff               ctermfg=2
hi cssUIAttr                guifg=#ffffff               ctermfg=2
hi cssColorAttr             guifg=#ffffff               ctermfg=2
hi cssTextAttr              guifg=#ffffff               ctermfg=2
hi cssFontAttr              guifg=#ffffff               ctermfg=2
hi cssImportant             guifg=#520000               ctermfg=1

" Ruby Highlighting
hi rubyFunction     guifg=#0066bb               gui=bold
hi rubyClass        guifg=#ff0086               gui=bold
hi rubyModule       guifg=#ff0086               gui=bold,underline
hi rubyKeyword      guifg=#008800               gui=bold
hi rubySymbol       guifg=#aa6600
hi rubyIndentifier              guifg=#008aff
hi rubyGlobalVariable           guifg=#dd7700
hi rubyConstant                 guifg=#5894d2   gui=bold
hi rubyBlockParameter           guifg=#66cd66
hi rubyPredefinedIdentifier     guifg=#555555   gui=bold
hi rubyString           guifg=#0086d2
hi rubyStringDelimiter  guifg=#dd7700
hi rubySpaceError       guibg=#270000
hi rubyDocumentation    guifg=#aaaaaa
hi rubyData             guifg=#555555

" XML Highlighting
hi xmlTag           guifg=#E6E6E6                   ctermfg=7
hi xmlTagName       guifg=#303364                   ctermfg=4
hi xmlEndTag        guifg=#303364                   ctermfg=4
hi xmlNamespace     guifg=#00bdec                   gui=underline
hi xmlAttribPunct   guifg=#cccaa9                   gui=bold
hi xmlEqual         guifg=#cccaa9                   gui=bold
hi xmlCdata         guifg=#bf0945                   gui=bold
hi xmlCdataCdata	guifg=#ac1446   guibg=#23010c   gui=none
hi xmlCdataStart	guifg=#bf0945                   gui=bold
hi xmlCdataEnd		guifg=#bf0945                   gui=bold

" HTML Highlighting
hi htmlTag              guifg=#E6E6E6               ctermfg=7
hi htmlEndTag           guifg=#E6E6E6               ctermfg=7
hi htmlArg              guifg=#636697               ctermfg=12
hi htmlSpecialTagName   guifg=#303364               ctermfg=4
hi htmlSpecialChar      guifg=#ae81ff
hi htmlTagName          guifg=#303364               ctermfg=4
hi htmlTagN             guifg=#66cd66
hi htmlEvent            guifg=#E6E6E6               ctermfg=7
hi htmlLink             guifg=#E6E6E6               ctermfg=7

" Django Highlighting
hi djangoTagBlock   guifg=#ff0007   guibg=#200000   gui=bold
hi djangoVarBlock   guifg=#ff0007   guibg=#200000
hi djangoArgument   guifg=#0086d2   guibg=#200000
hi djangoStatement  guifg=#fb660a   guibg=#200000   gui=bold
hi djangoComment    guifg=#008800   guibg=#002300   gui=italic
hi djangoFilter     guifg=#ff0086   guibg=#200000   gui=italic

" Jinja Highlighting
hi jinjaTagBlock    guifg=#ff0007   guibg=#200000   gui=bold
hi jinjaVarBlock    guifg=#ff0007   guibg=#200000
hi jinjaString      guifg=#0086d2   guibg=#200000
hi jinjaNumber      guifg=#bf0945   guibg=#200000   gui=bold
hi jinjaStatement   guifg=#fb660a   guibg=#200000   gui=bold
hi jinjaComment     guifg=#008800   guibg=#002300   gui=italic
hi jinjaFilter      guifg=#ff0086   guibg=#200000
hi jinjaRaw         guifg=#aaaaaa   guibg=#200000
hi jinjaOperator    guifg=#E6E6E6   guibg=#200000
hi jinjaVariable    guifg=#92cd35   guibg=#200000
hi jinjaAttribute   guifg=#dd7700   guibg=#200000
hi jinjaSpecial     guifg=#008ffd   guibg=#200000

" Twig Highlighting
hi twigTagBlock    guifg=#E6E6E6   guibg=#101010   ctermfg=7
hi twigVarBlock    guifg=#E6E6E6   guibg=#101010   ctermfg=7
hi twigString      guifg=#66CCFF   guibg=#101010   ctermfg=6
hi twigNumber      guifg=#AE81FF   guibg=#101010   ctermfg=5
hi twigStatement   guifg=#636697   guibg=#101010   ctermfg=12
hi twigComment     guifg=#333333   guibg=#101010   ctermfg=8
hi twigFilter      guifg=#B1F36F   guibg=#101010   ctermfg=2
hi twigRaw         guifg=#aaaaaa   guibg=#101010   ctermfg=7
hi twigOperator    guifg=#E6E6E6   guibg=#101010   ctermfg=7
hi twigVariable    guifg=#B1F36F   guibg=#101010   ctermfg=2
hi twigAttribute   guifg=#ae81ff   guibg=#101010   ctermfg=7
hi twigSpecial     guifg=#008ffd   guibg=#101010   ctermfg=7

" ERuby Highlighting (for my eruby.vim)
hi erubyRubyDelim   guifg=#2c8a16                   gui=bold
hi erubyComment     guifg=#4d9b3a                   gui=italic

" Diff
hi diffRemoved      guifg=#F94040  ctermfg=9
hi diffAdded        guifg=#79FE68  ctermfg=2
