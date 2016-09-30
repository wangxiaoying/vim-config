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

" move to last position when open file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

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

" NerdCommenter
filetype plugin on
let mapleader = ';'
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NeradCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" NeoComplete ================================================

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'')'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'')'

" remove preview window
set completeopt-=preview

" NeoComplete ================================================

" Tagbar
" need to install exuberant-ctags first
map <F8> :TagbarToggle<CR>
