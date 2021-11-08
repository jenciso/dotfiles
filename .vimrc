execute pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'junegunn/vim-easy-align'
Plug 'zxqfl/tabnine-vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/artify.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'rmolin88/pomodoro.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-markdown'
Plug 'preservim/NERDTree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

autocmd VimEnter *
 \ if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
 \ | PlugInstall | q
 \ | endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" set paste
set pastetoggle=<F3>

set nu
"se mouse+=a

set termguicolors

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set background=dark

set expandtab

nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"set guifont=Hack\ Nerd\ Font\ Regular\ 11
:se guifont=*

let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_background = 'hard'
let g:gruvbox_italic=1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_termcolors = 256
let g:gruvbox_material_ui_contrast = 'soft'
let g:gruvbox_material_current_word = 'grey background'
let g:gruvbox_material_diagnostic_text_highligh = 1 
let g:gruvbox_material_better_performance = 1
let g:airline_theme = 'gruvbox_material'

let g:ale_yaml_yamllint_options = '-d "{extends: relaxed, rules: {line-length: disable}}"'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
let g:NERDTreeColorMapCustom = {
    \ "Staged"    : "#0ee375",
    \ "Modified"  : "#d9bf91",
    \ "Renamed"   : "#51C9FC",
    \ "Untracked" : "#FCE77C",
    \ "Unmerged"  : "#FC51E6",
    \ "Dirty"     : "#FFBD61",
    \ "Clean"     : "#87939A",
    \ "Ignored"   : "#808080"
    \ }

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'gruvbox_material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

colorscheme gruvbox-material

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
