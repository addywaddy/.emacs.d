(require 'url)
(require 'cl)
(browse-url "http//:google.com")

(require 'compile)
;; Find root directory by searching for Gemfile
(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  (let ((root (expand-file-name "/")))
    (loop
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

(defun rspec-compile-file ()
  (interactive)
  (compile (format "cd %s;zeus rspec %s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   ) t))

(defun rspec-compile-on-line ()
  (interactive)
  (compile (format "cd %s;zeus rspec %s:%s"
                   (get-closest-gemfile-root)
                   (file-relative-name (buffer-file-name) (get-closest-gemfile-root))
                   (line-number-at-pos)
                   ) t))

(defun alternative-file ()
  (file-relative-name (buffer-file-name))
  )

(add-hook 'rspec-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c l") 'rspec-compile-on-line)
            (local-set-key (kbd "C-c k") 'rspec-compile-file)
            ))

(defun herein ()
  (interactive)
  (let ((url-request-method "GET")
        (url "http://192.168.2.5/letmein"))
    (url-retrieve url
                  (lambda (status) (message "Enter!")))))








;; Copied from Ruby Tools, but would be nice to generalize and use as a function for toggling between certain predefined pairings:

(require 'ruby-mode)

(defvar ruby-tools-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-'") 'ruby-tools-to-single-quote-string)
    (define-key map (kbd "C-\"") 'ruby-tools-to-double-quote-string)
    (define-key map (kbd "C-:") 'ruby-tools-to-symbol)
    (define-key map (kbd "C-;") 'ruby-tools-clear-string)
    (define-key map (kbd "#") 'ruby-tools-interpolate)
    map)
  "Keymap for `ruby-tools-mode'.")


(defun ruby-tools-looking-around (back at)
  "Check if looking backwards at BACK and forward at AT."
  (and (looking-at-p at) (looking-back back)))

(defun ruby-tools-symbol-at-point-p ()
  "Check if cursor is at a symbol or not."
  (ruby-tools-looking-around ":[A-Za-z0-9_]*" "[A-Za-z0-9_]*"))

(defun ruby-tools-string-at-point-p ()
  "Check if cursor is at a string or not."
  (ruby-tools-string-region))

(defun ruby-tools-symbol-region ()
  "Return region for symbol at point."
  (list
   (save-excursion
     (search-backward ":" (line-beginning-position) t))
   (save-excursion
     (if (re-search-forward "[^A-Za-z0-9_]" (line-end-position) t)
         (1- (point))
       (line-end-position)))))

(defun ruby-tools-string-region ()
  "Return region for string at point."
  (let ((orig-point (point)) (regex "'\\(\\(\\\\'\\)\\|[^']\\)*'\\|\"\\(\\(\\\\\"\\)\\|[^\"]\\)*\"") beg end)
    (save-excursion
      (goto-char (line-beginning-position))
      (while (and (re-search-forward regex (line-end-position) t) (not (and beg end)))
        (let ((match-beg (match-beginning 0)) (match-end (match-end 0)))
          (when (and
                 (> orig-point match-beg)
                 (< orig-point match-end))
            (setq beg match-beg)
            (setq end match-end))))
      (and beg end (list beg end)))))

(defun ruby-tools-interpolate ()
  "Interpolate with #{} in some places."
  (interactive)
  (if (and mark-active (equal (point) (region-end)))
      (exchange-point-and-mark))
  (insert "#")
  (when (or
         (ruby-tools-looking-around "\"[^\"\n]*" "[^\"\n]*\"")
         (ruby-tools-looking-around "`[^`\n]*"   "[^`\n]*`")
         (ruby-tools-looking-around "%([^(\n]*"  "[^)\n]*)"))
    (cond (mark-active
           (goto-char (region-beginning))
           (insert "{")
           (goto-char (region-end))
           (insert "}"))
          (t
           (insert "{}")
           (forward-char -1)))))

(defun ruby-tools-to-symbol ()
  "Turn string at point to symbol."
  (interactive)
  (if (ruby-tools-string-at-point-p)
      (let* ((region (ruby-tools-string-region))
             (min (nth 0 region))
             (max (nth 1 region))
             (content (buffer-substring-no-properties (1+ min) (1- max))))
        (when (string-match-p "^\\([a-ZA-Z_][a-ZA-Z0-9_]*\\)?$" content)
          (let ((orig-point (point)))
            (delete-region min max)
            (insert (concat ":" content))
            (goto-char orig-point))))))

(defun ruby-tools-to-single-quote-string ()
  (interactive)
  (ruby-tools-to-string "'"))

(defun ruby-tools-to-double-quote-string ()
  (interactive)
  (ruby-tools-to-string "\""))

(defun ruby-tools-to-string (string-quote)
  "Convert symbol or string at point to string."
  (let* ((at-string
          (ruby-tools-string-at-point-p))
         (at-symbol
          (and (not at-string) (ruby-tools-symbol-at-point-p))))
    (when (or at-string at-symbol)
      (let* ((region
              (or
               (and at-symbol (ruby-tools-symbol-region))
               (and at-string (ruby-tools-string-region))))
             (min (nth 0 region))
             (max (nth 1 region))
             (content
              (buffer-substring-no-properties (1+ min) (if at-symbol max (1- max)))))
        (setq content
              (if (equal string-quote "'")
                  (replace-regexp-in-string "\\\\\"" "\"" (replace-regexp-in-string "\\([^\\\\]\\)'" "\\1\\\\'" content))
                (replace-regexp-in-string "\\\\\'" "'" (replace-regexp-in-string "\\([^\\\\]\\)\"" "\\1\\\\\"" content))))
        (let ((orig-point (point)))
          (delete-region min max)
          (insert
           (format "%s%s%s" string-quote content string-quote))
          (goto-char orig-point))))))

(defun ruby-tools-clear-string ()
  "Clear string at point."
  (interactive)
  (when (ruby-tools-string-at-point-p)
    (let* ((region (ruby-tools-string-region))
           (min (nth 0 region))
           (max (nth 1 region)))
      (delete-region (+ min 1) (- max 1)))))


;;;###autoload
(define-minor-mode ruby-tools-mode
  "Collection of handy functions for ruby-mode."
  :init-value nil
  :lighter " rt"
  :keymap ruby-tools-mode-map)

(add-hook 'ruby-mode-hook 'ruby-tools-mode)

(provide 'ruby-tools)

(defun rhtml-tools-rhtml-tag ()
  "Insert rhtml tag."
  (interactive)
  (insert "%=")
  (backward-char 2)
  (insert "<")
  (forward-char 2)
  (insert "  %>")
  (backward-char 3)
  )

(defvar rhtml-tools-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-M-=") 'rhtml-tools-rhtml-tag)
    map)
  "Keymap for `rhtml-tools-mode'.")

(provide 'rhtml-tools)

(define-minor-mode rhtml-tools-mode
  "Collection of handy functions for ruby-mode."
  :init-value nil
  :lighter " rt"
  :keymap rhtml-tools-mode-map)

(add-hook 'ruby-mode-hook 'ruby-tools-mode)
(eval-after-load 'ruby-mode
  '(progn
     (define-key ruby-mode-map (kbd "#") 'senny-ruby-interpolate)))

(add-hook 'web-mode-hook 'rhtml-tools-mode)
