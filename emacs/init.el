
;; Archivo de configuración para Emacs
;; Martín Estrada Mejía

;; -------------------------------------------------------------------
;;; Code:

(setq inhibit-startup-message t)        ; Remover la pantalla inicial
(scroll-bar-mode -1)                    ; Remover barra scroll
(tool-bar-mode -1)                      ; Remover barra herramientas
(tooltip-mode -1)                       ; Remover tooltips
(menu-bar-mode -1)                      ; Remover barra de menues
(set-fringe-mode 3)                     ; Margen 3 pixeles

;; (set-face-attribute 'default nil :height 100)
(set-face-attribute 'default nil :font "Fira Code Light" :height 110) ; fuente
(load-theme 'wombat)                    ; Tema de colores
(set-cursor-color "#ff00ff")            ; Color del cursor

(column-number-mode t)                  ; Mostrar número de columna
;; (global-display-line-numbers-mode t)    ; Números de línea siempre
(global-visual-line-mode t)             ; Bajar en líneas visuales, wraped

(setq-default indent-tabs-mode -1)      ; Indent con espacios (no TAB)
(setq-default tab-width 2)              ; 2 espacios por tab

(setq auto-save-default nil)            ; No crear archivos #autosave#
(setq create-lockfiles nil)             ; No crear archivos .#
(setq make-backup-files nil)            ; No crear archivos backup~
(global-set-key (kbd "<escape>") 'keyboard-escape-quit) ; ESC para salir del prompt

;; Abrir siempre archivos .m en modo octave
;; (autoload 'octave-mode "octave-mod" nil t)
(setq auto-mode-alist
      (cons '("\\.m$" . octave-mode) auto-mode-alist))

;; -------------------------------------------------------------------
;;; Packages:

;; Inicializar Melpa para instalar paquetes
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

;; Paquete use-package (es más cómo para instalar otros paquetes)
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Paquete auto-complete
(use-package auto-complete
        :config (ac-config-default))

;; Paquete evil (varias cosas de vim en emacs)
(use-package evil
        :config (evil-mode 1)) ; descomentar para activarlo automaticamente

;; Paquete ivy (muestra información en el buffer de comandos)
(use-package ivy)
	:config (ivy-mode 1)

;; Paquete útil para aprender comandos en Emacs
(use-package which-key
        :init (which-key-mode 1)
        :diminish which-key-mode
        :config (setq which-key-idle-delay 1.5))

;; Paquete magit (ayudas para git)
(use-package magit)

;; Paquete markdown para archivos de notas generales
(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
        :config (setq markdown-enable-math t))

;; Paquete svelte-mode (para aplicaciones web con svelte y sveltekit)
(use-package svelte-mode)

;; Paquete multiple-cursors (editar en varios lugares al tiempo)
(use-package multiple-cursors
        :init (multiple-cursors-mode 1)
        :bind
        ("C-c m c" . mc/edit-lines)
        ("M-n" . mc/mark-next-lines)
        ("M-p" . mc/mark-previous-lines))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
         (quote
                (svelte-mode prettier multiple-cursors rainbow-delimiters markdown-mode magit which-key ivy evil auto-complete use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
