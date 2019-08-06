call plug#begin()

" Plugins
Plug 'tpope/vim-surround'                                                              " Surround
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                      " Fuzzy file search
Plug 'junegunn/fzf.vim'                                                                " Fuzzy file search
Plug 'tpope/vim-fugitive'                                                              " Git wrapper
Plug 'mileszs/ack.vim'                                                                 " Ack search tool
Plug 'airblade/vim-gitgutter'                                                          " Gitgutter
Plug 'vim-airline/vim-airline'                                                         " Airline statusline
Plug 'leafgarland/typescript-vim'                                                      " TypeScript highlighting
Plug 'morhetz/gruvbox'                                                                 " Gruvbox theme
Plug 'scrooloose/nerdtree'                                                             " Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                                                     " Nerdtree git plugin
Plug 'machakann/vim-highlightedyank'                                                   " Highlight yanked text

call plug#end()

colorscheme gruvbox                 " Enable theme
filetype plugin indent on           " Enabling filetype support provides filetype-specific indenting,
syntax on                           " Syntax highlighting, omni-completion and other useful settings.

" fzf setup
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <c-P> :ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

" Highlighted yank setup
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 200

" Keybindings
" Stop space from moving cursor
nnoremap <SPACE> <Nop>
let mapleader = "\<Space>" " Assign space as leader
" Leader leader to swap to most recent buffer
nnoremap <leader><leader> <C-^>
" Leader f to search all
nnoremap <leader>f :Ag 
" Leader q to quit vim
nnoremap <leader>q :qall<CR>
" Leader l to search buffers
nnoremap <leader>l :Lines<CR>
" Leader b to show buffers
nnoremap <leader>b :Buffers<CR>
" Leader w to save
nnoremap <leader>w :w<CR>
" Alt + direction to move between splits in any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-j> <C-W>j
nnoremap <A-k> <C-W>k
nnoremap <A-h> <C-W>h
nnoremap <A-l> <C-W>l
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
" Use ; for entering commands
nnoremap ; :
" Make 'Y' yank from cursor to end of line
nnoremap Y y$
" Clear search with ,/
nnoremap <silent> <leader>/ :nohlsearch<CR>
" Leader t to open terminal in vertical split
nnoremap <leader>t :vs term://bash<CR>
" Map esc to exit terminal mode
tnoremap <Esc> <C-\><C-n>
" Toggle nerdtree with leader e
nnoremap <leader>e :NERDTreeToggle<CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
  let g:ackprg = 'ag --nogroup --nocolor --column' " Use ag in place of ack
endif

runtime macros/matchit.vim " Hit `%` on `if` to jump to `else`.

if has ('autocmd') " Remain compatible with earlier versions
  " Use actual tab chars in Makefiles.
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
  augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd

" various settings
set autoindent                                    " Minimal automatic indenting for any filetype.
set smartindent                                   " Better autoindent e.g. extra indent after parens
set backspace=indent,eol,start                    " Proper backspace behavior.
set hidden                                        " Possibility to have more than one unsaved buffers.
set incsearch                                     " Incremental search, hit `<CR>` to stop.
set ruler                                         " Shows the current line number at the bottom-right of the screen.
set wildmenu                                      " Great command-line completion, use `<Tab>` to move around.
set ignorecase                                    " Case insensitive search default
set smartcase                                     " Case sensitive search if capital in search string
set confirm                                       " Ask to save instead of failing command requiring save
set hlsearch                                      " Highlight search matches
set showmatch                                     " Highlight matching parens etc
set laststatus=2                                  " Always show the statusline
set list                                          " Display trailing whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:< " Display trailing whitespace as ~
set showcmd                                       " Show the command as it is being typed at bottom of screen
set autoread                                      " Automatically reload file on change
set bg=dark                                       " Enable dark mode
set updatetime=100                                " Set refresh to 100ms
set noerrorbells                                  " No beeping
set undofile                                      " Maintain undo history between sessions
set undodir=~/.vim/undodir//                      " Store undofiles in single directory
set noswapfile                                    " Disable swapfiles
set tabstop=2                                     " The width of a TAB is set to 2.
set shiftwidth=2                                  " Indents will have a width of 2
set softtabstop=2                                 " Sets the number of columns for a TAB
set expandtab                                     " Expand TABs to spaces
set splitbelow                                    " Horizontal split new window below
set splitright                                    " Vertical split new window below
set clipboard+=unnamedplus                        " Default to system clipboard
set inccommand=nosplit                            " Show substitute command in real time
set formatoptions-=cro                            " Disable automatic commenting

" Hybrid line numbers, relative in visual and absolute other times
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

