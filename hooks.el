(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(add-hook 'markdown-mode-hook (lambda () (setq markdown-css-path "~/.emacs/resources/markdown/github.css")))
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'yaml-mode-hook (lambda () (electric-indent-local-mode -1)))
