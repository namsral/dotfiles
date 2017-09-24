" Enable vim-plug to manage plugins
call plug#begin('~/src/github.com/junegunn/vim-plug')

" Text line up
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'neomake/neomake'
Plug 'jamessan/vim-gnupg'
Plug 'tpope/vim-surround'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Go
Plug 'fatih/vim-go'
Plug 'dgryski/vim-godef'

" Tag completion
Plug 'ervandew/sgmlendtag'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

" Use ag, aka Silver Searcher, instead of grep
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif
"
call plug#end()

" Options for Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

syntax enable
colorscheme snapper

" Options
set nocompatible
set encoding=utf-8
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set list            " make whitespace visble
set ic              " Ignore case when searching
set cursorline      " highlight current line
set vb              " enable visual bell (disable audio bell)
set scrolloff=2     " minimum lines above/below cursor
set wildmode=longest:full " tab completion similar to bash
set colorcolumn=80
set list listchars=eol:¬,tab:›\ ,trail:·

" Status bar
set laststatus=2
set statusline=                              " clear statusline
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

" Disable arrow keys in normal and insert mode to force use of hjkl
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Vim's file browser options; netrw
let g:netrw_banner = 0    " disable banner
let g:netrw_liststyle = 3 " tree style

" Frequent actions mapped
" Sorted by key
let mapleader="\<Space>"
nnoremap <leader>c :close<cr>
nnoremap <leader>d :bd<cr> "Delete buffer
nnoremap <leader>e :FZF .<cr> " Open file menu
nnoremap <leader>E :Explore . " Open explorer
nnoremap <leader>f :find
nnoremap <leader>h :History<cr> " FZF v:oldfiles and open buffers
nnoremap <leader>l :Buffers<cr> " List open buffers
vnoremap <leader>M :make<cr>
nnoremap <leader>n :new<cr>" new
nnoremap <leader>R :so ~/.vimrc<cr>" reload vim config
nnoremap <leader>w :w<cr>" save file
nnoremap <leader>o <C-w>w " toggle window

" GnuPGP options
let g:GPGPreferArmor=1

" Go options
let g:go_fmt_command = "goimports"
let g:neomake_go_enabled_makers = ['golint' ]
"autocmd! BufWritePost *.go Neomake " Run Neomake on save
"autocmd BufRead *.go Neomake " Run Neomake on open
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

" The Silver Searcher, use ag over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
