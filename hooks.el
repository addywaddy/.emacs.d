(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(add-hook 'markdown-mode-hook (lambda () (setq markdown-css-path "~/.emacs/resources/markdown/github.css")))
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'yaml-mode-hook (lambda () (electric-indent-local-mode -1)))
(add-hook 'css-mode-hook '(lambda ()
                            (setq css-indent-offset 2)))

(add-hook 'scss-mode-hook '(lambda ()
                             (setq scss-compile-at-save nil)
                             ))

(add-hook 'fci-mode '(lambda ()
                       (setq fci-rule-column 120)
                       (setq fci-rule-width 5)
                       (setq fci-rule-color "gray11")
                       ))
