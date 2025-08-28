" Uses snippets from https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim


" ===== VIM UI =====

" shortlist: habamax, retrobox, wildcharm, sorbet, slate, unoka
colorscheme habamax
set background=dark

" Enable syntax highlighting
syntax on

" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Always show position in file on bottom right
set ruler

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" Don't redraw while executing macros (good performance config)
set lazyredraw



" ===== Text, tab and indent related =====

" Use spaces instead of tabs
set expandtab

" Inserts blanks on a <Tab> key
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" subtle appearance on lines above and below
highlight LineNrAbove ctermfg=Grey
highlight LineNrBelow ctermfg=Grey

" Set line numbers and relative numbers
set number
set relativenumber

" Turn off wrapping
set nowrap



" ===== Status Line =====

" Always show the status line
set laststatus=2

" Show commands on bottom right as you type vim commands
set showcmd



" ===== Filetype-specific settings =====

" Remove default 0 space tabs in makefiles
augroup MakefileTabs
  autocmd!
  autocmd FileType make setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=0
augroup END


" ===== Helpful hacks =====

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Smooth-ish scrolling with centered cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

