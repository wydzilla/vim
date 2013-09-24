"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === Preamble
" {
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set english language - polish has terrible translation and fonts doesnt't work
set langmenu=en_us
let $lang = 'en_us'


source $VIMRUNTIME/mswin.vim
"behave mswin
"exclusive selection could be confusing for plugins and cursor is less visible
:set selection=inclusive

filetype off
set rtp+=$HOME/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'wombat'
Bundle 'itchyny/lightline.vim'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'kevinw/pyflakes-vim'
Bundle 'tpope/vim-surround'
Bundle 'pep8'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'parameter_objects'
Bundle 'python-syntax'


filetype plugin indent on " Enable filetype plugin
set nocompatible "disable vi compatibility
"}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000          " remember more commands and search history
set undolevels=1000       " use many muchos levels of undo
set autoread              " Set to auto read when a file is changed from the outside
au FocusLost * silent! wa " autosave on focuslost(ignore warn on untitled buffs)

set encoding=utf-8
set laststatus=2          " always show the status line


set backup
set noswapfile            " do not create swaps files
set undofile
set undoreload=10000

set undodir=$HOME/.vim/tmp/undo// "undo files
set backupdir=$HOME/.vim/tmp/backup// "backup files
set directory=$HOME/.vim/tmp/swap// "swap files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === VIM USER INTERFACE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --- Apperance
set title                " change the terminal's title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

au GUIEnter * simalt ~x      " start maximized window
set number                   " always show line numbers
set ttyfast                  " smooth char drawing
set guioptions-=T            " do not show toolbar
set guioptions-=L            " Disable left scroll
set guioptions-=R            " Disable right scroll
set guioptions-=r            " Disable right scroll always

" --- Long lines
set nowrap        " don't wrap lines

set ruler "show cursor location in status line

" --- Colors, fonts
if &t_Co >= 256 || has("gui_running")
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l
    "colorscheme desert 
   colorscheme wombat
   "colorscheme badwolf
   set background=dark
   "colorscheme mustang
   "colorscheme blackboard
endif
if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

set gfn=Consolas:h11:cDEFAULT

" colors for FoldColumn
highlight FoldColumn guifg=#857b6f guibg=#000000
highlight Folded  guifg=gray guibg=#151515 gui=italic

highlight Todo guibg=#242424 guifg=#8ac6f2   gui=bold,italic
highlight Test guifg=#ffff70
"highlight pythonFuncName guifg=#ff80c0 gui=none
highlight pythonFuncName guifg=#cae682  gui=none
highlight pythonClassName guifg=#cae682 gui=bold

highlight pythonSelfParam guifg=salmon
hi pythonDecorator guifg=HotPink
hi pythonRun guifg=#99968b gui=italic 
hi Cursor guifg=black guibg=#4aa9ff

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1a1a1a   
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=bg

let python_highlight_all = 1


"highlight pythonSelfParam guifg=red
" --- Long lines
set nowrap        " don't wrap lines
set colorcolumn=121  "show right margin
hi ColorColumn guibg=#2d2d2d ctermbg=236    

" --- highlight line and column with currsor
set cursorline
hi CursorLine guibg=#202020 ctermbg=236    
set cursorcolumn
hi CursorColumn guibg=#202020 ctermbg=236    

" --- highlight matching cursor
hi MatchParen gui=bold,underline  guibg=bg guifg=Violet guisp=#dd3333

" --- Tabs, indent etc. {{{
set tabstop=4     " a tab is four spaces
:set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab     " insert spaces istead of tabs
set textwidth=120  
set softtabstop=4 " Number of spaces that a <Tab> counts for while performing 
                  " editing operations, like inserting a <Tab> or using <BS>.
set winaltkeys=no "turn off the menu shortcuts

" --- Searching, substitution and matching
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set showmatch     " set show matching parenthesis
set gdefault      " global substitution by default

" --- Error indicator
set visualbell    " don't beep
set noerrorbells  " don't beep
set t_vb=         " this in fact do not have effect here, put it to gvimrc }}}
    

"set list listchars=trail:·   "show trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class

set ofu=syntaxcomplete#Complete
set completeopt=longest,menuone

"autocmd FileType python set complete+=k~/.vim/syntax/python.vim
autocmd filetype python set expandtab
"autocmd FileType python compiler pylint

"switch auto formating for paste/edit
set pastetoggle=<F2>

set mouse=a

"speed up parenthesis matching
set matchtime=3
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    KEY SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Quickly edit/reload the vimrc file
" \ev \svhttps://github.com/hdima/python-syntax
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"It clears the search buffer when you press ,/
nmap <silent> <leader>/ :let @/=""<CR>
"this moves cursor one editor line down when lines are wrapped instead of next
"text line
nnoremap j gj
nnoremap k gk

" move up/down/indent/unindent text
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv

inoremap <A-l> <Esc>>>
inoremap <A-h> <Esc><<
nnoremap <A-l> >>
nnoremap <A-h> <<
vnoremap <A-l> >gv
vnoremap <A-h> <gv

"move accross window splits
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l


" Execute file being edited with <F9>
map <buffer> <F9> :w<CR>:!c:\Python27\python.exe % <CR>

"Insert newline without entering insert mode
nmap <CR> i<CR><Esc>
nmap <C-CR> o<Esc>

"make Y works like D
nmap Y y$

"reselect text from last edit/paste
nmap gV `[v`]

" show cursorline  and cursorcolumn only in active window
au WinEnter * setlocal cursorline
au WinEnter * setlocal cursorcolumn
au WinLeave * setlocal nocursorline
au WinLeave * setlocal nocursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" === PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins_Included:
"pathogen bundle directory:
"ack-plugin ***indent-object *indent_guides 
"parameter_objects 
"repeat 
"text_objects 

"
" --- miniBufExplorer --------------------
 " MiniBufExplorer
"highlight MBENormal         guifg=darkgray
"highlight MBEChanged        guifg=red
"highlight MBEVisibleNormal  guifg=white
"highlight MBEVisibleChanged guifg=darkyellow
 
"let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplorerMoreThanOne = 0


" --- NERDTree --------------------
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>
" Store the bookmarks file
"let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

"" Don't display these kinds of files
"let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            "\ '\.o$', '\.so$', '^\.git$', '\~$', '^\.svn$', '^\.$',
            "\ '^\.\.$' ]

"let NERDTreeShowBookmarks=1       " Show the bookmarks table on startup
"let NERDTreeShowFiles=1           " Show hidden files, too
"let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=0          " Do not quit on opening files from the tree
"let NERDTreeHighlightCursorline=1 " Highlight the selected entry in the tree
"let NERDTreeMouseMode=2           " single click to fold/unfold directories
                                  "" and a double click to open files
"let NERDTreeWinPos=0              " left most position of the window

""show tree on start ...
"autocmd VimEnter * NERDTree
""and select buffer not nerdtree window
"autocmd VimEnter * wincmd p
"

""quit vim if NERDTree is only buffer
""copied from https://github.com/scrooloose/nerdtree/issues#issue/21
"function! NERDTreeQuit()
  "redir => buffersoutput
  "silent buffers
  "redir END
""                     1BufNo  2Mods.     3File           4LineNo
  "let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  "let windowfound = 0

  "for bline in split(buffersoutput, "\n")
    "let m = matchlist(bline, pattern)

    "if (len(m) > 0)
      "if (m[2] =~ '..a..')
        "let windowfound = 1
      "endif
    "endif
  "endfor

  "if (!windowfound)
    "quitall
  "endif
"endfunction
"autocmd WinEnter * call NERDTreeQuit()

" --- NERDCommenter --------------------
" Eclipse style commenting - this is not possible as vim do not see 
" ctrl+/ by design
" map <C-/> <leader>c<space>
map <leader>. <leader>c<space>
map <C-.> <leader>c<space>


" --- Taglist--------------------
"set tags=tags;
"let Tlist_Sort_Type = "name"        
"let Tlist_Use_Right_Window = 1     
"let Tlist_Compart_Format = 1      
"let Tlist_Exist_OnlyWindow = 1   
"let Tlist_File_Fold_Auto_Close = 1 
"let Tlist_Enable_Fold_Column = 1  

"show tlist on start
"autocmd VimEnter * TlistOpen        
"and select buffer not tlist window
"autocmd VimEnter * wincmd p
"nmap <leader>l :TlistToggle<CR> 

"Create tags for current directory
"map <F8> :!c:/Software/ctags58/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

 
" --- neocomplcache --------------------
" Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
 let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
 let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
 let g:neocomplcache_min_syntax_length = 2
 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


"###############################################################################
let g:neocomplcache_ctags_program = 'c:/Software/ctags58/ctags'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
   \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" select next i
"imap <expr><TAB> pumvisible() ? "\<C-n>" :(neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<TAB>")

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup():"\<CR>"
inoremap <expr><Esc>  pumvisible() ? neocomplcache#cancel_popup():"\<Esc>"

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char:
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<BS>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" turn off AutoComplPop like behavior - this causes problems with backspace-
" when deleting chars it automatically inserts longest matching string and in
" fact deleting is imposible also inserts in the middle of words.
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_disable_auto_complete = 0
" show popup but do not select longest matching string automatically
set completeopt-=longest

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal omnifunc=RopeCompleteFunc 
"autocmd FileType python setlocal omnifunc=TwoEngines 
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
let g:neocomplcache_omni_patterns = {}
endif
" --- FuzzyFind --------------------
nmap <C-T> :FufCoverageFile<CR>
nmap <leader>t :FufCoverageFile<CR>
nmap <C-B> :FufBuffer<CR>

" --- pyflakes --------------------
if has("gui_running")
    highlight SpellBad term=underline gui=undercurl guisp=Orange
endif 

