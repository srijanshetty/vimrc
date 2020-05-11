"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Mouse support only in normal mode
set mouse=n

" https://github.com/numirias/security
set nomodeline
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim-plug
" Automatic installaion of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

" Motions, objects, operators
Plug 'justinmk/vim-sneak'                                                       " Sneak 's' motion and object
Plug 'romainl/vim-cool'                                                         " Close hlsearch after complete
Plug 'tpope/vim-repeat'                                                         " Repeat random actions
Plug 'tpope/vim-commentary'                                                     " Toggle comments
Plug 'tpope/vim-surround'                                                       " Change surround
Plug 'tpope/vim-unimpaired'                                                     " [/] mappings for vim
Plug 'tpope/vim-abolish'                                                        " For crm, crs, crc, cru case changes
Plug 'vim-scripts/visualrepeat'                                                 " Visual mode repeat
Plug 'vim-scripts/matchit.zip'                                                  " % works for more languages
Plug 'wellle/targets.vim'                                                       " Quotes, Separator, brace objects

" Buffers, Tags, QuickFix, Undo
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --key-bindings --completion --no-update-rc' }
Plug 'junegunn/fzf.vim'                                                         " fuzzy searching
Plug 'mbbill/undotree'                                                          " Traverse the undotree
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }                              " Tags viewer

" VCS Related
Plug 'tpope/vim-fugitive'                                                       " Best Git integration

" Completions and compilations
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

" Support for different filetypes
Plug 'sheerun/vim-polyglot'                                                     " Syntax highlighthing
Plug 'tpope/vim-apathy'                                                         " figure out import statements

" UI
Plug 'itchyny/lightline.vim'

" Experimental
" Plug 'tpope/vim-dispatch'                                                       " Async command exec in vim

call plug#end()
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Plugins Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YCM
"""""""""""""
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gR :YcmCompleter RefactorRename<CR>
nnoremap go :YcmCompleter OrganizeImports<CR>
nnoremap K :YcmCompleter GetDoc<CR>
nnoremap <leader>g :YcmDiags<CR>

let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_tags_file = 1
let g:ycm_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_auto_hover = ''

" ALE
"""""""""""""
nmap <silent> [w <Plug>(ale_previous_wrap)
nmap <silent> ]w <Plug>(ale_next_wrap)

" FZF
"""""""""""""
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" Tagbar
"""""""""""""
let g:tagbar_left = 1
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => VIM user interface (UI)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme settings
colorscheme default

" Allow unsaved files
set hidden

" Set the title of the terminal
set title

" Always show current position
set ruler

" This is the most awesome configurationa ever, is shows both
" the absolute and relative numbering together to make jumps
" easier
set number

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Indicate this is a fast terminal
set ttyfast

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Mark the current line
set cursorline

" This prevents redraw for git-gutter/errors as signcolumn always is present
set signcolumn=yes

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Search Related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When searching try to be smart about cases
set smartcase
set ignorecase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Taken from www.vi-improved.org/recommendations
if executable("rg")
    set grepprg=rg\ -H\ --no-heading\ --vimgrep
endif
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Fold
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding is enabled by default
set foldenable

" Only very nested blocks will be folded
set foldlevelstart=2 " 99 means everything will open up

" Don't open folds on search
set fdo-=search
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and completions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set fileencoding=utf-8
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set to auto read when a file is changed from the outside
set autoread

" Sets how many lines of history VIM has to remember and undolevels
set history=9999
set undolevels=9999

" If you use git + undo long enough, and have a durable laptop which doesn't
" explode, you can do without swaps and backups
set noswapfile
set nowb
set nobackup

" Time travelling with vim
" All changes are automatically saved; All undos are logged, so we can always move
" back and forth between changes and files without worrying
set undofile
set undodir=~/.vim/undodir//
au FocusLost * silent! wa

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on

" Netrw setup
" This converts netrw to a poor man's project finder
let g:netrw_banner=0                                    " Don't show hideous banner
let g:netrw_altv=1                                      " Open splits to the right
let g:netrw_liststyle=3                                 " Tree view
let g:netrw_winsize=20                                  " Occupy 25% of the screen

" Use '*' for fuzzy search, and suggest completions on command line
set wildmenu

" Tab completion: mimics the behaviour of zsh
set wildmode=list:longest,full

" Adding omnicomplete
set ofu=syntaxcomplete#Complete

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.so,*.swp,*.zip,*/tmp/*
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Text, and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

" Migrated to editorconfig
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab "Converts tabs into space characters

" Textwrap at 120 haracters
set tw=120
set wrap

" Indentation
set autoindent "Auto indent
set smartindent "Smart indent
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Do not show editor mode
set noshowmode

" Height of the command bar
set cmdheight=2
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Key bindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
let g:mapleader = " "

" Paste should always re-indent
nnoremap p ]p

" The annoying jump over wrapped lines is removed
nnoremap j gj
nnoremap k gk

" Taken from @Tarrasch's vimrc
" Edit vimrc
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Exit
nnoremap <leader>q :q<CR>

" In ex mode use <C-p> <C-n> for scroll
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" white spaces
nnoremap <silent> <leader>w :set list!<CR>

" Paste from clipboard
nnoremap <leader>v :set paste<CR>"+p:set nopaste<CR>

" Sudo this file if opened without root priveileges
nnoremap <leader>u <Esc>:w !sudo tee % >/dev/null<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Redir output from vim commands to scratch
command! -nargs=1 -complete=command -bar -range Redir silent call functions#redir#Redir(<q-args>, <range>, <line1>, <line2>)

" Remove trailing whitespace
" Taken from www.vi-improved.org/recommendations
nnoremap <Leader>fw :<C-U>call functions#stripwhitespace#StripTrailingWhitespace()<CR>

" Qargs populates args list with quickfix search list
" Taken from vim tips book
command! -nargs=0 -bar Qargs execute 'args' functions#qargs#QuickfixFilenames()

" make list-like commands more intuitive
cnoremap <expr> <CR> functions#list#CCR()

" Autorun Commands
"""""""""""""""""""
augroup configgroup
    autocmd!

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    " Additional Syntax Highlighting
    au BufEnter *.mrconfig set filetype=dosini
    au BufEnter *.git set filetype=dosini
    au BufEnter *.vcsh set filetype=dosini
augroup END
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Experimental
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy text on exit
nmap <leader>y :w! /tmp/last_scratchpad.txt<CR>gg0vG$"+y:q!<CR>

" Get the count of a search string
nnoremap <leader>c <Esc>:%s///gn<CR>

" Reselect yanked text
nnoremap gy `[v`]

" Taken from: https://old.reddit.com/r/vim/comments/g66mfb/concealing_two_characters_with_concat/
" This converts <- into an arrow by using a conceal trick
"
" the last pattern returned is what match converts into something else, so first we convert < to arrow
" and then - to space
" last hi is for highlighting
setlocal conceallevel=1
call matchadd('Conceal', '<-\&<', 10, -1, {'conceal':'←'})
call matchadd('Conceal', '<\zs-', 10, -1, {'conceal':' '})
hi Conceal ctermbg=NONE ctermfg=red guifg=red

" Taken from: https://old.reddit.com/r/vim/comments/gc40ac/mapping_for_navigating_vim_jumplist_and_changelist/
" Jumplist navigation use C-v C-o/C-i to enter these sequences
nnoremap <leader>o :set nomore \| jumps \| set more<cr>:norm ^O<left>
nnoremap <leader>i :set nomore \| jumps \| set more<cr>:norm ^I<left>

" Changelist navigation, keepjumps makes sure jumplist is not changed
nnoremap <leader>; :changes<cr>:keepjumps norm g;<left><left>
nnoremap <leader>, :changes<cr>:keepjumps norm g,<left><left>
"}}}
