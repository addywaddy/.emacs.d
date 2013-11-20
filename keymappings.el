(setq mac-right-option-modifier nil)
(setq mac-option-key-is-meta nil)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)
(setq mac-right-command-modifier nil)

(global-set-key (kbd "M-v") 'yank)
(global-set-key (kbd "M-c") 'kill-ring-save)
(global-set-key (kbd "M-u") 'undo-tree-visualize)
(global-set-key (kbd "C-k") 'next-line)
(global-set-key (kbd "C-j") 'previous-line)
(global-set-key (kbd "C-h") 'backward-char)
(global-set-key (kbd "C-l") 'forward-char)
