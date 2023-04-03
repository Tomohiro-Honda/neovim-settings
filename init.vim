let g:python3_host_prog = '/usr/bin/python3'
if executable('volta')
  let g:node_host_prog = trim(system("volta which neovim-node-host"))
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


""""" lightline """""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']


""""" neoterm """""
let g:neoterm_size= 10
let g:neoterm_autoscroll=1 " REPLを自動的に改行
let g:neoterm_default_mod='belowright'
"tnoremap <silent> <C-w> <C-\><C-n><C-w>
tnoremap <silent> <ESC> <C-\><C-n><C-w> 
nnoremap <C-t> :Ttoggle<CR>
tnoremap <C-t> <C-¥><C-n>:Ttoggle<CR>

""""" NERDTree """""
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nmap <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

""""" fugitive """""
set diffopt+=vertical


""""" Prettier """""
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_sign_error = 'P>'
let g:ale_sign_warning = 'P-'
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_statusline_format = ['E%d', 'W%d', 'OK']

nmap <silent> <C-w>j <Plug>(ale_next_wrap)
nmap <silent> <C-w>k <Plug>(ale_previous_wrap)

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all'


""""" coc.vim """""
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
hi CocSearch ctermfg=147 guifg=#afafff
hi CocMenuSel ctermbg=16 guifg=#000000
hi CocFloating ctermbg=236 guifg=##303030 ctermfg=14 guifg=#00ffff

""""" basic settings """""
if executable('zsh')
  set shell=/usr/bin/zsh
endif
set number
set expandtab
set shiftwidth=2
set tabstop=2
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
