" Enable vim-plug to manage plugins
call plug#begin('~/src/github.com/junegunn/vim-plug')

Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'kien/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'
Plug 'jamessan/vim-gnupg'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'fatih/vim-go'
Plug 'dgryski/vim-godef'

Plug 'ervandew/sgmlendtag'
Plug 'tomasr/molokai'

Plug 'plasticboy/vim-markdown'
call plug#end()

" Options for Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

" Options for the solarized color theme
if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif
syntax on
colorscheme solarized
set background=dark

" Options
set relativenumber
set number
set tabstop=4
set list            " make whitespace visble
set shiftwidth=4
set ic              " Ignore case when searching
set cursorline      " highlight current line
set vb              " enable visual bell (disable audio bell)
set scrolloff=2     " minimum lines above/below cursor
set wildmode=longest:full " tab completion similar to bash
let &colorcolumn=join(range(81,999),",") " Hint to keep lines short

" Disable arrow keys in normal and insert mode to force use of hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Netrw options
let g:netrw_banner = 0    " disable banner
let g:netrw_liststyle = 3 " tree style

" Frequent actions mapped
let mapleader="\<Space>"
nnoremap <leader>f :find
nnoremap <leader>l :CtrlPBuffer<cr> " Open buffer menu
nnoremap <leader>r :CtrlPMRUFiles<cr> " Open most recently used files
nnoremap <leader>e :CtrlP .<cr> " Open file menu
nnoremap <leader>E :Explore . " Open explorer
nnoremap <leader>c :close<cr>
nnoremap <leader>d :bd<cr> "Delete buffer
nnoremap <leader>w :w<cr>" save file
nnoremap <leader>n :new<cr>" new
nnoremap <leader>R :so ~/.vimrc<cr>" reload vim config
vnoremap <leader>M :make<cr>

" GnuPGP options
let g:GPGPreferArmor=1

" Go
let g:go_fmt_command = "goimports"
let g:neomake_go_enabled_makers = ['golint' ]
autocmd! BufWritePost *.go Neomake " Run Neomake on save
autocmd BufRead *.go Neomake " Run Neomake on open
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>i  <Plug>(go-info)
autocmd FileType go nmap <leader>a :GoAlternate<cr>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go nnoremap <leader>v :vsp <cr>:exe "GoDef" <cr> " Open go doc in v window
autocmd FileType go setlocal commentstring=//\ %s " Vim Commentary
command! NewScratchGo execute "n scratch-go" | setf go | setl buftype=nofile | setl bufhidden=hide | setl noswapfile

" HTML
autocmd FileType html setlocal ts=2 sw=2 tw=0

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd! BufWritePost *.yaml Neomake

" Neomake options
let g:neomake_open_list = 1
let g:neomake_list_height = 6

" Fix issue with osx + vim + crontab
autocmd filetype crontab setlocal nobackup nowritebackup
