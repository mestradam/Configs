# Configs

Archivos de configuración personales

[Martín Estrada Mejía - 2022]


## Neovim

Poner el archivo `init.lua` en la carpeta `~/.config/nvim/`

Instalar los plugins con `:PackerSync`


## Octave

Poner el archivo `.octaverc` en la carpeta `~/`

Solo contiene un par de configuraciones para las figuras.


## Alacritty 

Poner el archivo `alacritty.yml` en la carpeta `~/.config/alacritty/`


## Emacs

Poner el archivo `init.el` en la carpeta `~/.emacs.d/`


## Terminal prompt

Poner en `~/.bashrc`

```
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\] \W > '
else
    PS1='\[\033[01;32m\] \W > '
fi
```

## Tmux

Poner el archivo `.tmux.config` en la carpeta `~/`

## fzf

Después de instalar, agregar lo siguiente al final de `~/.bashrc`

```
# source tmux extra keybindings

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
```
