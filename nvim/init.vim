"
" Archivo de configuración para nvim (Martin Estrada)
"

" Configuraciones generales {{{
" -------------------------------------------------------------------

" Ajustes generales
syntax enable                 " activar syntax
filetype plugin indent on     " enable plugin and indent
let mapleader = "\<space>"    " mapleader en espacio
set nocompatible        " no compatbilidad con vi
set encoding=UTF-8      " encodaje por defecto de los archivos
set noswapfile          " no crear archivos swap
set mouse=a             " habilitar el mouse
set autochdir           " directorio de trabajo
set hidden              " permite cambiar de buffer sin guardar cambios
set scrolloff=2         " comenzar scroll 2 lineas antes del final
set laststatus=2        " mostrar siempre el estado
" set ruler               " mostrar barra de status
set wildmenu            " mostrar opciones en la barra al presionar <tab>
" set updatetime=300      " mostrar cambios (git y otros) más rápidamente
" set spell spelllang=es  " revisión ortografía (es, en)

" Plegado del código
set nofoldenable        " todos los fold abiertos al abrir
set foldmethod=syntax   " code folding
" set foldmethod=marker   " code folding

" Columna de cambios git o errores visible
" set signcolumn=yes

" Números de línea
set number              " activar números de línea
" set rnu                 " numeración relativa
" set cursorline          " Resaltar línea del cursor
" set cursorcolumn        " Resaltar la columna del cursor

" Plegado de líneas largas
set wrap                " wrap líneas largas
set linebreak           " wrap por palabra y no por letra
set breakindent         " mostrar líneas indentadas después de wrap

" Tabulaciones (indentación)
set tabstop=4 shiftwidth=4 softtabstop=4              " tamaño tabs
set expandtab smarttab autoindent smartindent         " tabulaciones

" Búsqueda de palabras
set ignorecase smartcase wrapscan incsearch hlsearch  " Búsqueda

" Ventanas nuevas a la derecha y abajo
set splitright          " abrir splits a la derecha
set splitbelow          " abrir splits abajo

" Tipo de archivos en formatos específicos
autocmd BufNewFile,BufRead *.m set filetype=octave
autocmd BufNewFile,BufRead *.ifc set syntax=stp
" }}}

" Colores {{{
" -------------------------------------------------------------------

set t_Co=256            " soporte para 256 colores
set termguicolors       " mejores colores en terminales modernos
set background=light    " esquema de colores con fondo oscuro
colorscheme one

" highlight Normal                  guibg=None
" highlight LineNr                  guibg=None guifg=#999999
" highlight GitGutterAdd            guibg=None guifg=green
" highlight GitGutterChange         guibg=None guifg=orange
" highlight GitGutterDelete         guibg=None guifg=red
" highlight GitGutterChangeDelete   guibg=None
" highlight clear SignColumn
" set colorcolumn=

" }}}

" Comandos y atajos de teclado {{{
" -------------------------------------------------------------------

" abrir y ejecutar la configuración de vim
" nmap <leader>ve :e $MYVIMRC<CR>
" nmap <leader>vs :source $MYVIMRC<CR>

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

" usar tab y shift+tab para moverse entre buffers
map <TAB> :bnext<CR>
map <s-TAB> :bprevious<CR>

" grabar también con W (mayúscula) para escribir rápido
command! W :w
command! Wq :wq
command! Q :q
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :q<CR>
nmap <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>

" salir del modo insert
imap jk <ESC>

" compilar pdflatex / compilar biber / borrar auxiliares / ver en zathura
map <Leader>la :! pdflatex %<CR>
map <Leader>lu :! lualatex %<CR>
map <Leader>lb :! biber %:r<CR>
map <Leader>lr :! rm *.aux *.bbl *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc *.vrb && disown <CR><CR>
map <Leader>lz :! zathura %:r.pdf && disown <CR><CR>
map <Leader>lo :! okular %:r.pdf && disown <CR><CR>

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
nnoremap <Leader>fe "=strftime('[%Y-%m-%d]')<CR>P

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

" Instalación de Plugins {{{
" -------------------------------------------------------------------

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    "autocmd VimEnter * PlugInstall
    "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'rakr/vim-one'

Plug 'nvim-lualine/lualine.nvim'      " statusbar
" Plug 'kyazdani42/nvim-web-devicons'   " mejores iconos
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

Plug 'neoclide/coc.nvim', {'branch': 'release'} " autocompletar

Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'

Plug 'metakirby5/codi.vim'

call plug#end()

" }}}

"  Configuración de plugins {{{
" -------------------------------------------------------------------

"" Settings for plugin: lualine
lua << END
require'lualine'.setup()
END

"" Settings for plugin: coc
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-ultisnips',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-toml',
    \ 'coc-clangd',
    \ 'coc-python',
    \ 'coc-texlab',
    \ 'coc-tsserver',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-svelte',
    \ 'coc-tailwindcss',
    \ 'coc-julia',
    \ 'coc-flutter',
    \ ]

"" Settings for plugin: deoplete (completar)
" let g:deoplete#enable_at_startup = 1

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
map <Leader>e :Lex<CR>
let g:netrw_winsize = 20 " ancho de ventana por defecto
let g:netrw_banner = 0 " quitar un banner que ocupa mucho espacio
let g:netrw_browse_split = 4 " open in prior window
let g:netrw_altv = 1 " open split to the right
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()
let g:netrw_list_hide = ',\(^\|\s\s\)\zs\.\S\+'

"" Configuración del terminal

" salir del modo terminal y quedar en NORMAL
tnoremap <Esc> <C-\><C-n> 
tnoremap <C-c> <C-\><C-n>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif " start terminal in insert mode
" Open terminal with leader+t
function! OpenTerminal()
  split term://bash
  resize 10
  setlocal nonumber
endfunction
nnoremap <leader>t :call OpenTerminal()<CR> 

let g:term_buf = 0
let g:term_win = 0

function! Term_toggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction


nnoremap <M-t> :call Term_toggle(10)<cr>
tnoremap <M-t> <C-\><C-n>:call Term_toggle(10)<cr>

" }}}

" -------------------------------------------------------------------
" vim:foldmethod=marker:foldlevel=0
