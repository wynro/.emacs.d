(defun asciify-text (&optional *begin *end)
  "Change European language characters into equivalent ASCII ones, ⁖ “café” ⇒ “cafe”.
When called interactively, work on current line or text selection.

URL `http://ergoemacs.org/emacs/emacs_zap_gremlins.html'
Version 2016-07-12"
  (interactive)
  (let ((-charMap
         [
          ["á\\|à\\|â\\|ä\\|ā\\|ǎ\\|ã\\|å\\|ą" "a"]
          ["é\\|è\\|ê\\|ë\\|ē\\|ě\\|ę" "e"]
          ["í\\|ì\\|î\\|ï\\|ī\\|ǐ" "i"]
          ["ó\\|ò\\|ô\\|ö\\|õ\\|ǒ\\|ø\\|ō" "o"]
          ["ú\\|ù\\|û\\|ü\\|ū"     "u"]
          ["Ý\\|ý\\|ÿ"     "y"]
          ["ç\\|č\\|ć" "c"]
          ["ď\\|ð" "d"]
          ["ľ\\|ĺ\\|ł" "l"]
          ["ñ\\|ň\\|ń" "n"]
          ["þ" "th"]
          ["ß" "ss"]
          ["æ" "ae"]
          ["š\\|ś" "s"]
          ["ť" "t"]
          ["ř\\|ŕ" "r"]
          ["ž\\|ź\\|ż" "z"]
          ])
        -begin -end
        )
    (if (null *begin)
        (if (use-region-p)
            (progn
              (setq -begin (region-beginning))
              (setq -end (region-end)))
          (progn
            (setq -begin (line-beginning-position))
            (setq -end (line-end-position))))
      (progn
        (setq -begin *begin)
        (setq -end *end)))
    (let ((case-fold-search t))
      (save-restriction
        (narrow-to-region -begin -end)
        (mapc
         (lambda (-pair)
           (goto-char (point-min))
           (while (search-forward-regexp (elt -pair 0) (point-max) t)
             (replace-match (elt -pair 1))))
         -charMap)))))

(defun asciify-string (*string)
  "Returns a new string. European language chars are changed ot ASCII ones ⁖ “café” ⇒ “cafe”.
See `asciify-text'
Version 2015-06-08"
  (with-temp-buffer
    (insert *string)
    (asciify-text (point-min) (point-max))
    (buffer-string)))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
