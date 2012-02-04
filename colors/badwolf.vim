"      _               _                 _  __
"     | |__   __ _  __| | __      _____ | |/ _|
"     | '_ \ / _` |/ _` | \ \ /\ / / _ \| | |_
"     | |_) | (_| | (_| |  \ V  V / (_) | |  _|
"     |_.__/ \__,_|\__,_|   \_/\_/ \___/|_|_|
"
"      I am the Bad Wolf. I create myself.
"       I take the words. I scatter them in time and space.
"        A message to lead myself here.
"
" A Vim colorscheme pieced together by Steve Losh.
" Available at http://stevelosh.com/projects/badwolf/
"
" Why? {{{
"
" After using Molokai for quite a long time, I started longing for
" a replacement.
"
" I love Molokai's high contrast and gooey, saturated tones, but it can be
" a little inconsistent at times.
"
" Also it's winter here in Rochester, so I wanted a color scheme that's a bit
" warmer.  A little less blue and a bit more red.
"
" And so Bad Wolf was born.  I'm no designer, but designers have been scattering
" beautiful colors through time and space long before I came along.  I took
" advantage of that and reused some of my favorites to lead me to this scheme.
"
" }}}

" Supporting code -------------------------------------------------------------

" Preamble {{{

set background=dark

" hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "badwolf"

" }}}
" Palette {{{

let s:bwc = {}

" The most basic of all our colors is a slightly tweaked version of the Molokai
" Normal text.
let s:bwc.plain = 'f8f6f2'

" Pure and simple.
let s:bwc.snow = 'ffffff'
let s:bwc.coal = '000000'

" All of the Gravel colors are based on a brown from Clouds Midnight.
let s:bwc.brightgravel = 'd9cec3'
let s:bwc.lightgravel  = '998f84'
let s:bwc.gravel       = '857f78'
let s:bwc.mediumgravel = '666462'
let s:bwc.deepgravel   = '45413b'
let s:bwc.deepergravel = '35322d'
let s:bwc.darkgravel   = '242321'
let s:bwc.blackgravel  = '1c1b1a'

" A color sampled from a highlight in a photo of a glass of Dale's Pale Ale on
" my desk.
let s:bwc.dalespale = 'fade3e'

" A beautiful tan from Tomorrow Night.
let s:bwc.dirtyblonde = 'f4cf86'

" Delicious, chewy red from Made of Code for the poppiest highlights.
let s:bwc.taffy = 'ff2c4b'

" The star of the show comes straight from Made of Code.
let s:bwc.tardis = '0a9dff'

" This one's from Mustang, not Florida!
let s:bwc.orange = 'ffa724'

" A limier version of Mustang's horsefood, to ward off scurvy.
" It actually turned out pretty close to Molokai's green.  Huh.
let s:bwc.lime = 'a1e022'

" Rose's dress in The Idiot's Lantern.
let s:bwc.dress = 'ff99b3'

" Saturated gravel (originally from Clouds Midnight).
let s:bwc.mud = 'ff6b40'
let s:bwc.mud = 'b88853'

" }}}
" Highlighting Function {{{
function! HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    let histring = 'hi ' . a:group . ' '

    if strlen(a:fg)
        if a:fg == 'fg'
            let histring .= 'guifg=fg '
        else
            let histring .= 'guifg=#' . get(s:bwc, a:fg, '') . ' '
        endif
    endif

    if a:0 >= 1 && strlen(a:1)
        if a:1 == 'bg'
            let histring .= 'guibg=bg '
        else
            let histring .= 'guibg=#' . get(s:bwc, a:1, '') . ' '
        endif
    endif

    if a:0 >= 2 && strlen(a:2)
        let histring .= 'gui=' . a:2 . ' '
    endif

    if a:0 >= 3 && strlen(a:3)
        let histring .= 'guisp=#' . get(s:bwc, a:3, '') . ' '
    endif

    " echom histring

    execute histring
endfunction
" }}}

" Actual colorscheme ----------------------------------------------------------

" Vanilla Vim {{{

" General/UI {{{

call HL('Normal', 'plain', 'blackgravel')

call HL('LineNr', 'mediumgravel', 'bg')
call HL('Folded', 'mediumgravel', 'bg', 'none')

call HL('VertSplit', 'lightgravel', 'bg', 'none')

call HL('CursorLine',   '', 'darkgravel')
call HL('CursorColumn', '', 'darkgravel')
call HL('ColorColumn',  '', 'darkgravel')

call HL('MatchParen', 'dalespale', 'bg', 'bold')

call HL('NonText',    'deepgravel', 'bg')
call HL('SpecialKey', 'deepgravel', 'bg')

call HL('Visual',    '',  'deepgravel')
call HL('VisualNOS', '',  'deepgravel')

call HL('Search',    'coal', 'dalespale', 'bold')
call HL('IncSearch', 'coal', 'tardis',    'bold')

call HL('SignColumn', '', 'blackgravel')
call HL('FoldColumn', 'mediumgravel', 'blackgravel')

call HL('Underlined', 'fg', '', 'underline')

call HL('StatusLine',   'coal', 'tardis',     'bold')
call HL('StatusLineNC', 'snow', 'deepgravel', 'bold')

call HL('Directory', 'dirtyblonde', '', 'bold')

call HL('Title', 'lime')

call HL('ErrorMsg',   'taffy',       'bg', 'bold')
call HL('MoreMsg',    'dalespale',   '',   'bold')
call HL('ModeMsg',    'dirtyblonde', '',   'bold')
call HL('Question',   'dirtyblonde', '',   'bold')
call HL('WarningMsg', 'dress',       '',   'bold')

" This is a ctags tag, not an HTML one.  'Something you can use c-] on'.
call HL('Tag', '', '', 'bold')

" hi IndentGuides                  guibg=#373737
" hi WildMenu        guifg=#66D9EF guibg=#000000

" }}}
" Cursor {{{

call HL('Cursor',  'coal', 'tardis', 'bold')
call HL('vCursor', 'coal', 'tardis', 'bold')
call HL('iCursor', 'coal', 'tardis', 'none')

" }}}
" Syntax highlighting {{{

" Start with a simple base.
call HL('Special', 'plain')

" Comments are slightly brighter than folds, to make 'headers' easier to see.
call HL('Comment',        'gravel')
call HL('Todo',           'snow', 'bg', 'bold')
call HL('SpecialComment', 'snow', 'bg', 'bold')

" Strings are a nice, pale straw color.  Nothing too fancy.
call HL('String', 'dirtyblonde')

" Control flow stuff is taffy.
call HL('Statement',   'taffy', '', 'bold')
call HL('Keyword',     'taffy', '', 'bold')
call HL('Conditional', 'taffy', '', 'bold')
call HL('Operator',    'taffy', '', 'none')
call HL('Label',       'taffy', '', 'none')
call HL('Repeat',      'taffy', '', 'none')

" Functions and variable declarations are orange, because plain looks weird.
call HL('Identifier', 'orange', '', 'none')
call HL('Function',   'orange', '', 'none')

" Preprocessor stuff is lime, to make it pop.
"
" This includes imports in any given language, because they should usually be
" grouped together at the beginning of a file.  If they're in the middle of some
" other code they should stand out, because something tricky is
" probably going on.
call HL('PreProc',   'lime', '', 'none')
call HL('Macro',     'lime', '', 'none')
call HL('Define',    'lime', '', 'none')
call HL('PreCondit', 'lime', '', 'bold')

" Constants of all kinds are colored together.
" I'm not really happy with the color yet...
call HL('Constant',  'mud', '', 'bold')
call HL('Character', 'mud', '', 'bold')
call HL('Boolean',   'mud', '', 'bold')

call HL('Number', 'mud', '', 'bold')
call HL('Float',  'mud', '', 'bold')

" Not sure what 'special character in a constant' means, but let's make it pop.
call HL('SpecialChar', 'dress', '', 'bold')

call HL('Type', 'dress', '', 'none')
call HL('StorageClass', 'taffy', '', 'none')
call HL('Structure', 'taffy', '', 'none')
call HL('Typedef', 'taffy', '', 'bold')

" Make try/catch blocks stand out.
call HL('Exception', 'lime', '', 'bold')

" Misc
call HL('Error',  'snow',   'taffy', 'bold')
call HL('Debug',  'snow',   '',      'bold')
call HL('Ignore', 'gravel', '',      '')

" }}}
" Completion Menu {{{

call HL('Pmenu', 'plain', 'deepergravel')
call HL('PmenuSel', 'coal', 'tardis', 'bold')
call HL('PmenuSbar', '', 'deepergravel')
call HL('PmenuThumb', 'brightgravel')

" }}}
" Diffs {{{

call HL('DiffDelete', 'coal', 'dress')
call HL('DiffAdd',    'coal', 'lime')
call HL('DiffChange', '',     'darkgravel')
call HL('DiffText',   'snow', 'deepergravel', 'bold')

" }}}
" Spelling {{{

if has("spell")
    call HL('SpellCap', 'dalespale', '', 'undercurl,bold', 'dalespale')
    call HL('SpellBad', '', '', 'undercurl', 'dalespale')
    call HL('SpellLocal', '', '', 'undercurl', 'dalespale')
    call HL('SpellRare', '', '', 'undercurl', 'dalespale')
endif

" }}}

" }}}
" Plugins {{{

" EasyMotion {{{

call HL('EasyMotionTarget', 'tardis',     'bg', 'bold')
call HL('EasyMotionShade',  'deepgravel', 'bg')

" }}}
" Interesting Words {{{

" These are only used if you're me or have copied the <leader>hNUM mappings
" from my Vimrc.
call HL('InterestingWord1', 'coal', 'orange')
call HL('InterestingWord2', 'coal', 'lime')
call HL('InterestingWord3', 'coal', 'taffy')

" }}}
" Makegreen {{{

" hi GreenBar term=reverse ctermfg=white ctermbg=green guifg=coal guibg=#9edf1c
" hi RedBar   term=reverse ctermfg=white ctermbg=red guifg=white guibg=#C50048

" }}}

" }}}
" Filetype-specific {{{

" Clojure {{{

call HL('clojureSpecial', 'taffy', '', '')
call HL('clojureDefn',    'taffy', '', '')
call HL('clojureDefine',  'taffy', '', '')
call HL('clojureMacro',   'taffy', '', '')
call HL('clojureCond',    'taffy', '', '')

call HL('clojureKeyword', 'orange', '', 'none')

call HL('clojureFunc',   'dress', '', 'none')
call HL('clojureRepeat', 'dress', '', 'none')

call HL('clojureParen0', 'lightgravel', '', 'none')

call HL('clojureAnonArg', 'snow', '', 'bold')

" }}}
" CSS {{{

call HL('cssColorProp', 'fg', '', 'none')
call HL('cssBoxProp', 'fg', '', 'none')
call HL('cssTextProp', 'fg', '', 'none')
call HL('cssRenderProp', 'fg', '', 'none')
call HL('cssGeneratedContentProp', 'fg', '', 'none')

call HL('cssValueLength', 'mud', '', 'bold')
call HL('cssColor', 'mud', '', 'bold')
call HL('cssBraces', 'lightgravel', '', 'none')
call HL('cssIdentifier', 'orange', '', 'bold')
call HL('cssClassName', 'orange', '', 'none')

" }}}
" Django Templates {{{

call HL('djangoArgument', 'dirtyblonde', '',)
call HL('djangoTagBlock', 'lime', '')
" hi djangoStatement guifg=#ff3853 gui=bold
" hi djangoVarBlock guifg=#f4cf86

" }}}
" HTML {{{

call HL('htmlTagName', 'taffy', '', 'bold')
call HL('htmlLink', 'lightgravel', '', 'underline')
" hi htmlTag guifg=#947b5b
" hi htmlTagName guifg=#ff3853 gui=bold
" hi htmlArg guifg=#c0a7c7
" hi htmlString guifg=#e6db74

" }}}
" Java {{{

call HL('javaClassDecl', 'taffy', '', 'bold')
call HL('javaScopeDecl', 'taffy', '', 'bold')
call HL('javaCommentTitle', 'gravel', '')
call HL('javaDocTags', 'snow', '', 'none')
call HL('javaDocParam', 'dalespale', '', '')

" }}}
" LessCSS {{{

call HL('lessVariable', 'lime', '', 'none')

" }}}
" Markdown {{{

call HL('markdownHeadingRule', 'lightgravel', '', 'bold')
call HL('markdownHeadingDelimiter', 'lightgravel', '', 'bold')
call HL('markdownOrderedListMarker', 'lightgravel', '', 'bold')
call HL('markdownListMarker', 'lightgravel', '', 'bold')
call HL('markdownH1', 'orange', '', 'bold')
call HL('markdownH2', 'lime', '', 'bold')
call HL('markdownH3', 'lime', '', 'none')
call HL('markdownH4', 'lime', '', 'none')
call HL('markdownH5', 'lime', '', 'none')
call HL('markdownH6', 'lime', '', 'none')
call HL('markdownLinkText', 'mud', '', 'underline')
call HL('markdownIdDeclaration', 'mud')
call HL('markdownAutomaticLink', 'mud', '', 'bold')
call HL('markdownUrl', 'mud', '', 'bold')
call HL('markdownUrldelimiter', 'lightgravel', '', 'bold')
call HL('markdownLinkDelimiter', 'lightgravel', '', 'bold')
call HL('markdownLinkTextDelimiter', 'lightgravel', '', 'bold')
call HL('markdownCodeDelimiter', 'dirtyblonde', '', 'bold')
call HL('markdownCode', 'dirtyblonde', '', 'none')
call HL('markdownCodeBlock', 'dirtyblonde', '', 'none')

" }}}
" Python {{{

hi def link pythonOperator Operator
call HL('pythonBuiltin',    'dress')
call HL('pythonEscape',     'dress')
call HL('pythonException',  'lime', '', 'bold')
call HL('pythonExceptions', 'lime', '', 'none')

" }}}
" Vim {{{

call HL('VimCommentTitle', 'lightgravel', '', 'bold')

call HL('VimMapMod',    'dress', '', 'none')
call HL('VimMapModKey', 'dress', '', 'none')
call HL('VimNotation', 'dress', '', 'none')
call HL('VimBracket', 'dress', '', 'none')

" }}}

" }}}

