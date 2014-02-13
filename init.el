(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'auto-complete)
(add-to-list 'auto-mode-alist '("Cask" . lisp-mode))
(push "/usr/local/bin" exec-path)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d/")))

(defun open-init ()
  (interactive)
  (find-file "~/.emacs.d")
  )

(load-user-file "settings.el")
(load-user-file "global_modes.el")
(load-user-file "keymappings.el")
(load-user-file "look.el")
(load-user-file "hooks.el")
(load-user-file "functions.el")
(load-user-file "file-types.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("f41fd682a3cd1e16796068a2ca96e82cfd274e58b978156da0acce4d56f2b0d5" "978ff9496928cc94639cb1084004bf64235c5c7fb0cfbcc38a3871eb95fa88f6" "51bea7765ddaee2aac2983fac8099ec7d62dff47b708aa3595ad29899e9e9e44" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "d9639ebed5f3709f47b53e4bb8eea98a11455ab9336039cf06e9695a0233d5fb" "e53cc4144192bb4e4ed10a3fa3e7442cae4c3d231df8822f6c02f1220a0d259a" "41b6698b5f9ab241ad6c30aea8c9f53d539e23ad4e3963abff4b57c0f8bf6730" "405fda54905200f202dd2e6ccbf94c1b7cc1312671894bc8eca7e6ec9e8a41a2" "ae8d0f1f36460f3705b583970188e4fbb145805b7accce0adb41031d99bd2580" "1affe85e8ae2667fb571fc8331e1e12840746dae5c46112d5abb0c3a973f5f5a" default))))
