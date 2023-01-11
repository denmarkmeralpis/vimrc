set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale'
Plugin 'kylef/apiblueprint.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'preservim/nerdtree'
Plugin 'itmammoth/run-rspec.vim'
Plugin 'rstacruz/sparkup'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'vwxyutarooo/nerdtree-devicons-syntax'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'cj/vim-webdevicons'
Plugin 'joshdick/onedark.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'gregsexton/matchtag'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin on
set number relativenumber
set list

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd BufWritePre * %s/\s\+$//e
augroup END

let g:airline_powerline_fonts = 1
let g:indentLine_color_gui = '#444c56'
set backspace=indent,eol,start
set history=50
set ruler
set showcmd
set wildmenu
set ttimeout
set ttimeoutlen=100
set display=truncate
set scrolloff=5
set nosmartindent

if has ("autocmd")
  filetype indent on
endif

set nowrap
set colorcolumn=80
set mouse=a
set tags^=./.git/tags;
set cursorline
let g:ale_linters = {
      \   'ruby': ['rubocop'],
      \   'javascript': ['eslint'],
      \ }
" let g:ale_fixers= {
"       \   'javascript': ['prettier', 'eslint'],
"       \ }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_brakeman_executable = 'bundle'
let g:ale_set_highlights = 0

map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!bundle exec rspec"
let g:run_rspec_bin = 'bundle exec rspec'
set encoding=UTF-8
let g:user_emmet_leader_key=','
set timeoutlen=1000 ttimeoutlen=0

nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>vc :e ~/.vimrc<CR>
nnoremap <leader>vcr :source ~/.vimrc<CR>
nnoremap <S-h> :wincmd h<CR>
nnoremap <S-j> :wincmd j<CR>
nnoremap <S-k> :wincmd k<CR>
nnoremap <S-l> :wincmd l<CR>
nnoremap nf :NERDTreeFind<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>z :tabe %<CR>
nnoremap <leader>sw :set shiftwidth=2<CR>

if $TERM_PROGRAM != "Apple_Terminal"
  if has('termguicolors')
    set termguicolors
    let g:onedark_termcolors = 256
  endif
endif

" colorscheme one_monokai
" colorscheme onedark
colorscheme onehalfdark

let g:airline_theme='onedark'
let g:airline#extensions#hunks#enabled = 0
set diffopt+=vertical

hi vertsplit guifg=fg guibg=bg

if $PATH !~ "\.rbenv"
  let $PATH="/home/username/.rbenv/shims:/home/username/.rbenv/bin:" . $PATH
endif

let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop -a'
set clipboard=unnamed
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let g:fzf_layout = { 'down': '~21%' }
let s:beige = "F5C06F"
set shiftwidth=2

syntax enable

hi ALEWarning ctermbg=8


highlight! link NERDTreeFlags NERDTreeHelp
