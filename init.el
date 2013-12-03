(require 'cask "~/.cask/cask.el")

(cask-initialize)
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
