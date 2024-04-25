let g:switch_custom_definitions =
    \ [
    \   ['1', '0'],
    \   ['false', 'true'],
    \   ['left', 'right'],
    \   ['Left', 'Right'],
    \   ['Top', 'Bottom'],
    \   ['next', 'prev'],
    \   {
    \       '\m(\(.*\))': '[\1]',
    \       '\m\[\(.*\)\]': '{\1}',
    \       '\m{\(.*\)}': '(\1)',
    \   },
    \   {
    \       'start': 'stop',
    \       'stop': 'start',
    \       '\<\(\l\)\(\l\+\(\u\l\+\)\+\)\>': '\=toupper(submatch(1)) . submatch(2)',
    \       '\<\(\u\l\+\)\(\u\l\+\)\+\>': "\\=tolower(substitute(submatch(0), '\\(\\l\\)\\(\\u\\)', '\\1_\\2', 'g'))",
    \       '\<\(\l\+\)\(_\l\+\)\+\>': '\U\0',
    \       '\<\(\u\+\)\(_\u\+\)\+\>': "\\=tolower(substitute(submatch(0), '_', '-', 'g'))",
    \       '\<\(\l\+\)\(-\l\+\)\+\>': "\\=substitute(submatch(0), '-\\(\\l\\)', '\\u\\1', 'g')",
    \   }
    \ ]

let g:switch_mapping = "-"
"nnoremap _ :call switch#Switch({'reverse': v:true})<cr>
let g:switch_find_smallest_match = 1

autocmd FileType vim let b:switch_custom_definitions = [
    \ { '\<\([invoxtcl]\?\)noremap\>': '\1map'},
    \ { '\<\([invoxtcl]\?\)map\>': '\1noremap'},
    \ { '\<\(allowrevins\|ari\|autochdir\|acd\|arabic\|arab\|arabicshape\|arshape\|autoindent\|ai\|autoread\|ar\|autowrite\|aw\|autowriteall\|awa\|backup\|bk\|ballooneval\|beval\|binary\|bin\|bomb\|buflisted\|bl\|cindent\|cin\|confirm\|cf\|copyindent\|ci\|cscoperelative\|csre\|cscopetag\|cst\|cursorbind\|crb\|cursorcolumn\|cuc\|cursorline\|cul\|delcombine\|deco\|diff\|digraph\|dg\|endofline\|eol\|equalalways\|ea\|errorbells\|eb\|expandtab\|et\|fileignorecase\|fic\|fixendofline\|fixeol\|foldenable\|fen\|gdefault\|gd\|hidden\|hid\|hkmap\|hk\|hkmapp\|hkp\|hlsearch\|hls\|icon\|ignorecase\|ic\|imcmdline\|imc\|imdisable\|imd\|incsearch\|is\|infercase\|inf\|insertmode\|im\|joinspaces\|js\|langremap\|lrm\|lazyredraw\|lz\|linebreak\|lbr\|lisp\|list\|lpl\|loadplugins\|magic\|modeline\|ml\|modelineexpr\|mle\|modifiable\|ma\|modified\|mod\|more\|mousefocus\|mousef\|mousehide\|mh\|number\|nu\|opendevice\|odev\|paste\|preserveindent\|pi\|previewwindow\|pvw\|prompt\|readonly\|ro\|relativenumber\|rnu\|remap\|revins\|ri\|rightleft\|rl\|ruler\|ru\|scrollbind\|scb\|secure\|shellslash\|ssl\|shelltemp\|stmp\|shiftround\|sr\|showcmd\|sc\|showfulltag\|sft\|showmatch\|sm\|showmode\|smd\|smartcase\|scs\|smartindent\|si\|smarttab\|sta\|spell\|splitbelow\|sb\|splitright\|sr\|startofline\|sol\|swapfile\|swf\|tagbsearch\|tbs\|tagrelative\|tr\|tagstack\|tgst\|termbidi\|tbidi\|terse\|tildeop\|top\|timeout\|to\|ttimeout\|title\|ttyfast\|tf\|undofile\|udf\|visualbell\|vb\|warn\|wildignorecase\|wic\|wildmenu\|wmnu\|winfixheight\|wfh\|winfixwidth\|wfw\|wrap\|wrapscan\|ws\|write\|writeany\|wa\|writebackup\|wb\)\>': 'no\1'},
    \ { '\<no\(allowrevins\|ari\|autochdir\|acd\|arabic\|arab\|arabicshape\|arshape\|autoindent\|ai\|autoread\|ar\|autowrite\|aw\|autowriteall\|awa\|backup\|bk\|ballooneval\|beval\|binary\|bin\|bomb\|buflisted\|bl\|cindent\|cin\|confirm\|cf\|copyindent\|ci\|cscoperelative\|csre\|cscopetag\|cst\|cursorbind\|crb\|cursorcolumn\|cuc\|cursorline\|cul\|delcombine\|deco\|diff\|digraph\|dg\|endofline\|eol\|equalalways\|ea\|errorbells\|eb\|expandtab\|et\|fileignorecase\|fic\|fixendofline\|fixeol\|foldenable\|fen\|gdefault\|gd\|hidden\|hid\|hkmap\|hk\|hkmapp\|hkp\|hlsearch\|hls\|icon\|ignorecase\|ic\|imcmdline\|imc\|imdisable\|imd\|incsearch\|is\|infercase\|inf\|insertmode\|im\|joinspaces\|js\|langremap\|lrm\|lazyredraw\|lz\|linebreak\|lbr\|lisp\|list\|lpl\|loadplugins\|magic\|modeline\|ml\|modelineexpr\|mle\|modifiable\|ma\|modified\|mod\|more\|mousefocus\|mousef\|mousehide\|mh\|number\|nu\|opendevice\|odev\|paste\|preserveindent\|pi\|previewwindow\|pvw\|prompt\|readonly\|ro\|relativenumber\|rnu\|remap\|revins\|ri\|rightleft\|rl\|ruler\|ru\|scrollbind\|scb\|secure\|shellslash\|ssl\|shelltemp\|stmp\|shiftround\|sr\|showcmd\|sc\|showfulltag\|sft\|showmatch\|sm\|showmode\|smd\|smartcase\|scs\|smartindent\|si\|smarttab\|sta\|spell\|splitbelow\|sb\|splitright\|sr\|startofline\|sol\|swapfile\|swf\|tagbsearch\|tbs\|tagrelative\|tr\|tagstack\|tgst\|termbidi\|tbidi\|terse\|tildeop\|top\|timeout\|to\|ttimeout\|title\|ttyfast\|tf\|undofile\|udf\|visualbell\|vb\|warn\|wildignorecase\|wic\|wildmenu\|wmnu\|winfixheight\|wfh\|winfixwidth\|wfw\|wrap\|wrapscan\|ws\|write\|writeany\|wa\|writebackup\|wb\)\>': '\1'},
    \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)$': '\1split' },
    \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)split\>': '\1nosplit' },
    \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)nosplit\>': '\1' },
    \ { '\c<Bar>': '\\|' },
    \ { '\\|': '<Bar>' }
    \]

