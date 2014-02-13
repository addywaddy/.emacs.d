(require 'cask "~/.cask/cask.el")

(cask-initialize)
(require 'auto-complete)
(add-to-list 'auto-mode-alist '("Cask" . lisp-mode))
(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d/")))

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(load-user-file "settings.el")
(load-user-file "global_modes.el")
(load-user-file "keymappings.el")
(load-user-file "look.el")
(load-user-file "hooks.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d9639ebed5f3709f47b53e4bb8eea98a11455ab9336039cf06e9695a0233d5fb" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#110F13" :foreground "#F4EAD5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "apple" :family "Monaco"))))
 '(linum ((t (:inherit (shadow default) :background "#111013" :foreground "#404040" :height 100))))
 '(mode-line ((t (:background "#141414" :foreground "#828282" :box nil :height 120)))))
