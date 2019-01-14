"                        _                 _  __
"                       | |               | |/ _|
"   __ _  ___   ___   __| | __      _____ | | |_
"  / _` |/ _ \ / _ \ / _` | \ \ /\ / / _ \| |  _|
" | (_| | (_) | (_) | (_| |  \ V  V / (_) | | |
"  \__, |\___/ \___/ \__,_|   \_/\_/ \___/|_|_|
"   __/ |
"  |___/
"
"     :syntax less
"
" A Vim colorscheme pieced together by Steve Losh.
" Available at http://stevelosh.com/projects/badwolf/
"
" Supporting code -------------------------------------------------------------
" Preamble {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "goodwolf"

if !exists("g:badwolf_html_link_underline") " {{{
    let g:badwolf_html_link_underline = 1
endif " }}}

" }}}
" Palette {{{

let s:bwc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:bwc.plain = ['f8f6f2', 15]

" Pure and simple.
let s:bwc.snow = ['ffffff', 15]
let s:bwc.coal = ['000000', 16]

" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:bwc.brightgravel   = ['d9cec3', 252]
let s:bwc.lightgravel    = ['998f84', 245]
let s:bwc.gravel         = ['857f78', 243]
let s:bwc.mediumgravel   = ['666462', 241]
let s:bwc.deepgravel     = ['45413b', 238]
let s:bwc.deepergravel   = ['35322d', 236]
let s:bwc.darkgravel     = ['242321', 235]
let s:bwc.blackgravel    = ['1c1b1a', 233]
let s:bwc.blackestgravel = ['141413', 232]

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = ['fade3e', 221]

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = ['f4cf86', 222]

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = ['ff2c4b', 196]

" Another chewy accent, but use sparingly!
let s:bwc.saltwatertaffy = ['8cffba', 121]

" The star of the show comes straight from Made of Code.
"
" You should almost never use this.  It should be used for things that denote
" 'where the user is', which basically consists of:
"
" * The cursor
" * A REPL prompt
let s:bwc.tardis = ['0a9dff', 39]

" This one's from Mustang, not Florida!
let s:bwc.orange = ['ffa724', 214]

" A limier green from Getafe.
let s:bwc.lime = ['aeee00', 154]

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = ['ff9eb8', 211]

" Another play on the brown from Clouds Midnight.  I love that color.
let s:bwc.toffee = ['b88853', 137]

" Also based on that Clouds Midnight brown.
let s:bwc.coffee    = ['c7915b', 173]
let s:bwc.darkroast = ['88633f', 95]

" }}}
" Highlighting Function {{{
function! GoodWolfHL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg ctermfg=fg '
        else
            let c = get(s:bwc, a:fg)
            let histring .= 'guifg=#' . c[0] . ' ctermfg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg ctermbg=bg '
        else
            let c = get(s:bwc, a:1)
            let histring .= 'guibg=#' . c[0] . ' ctermbg=' . c[1] . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' cterm=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let c = get(s:bwc, a:3)
        let histring .= 'guisp=#' . c[0] . ' '
    endif

    execute histring
endfunction

" }}}
" Configuration Options {{{

if exists('g:badwolf_darkgutter') && g:badwolf_darkgutter
    let s:gutter = 'blackestgravel'
else
    let s:gutter = 'blackgravel'
endif

if exists('g:badwolf_tabline')
    if g:badwolf_tabline == 0
        let s:tabline = 'blackestgravel'
    elseif  g:badwolf_tabline == 1
        let s:tabline = 'blackgravel'
    elseif  g:badwolf_tabline == 2
        let s:tabline = 'darkgravel'
    elseif  g:badwolf_tabline == 3
        let s:tabline = 'deepgravel'
    else
        let s:tabline = 'blackestgravel'
    endif
else
    let s:tabline = 'blackgravel'
endif

" }}}

" Actual colorscheme ----------------------------------------------------------
" Vanilla Vim {{{

" General/UI {{{

" call GoodWolfHL('Normal', 'plain', 'blackgravel')
call GoodWolfHL('Normal', 'plain', 'blackestgravel')

call GoodWolfHL('Folded', 'mediumgravel', 'bg', 'none')

call GoodWolfHL('VertSplit', 'lightgravel', 'bg', 'none')

call GoodWolfHL('CursorLine',   '', 'darkgravel', 'none')
call GoodWolfHL('CursorColumn', '', 'darkgravel')
call GoodWolfHL('ColorColumn',  '', 'darkgravel')

call GoodWolfHL('TabLine', 'plain', s:tabline, 'none')
call GoodWolfHL('TabLineFill', 'plain', s:tabline, 'none')
call GoodWolfHL('TabLineSel', 'coal', 'tardis', 'none')

call GoodWolfHL('MatchParen', 'dalespale', 'darkgravel', 'bold')

call GoodWolfHL('NonText',    'deepgravel', 'bg')
call GoodWolfHL('SpecialKey', 'deepgravel', 'bg')

call GoodWolfHL('Visual',    '',  'deepgravel')
call GoodWolfHL('VisualNOS', '',  'deepgravel')

call GoodWolfHL('Search',    'coal', 'dalespale', 'bold')
call GoodWolfHL('IncSearch', 'coal', 'tardis',    'bold')

call GoodWolfHL('Underlined', 'fg', '', 'underline')

call GoodWolfHL('StatusLine',   'coal', 'tardis',     'bold')
call GoodWolfHL('StatusLineNC', 'snow', 'deepgravel', 'none')

call GoodWolfHL('Directory', 'dirtyblonde', '', 'bold')

call GoodWolfHL('Title', 'lime')

call GoodWolfHL('ErrorMsg',   'taffy',       'bg', 'bold')
call GoodWolfHL('MoreMsg',    'dalespale',   '',   'bold')
call GoodWolfHL('ModeMsg',    'dirtyblonde', '',   'bold')
call GoodWolfHL('Question',   'dirtyblonde', '',   'bold')
call GoodWolfHL('WarningMsg', 'dress',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call GoodWolfHL('Tag', '', '', 'bold')

" }}}
" Gutter {{{

call GoodWolfHL('LineNr',     'mediumgravel', s:gutter)
call GoodWolfHL('SignColumn', '',             s:gutter)
call GoodWolfHL('FoldColumn', 'mediumgravel', s:gutter)

" }}}
" Cursor {{{

call GoodWolfHL('Cursor',  'coal', 'tardis', 'bold')
call GoodWolfHL('vCursor', 'coal', 'tardis', 'bold')
call GoodWolfHL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call GoodWolfHL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call GoodWolfHL('Comment',        'gravel', 'bg', 'none')
call GoodWolfHL('Todo',           'snow',   'bg', 'bold')
call GoodWolfHL('SpecialComment', 'snow',   'bg', 'bold')

" Strings are highlighted separately.
call GoodWolfHL('String', 'lightgravel', '', 'bold')

" Turn off everything else
call GoodWolfHL('Statement',    'plain', '', 'none')
call GoodWolfHL('Keyword',      'plain', '', 'none')
call GoodWolfHL('Conditional',  'plain', '', 'none')
call GoodWolfHL('Operator',     'plain', '', 'none')
call GoodWolfHL('Label',        'plain', '', 'none')
call GoodWolfHL('Repeat',       'plain', '', 'none')
call GoodWolfHL('Identifier',   'plain', '', 'none')
call GoodWolfHL('Function',     'plain', '', 'none')
call GoodWolfHL('PreProc',      'plain', '', 'none')
call GoodWolfHL('Macro',        'plain', '', 'none')
call GoodWolfHL('Define',       'plain', '', 'none')
call GoodWolfHL('PreCondit',    'plain', '', 'none')
call GoodWolfHL('Constant',     'plain', '', 'none')
call GoodWolfHL('Character',    'plain', '', 'none')
call GoodWolfHL('Boolean',      'plain', '', 'none')
call GoodWolfHL('Number',       'plain', '', 'none')
call GoodWolfHL('Float',        'plain', '', 'none')
call GoodWolfHL('Type',         'plain', '', 'none')
call GoodWolfHL('StorageClass', 'plain', '', 'none')
call GoodWolfHL('Structure',    'plain', '', 'none')
call GoodWolfHL('Typedef',      'plain', '', 'none')
call GoodWolfHL('Exception',    'plain', '', 'none')

" Not sure what 'special character in a constant' means, but let's make it pop.
call GoodWolfHL('SpecialChar', 'plain', '', 'bold')

" Misc
call GoodWolfHL('Error',  'snow',   'taffy', 'bold')
call GoodWolfHL('Debug',  'snow',   '',      'bold')
call GoodWolfHL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call GoodWolfHL('Pmenu', 'plain', 'deepergravel')
call GoodWolfHL('PmenuSel', 'coal', 'tardis', 'bold')
call GoodWolfHL('PmenuSbar', '', 'deepergravel')
call GoodWolfHL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call GoodWolfHL('DiffDelete', 'coal', 'coal')
call GoodWolfHL('DiffAdd',    '',     'deepergravel')
call GoodWolfHL('DiffChange', '',     'darkgravel')
call GoodWolfHL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call GoodWolfHL('SpellCap', 'dalespale', 'bg', 'undercurl,bold', 'dalespale')
    call GoodWolfHL('SpellBad', '', 'bg', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call GoodWolfHL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}
" Status Line Utils {{{

call GoodWolfHL('GWStatusLineMode', 'coal', 'lime')
call GoodWolfHL('GWStatusLineModeX', 'lime', 'deepergravel')


" }}}

" }}}
" Plugins {{{

" Clam {{{

" hg status
call GoodWolfHL('clamHgStatusAdded',    'lime', '', 'none')
call GoodWolfHL('clamHgStatusModified', 'saltwatertaffy', '', 'none')
call GoodWolfHL('clamHgStatusRemoved',  'toffee', '', 'none')
call GoodWolfHL('clamHgStatusUnknown',  'taffy', '', 'bold')

" }}}
" CtrlP {{{

" the message when no match is found
call GoodWolfHL('CtrlPNoEntries', 'snow', 'taffy', 'bold')

" the matched pattern
call GoodWolfHL('CtrlPMatch', 'dress', 'bg', 'bold')

" the line prefix '>' in the match window
call GoodWolfHL('CtrlPLinePre', 'deepgravel', 'bg', 'none')

" the prompt’s base
call GoodWolfHL('CtrlPPrtBase', 'deepgravel', 'bg', 'none')

" the prompt’s text
call GoodWolfHL('CtrlPPrtText', 'plain', 'bg', 'none')

" the prompt’s cursor when moving over the text
call GoodWolfHL('CtrlPPrtCursor', 'coal', 'tardis', 'bold')

" 'prt' or 'win', also for 'regex'
call GoodWolfHL('CtrlPMode1', 'coal', 'tardis', 'bold')

" 'file' or 'path', also for the local working dir
call GoodWolfHL('CtrlPMode2', 'coal', 'tardis', 'bold')

" the scanning status
call GoodWolfHL('CtrlPStats', 'coal', 'tardis', 'bold')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call GoodWolfHL('InterestingWord1', 'coal', 'orange')
call GoodWolfHL('InterestingWord2', 'coal', 'lime')
call GoodWolfHL('InterestingWord3', 'coal', 'saltwatertaffy')
call GoodWolfHL('InterestingWord4', 'coal', 'toffee')
call GoodWolfHL('InterestingWord5', 'coal', 'dress')
call GoodWolfHL('InterestingWord6', 'coal', 'taffy')

" }}}
" Rainbow Parentheses {{{

call GoodWolfHL('level1c',  'mediumgravel', '', 'bold')

" }}}
" Fugitive {{{

call GoodWolfHL('fugitiveHeading', 'dress', 'bg', 'bold')
call GoodWolfHL('fugitiveHeader', 'dress', 'bg', 'bold')
call GoodWolfHL('fugitiveCount', 'plain', 'bg', 'bold')
call GoodWolfHL('fugitiveSymbolicRef', 'dirtyblonde', 'bg', 'none')
call GoodWolfHL('fugitiveModifier', 'dirtyblonde', 'bg', 'bold')

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call GoodWolfHL('clojureParen0', 'lightgravel', '', 'none')
call GoodWolfHL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" CSS {{{

call GoodWolfHL('cssBraces', 'lightgravel', '', 'none')

" }}}
" Diff {{{

call GoodWolfHL('gitDiff', 'lightgravel', '',)

call GoodWolfHL('diffRemoved', 'dress', '',)
call GoodWolfHL('diffAdded', 'lime', '',)
call GoodWolfHL('diffFile', 'coal', 'toffee', 'bold')
call GoodWolfHL('diffNewFile', 'coal', 'toffee', 'bold')

call GoodWolfHL('diffLine', 'coal', 'orange', 'bold')
call GoodWolfHL('diffSubname', 'orange', '', 'none')

" }}}
" HTML {{{

" Punctuation
call GoodWolfHL('htmlTag',    'darkroast', 'bg', 'none')
call GoodWolfHL('htmlEndTag', 'darkroast', 'bg', 'none')

" Tag names
call GoodWolfHL('htmlTagName',        'coffee', '', 'bold')
call GoodWolfHL('htmlSpecialTagName', 'coffee', '', 'bold')
call GoodWolfHL('htmlSpecialChar',    'lime',   '', 'none')

" Attributes
call GoodWolfHL('htmlArg', 'coffee', '', 'none')

" Stuff inside an <a> tag

if g:badwolf_html_link_underline
    call GoodWolfHL('htmlLink', 'lightgravel', '', 'underline')
else
    call GoodWolfHL('htmlLink', 'lightgravel', '', 'none')
endif

" }}}
" Java {{{

call GoodWolfHL('javaCommentTitle', 'gravel', '')
call GoodWolfHL('javaDocTags', 'snow', '', 'none')
call GoodWolfHL('javaDocParam', 'plain', '', '')

" }}}
" LaTeX {{{

call GoodWolfHL('texStatement', 'dress', '', 'none')
call GoodWolfHL('texDocType', 'dress', '', 'none')
call GoodWolfHL('texSection', 'dress', '', 'none')
call GoodWolfHL('texBeginEnd', 'dress', '', 'none')

call GoodWolfHL('texMathZoneX', 'orange', '', 'none')
call GoodWolfHL('texMathZoneA', 'orange', '', 'none')
call GoodWolfHL('texMathZoneB', 'orange', '', 'none')
call GoodWolfHL('texMathZoneC', 'orange', '', 'none')
call GoodWolfHL('texMathZoneD', 'orange', '', 'none')
call GoodWolfHL('texMathZoneE', 'orange', '', 'none')
call GoodWolfHL('texMathZoneV', 'orange', '', 'none')
call GoodWolfHL('texMathZoneX', 'orange', '', 'none')
call GoodWolfHL('texMath', 'orange', '', 'none')
call GoodWolfHL('texMathMatcher', 'orange', '', 'none')
call GoodWolfHL('texRefLabel', 'dirtyblonde', '', 'none')
call GoodWolfHL('texRefZone', 'lime', '', 'none')
call GoodWolfHL('texDelimiter', 'orange', '', 'none')
call GoodWolfHL('texZone', 'brightgravel', '', 'none')

augroup badwolf_tex
    au!

    au BufRead,BufNewFile *.tex syn region texMathZoneV start="\\(" end="\\)\|%stopzone\>" keepend contains=@texMathZoneGroup
    au BufRead,BufNewFile *.tex syn region texMathZoneX start="\$" skip="\\\\\|\\\$" end="\$\|%stopzone\>" keepend contains=@texMathZoneGroup
augroup END

" }}}
" REPLs {{{
" This isn't a specific plugin, but just useful highlight classes for anything
" that might want to use them.

call GoodWolfHL('replPrompt', 'tardis', '', 'bold')

" }}}
" Mail {{{

call GoodWolfHL('mailSubject', 'orange', '', 'bold')
call GoodWolfHL('mailHeader', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderKey', 'lightgravel', '', '')
call GoodWolfHL('mailHeaderEmail', 'snow', '', '')
call GoodWolfHL('mailURL', 'toffee', '', 'underline')
call GoodWolfHL('mailSignature', 'gravel', '', 'none')

call GoodWolfHL('mailQuoted1', 'gravel', '', 'none')
call GoodWolfHL('mailQuoted2', 'dress', '', 'none')
call GoodWolfHL('mailQuoted3', 'dirtyblonde', '', 'none')
call GoodWolfHL('mailQuoted4', 'orange', '', 'none')
call GoodWolfHL('mailQuoted5', 'lime', '', 'none')

" }}}
" Markdown {{{

call GoodWolfHL('markdownHeadingRule', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownListMarker', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownItalic', 'snow', '', 'bold')
call GoodWolfHL('markdownBold', 'snow', '', 'bold')
call GoodWolfHL('markdownH1', 'orange', '', 'bold')
call GoodWolfHL('markdownH2', 'lime', '', 'bold')
call GoodWolfHL('markdownH3', 'lime', '', 'none')
call GoodWolfHL('markdownH4', 'lime', '', 'none')
call GoodWolfHL('markdownH5', 'lime', '', 'none')
call GoodWolfHL('markdownH6', 'lime', '', 'none')
call GoodWolfHL('markdownLinkText', 'toffee', '', 'underline')
call GoodWolfHL('markdownIdDeclaration', 'toffee')
call GoodWolfHL('markdownAutomaticLink', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrl', 'toffee', '', 'bold')
call GoodWolfHL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call GoodWolfHL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call GoodWolfHL('markdownCode', 'dirtyblonde', '', 'none')
call GoodWolfHL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call GoodWolfHL('pythonBuiltin',     'plain')
call GoodWolfHL('pythonBuiltinObj',  'plain')
call GoodWolfHL('pythonBuiltinFunc', 'plain')
call GoodWolfHL('pythonEscape',      'plain')
call GoodWolfHL('pythonException',   'plain', '', 'none')
call GoodWolfHL('pythonExceptions',  'plain', '', 'none')
call GoodWolfHL('pythonPrecondit',   'plain', '', 'none')
call GoodWolfHL('pythonDecorator',   'plain', '', 'none')
call GoodWolfHL('pythonRun',         'plain', '', 'none')
call GoodWolfHL('pythonCoding',      'plain', '', 'bold')

" }}}
" Scala {{{

call GoodWolfHL('scalaParameterAnnotation', 'gravel', '', 'bold')
call GoodWolfHL('scalaParamAnnotationValue', 'gravel', '', 'bold')
call GoodWolfHL('scalaCommentAnnotation', 'gravel', '', 'bold')
call GoodWolfHL('scalaDocLinks', 'gravel', '', 'bold')

" }}}
" Vim {{{

call GoodWolfHL('helpHyperTextJump', 'dress', '', 'none')

" }}}

" }}}


