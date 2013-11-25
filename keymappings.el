(setq mac-right-option-modifier nil)
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier nil)

(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "C-c k") 'kill-line)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-j") 'next-line)

(defun me-add-lisp-keys ()
    (local-set-key (kbd "C-j") 'next-line))

(add-hook 'lisp-interaction-mode-hook 'me-add-lisp-keys)

(global-set-key (kbd "\C-ch") help-map)
(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-l") 'forward-char)
