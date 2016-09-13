execute pathogen#infect()
syntax on
filetype plugin indent on

" NerdTree
map <F9> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
set tabstop=2
set shiftwidth=2
set expandtab
set hlsearch

" Tab operations
nnoremap tj :tabfirst<CR>
nnoremap tk :tablast<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Disable auto comment new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Turn mouse on
set mouse=a

" Colortheme
syntax enable
colorscheme monokai
highlight TabLineFill ctermbg=242, ctermfg=242
highlight TabLine ctermfg=0

" Add c++11 syntax
au BufNewFile,BufRead *.cc,*.cpp,*.h,*.hpp set syntax=cpp11
" Add thrift syntax
au BufRead,BufNewFile *.thrift set syntax=thrift

" set encode
set encoding=utf-8

" Auto add file title
autocmd BufNewFile *.h,*.hpp,*.c,*.cpp,*.cc exec ":call InsertTitle()"
map <F2> :call InsertTitle()<CR>

func InsertTitle()
call setline(1, "/*")
call append(line("."), " * File: ".expand("%"))
call append(line(".")+1, " *")
call append(line(".")+2, " * Author: wangxy")
call append(line(".")+3, " *")
call append(line(".")+4, " * Created on: ".strftime("%Y-%m-%d %H:%M:%S"))
call append(line(".")+5, " */")
endfunc

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-o>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrl_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }
let g:ctrlp_user_command = 'find %s -type f'
