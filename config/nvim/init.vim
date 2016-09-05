" Enable syntax detection
syntax on

" Show matching for symbols like () and etc.
set showmatch

" Show (partial) command in the last line of the screen.
set showcmd
set backup
set backupdir=~/.config/nvim/backup
set noswapfile
set viminfo='20,<1000

" Always display a status line at the bottom of the window
set laststatus=2

" Keep 3 lines visible down from the cursor while scrolling
set scrolloff=3

 " Enable mouse features
set mouse=a

let g:airline_powerline_fonts = 1
" Set mapleader to ,
let mapleader = ","
let maplocalleader = "\\"

" Line numbering
set number

" Act backspace as normal
set backspace=indent,eol,start

" Automatically refresh files
set autoread

" Manual highlighting
let hlstate=0
nnoremap <leader>h :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>
nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" 256 colors
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
let s:editor_root=expand("~/.config/nvim")
call vundle#rc(s:editor_root . "/bundle/")
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git integration in vim
Plugin 'tpope/vim-fugitive'

" Vim open on a file line
Plugin 'vim-scripts/file-line'

" Fuzzy file/buffer/tag/mru search
Plugin 'ctrlpvim/ctrlp.vim'

" Graphical undo
Plugin 'vim-scripts/Gundo'

Plugin 'drmikehenry/vim-extline'

" Mini buffer explorer
Plugin 'fholgado/minibufexpl.vim'

" Smart commenting
Plugin 'scrooloose/nerdcommenter'

" Project management
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'scrooloose/syntastic'

Plugin 'tomtom/tlib_vim'

Plugin 'vim-scripts/UltiSnips.git'

Plugin 'olethanh/openerp-snippets.vim'

Plugin 'godlygeek/tabular'

Plugin 'vim-scripts/TaskList.vim'

Plugin 'ehamberg/vim-cute-python'

Plugin 'vim-scripts/c.vim'

" Colorschemes
Plugin 'tomasr/molokai'

Plugin 'klen/python-mode'

Plugin 'majutsushi/tagbar'

Plugin 'Lokaltog/vim-easymotion'

" Surround helpers
Plugin 'tpope/vim-surround'

Plugin 'Valloric/YouCompleteMe'

" Syntax highlight for Dockerfiles
Plugin 'ekalinin/Dockerfile.vim'

" Git wrapping
Plugin 'tpope/vim-git'

" Helper for xml files
Plugin 'sukima/xmledit'

" Html file helper
Plugin 'mattn/emmet-vim'

" Js file helper
Plugin 'jelera/vim-javascript-syntax'

Plugin 'pangloss/vim-javascript'

Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'Raimondi/delimitMate'

" jQuery
Plugin 'vim-scripts/jQuery'

" Replace vanilla yaml syntax
Plugin 'stephpy/vim-yaml'

" Mako support
Plugin 'sophacles/vim-bundle-mako' 

"Haskell
Plugin 'lukerandall/haskellmode-vim'
Plugin 'raichoo/haskell-vim'

" Go lang support 
Plugin 'fatih/vim-go'

" Rename plugin
Plugin 'danro/rename.vim'

" Rust support
Plugin  'rust-lang/rust.vim'

" Toml support
Plugin 'cespare/vim-toml'

" Html fast editing
Plugin 'rstacruz/sparkup'

" Tmux
Plugin 'benmills/vimux'

" Sum floats in lines
Plugin 'vim-scripts/visSum.vim'

" Sort python imports
Plugin 'fisadev/vim-isort'


" SnipMate mutli-edit simulation
Plugin 'terryma/vim-multiple-cursors'

Plugin 'tell-k/vim-autopep8'

" Asynchronious checker
Plugin 'benekastah/neomake'


Plugin 'ryanoasis/vim-devicons'

Plugin 'tpope/vim-cucumber'

Plugin 'bling/vim-airline'

Plugin 'chrisbra/csv.vim'

Plugin 'vim-scripts/grep.vim'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme molokai
set background=dark

" Enable ctags support
set tags=./tags;/
" Escape comfortably from insert mode
inoremap jk <esc>

" Set fold level to open all methods arround
set foldlevel=100

" Simple Copy to system clipboard
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
let home_dir = "/home/karolis"

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:syntastic_mode_map = { "mode": "active", "active_filetypes": ["ruby", "php", "javascript", "c", "cpp"], "passive_filetypes": [] }
let g:syntastic_c_checkers = ['clang_check', 'gcc', 'make', 'splint']
let g:syntastic_python_checkers = ['pep8', 'flake8']

let g:neomake_python_enabled_makers = ['pep9', 'pylint', 'flake8']

let g:syntastic_python_pep8_args = "--ignore=E501"
let g:syntastic_python_flake8_args = "--builtins=unicode,xrange --ignore=E501"
let g:syntastic_python_python_exec = "/home/karolis/venv/py27/bin/python2"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_loc_list_height = 3
let g:syntastic_auto_jump = 0
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "ng']

let g:autopep8_ignore="E501"
nmap <leader>pep :Autopep8<cr>

nmap <leader>q :SyntasticCheck<cr>
nmap <leader>sd :SyntasticToggleMode<cr>


let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:pymode_rope = 0 
let g:pymode_lint = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_completion = 0
let g:haddock_browser = "open"

" Resize windows with arrows
nmap <right> :3wincmd ><cr>
nmap <left> :3wincmd <<cr>
nmap <up> :3wincmd +<cr>
nmap <down> :3wincmd -<cr>
nmap <leader>wv <C-w>s
nmap <leader>wh <C-w>v

map <C-h> <C-w>h
map <C-j> <C-w>
map <C-k> <C-w>k
map <C-l> <C-w>l

" Window close
map <leader>wc :wincmd q<cr>

" Window rotate
map <leader>wr <C-W>r

" Task list toggle
nmap <leader>tl :TaskList<cr>

" Buffer navigation
nmap tl :MBEbn<cr>
nmap th :MBEbp<cr>

" File types options ===================================================== {{{

    " Ignore these file types on :e
    set wildmenu
    set wildmode=list:longest
    set wildignore=*.swp,*.bak,*.pyc

    " If VIM founds project.vim file in project root, it will be loaded.
    " This is required if project has specific settings.
    silent! source project.vim

" }}}


" NERDTree toggle
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>gb :TagbarToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Pymode Toggle
nmap <leader>pm :PymodeLintToggle<CR>

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Tmux docker files
let g:VimuxResetSequence="C-c"

function! CheckProject()
	if !exists("g:OdooProject")
		let g:OdooProject = input('Project: ')
	endif
endfunction

function! VimuxTestProject()
	call CheckProject()
	call inputsave()
	let modules = input('Modules: ')
	call inputrestore()
	call VimuxSendKeys("C-c")
	let command = ("docker-start " . g:OdooProject . " --test-enable --log-level test --stop-after-init -u " . modules)
	call VimuxRunCommand(command)
endfunction

function! VimuxStartProject()
	call CheckProject()
	call inputsave()
	let parameters = input('Parameters:')
	call inputrestore()
	let command = ("docker-start " . g:OdooProject . " " . parameters)
	call VimuxRunCommand(command)
endfunction

function! VimuxReload()
	call VimuxSendKeys("C-c")
	call VimuxRunLastCommand()
endfunction

function! VimuxShutDown()
	call VimuxSendKeys("C-c")
	call VimuxSendKeys("C-c")
endfunction

function! VimuxDockerClean()
    call CheckProject()
    call VimuxShutDown()
    call VimuxRunCommand("dockerkill " . g:OdooProject)
endfunction

nmap <leader>rr :call VimuxStartProject()<CR>
nmap <leader>rt :call VimuxTestProject()<CR>
nmap <leader>rl :call VimuxReload()<CR>
nmap <leader>rc :call VimuxShutDown()<CR>
nmap <leader>rq :call VimuxDockerClean()<CR>


map P :TlistToggle<CR>

" Fugitive mappins
nmap <leader>git :Gstatus<CR>
nmap <leader>tb :CommandTBuffer<CR>

" File Editing actions
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Mappings
nnoremap <space> za
nnoremap <leader>` :call SetSpellingToggle()<cr>
au BufNewFile,BufRead *.gp set filetype=gnuplot

" Autosource vimrc file
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


let g:spelling_is_enabled = 0
function! SetSpellingToggle()
	if g:spelling_is_enabled
		set nospell
		let g:spelling_is_enabled = 0
	else
		set spell spelllang=lt
		setlocal spell spelllang=lt
		let g:spelling_is_enabled = 1
	endif
endfunction 

" If argument is x tabstop = 2x, softtabstop=x and shiftwidth=x
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = 2 * l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction


let g:pymode_lint_on_write = 0
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0

let g:ycm_rust_src_path="/home/karolis/my_files/projects/rust"

let g:UltiSnipsSnippetDirectories=["UltiSnips", "AngularSnips", "HonzaSnipps", "OdooSnipps"]

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
    \}


" Jump to the next or previous line that has the same level or a lower
" level of indentation than the current line.
"
" exclusive (bool): true: Motion is exclusive
" false: Motion is inclusive
" fwd (bool): true: Go to next line
" false: Go to previous line
" lowerlevel (bool): true: Go to line with lower indentation level
" false: Go to line with the same indentation level
" skipblanks (bool): true: Skip blank lines
" false: Don't skip blank lines
function! NextIndent(exclusive, fwd, lowerlevel, skipblanks)
  let line = line('.')
  let column = col('.')
  let lastline = line('$')
  let indent = indent(line)
  let stepvalue = a:fwd ? 1 : -1
  while (line > 0 && line <= lastline)
    let line = line + stepvalue
    if ( ! a:lowerlevel && indent(line) == indent ||
          \ a:lowerlevel && indent(line) < indent)
      if (! a:skipblanks || strlen(getline(line)) > 0)
        if (a:exclusive)
          let line = line - stepvalue
        endif
        exe line
        exe "normal " column . "|"
        return
      endif
    endif
  endwhile
endfunction

" Moving back and forth between lines of same or lower indentation.
nnoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
nnoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
nnoremap <silent> [L :call NextIndent(0, 0, 1, 1)<CR>
nnoremap <silent> ]L :call NextIndent(0, 1, 1, 1)<CR>
vnoremap <silent> [l <Esc>:call NextIndent(0, 0, 0, 1)<CR>m'gv''
vnoremap <silent> ]l <Esc>:call NextIndent(0, 1, 0, 1)<CR>m'gv''
vnoremap <silent> [L <Esc>:call NextIndent(0, 0, 1, 1)<CR>m'gv''
vnoremap <silent> ]L <Esc>:call NextIndent(0, 1, 1, 1)<CR>m'gv''
onoremap <silent> [l :call NextIndent(0, 0, 0, 1)<CR>
onoremap <silent> ]l :call NextIndent(0, 1, 0, 1)<CR>
onoremap <silent> [L :call NextIndent(1, 0, 1, 1)<CR>
onoremap <silent> ]L :call NextIndent(1, 1, 1, 1)<CR>


au BufRead,BufNewFile *.tikz set filetype=tex

" Use the following regexp to replace function kwarg values by kwargs
" themselves. Useful when inheriting a function with a lot of kwargs
" usage :'<,'>s/<C-R>=pyargs/g
let pyargs='\(\w\+\)=\(\w\+\)/\1=\1'

function! GitKExe() range
    let firstline = a:firstline
    let lastline = a:lastline
    if firstline == lastline
        execute "!gitk " . @%
    else
        execute '!gitk -L' . firstline . ',' . lastline . ':' . @%
    endif
endfunction
command! -range GitK <line1>,<line2>call GitKExe()
