(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "e80a0a5e1b304eb92c58d0398464cd30ccbc3622425b6ff01eea80e44ea5130e" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "c4e6fe8f5728a5d5fd0e92538f68c3b4e8b218bcfb5e07d8afff8731cc5f3df0" default)))
 '(pivotal-api-token "0299b8b762749c9a4819ef9c05c9744e")
 '(sp-autoescape-string-quote nil))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-to-list 'auto-mode-alist '("Cask" . lisp-mode))
(push "/usr/local/bin" exec-path)
(push "~/.rbenv/shims" exec-path)

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
(load-user-file "config.el")
(load-user-file "typing-speed.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 150 :foundry "apple" :family "Inconsolata_for_Powerline"))))
 '(linum ((t (:height 150))))
 '(mode-line ((t (:height 140)))))
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
