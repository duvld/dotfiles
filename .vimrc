set number relativenumber
set nu rnu


let mapleader=" "

noremap <Space> <Nop>
noremap <Leader>l :ls<Enter>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

map <Leader>b <C-^>
map <Leader>e 10<C-e>
map <Leader>n :bn<cr>
map <Leader>p :bp<cr>
map <Leader>w <C-w>
map <Leader>o o<esc>
map <Leader>O O<esc>
map <Leader>i i<Space><esc>r
map <Leader>a a<Space><esc>r
map <Leader>r :redo<cr>
map <Leader>s :SignifyToggle<cr>
map <Leader>u :UndotreeToggle<cr>
map <Leader>qqq :q<cr>
map <Leader>QQQ :q!<cr>
map <Leader>qqa :qa<cr>
map <Leader>QQA :qa!<cr>
map <Leader>c :IndentLinesToggle<cr>:set number!<cr>
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader><Leader>y "+y

"NERDTree bindings
map <Leader><Leader>h :NERDTreeFromBookmark hmn<cr>
map <Leader><Leader>n :NERDTreeToggle<cr>

" FZF stuff
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
map <Leader><Leader>a :Ag<cr>

set splitbelow
set splitright

" Resizing on focus
" set winwidth=104
" set winheight=5
" set winminheight=5
" set winheight=999
 
set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm
set nowrap
set backspace=2

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab 

set nocompatible  "be iMproved
set showcmd
syntax on
filetype off

set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#begin('~/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-fugitive'
Plugin 'dbarsam/vim-rainbow-parentheses'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
 Plugin 'Yggdroot/indentLine'
Plugin 'mhinz/vim-signify'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-surround'
Plugin 'edkolev/tmuxline.vim'
Plugin 'aming/vim-mason'
"Plugin 'craigemery/vim-autotag'
Plugin 'tomasr/molokai'
Plugin 'mhinz/vim-startify'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'calviken/vim-gdscript3'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
" Plugin 'luochen1990/rainbow'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'wincent/command-t'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'benmills/vimux'
Plugin 'andreasvc/vim-256noir'
"Plugin 'rafi/awesome-vim-colorschemes'
"Plugin 'qualiabyte/vim-colorstepper'
Plugin 'veloce/vim-aldmeris'
call vundle#end()

filetype plugin indent on

set laststatus=2



colorscheme gruvbox
highlight Normal ctermbg=NONE
" "Change theme depending on the time of day
let hr = (strftime('%H'))
if hr >= 23 
set background=dark
let g:gruvbox_contrast_dark='hard'
elseif hr >= 8 
set background=light
let g:gruvbox_contrast_light='hard'
set background=light
elseif hr >= 0
set background=dark
let g:gruvbox_contrast_dark='hard'
set background=dark
endif

" Anji's corner
set colorcolumn=80


"Airline options
let g:airline_theme='gruvbox'
" let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1

"Signify options
let g:signify_vcs_list = ['svn', 'git']

"Startify options
let g:startify_custom_header = startify#fortune#boxed(startify#fortune#quote())

"Fix gvim's weird resizing issue
set guioptions-=L
set guioptions-=r

"NERDTree options
let NERDTreeHijackNetrw=1

"Rainbow Parens
" let g:rainbow_active=1

"Folding options
let php_folding = 1        "Set PHP folding of classes and functions.
let php_htmlInStrings = 1  "Syntax highlight HTML code inside PHP strings.
let php_sql_query = 1      "Syntax highlight SQL code inside PHP strings.
let php_noShortTags = 1    "Disable PHP short tags.

"Show quotes in json files
set conceallevel=0

" syntactic java
" let g:syntastic_java_javac_classpath = '/home/anjitong/jpf/jpf.jar:/home/anjitong/jpf/java-classes'
" let g:syntastic_java_checkers=['java']
" let g:syntastic_java_javac_config_file_enabled = 1

" ALE java
let g:ale_java_javac_classpath = '/home/anjitong/jpf/jpf.jar:/home/anjitong/jpf/java-classes'
let g:ale_linters = {'java': []}

" autocmd! FileType c,cpp,java,php call CSyntaxAfter()

" Airline font options
  if has("gui_running")
      set encoding=utf8
      if has('gui_win32')
          set guifont=Droid\ Sans\ Mono\ for\ Powerline:h10
      else
          set guifont=Droid_Sans_Mono_for_Powerline\ 10
      endif
  else
      set t_Co=256
      let &t_AB="\e[48;5;%dm"
      let &t_AF="\e[38;5;%dm"
      inoremap <Char-0x07F> <BS>
      nnoremap <Char-0x07F> <BS>
  endif

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
   let @/ = ''
   if exists('#auto_highlight')
     au! auto_highlight
     augroup! auto_highlight
     setl updatetime=4000
     echo 'Highlight current word: off'
     return 0
  else
    augroup auto_highlight
    au!
    au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
  return 1
 endif
endfunction

" Java compilation
map <F9> :ProjectCreate -p  -n java<C-Left><C-Left><Left>

"FZF vim
" let g:fzf_colors =
" \ { 'fg':      [['Normal',       'fg']],
"     \ 'bg':      [['Normal',       'bg']],
"     \ 'hl':      [['Comment',      'fg']],
"     \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
"     \ 'bg+':     [['CursorColumn', 'bg']],
"     \ 'hl+':     [['Statement',    'fg']],
"     \ 'info':    [['PreProc',      'fg']],
"     \ 'prompt':  [['Conditional',  'fg']],
"     \ 'pointer': [['Exception',    'fg']],
"     \ 'marker':  [['Keyword',      'fg']],
"     \ 'spinner': [['Label',        'fg']],
"     \ 'header':  [['Comment',      'fg']] }
