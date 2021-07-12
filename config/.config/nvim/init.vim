syntax on

set noswapfile
set nospell
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set nu
set guicursor=
set relativenumber
set nohlsearch
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

hi VertSplit ctermfg=0 ctermbg=15

nnoremap <SPACE> <Nop>
let mapleader = " "

call plug#begin('~/.vim/plugged')

Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pearofducks/ansible-vim'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown','vim-plug']}
Plug 'preservim/nerdcommenter'
Plug 'edkolev/tmuxline.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'


call plug#end()

colorscheme nord

"Navigation remaps

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nnoremap <leader>sv :vertical split<CR>

"Terminal exit

tnoremap <Esc> <C-\><C-n>

"Markdown-preview

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0

nnoremap <leader>mp :MarkdownPreview

"Fugitive config

nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gpl :Git pull<CR>
nnoremap <leader> gps :Gpush<CR>
  
"FZF config

nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
let g:fzf_layout = { 'window': {  'width': 0.8, 'height':0.8 } }

"CHADtree config

nnoremap <leader>v <cmd>CHADopen<cr>

"config de coc.nvim

if has("patch-8.1.1564")
    set signcolumn=number
else
    set signcolumn=yes
endif

hi signcolumn ctermbg=0
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Airline font config
let g:airline_powerline_fonts = 1

"Startify

let g:startify_custom_header = [
\ '                 _   _            ____             _     _ ',
\ ' ___ _   _ _ __ | |_| |__   ___  / __ \__   _____ (_) __| |',
\ '/ __| | | | ''_ \| __| ''_ \ / _ \/ / _` \ \ / / _ \| |/ _` |',
\ '\__ \ |_| | | | | |_| | | |  __/ | (_| |\ V / (_) | | (_| |',
\ '|___/\__, |_| |_|\__|_| |_|\___|\ \__,_| \_/ \___/|_|\__,_|',
\ '     |___/                       \____/',
\ '',
\]

"Tmuxline

let g:tmuxline_preset = {
  \'a':'#S',
  \'win':['#I', '#W'],
  \'cwin':['#I', '#W'],
  \'options': {'status-justify':'left'}}

" Blamer.nvim
let g:blamer_enabled = 1
let g:blamer_delay = 200
