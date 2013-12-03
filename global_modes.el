(global-undo-tree-mode)
(global-rainbow-delimiters-mode)
(global-linum-mode)
(projectile-global-mode)
(ido-mode t)
(ido-vertical-mode t)
(ido-everywhere t)
(flx-ido-mode t)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)
(setq ido-enable-flex-matching t
      flx-ido-use t
      flx-ido-threshhold 1000
      ido-auto-merge-work-directories-length -1)
