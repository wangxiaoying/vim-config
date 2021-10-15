set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
call vundle#begin('~/.vim/plugged')

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Syntax Highlighting
Plugin 'sheerun/vim-polyglot'

" Colorscheme
Plugin 'cocopon/iceberg.vim'
Plugin 'arcticicestudio/nord-vim'

" Pair Completion
Plugin 'jiangmiao/auto-pairs'

" Directory/file exploration
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'dyng/ctrlsf.vim'
Plugin 'derekwyatt/vim-fswitch'

" Coding
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

set nu              " Enable line numbers
syntax on           " Enable syntax highlighting
set tabstop=4       " How many columns of whitespace a \t is worth
set shiftwidth=4    " How many columns of whitespace a "level of indentation" is worth
set expandtab       " Use spaces when tabbing
set incsearch       " Enable incremental search
set hlsearch        " Enable highlight search

set background=dark
colorscheme iceberg

" Built-in terminal
set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits

" Disable auto comment new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" move to last position when open file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Tab operations
nnoremap tj :tabfirst<CR>
nnoremap tk :tablast<CR>
nnoremap th :tabprev<CR>
nnoremap tl :tabnext<CR>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Pair completion
let g:AutoPairsShortcutToggle = '<C-P>' " Switch between disable and enable pair completion

" NERDTree
nmap <F9> :NERDTreeToggle<CR>

" tagbar
let g:tagbar_autofocus = 1                      " Focus the panel when opening it 
let g:tagbar_autoshowtag = 1                    " Highlight the active tag
let g:tagbar_position = 'botright vertical'     " Make panel vertical and place on the right
nmap <F8> :TagbarToggle<CR>

" CtrlFS
let g:ctrlsf_backend = 'ack'                            " Use the ack tool as the backend
let g:ctrlsf_auto_close = { "normal":0, "compact":0 }   " Auto close the results panel when opening a file
let g:ctrlsf_auto_focus = { "at":"start" }              " Immediately switch focus to the search window
let g:ctrlsf_auto_preview = 0                           " Don't open the preview window automatically
let g:ctrlsf_case_sensitive = 'smart'                   " Use the smart case sensitivity search scheme
let g:ctrlsf_default_view = 'normal'                    " Normal mode, not compact mode
let g:ctrlsf_regex_pattern = 0                          " Use absoulte search by default
let g:ctrlsf_position = 'bottom'                        " Position of the search window
let g:ctrlsf_winsize = '30%'                            " Width or height of search window
let g:ctrlsf_default_root = 'cwd'                       " Search from the current working directory

" Change Ctrl+F -> Ctrl+S otherwise conflict with move to next page
" (Ctrl+F) Open search prompt (Normal Mode)
nmap <C-S>f <Plug>CtrlSFPrompt
" (Ctrl-F + f) Open search prompt with selection (Visual Mode)
xmap <C-S>f <Plug>CtrlSFVwordPath
" (Ctrl-F + F) Perform search with selection (Visual Mode)
xmap <C-S>F <Plug>CtrlSFVwordExec
" (Ctrl-F + n) Open search prompt with current word (Normal Mode)
nmap <C-S>n <Plug>CtrlSFCwordPath
" (Ctrl-F + o )Open CtrlSF window (Normal Mode)
nnoremap <C-S>o :CtrlSFOpen<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Normal Mode)
nnoremap <C-S>t :CtrlSFToggle<CR>
" (Ctrl-F + t) Toggle CtrlSF window (Insert Mode)
inoremap <C-S>t <Esc>:CtrlSFToggle<CR>

" FSwitch
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'
au! BufEnter *.h let b:fswitchdst = 'cpp,c'
nmap <C-Z> :vsplit <bar> :wincmd l <bar> :FSRight<CR>

" YCM
" Mapping to close the completion menu (default <C-y>)
let g:ycm_key_list_stop_completion = ['<C-x>']

" Set filetypes where YCM will be turned on
let g:ycm_filetype_whitelist = { 'cpp':1, 'h':2, 'hpp':3, 'c':4, 'cxx':5 }

" Close preview window after completing the insertion
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:ycm_confirm_extra_conf = 0                 " Don't confirm python conf
let g:ycm_always_populate_location_list = 1      " Always populae diagnostics list
let g:ycm_enable_diagnostic_signs = 1            " Enable line highligting diagnostics
let g:ycm_open_loclist_on_ycm_diags = 1          " Open location list to view diagnostics

let g:ycm_max_num_candidates = 20                " Max number of completion suggestions 
let g:ycm_max_num_identifier_candidates = 10     " Max number of identifier-based suggestions
let g:ycm_auto_trigger = 1                       " Enable completion menu
let g:ycm_show_diagnostic_ui = 1                 " Show diagnostic display features
let g:ycm_error_symbol = '>>'                    " The error symbol in Vim gutter
let g:ycm_enable_diagnostic_signs = 1            " Display icons in Vim's gutter, error, warnings
let g:ycm_enable_diagnostic_highlighting = 1     " Highlight regions of diagnostic text
let g:ycm_echo_current_diagnostic = 1            " Echo line's diagnostic that cursor is on
set signcolumn=yes                               " Make Vim always render the sign column

