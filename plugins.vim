filetype off										"required"

											" set the runtime path to include Vundle and initialize"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'flazz/vim-colorschemes'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'mileszs/ack.vim'
Plugin 'skwp/greplace.vim'
											" Dont Add Plugins Below this Line"

call vundle#end()         								"required"
filetype plugin indent on 								"required"
