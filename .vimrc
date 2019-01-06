call plug#begin('~/.vim/bundle')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'stephpy/vim-yaml'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/pearofducks/ansible-vim'
Plug 'https://github.com/stephpy/vim-yaml'
Plug 'https://github.com/lepture/vim-jinja.git'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ekalinin/Dockerfile.vim'
Plug 'https://github.com/tpope/vim-commentary'

Plug 'https://github.com/klen/python-mode.git'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
Plug 'fisadev/fisa-vim-colorscheme'

" puppet
Plug 'rodjek/vim-puppet'
Plug 'honza/vim-snippets'
Plug 'vim-syntastic/syntastic'
call plug#end()

" comment
:nnoremap <C-c> :Commentary<cr>

" jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

" Python 
" Override go-to.definition key shortcut to Ctrl-]
let g:pymode_rope_goto_definition_bind = "<C-]>"
" Override run current python file key shortcut to Ctrl-Shift-e
let g:pymode_run_bind = "<C-S-e>"
" Override view python doc key shortcut to Ctrl-Shift-d
let g:pymode_doc_bind = "<C-S-d>"
" let g:pymode_python = 'python3'



" better searches
set hlsearch
set incsearch
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

nnoremap <CR> :nohlsearch<cr>

" search 
set runtimepath^=~/.vim/bundle/ctrlp.vim

" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
""git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
noremap <C-a> :CtrlP ~/git/<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


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

" add yaml
" au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
let g:ansible_options = {'ignore_blank_lines': 0}
let g:ansible_options = {'documentation_mapping': '<C-K>'}


" let g:gitgutter_max_signs = 500  " default value
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk
" omap ih <Plug>GitGutterTextObjectInnerPending
" omap ah <Plug>GitGutterTextObjectOuterPending
" xmap ih <Plug>GitGutterTextObjectInnerVisual
" xmap ah <Plug>GitGutterTextObjectOuterVisual
" set updatetime=100
" let g:gitgutter_git_args = '--git-dir-""'
" let g:gitgutter_diff_args = '-w'



autocmd FileType yaml setlocal ai ts=2 sw=2 et
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'b'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }


" Spell-check set to <leader>o, 'o' for 'orthography':
map <F6> :setlocal spell! spelllang=en_us<CR>
" Check file in shellcheck:
" map <F7> :!clear && shellcheck %<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow splitright

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
 
" Use visual bell instead of beeping when doing something wrong
set visualbell

:nnoremap <C-n> :bnext<CR>
" :nnoremap <C-p> :bprevious<CR>

function s:SetCursorLine()
    set cursorline
    hi cursorline cterm=none ctermbg=DarkGray ctermfg=white
endfunction
autocmd VimEnter * call s:SetCursorLine()

" Airline ------------------------------
colorscheme fisa

let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
 
" puppet
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']

