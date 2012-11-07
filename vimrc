set nocompatible          " Force into Vim mode, not vi.

" Loads the pathogen plugin.  Now third-party bundles can be extracted into
" their own directories under ~/.vim/bundle and Pathogen will add them to the
" Vim search path.  This makes bundle management easy, but must occur early in
" the .vimrc file.
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"
" Tab and indent settings.
"
set autoindent            " Automatically indent lines.
set copyindent            " Copies the indent level of the previous line.
set expandtab             " Expands tabs into spaces.
set shiftwidth=2          " Indenting is two spaces.
set smarttab              " Insert tabs at the beginning of a line using
                          " the shiftwidth, not tabstop value.
set tabstop=2             " Displays tabs as two spaces.

"
" Uses the RailsCasts 256-color theme
"
"colorscheme railscasts

"
" Font for GUI.
"
set guifont=Menlo\ Regular:h13

"
" Setting that modify how searches are performed.
"
set ignorecase            " Case-insensitive searching.
set smartcase             " Case-insensitive if search pattern is all
                          " lower case; otherwise case-sensitive.
set hlsearch              " Highlights search hits when found.
set incsearch             " Enables incremental as-you-type searching.

"
" Modifies the status bar to be more useful.
"
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
                          " Full file path [mode] (row,col)
set laststatus=2          " Allows the status line to be visible.

"
" Turn off 1970's technology.
"
set nobackup              " Don't need backup files.
set noswapfile            " Don't need swap files -- have enough memory.

"
" Miscellaneious settings.
"
set backspace=indent,eol,start
                          " Allows backspacing over everything in insert mode.
set showmatch             " Shows matching parantheses and brackets.
set pastetoggle=<F2>      " Press F2 to en/disable auto formatting for pasting.

"
" Turn on file type sniffing and syntax highlighting.
"
filetype on               " Enable file type detection.
filetype indent on        " Enable file type-specific indenting.
filetype plugin on        " Enable file type-specific plugins.
syntax on                 " Enables syntax highlighting.

"
" I like to have a marker at column 80 in order to break my lines up into
" readable (non-wrapping) lengths.  Vim has two options that can work together
" to accomplish this:  textwidth and colorcolumn.  The textwidth will force
" Vim to split and wrap lines longer than whateve the limit is set to.  You
" can always go back and join lines together making them long again though.
" The colorcolumn options puts a light red marker in the specified column so
" long lines can be visually identified.  Multiple markers may be placed for
" visual confirmation of various line lenghts.
"
:set textwidth=78
:set colorcolumn=80,100,132

"
" Handy keyboard macro that allows F5 to indent an entire file.
"
map <silent> <F5> mmgg=G'm
imap <silent> <F5> <Esc> mmgg=G'm

"
" Turn on OmniCompletion -- Activate from Insert mode with C-x C-o
"
set ofu=syntaxcomplete#Complete

"
" Allow Ruby scripts to be executed to help the OmniCompletion engine.
"
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

"
" Pressing "t" in a document window will toggle the visibility of the
" NERDtree plugin.
"
nmap t :NERDTreeToggle<CR>

"
" Convert LaTeX files to PDF
"
command Pdflatex !pdflatex -interaction nonstopmode %

"
" Enable ctags search up the directory structure
"
set tags=./tags;/
