" -----------------------------------------------------------------------------
" GENERIC SETTINGS
" -----------------------------------------------------------------------------
 " Important!!
if has('termguicolors')
set termguicolors
endif

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

filetype plugin indent on "Enable filetype specific indent scripts
set nocompatible
syntax on
filetype plugin on
set backupcopy=yes "Do not use swaps and update directly files. (hot reload)
set clipboard=unnamed "Set the OS register for vim clipboard
set cursorline "Highlight current line
set directory=~/.vim/swps "Dir for swp files.
set encoding=utf-8 "Always use encoding UTF-8.
set expandtab "Use spaces instead tabs
set mouse=a "Enable mouse scrolling

set foldmethod=indent
set foldnestmax=2 "Maximum nested folds
set nofoldenable "Do not fold files when opening
set foldlevel=2 "Folding level

set history=1000 "Default is 20, I'd rather set this to ∞
set laststatus=2 "Always show file status line.
set number "Show line numbers.
set numberwidth=4 "Spacing always given to these numbers.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set undodir=~/.vim/undodir "Dir for undo history.
set undofile "Maintain undo history between sessions.
set noshowmode "Do not show indicator for insert, use lightline instead

" -----------------------------------------------------------------------------
" PLUGINS
" -----------------------------------------------------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" QOL Plugins
Plugin 'hotoo/highlight-cursor-word.vim' "Highlight same words under cursor
Plugin 'ntpeters/vim-better-whitespace' "Highlight whitespace in files
Plugin 'henrik/vim-indexed-search' "Adds number of results to search
Plugin 'Yggdroot/indentLine' "Better & smarter indentation rules
Plugin 'airblade/vim-gitgutter' "Show changed lines in gutter
Plugin 'alvan/vim-closetag' "Auto complete closetags
" Plugin 'jiangmiao/auto-pairs' "Automatticaly add a paired hyphen/parenthesis
Plugin 'junegunn/vim-peekaboo' "Shows the content of registers
Plugin 'terryma/vim-multiple-cursors' "Multicursor support
Plugin 'tpope/vim-commentary' "Comment multiple lines at once
Plugin 'tpope/vim-eunuch' "Vim sugar for UNIX shell commands
Plugin 'tpope/vim-fugitive' "Helpful git addon
Plugin 'tpope/vim-repeat' "Enable . for special commands
Plugin 'tpope/vim-sensible' "Common ground of all vim users
Plugin 'tpope/vim-surround' "Change surroundings easily
Plugin 'embear/vim-localvimrc' " Use local .vimrc files for specific projects
Plugin 'preservim/nerdtree'

" " Eye Candy
Plugin 'itchyny/lightline.vim' "Theme
Plugin 'mhinz/vim-startify' "Custom vim startup page
Plugin 'ap/vim-css-color' "Show color highlightscall vundle#end()
Plugin 'drzel/vim-pedant' "Match iterm2 colors to vim colorscheme
Plugin 'sainnhe/gruvbox-material' "Theme
Plugin 'arcticicestudio/nord-vim' "Theme

" Search
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Language Syntax Support
Plugin 'sheerun/vim-polyglot' "Syntax for all languages
Plugin 'andreshazard/vim-freemarker' "ftl

" Autosuggest
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'github/copilot.vim'

filetype plugin indent on
call vundle#end()

" -----------------------------------------------------------------------------
" KEYBINDINGS
" -----------------------------------------------------------------------------
command! Wq wq "https://sanctum.geek.nz/arabesque/vim-koans/
"Enter newlines without entering insert mode
nmap <CR> o<Esc>k
" Tab Navigation
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tn  :tabnew<CR>
" FZF & Ag Search
nnoremap fzf :FZF<CR>
nnoremap ; :Buffers<CR>
nnoremap , :Ag<CR>
" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+2<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Coc.nvim keybinds
nnoremap <C-f> :CocCommand<CR>
nnoremap <C-a> :CocAction<CR>

" -----------------------------------------------------------------------------
" PLUGIN CONFIGURATION
" -----------------------------------------------------------------------------
autocmd CursorMoved,CursorHold * silent! call HighlightCursorWord()
let g:highlight_cursor_word_white_list = {
      \ 'javascript': '*',
      \ 'typescript': '*',
      \ 'javascriptreact': '*',
      \ 'typescriptreact': '*'
      \ }

autocmd BufRead,BufNewFile *.ftl setlocal filetype=freemarker

let g:pedant_options = {
      \ 'monokai': ['/Users/mars/.itermcolors/monokai.itermcolors', 'dark'],
      \ }

" Colorscheme
set background=dark
let g:lightline = {'colorscheme' : 'nord'}
colorscheme nord
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_status_lines = 1

nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

