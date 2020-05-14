" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall
"  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
  Plug 'stephpy/vim-yaml'
  Plug 'rodjek/vim-puppet'

  " File Explorer
  Plug 'scrooloose/NERDTree'
  " Auto pairs for '(' '[' '{' 
  Plug 'jiangmiao/auto-pairs'
  " Status line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'https://github.com/joshdick/onedark.vim.git'
  Plug 'norcalli/nvim-colorizer.lua'
  " Git
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'junegunn/gv.vim'
  "Sessions 
  Plug 'mhinz/vim-startify'
  " sudo apt install fzf ripgrep fd-find silversearcher-ag universal-ctags
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
"  Plug 'neoclide/nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
