let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:blackestgravel = ["#141413", 232]
let s:darkgravel = ["#242321", 235]
let s:deepgravel = ["#45413b", 238]
let s:mediumgravel = ["#666462", 241]
let s:brightgravel = ["#d9cec3", 252]
let s:plain = ["#f8f6f2", 15]
let s:snow = ["#ffffff", 15]
let s:lime = ["#aeee00", 154]
let s:tardis = ["#0a9dff", 39]
let s:taffy = ["#ff2c4b", 196]
let s:orange = ["#ffa724", 214]
let s:dirtyblone = ["#f4cf86", 222]
let s:saltwatertaffy = ["#8cffba", 121]
let s:dress = ["#ff9eb8", 211]

let s:p.normal.left = [ [ s:darkgravel, s:orange ], [ s:plain, s:darkgravel ] ]
let s:p.normal.middle = [ [ s:plain, s:mediumgravel ] ]
let s:p.normal.right = [ [ s:plain, s:darkgravel ], [ s:plain, s:darkgravel ] ]
let s:p.normal.warning = [ [ s:darkgravel, s:dirtyblone ] ]
let s:p.normal.error = [ [ s:darkgravel, s:taffy ] ]

let s:p.inactive.left =  [ [ s:darkgravel, s:lime ], [ s:plain, s:darkgravel ] ]
let s:p.inactive.middle = [ [ s:plain, s:darkgravel ] ]
let s:p.inactive.right = [ [ s:plain, s:darkgravel ], [ s:plain, s:darkgravel ] ]

let s:p.insert.left = [ [ s:darkgravel, s:taffy ], [ s:plain, s:darkgravel ] ]
let s:p.replace.left = [ [ s:darkgravel, s:dirtyblone ], [ s:plain, s:darkgravel ] ]
let s:p.visual.left = [ [ s:darkgravel, s:lime ], [ s:plain, s:darkgravel ] ]

let s:p.tabline.left = [ [ s:plain, s:mediumgravel ] ]
let s:p.tabline.middle = [ [ s:plain, s:mediumgravel ] ]
let s:p.tabline.right = [ [ s:plain, s:mediumgravel ] ]
let s:p.tabline.tabsel = [ [ s:darkgravel, s:lime ] ]

let g:lightline#colorscheme#badwolf#palette = lightline#colorscheme#flatten(s:p)
