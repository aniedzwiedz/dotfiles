
call plug#begin('~/.vim/bundle')

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" better searches
set hlsearch
set incsearch
set ignorecase
set smartcase

nnoremap <CR> :nohlsearch<cr>

" search 
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <C-a> :CtrlP ~/.vim/<CR>



" Some basics:
set nu
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

Plug 'pearofducks/ansible-vim'
Plug 'stephpy/vim-yaml'
autocmd FileType yaml setlocal ai ts=2 sw=2 et
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'

" Spell-check set to <leader>o, 'o' for 'orthography':
map <F6> :setlocal spell! spelllang=en_us<CR>
" Check file in shellcheck:
" map <F7> :!clear && shellcheck %<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

