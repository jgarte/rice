set nocp t_ut= nu rnu laststatus=2 ts=4 sw=4 clipboard=unnamedplus
set wildmode=longest,list,full wildmenu formatoptions-=cro lbr
set path+=** rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'slim-template/vim-slim'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'depsterr/hex.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()

colorscheme vibrant-night
filetype plugin indent on
syntax enable

" Remaps
noremap <C-c> :q<CR>
noremap <C-d> :q<CR>
let maplocalleader = "\<space>"
noremap <localleader>zm : Goyo<CR>
noremap <tab> >>
noremap <S-tab> <<
noremap <localleader>he :HexToggle<CR>
set foldmethod=indent
set foldlevelstart=99
noremap <localleader>fo za
noremap <localleader>fr zA
noremap <localleader>ss :set spelllang=sv spell<CR>
noremap <localleader>se :set spelllang=en spell<CR>
noremap <localleader>so :setlocal nospell<CR>
noremap <localleader>sn ]s
noremap <localleader>sN [s
noremap <localleader>sc z=
noremap <localleader>sa zg
noremap <localleader>sr zug
noremap <localleader>sb zw
noremap <localleader>su zuw

" Autocommands
au BufReadPost,BufNewFile *.ms setlocal ft=groff
au BufReadPost,BufNewFile *.ms,*.md,*.tex Goyo
au BufReadPost,BufNewFile *.c,*.h setlocal textwidth=80
au BufReadPost,BufNewFile *.s,*.nasm,*.asm setlocal ft=nasm
au BufReadPost,BufNewFile *.slim setlocal ft=slim
au BufReadPost,BufNewFile *.hs set expandtab

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
    	autocmd!
    	au InsertEnter * set timeoutlen=0
    	au InsertLeave * set timeoutlen=1000
    augroup END
endif
