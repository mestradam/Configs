# Configs

Archivos de configuración personales

[Martín Estrada Mejía - 2022]


## Neovim

Poner el archivo `init.lua` en la carpeta `~/.config/nvim/`

```
mkdir ~/.config/nvim
ln ~/Documents/Configs/nvim/init.lua ~/.config/nvim/
```

Instalar los plugins con `:PackerSync`. Y luego instalar `xclip` para poder copiar al clipboard.


## Octave

Solo contiene un par de configuraciones para las figuras.

Poner el archivo `.octaverc` en la carpeta `~/`

```
ln ~/Documents/Configs/octave/octaverc ~/.octaverc
```


## Alacritty 

Poner el archivo `alacritty.yml` en la carpeta `~/.config/alacritty/`

```
mkdir ~/.config/alacritty
ln ~/Documents/Configs/alacritty/alacritty.yml ~/.config/alacritty/
```


## Emacs

Poner el archivo `init.el` en la carpeta `~/.emacs.d/`

```
mkdir ~/.emacs.d
ln ~/Documents/Configs/emacs/init.el ~/.emacs.d/
```


## Tmux

Instalar el administrador de plugins `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

Poner el archivo `.tmux.config` en la carpeta `~/`

```
ln ~/Documents/Configs/tmux/tmux.config ~/.tmux.config
```


## fzf

Después de instalar, agregar lo siguiente al final de `~/.bashrc`

```
# source tmux extra keybindings
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
```


## Terminal prompt

Poner en `~/.bashrc`

```
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\] \W > '
else
    PS1='\[\033[01;32m\] \W > '
fi
```
