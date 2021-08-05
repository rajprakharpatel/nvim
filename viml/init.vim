set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
set runtimepath+=~/.config/nvim

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

"----------------options------------------------
" set UTF encoding
set enc=utf-8
set noswapfile
set nobackup
set fenc=utf-8
set termencoding=utf-8
set list lcs=tab:\|\ "(here is a space)
set termguicolors
set hidden
set noshowmode          "only if a status line plugin is installed
set smartcase
set ignorecase
set incsearch
set lazyredraw
set autoindent
set smartindent
set secure
set title
" configure tabwidth and insert spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
" wrap lines at 120 chars. 80 is some what antiquated with nowadays displays.
set nowrap
set textwidth=79
" turn syntax highlighting on
set t_Co=256
syntax on
"" turn line numbers on
" set number
" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
set laststatus=2
"scroll when [count] lines to the border
set so=5
set sidescrolloff=5
"let left right keys to switch to different line at end of line
set whichwrap=<,>,[,]
" display tabs as '>---' and trailing spaces as '-'
set listchars=tab:>-,trail:-
"let terminal detect mouse input
set mouse=a
set showtabline=2
set colorcolumn=80
" set cursorline
colo tokyonight

"---------------autocommands-------------------
"Don't show relative numbering in Insert mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END
augroup code
    autocmd!
  autocmd filetype cpp nmap <F6> :w <bar> !g++ -s -O3 % -o release-%:r && release-%:r < inp.txt > out.txt <CR>
  autocmd filetype cpp nmap <S-F6> :w <bar> FloatermNew! g++ -ulimit -ggdb -Og -Wall -Wno-unused-result -std=c++11 % -o debug-%:r && debug-%:r < inp.txt > out.txt <CR>
  autocmd filetype c nmap <F6> :w <bar> !gcc -g  % -o %:r && %:r < inp.txt > out.txt <CR>
  autocmd filetype c nmap <S-F6> :w <bar> FloatermNew! gcc -g  % -o %:r && %:r < inp.txt > out.txt <CR>
  autocmd filetype java nmap <F6> :w <bar> !javac -g % && java -enableassertions %:r < inp.txt > out.txt <CR>
  " to start debug server on port 5005
  autocmd filetype java nmap <S-F6> :w <bar> FloatermNew! java -Xdebug -Xrunjdwp:server=y,transport=dt_socket,address=5005,suspend=y %:r
  autocmd filetype python nmap <F6> :w <bar> !python % < inp > out <CR>
  autocmd filetype cpp nnoremap <leader>tp 0r ~/.vim/tempelate/tempelate.cpp
augroup END

"Comment toggling          "Alternative commentary by tpope
autocmd FileType c,cpp,java,json,scala,jsonc let b:comment_leader = '//'
autocmd FileType sh,ruby,python,cmake,ps1    let b:comment_leader = '#'
autocmd FileType conf,fstab,yaml,fish,toml   let b:comment_leader = '#'
autocmd FileType tex                         let b:comment_leader = '%'
autocmd FileType mail                        let b:comment_leader = '>'
autocmd FileType vim                         let b:comment_leader = '"'
autocmd FileType lua                         let b:comment_leader = '--'


function! CommentToggle()
    execute ':silent! s/\([^ ]\)/' . escape(b:comment_leader,'\/') . ' \1/' | nohlsearch
    execute ':silent! s/^\( *\)' . escape(b:comment_leader,'\/') . ' \?' . escape(b:comment_leader,'\/') . ' \?/\1/' | nohlsearch
endfunction
map <c-/> :call CommentToggle()<ESC><CR>
map <c-_> :call CommentToggle()<ESC><CR>
"Comment toggling

augroup lsp
    au!
    au FileType java lua require('jdtls_config').setup()
augroup end
