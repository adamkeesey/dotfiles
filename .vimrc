let mapleader = ','
set number
set relativenumber
set numberwidth=3

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'morhetz/gruvbox'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'

Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
call plug#end()

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Go
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '$HOME/go/bin/gocode'
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_snippet_engine = "neosnippet"

let g:go_fmt_command = "goimports"
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <F12> <Plug>(go-def)
let g:go_addtags_transform = "camelcase"

" PHP
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:ale_php_phpcbf_standard='PSR2'
let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'

let g:vim_php_refactoring_default_property_visibility = 'private'
let g:vim_php_refactoring_default_method_visibility = 'private'
let g:vim_php_refactoring_auto_validate_visibility = 1
nnoremap <leader>pd :call pdv#DocumentCurrentLine()<CR>
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
let g:vim_php_refactoring_use_default_mapping = 0
nnoremap <unique> <Leader>rlv :call PhpRenameLocalVariable()<CR>
nnoremap <unique> <Leader>rcv :call PhpRenameClassVariable()<CR>
nnoremap <unique> <Leader>rm :call PhpRenameMethod()<CR>
nnoremap <unique> <Leader>eu :call PhpExtractUse()<CR>
vnoremap <unique> <Leader>ec :call PhpExtractConst()<CR>
nnoremap <unique> <Leader>ep :call PhpExtractClassProperty()<CR>
vnoremap <unique> <Leader>em :call PhpExtractMethod()<CR>
nnoremap <unique> <Leader>np :call PhpCreateProperty()<CR>
nnoremap <unique> <Leader>du :call PhpDetectUnusedUseStatements()<CR>
vnoremap <unique> <Leader>== :call PhpAlignAssigns()<CR>
nnoremap <unique> <Leader>sg :call PhpCreateSettersAndGetters()<CR>
nnoremap <unique> <Leader>cog :call PhpCreateGetters()<CR>
nnoremap <unique> <Leader>da :call PhpDocAll()<CR>

" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
  \}
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" General Settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
nnoremap <space> za
vnoremap <space> zf
inoremap <F3> <c-o>:w<cr>

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

filetype plugin on
set omnifunc=syntaxcomplete#Complete

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-n> :NERDTreeToggle<CR>

set bg=dark    " Setting dark mode
colorscheme gruvbox"
