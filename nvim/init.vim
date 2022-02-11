
" Archivo de configuración para nvim (Martin Estrada)


" Configuraciones generales {{{
" -------------------------------------------------------------------

syntax enable                 " activar syntax
filetype plugin indent on     " enable plugin and indent
let mapleader = "\<space>"    " mapleader en espacio

set nocompatible        " no compatbilidad con vi
set t_Co=256            " soporte para 256 colores
set encoding=UTF-8      " encodaje por defecto de los archivos
set noswapfile          " no crear archivos swap
set number              " activar números de línea
" set rnu                 " numeración relativa
set laststatus=2        " mostrar siempre el estado
set mouse=a             " habilitar el mouse
set ruler               " mostrar barra de status
set wildmenu            " mostrar opciones en la barra al presionar <tab>
set wrap                " wrap líneas largas
set linebreak           " wrap por palabra y no por letra
set breakindent         " mostrar líneas indentadas después de wrap
" set cursorline          " Resaltar línea del cursor
" set cursorcolumn        " Resaltar la columna del cursor
set tabstop=2 shiftwidth=2 softtabstop=2          " tamaño tabs
set expandtab smarttab autoindent smartindent     " tabulaciones
" set updatetime=300  " mostrar cambios git más rápidamente
set autochdir       " directorio de trabajo
set ignorecase smartcase wrapscan incsearch hlsearch  " Búsqueda
"set spell spelllang=es         " revisión ortografía (es, en)
set nofoldenable    " todos los fold abiertos al abrir
set foldmethod=syntax         " code folding
set hidden          " permite cambiar de buffer sin guardar cambios
autocmd BufNewFile,BufRead *.m set filetype=octave
autocmd BufNewFile,BufRead *.ifc set syntax=stp
set splitright      " abrir splits a la derecha
set splitbelow      " abrir splits abajo
set scrolloff=2     " comenzar scroll 2 lineas antes del final
set termguicolors   " mejores colores en terminales modernos
" }}}

" Instalación de Plugins {{{
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

Plug 'sheerun/vim-wombat-scheme'
Plug 'sainnhe/sonokai'
Plug 'rakr/vim-one'

Plug 'nvim-lualine/lualine.nvim'      " statusbar
Plug 'kyazdani42/nvim-web-devicons'   " mejores iconos
Plug 'tpope/vim-commentary' " toggle comments (gcc to comment line)

Plug 'mg979/vim-visual-multi', {'branch': 'master'} " multiples cursores

" Plug 'thaerkh/vim-indentguides'
Plug 'airblade/vim-gitgutter' " para trabajar con Git
Plug 'tpope/vim-fugitive' " para trabajar con Git
Plug 'sheerun/vim-polyglot' " better and more languages syntax
Plug 'vim-scripts/gmsh.vim' " sintaxis para archivos gmsh

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocompletar
let g:deoplete#enable_at_startup = 1

" Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletar
" Plug 'codechips/coc-svelte', {'do': 'npm install'} " autocompletar específico para svelte

call plug#end()

" }}}

"  Configuración de plugins {{{
" -------------------------------------------------------------------

"" Settings for plugin: lualine

lua << END
require'lualine'.setup()
END

"" Settings for plugin: vimtex, json y markdown

let g:tex_flavor = 'latex'
let g:tex_conceal = 0
let g:vimtex_syntax_conceal = 0
let g:vim_json_syntax_conceal = 0
let g:markdown_folding = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

""  Settings for plugin: UtilSnips

let g:completion_enable_snippet = 'UltiSnips'

"" Settings for plugin: fzf

" source /usr/share/doc/fzf/examples/fzf.vim
let g:fzf_layout = { 'down': '30%'}
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fb :Buffers<CR>
nnoremap <Leader>fl :Lines<CR>

"" Explorador de archivos netrw

map <Leader>t :Lex<CR>
let g:netrw_winsize = 20 " ancho de ventana por defecto
let g:netrw_banner = 0 " quitar un banner que ocupa mucho espacio
let g:netrw_browse_split = 4 " open in prior window
let g:netrw_altv = 1 " open split to the right
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'

"" Configuración del terminal

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
tnoremap <C-c> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+t
function! OpenTerminal()
  split term://bash
  resize 10
  setlocal nonumber
endfunction
nnoremap <c-t> :call OpenTerminal()<CR>

" }}}

" Colores {{{
" -------------------------------------------------------------------

" set background=dark " esquema de colores con fondo oscuro

" colorscheme sonokai 
" colorscheme one

colorscheme wombat

highlight Normal                  guibg=None
highlight LineNr                  guibg=None guifg=#444444
highlight GitGutterAdd            guibg=None guifg=green
highlight GitGutterChange         guibg=None guifg=orange
highlight GitGutterDelete         guibg=None guifg=red
highlight GitGutterChangeDelete   guibg=None
highlight clear SignColumn
set colorcolumn=

" }}}

" Comandos y atajos de teclado {{{
" -------------------------------------------------------------------

" moverse hacia arriba y abajo por líneas en pantalla y no por líneas físicas
" (wraped lines)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" usar alt+(hjkl) para enfocar o moverse entre ventanas
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" usar alt+(np) o leader+(np) para moverse entre buffers
map <A-n> :bnext<CR>
map <A-p> :bprevious<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>

" grabar también con W (mayúscula) para escribir rápido
command! W :w
command! Wq :wq
command! Q :q
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" compilar pdflatex / compilar biber / borrar auxiliares / ver en zathura
map <Leader>la :! pdflatex %<CR>
map <Leader>lu :! lualatex %<CR>
map <Leader>lb :! biber %:r<CR>
map <Leader>lr :! rm *.aux *.bbl *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc *.vrb && disown <CR><CR>
map <Leader>lv :! zathura %:r.pdf && disown <CR><CR>

" desplazar líneas seleccionadas hacia arriba o abajo
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" mejorar la visualiazación durante el scroll con el mouse
:map <ScrollWheelUp> <C-Y>
:map <S-ScrollWheelUp> <C-U>
:map <ScrollWheelDown> <C-E>
:map <S-ScrollWheelDown> <C-D>

" escribir la fecha actual entre corchetes
nnoremap <Leader>f "=strftime('[%Y-%m-%d]')<CR>P

" copiar, cortar y pegar al y del portapapeles
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>P "+P
nnoremap <Leader>d "+d
vnoremap <Leader>d "+d

" }}}

" -------------------------------------------------------------------
" vim:foldmethod=marker:foldlevel=0
