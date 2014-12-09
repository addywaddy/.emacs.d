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
(autoload 'turn-on-ruby-dev "ruby-dev" nil t)
(add-hook 'ruby-mode-hook 'turn-on-ruby-dev)
(wrap-region-add-wrapper "<%= " " %>" "=" '(web-mode))
(wrap-region-add-wrapper "#{" "}" "#" '(ruby-mode))
(wrap-region-add-wrapper "<% " " %>" "-" '(web-mode))
(add-hook 'ruby-mode-hook (lambda ()
                             (require 'smartparens-ruby)
                             (projectile-rails-mode t)))
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'javascript-mode (lambda() (setq js-indent-level 2)))

(add-hook 'dired-mode-hook (lambda ()
                             (linum-mode -1)
                             ))
(add-hook 'inf-ruby-mode-hook (lambda ()
                                (linum-mode -1)
                                ))
(add-hook 'after-init-hook 'global-company-mode)

;; haml-electric-backspace doesn't work with multiple-cursors. Here, we modify the mode-map from haml to unset the offending keybinding.
(add-hook 'haml-mode-hook (lambda ()
                            (define-key haml-mode-map (kbd "<backspace>") nil)
                            (define-key haml-mode-map (kbd "DEL") nil)))

(add-hook 'latex-mode
          (lambda ()
            (setq latex-run-command "pdflatex")))

(defun my-web-mode-hook ()
  (setq web-mode-enable-auto-pairing nil))

(add-hook 'web-mode-hook  'my-web-mode-hook)
