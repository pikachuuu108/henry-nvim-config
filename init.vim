lua require('core.init')
"let $PYTHONPATH="/Users/henry/anaconda3/envs/tf/bin/python"

set guifont=SFMono\ NERD\ Font:h13
set clipboard^=unnamed,unnamedplus

if has('unix')
	set thesaurus+=/usr/share/dict/words
endif

autocmd FileType markdown setlocal spell

set mouse+=a

set langmenu=zh_CN.UTF-8 " 设置打开文件的编码格式
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8

set noswapfile

set completeopt=menu,menuone,noselect

set backspace=indent,eol,start

set ruler

set hidden

set clipboard+=unnamed

set cmdheight=2

set nobackup
set nowritebackup

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c


" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if

" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set smartindent

" Highlight the matched text while searching
set hlsearch

let mapleader="\<space>"

call plug#begin('$HOME/.local/share/nvim/plugged')

"Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Initialize plugin system
call plug#end()

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		"exec "!clear"
		"exec "!time python3 %"
		exec "!/Users/henry/anaconda3/envs/tf/bin/python %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		" exec "!go build %<"
		exec "!go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	endif
endfunc

" Black
if v:version < 700 || !has('python3')
	func! __BLACK_MISSING()
		echo "The black.vim plugin requires vim7.0+ with Python 3.6 support."
	endfunc
	command! Black :call __BLACK_MISSING()
	command! BlackUpgrade :call __BLACK_MISSING()
	command! BlackVersion :call __BLACK_MISSING()
	finish
endif

if exists("g:load_black")
  finish
endif

let g:load_black = "py1.0"
if !exists("g:black_virtualenv")
  if has("nvim")
	let g:black_virtualenv = "~/.vim/black"
  else
	let g:black_virtualenv = "~/.vim/black"
  endif
endif
if !exists("g:black_fast")
  let g:black_fast = 0
endif
if !exists("g:black_linelength")
  let g:black_linelength = 88
endif
if !exists("g:black_skip_string_normalization")
  if exists("g:black_string_normalization")
	let g:black_skip_string_normalization = !g:black_string_normalization
  else
	let g:black_skip_string_normalization = 0
  endif
endif
if !exists("g:black_skip_magic_trailing_comma")
  if exists("g:black_magic_trailing_comma")
	let g:black_skip_magic_trailing_comma = !g:black_magic_trailing_comma
  else
	let g:black_skip_magic_trailing_comma = 0
  endif
endif
if !exists("g:black_quiet")
  let g:black_quiet = 0
endif
if !exists("g:black_target_version")
  let g:black_target_version = ""
endif

function BlackComplete(ArgLead, CmdLine, CursorPos)
  return [
\    'target_version=py27',
\    'target_version=py36',
\    'target_version=py37',
\    'target_version=py38',
\    'target_version=py39',
\    'target_version=py310',
\  ]
endfunction

command! -nargs=* -complete=customlist,BlackComplete Black :call black#Black(<f-args>)
command! Black :call black#Black()
command! BlackUpgrade :call black#BlackUpgrade()
command! BlackVersion :call black#BlackVersion()


" NERDTree
augroup Group2
	autocmd!
	" NERDTree setting
	autocmd VimEnter * NERDTree | wincmd p
	" close VIM automatically when NERDTree is the last window
	autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |  quit | endif
	"autocmd FileType python let g:autoformatpython_enabled = 1
augroup END

nnoremap ff :Black<cr>

"nmap [b :bp<cr>
"nmap ]b :bn<cr>
"nmap <leader>d :bprevious<CR>:bdelete #<CR>

"nnoremap <leader><ESC> :noh<CR>

" go to next line in the screen
"nnoremap j gj
"nnoremap gj j
"nnoremap k gk
"nnoremap gk k

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
" ============================ coc.nvim ====================================
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  "" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" tagbar
nmap <F8> :TagbarToggle<CR>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

 "Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"xmap <leader>q  <Plug>(coc-format-selected)
"nmap <leader>q  <Plug>(coc-format-selected)
"
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

let g:rainbow_active = 1
"let g:rainbow_conf = {
"\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
"\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
"\	'guis': [''],
"\	'cterms': [''],
"\	'operators': '_,_',
"\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
"\	'separately': {
"\		'*': {},
"\		'markdown': {
"\			'parentheses_options': 'containedin=markdownCode contained', "enable rainbow for code blocks only
"\		},
"\		'lisp': {
"\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'], "lisp needs more colors for parentheses :)
"\		},
"\		'haskell': {
"\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], "the haskell lang pragmas should be excluded
"\		},
"\		'vim': {
"\			'parentheses_options': 'containedin=vimFuncBody', "enable rainbow inside vim function body
"\		},
"\		'perl': {
"\			'syn_name_prefix': 'perlBlockFoldRainbow', "solve the [perl indent-depending-on-syntax problem](https://github.com/luochen1990/rainbow/issues/20)
"\		},
"\		'stylus': {
"\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], "[vim css color](https://github.com/ap/vim-css-color) compatibility
"\		},
"\		'css': 0, "disable this plugin for css files
"\	}
"\}
