let g:python3_host_prog = '/usr/bin/python3'
if executable('volta')
  let g:node_host_prog = trim(system("volta which neovim-node-host"))
endif

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'kassio/neoterm'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
call plug#end()

" lightline
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'unite']
let g:neoterm_default_mod='belowright'

" neoterm
let g:neoterm_size= 10
let g:neoterm_autoscroll=1 " REPLを自動的に改行
"tnoremap <silent> <C-w> <C-\><C-n><C-w>
tnoremap <silent> <ESC> <C-\><C-n><C-w> 

" NERDTree
nmap <C-e> :NERDTreeToggle<CR>

" fugitive
set diffopt+=vertical

" prettier
"let g:prettier#autoformat_require_pragma = 0
autocmd TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html Prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat_config_files = ['.prettierrc.json', '.prettierrc']
" prettier global
let g:prettier#config#print_width = 80
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#arrow_parens = 'always'

" basic settings
set shell=/usr/bin/zsh
set number
set expandtab
set shiftwidth=2
set tabstop=2
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
