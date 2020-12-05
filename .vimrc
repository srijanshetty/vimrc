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
Plug 'michaeljsmith/vim-indent-object'                                          " Indentation as a text object

" Buffers, Tags, QuickFix, Undo
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --key-bindings --completion --no-update-rc' }
Plug 'junegunn/fzf.vim'                                                         " fuzzy searching
Plug 'mbbill/undotree'                                                          " Traverse the undotree
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }                              " Tags viewer

" VCS Related
Plug 'tpope/vim-fugitive'                                                       " Best Git integration

" Completions and compilations
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Support for different filetypes
Plug 'sheerun/vim-polyglot'                                                     " Syntax highlighthing
Plug 'tpope/vim-apathy'                                                         " figure out import statements

" UI
Plug 'itchyny/lightline.vim'

call plug#end()
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Plugins Specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COC
"""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

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

" Open new windows on bottom and right
set splitright
set splitbelow

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
set signcolumn=number

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Search Related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Taken from www.vi-improved.org/recommendations
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
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
nnoremap <silent> <leader>4 :set list!<CR>

" Paste from clipboard
nnoremap <leader>v :set paste<CR>"+p:set nopaste<CR>

" Split command separated arguments on each line
nnoremap <leader><leader>, V:s/[,)]/&\r/g <cr>='<

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Redir output from vim commands to scratch
command! -nargs=1 -complete=command -bar -range Redir silent call functions#redir#Redir(<q-args>, <range>, <line1>, <line2>)

" Remove trailing whitespace
" Taken from www.vi-improved.org/recommendations
nnoremap <Leader>fw :<C-U>call functions#stripwhitespace#StripTrailingWhitespace()<CR>

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
augroup END
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{ => Experimental
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sudo this file if opened without root priveileges
nnoremap <leader>u <Esc>:w !sudo tee % >/dev/null<CR>

" Get the count of a search string
nnoremap <leader>c <Esc>:%s///gn<CR>

" Reselect yanked text
nnoremap gy `[v`]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-@> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"}}}
"
