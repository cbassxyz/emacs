;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs
;;; Sebastian's Custom Emacs (so far)

(require 'package)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(package-refresh-contents)

;; Package Configurations


;; lsp-mode

(use-package lsp-mode
  :init  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (rustic-mode . lsp)
	 ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)

;; rustic

(require 'rustic)
  (setq rustic-lsp-server 'rust-analyzer)
(use-package rustic
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer"))
  :init
  (rustic-mode))

;; corfu

(use-package corfu
  :init
  (global-corfu-mode))
(setq corfu-auto t
      corfu-quit-no-match t)
(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq tab-always-indent 'complete))

;; flycheck

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-inline
  :demand t
  :init
  (add-hook 'flycheck-mode-hook #'turn-on-flycheck-inline))

;; theme

(setq custom-safe-themes t)
(load-theme 'wombat t)

;; init.el ends here
