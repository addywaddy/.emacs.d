(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

;; local sources
(setq el-get-sources
      '((:name lisppaste :type elpa)))

(setq my-packages
      (append
        '(el-get yasnippet soothe-theme cider smartparens rainbow-delimiters markdown-mode undo-tree)
        (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
                                        ; emacs configuration
(push "/usr/local/bin" exec-path)
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file "~/.emacs.d/")))

(load-user-file "settings.el")
(load-user-file "global_modes.el")
(load-user-file "keymappings.el")
(load-user-file "look.el")

