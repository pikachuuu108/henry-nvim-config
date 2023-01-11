lua require('core.init')
"let $PYTHONPATH="/Users/henry/anaconda3/envs/tf/bin/python"

"set guifont=Source_Code_Pro_For_Powerline:h14
set guifont=MesloLGS\ NF:h15
"set guifont=SFMono\ NERD\ Font:h13
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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Initialize plugin system
call plug#end()

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		"exec "!g++ % -o %<"
        "exec "!clang % -o %<"
        exec "!g++ -std=c++17 -g % -o %:r && ./%:r"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		"exec "!clear"
		"exec "!time python3 %"
        "exec "!/Users/henry/anaconda3/envs/tf/bin/python %"
        exec "!/Users/henry.luohr/opt/anaconda3/envs/tf1.15/bin/python %"
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

" =============================== Black ==============================
"if v:version < 700 || !has('python3')
	"func! __BLACK_MISSING()
		"echo "The black.vim plugin requires vim7.0+ with Python 3.6 support."
	"endfunc
	"command! Black :call __BLACK_MISSING()
	"command! BlackUpgrade :call __BLACK_MISSING()
	"command! BlackVersion :call __BLACK_MISSING()
	"finish
"endif

"if exists("g:load_black")
  "finish
"endif

"let g:load_black = "py1.0"
"if !exists("g:black_virtualenv")
  "if has("nvim")
    "let g:black_virtualenv = "/Users/henry.luohr/opt/anaconda3/envs/tf1.15/bin/python" 
	""let g:black_virtualenv = "~/.vim/black"
  "else
	"let g:black_virtualenv = "~/.vim/black"
  "endif
"endif
"if !exists("g:black_fast")
  "let g:black_fast = 0
"endif
"if !exists("g:black_linelength")
  "let g:black_linelength = 88
"endif
"if !exists("g:black_skip_string_normalization")
  "if exists("g:black_string_normalization")
	"let g:black_skip_string_normalization = !g:black_string_normalization
  "else
	"let g:black_skip_string_normalization = 0
  "endif
"endif
"if !exists("g:black_skip_magic_trailing_comma")
  "if exists("g:black_magic_trailing_comma")
	"let g:black_skip_magic_trailing_comma = !g:black_magic_trailing_comma
  "else
	"let g:black_skip_magic_trailing_comma = 0
  "endif
"endif
"if !exists("g:black_quiet")
  "let g:black_quiet = 0
"endif
"if !exists("g:black_target_version")
  "let g:black_target_version = ""
"endif
"if !exists("g:black_preview")
  "let g:black_preview = 0
"endif

"function BlackComplete(ArgLead, CmdLine, CursorPos)
  "return [
"\    'target_version=py27',
"\    'target_version=py36',
"\    'target_version=py37',
"\    'target_version=py38',
"\    'target_version=py39',
"\    'target_version=py310',
"\  ]
"endfunction

"command! -nargs=* -complete=customlist,BlackComplete Black :call black#Black(<f-args>)
"command! Black :call black#Black()
"command! BlackUpgrade :call black#BlackUpgrade()
"command! BlackVersion :call black#BlackVersion()


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



" ============================ coc.nvim ====================================

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=yes

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: There's always complete item selected by default, you may want to enable
"" no select by `"suggest.noselect": true` in your configuration file.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ coc#pum#visible() ? coc#pum#next(1) :
      "\ CheckBackspace() ? "\<Tab>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"" Make <CR> to accept selected completion item or notify coc.nvim to format
"" <C-g>u breaks current undo, please make your own choice.
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              "\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"function! CheckBackspace() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
  "inoremap <silent><expr> <c-space> coc#refresh()
"else
  "inoremap <silent><expr> <c-@> coc#refresh()
"endif

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call ShowDocumentation()<CR>

"function! ShowDocumentation()
  "if CocAction('hasProvider', 'hover')
    "call CocActionAsync('doHover')
  "else
    "call feedkeys('K', 'in')
  "endif
"endfunction

"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
  "autocmd!
  """ Setup formatexpr specified filetype(s).
  "autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  """ Update signature help on jump placeholder.
  "autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Run the Code Lens action on the current line.
"nmap <leader>cl  <Plug>(coc-codelens-action)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"if has('nvim-0.4.3') || has('patch-8.2.0750')
          "nnoremap <nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
          "nnoremap <nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
          "inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
          "inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"endif


" NERDTrees File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
"autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Red guifg=#ffa500
"autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Red guifg=#ffa500
"autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Red guifg=#ffa500

"autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFlags
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
"autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFlags,html
"autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFlags

let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeFileExtensionHighlightFullName = 1


" ================================= rainbow ================================
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
"
"
" ==================================== neovide ======================================
if exists("g:neovide")
    let g:neovide_scroll_animation_length = 1
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_trail_size = 0.2

    "  ---------- particle -----------
    "let g:neovide_cursor_vfx_mode = "wireframe"
    let g:neovide_cursor_vfx_mode = "pixiedust"
    let g:neovide_cursor_vfx_particle_lifetime = 4
    let g:neovide_cursor_vfx_particle_density = 10.0
    let g:neovide_cursor_vfx_particle_speed = 10.0

    " -------------- enable cmd V to paste ----------
    let g:neovide_input_use_logo = 1
    let g:neovide_input_macos_alt_is_meta = v:true
    map <D-v> "+p<CR>
    map! <D-v> <C-R>+
    tmap <D-v> <C-R>+
    vmap <D-c> "+y<CR> 
endif
