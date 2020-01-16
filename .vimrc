let mapleader = ','
set number
set relativenumber
set numberwidth=3
set dir=~/tmp

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
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Konfekt/FastFold'
Plug 'vim-syntastic/syntastic'
Plug 'kylef/apiblueprint.vim'
Plug 'Townk/vim-autoclose'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'moll/vim-node'
Plug 'junegunn/limelight.vim'
Plug 'benmills/vimux'
Plug 'jbgutierrez/vim-better-comments'
call plug#end()

" markdown preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


autocmd FileType apiblueprint nnoremap <C-b> :call GenerateRefract()<cr>

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
au FileType go nmap <Leader><F12> <Plug>(go-def)
let g:go_addtags_transform = "camelcase"

" PHP
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
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

" JS
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

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
" set foldmethod=indent
" set foldnestmax=10
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

" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif""))
map <C-n> :NERDTreeToggle<CR>

set bg=dark    " Setting dark mode
set t_Co=256
colorscheme gruvbox"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" let g:markdown_folding = 7
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1

inoremap jj <ESC>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules

let g:limelight_conceal_ctermfg = 'grey'

let g:go_def_mode='gopls'

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

nnoremap <silent> <Leader>ts
    \ : if exists("syntax_on") <BAR>
    \    syntax off <BAR>
    \ else <BAR>  
    \    syntax enable <BAR>
    \ endif<CR>   
