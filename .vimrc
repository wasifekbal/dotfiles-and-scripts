call plug#begin()

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'

call plug#end()

let mapleader = " "

let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <leader>sf :source ~/.vimrc<CR>
nnoremap <leader>w <C-w>w
nnoremap p "0p
nnoremap P "0P
vnoremap x "0x
nnoremap x "0x

"nnoremap p "+p
"nnoremap P "+P
"vnoremap x "+x
"nnoremap x "+x

vnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

set number
set tabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent
set cursorline
set mouse=a
syntax on

set path+=**
set wildmenu
set wildignore+=**/node_modules/**

function! ConvertDosToUnix()
  :w
  :e ++ff=dos
  :set ff=unix
  :w
endfunction

let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

augroup AutoDeleteNetrwHiddenBuffers
  au!
  au FileType netrw setlocal bufhidden=wipe
augroup end

" Mappings ---------------------------------------------------
"map <silent> <C-E> :call ToggleNetrw()<CR>
map <leader>c :call ConvertDosToUnix()<CR>

let g:netrw_banner = 0
let g:netrw_keepdir = 0
let g:netrw_winsize = 23
let g:netrw_liststyle=3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 1

"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Lex
"augroup END

set noshowmode  " to get rid of thing like --INSERT--
set noshowcmd  " to get rid of display of last command
set shortmess+=F  " to get rid of the file name displayed in the command line bar
