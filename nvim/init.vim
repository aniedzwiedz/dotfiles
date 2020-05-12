source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/signify.vim
source $HOME/.config/nvim/vim-plug/start-screen.vim
source $HOME/.config/nvim/vim-plug/fzf.vim
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/onedark.vim


nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>

" We don't need to see things like -- INSERT -- anymore
set noshowmode
set paste
set nu
set relativenumber
colorscheme onedark

lua require'plug-colorizer'

nmap <C-n> :NERDTreeFind<CR>

