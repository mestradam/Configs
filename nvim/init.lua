---------------------------------------------------------------------
-- Archivo de configuración para neovim
-- Martín Estrada Mejía
-- 2021
---------------------------------------------------------------------

-- {{{ Variables locales de ayuda -----------------------------------

local set = vim.opt
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- }}}

-- {{{ Plugins ------------------------------------------------------

-- instalar packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- instalar paquetes
local use = require('packer').use
require('packer').startup(function()
  use { 'wbthomason/packer.nvim' } -- Package manager

  use { 'rakr/vim-one' } -- tema de colores one (dark/light)

  use { 'kyazdani42/nvim-web-devicons' } -- mejores íconos
  use { 'kyazdani42/nvim-tree.lua' } -- arbol de archivos
  use { 'nvim-lualine/lualine.nvim' } -- barra de estátus e información
  use { 'lukas-reineke/indent-blankline.nvim' } -- ayuda líneas indentadas

  use { 'nvim-lua/plenary.nvim' } -- algunas funciones necesarias para varios paquetes
  use { "terrortylor/nvim-comment" } -- comentar/descomentar
  use { 'nvim-treesitter/nvim-treesitter' } -- mejor coloreado
  use { 'nvim-telescope/telescope.nvim' } -- fuzzy finder

  use { 'akinsho/toggleterm.nvim' } -- abrir/cerrar terminal

  -- use { 'neovim/nvim-lspconfig' } -- colores syntaxis, completar, etc.
  -- use { 'hrsh7th/nvim-compe' } -- autocompletar

--   use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
--   use { 'saadparwaiz1/cmp_luasnip' } -- snippets com cmp

  use { 'lewis6991/gitsigns.nvim' } -- cambios git repo
end)

-- activar y configurar paquetes
vim.opt.termguicolors = true
set.background = 'light'
vim.cmd('colorscheme one')

require('lualine').setup{}
require('nvim_comment').setup{comment_empty = false}
require('nvim-treesitter.configs').setup{ ensure_installed = "maintained", highlight = { enable = true } }
require('indent_blankline').setup{ buftype_exclude = {"terminal"} }
require('nvim-tree').setup{}

require('gitsigns').setup{
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '│', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
}

-- }}}

-- {{{ Configuración general ----------------------------------------

-- algunos ajustes generales
vim.g.mapleader = ' ' -- tecla SPC para leader
vim.g.tex_flavor = 'latex'
set.swapfile = false
set.mouse = 'a'
set.autochdir = true
set.hidden = true
set.scrolloff = 2
-- plegado del código
set.foldenable = true
set.foldmethod = 'marker'
-- números de línea
set.number = true
set.relativenumber = false
-- líneas largas
set.wrap = true
set.linebreak = true
set.breakindent = true
-- tabulaciones (indentación)
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
-- búsqueda de palabras
set.ignorecase = true
set.smartcase = true
set.wrapscan = true
set.incsearch = true
-- dividir derecha y abajo
set.splitright = true
set.splitbelow = true

vim.g.markdown_folding = 1

-- }}}

-- {{{ Mappings (atajos de teclado) ---------------------------------

map('i', 'jk', '<ESC>', opts) -- ESC rápido con jk
map('i', 'kj', '<ESC>', opts) -- ESC rápido con kj
map('n', '<leader>ve', ':e $MYVIMRC<CR>', opts) -- abrir init.lua
map('n', '<leader>vs', ':source $MYVIMRC<CR>', opts) -- source init.lua

map('t', '<Esc>', '<C-\\><C-n>', opts) -- salir del INSERT en terminal
map('n', '<leader>oe', ':NvimTreeToggle<CR>', opts) -- abrir/cerrar arbol
map('n', '<leader>ot', ':ToggleTerm size=10 <cr>', opts) -- abrir terminal

map('n', '<C-s>', ':w<CR>', opts) -- grabar archivo
map('i', '<C-s>', '<ESC>:w<CR>', opts) -- grabar archivo
map('n', '<C-q>', ':qall<CR>', opts) -- cerrar todo
map('i', '<C-q>', '<ESC>:qall<CR>', opts) -- cerrar todo
map('n', '<leader>qq', ':qall<CR>', opts) -- cerrar todo

map('n', 'j', 'gj', opts) -- mover: visual abajo
map('n', 'k', 'gk', opts) -- mover: visual arriba
map('v', 'j', 'gj', opts) -- mover: visual abajo
map('v', 'k', 'gk', opts) -- mover: visual arriba
map('n', '<down>', 'gj', opts) -- mover: visual abajo
map('n', '<up', 'gk', opts) -- mover: visual arriba
map('v', '<down>', 'gj', opts) -- mover: visual abajo
map('v', '<up>', 'gk', opts) -- mover: visual arriba
map('i', '<c-j>', '<c-o>gj', opts) -- mover: visual abajo
map('i', '<c-k>', '<c-o>gk', opts) -- mover: visual arriba
map('i', '<c-h>', '<c-o>h', opts) -- mover: visual izquierda
map('i', '<c-l>', '<c-o>l', opts) -- mover: visual derecha

map('n', '<leader>ww', '<C-w>w', opts) -- ventana: otra
map('n', '<leader>wd', ':q<CR>', opts) -- ventana: cerrar
map('n', '<leader>wj', '<C-w>J', opts) -- ventana: mover abajo
map('n', '<leader>wl', '<C-w>L', opts) -- ventana: mover derecha
map('n', '<leader>wr', '<C-w>r', opts) -- ventana: rotar
map('n', '<leader>ws', ':sp<cr>', opts) -- ventana: dividir horizontal
map('n', '<leader>wv', ':vsp<cr>', opts) -- ventana: dividir vertical

map('n', '<c-h>', '<c-w>h', opts) -- ventana: enfocar izquierda
map('n', '<c-j>', '<c-w>j', opts) -- ventana: enfocar abajo
map('n', '<c-k>', '<c-w>k', opts) -- ventana: enfocar arriba
map('n', '<c-l>', '<c-w>l', opts) -- ventana: enfocar derecha
-- map('t', '<c-h>', '<c-\><c-n><c-w>h', opts) -- terminal: enfocar izquierda
-- map('t', '<c-j>', '<c-\><c-n><c-w>j', opts) -- terminal: enfocar abajo
-- map('t', '<c-k>', '<c-\><c-n><c-w>k', opts) -- terminal: enfocar arriba
-- map('t', '<c-l>', '<c-\><c-n><c-w>l', opts) -- terminal: enfocar derecha

map('n', '<TAB>', ':bnext<CR>', opts) -- buffer: siguiente
map('n', '<s-TAB>', ':bprevious<CR>', opts) -- buffer: anterior
map('n', '<leader>s', ':w<CR>', opts) -- buffer: grabar
map('n', '<leader>bw', ':w<CR>', opts) -- buffer: grabar
map('n', '<leader>bd', ':bd<CR>', opts) -- buffer: cerrar

map('n', '<m-j>', ':m .+1<CR>==', opts) -- desplazar: abajo
map('n', '<m-k>', ':m .-2<CR>==', opts) -- desplazar: arriba
map('i', '<m-j>', '<ESC>:m .+1<CR>==gi', opts) -- desplazar: abajo
map('i', '<m-k>', '<ESC>:m .-2<CR>==gi', opts) -- desplazar: arriba
map('v', '<m-j>', ":m '>+1<CR>gv=gv", opts) -- desplazar: abajo
map('v', '<m-k>', ":m '<-2<CR>gv=gv", opts) -- desplazar: arriba

map('n', '<leader>y', '"+y', opts) -- portapapeles: copiar
map('v', '<leader>y', '"+y', opts) -- portapapeles: copiar
map('n', '<leader>p', '"+p', opts) -- portapapeles: pegar después
map('v', '<leader>p', '"+p', opts) -- portapapeles: pegar después
map('n', '<leader>P', '"+P', opts) -- portapapeles: pegar antes
map('v', '<leader>P', '"+P', opts) -- portapapeles: pegar antes
map('n', '<leader>d', '"+d', opts) -- portapapeles: cortar
map('v', '<leader>d', '"+d', opts) -- portapapeles: cortar

map('n', '<leader>ff', ':Telescope find_files<cr>', opts) -- telescope: archivos
map('n', '<leader>fg', ':Telescope live_grep<cr>', opts) -- telescope: texto
map('n', '<leader>fb', ':Telescope buffers<cr>', opts) -- telescope: buffers
map('n', '<leader>fh', ':Telescope help_tags<cr>', opts) -- telescope: ayuda
map('n', '<leader>fo', ':Telescope oldfiles<cr>', opts) -- telescope: últimos
map('n', '<leader>ft', ':Telescope tags<cr>', opts) -- telescope: últimos
map('n', '<leader>fc', ':Telescope commands<cr>', opts) -- telescope: comandos

map('n', '<leader>gb', ':Telescope git_branches<cr>', opts) -- git: ramas
map('n', '<leader>gf', ':Telescope git_files<cr>', opts) -- git: archivos
map('n', '<leader>gs', ':Telescope git_status<cr>', opts) -- git: status
map('n', '<leader>gc', ':Telescope git_commits<cr>', opts) -- git: commits

map('n', '<leader>la', ':! pdflatex %<CR>', opts) -- latex: compilar pdflatex
map('n', '<leader>lp', ':! pdflatex %<CR>', opts) -- latex: compilar pdflatex
map('n', '<leader>lu', ':! lualatex %<CR>', opts) -- latex: compilar lualatex
map('n', '<leader>lb', ':! biber %:r<CR>', opts) -- latex: compilar biber
map('n', '<leader>lr', ':! rm *.aux *.bbl *.bcf *.blg *.log *.nav *.out *.run.xml *.snm *.toc *.vrb && disown <CR><CR>', opts) -- latex: borrar aux
map('n', '<leader>lv', ':! zathura %:r.pdf && disown <CR><CR>', opts) -- latex: visualizar en zathura

-- }}}

