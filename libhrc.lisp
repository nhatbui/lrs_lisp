;;; (c) 2016 Nhat Bui

#! /usr/local/bin/clisp

(defun suffixarray (start str indices) 
    (setq pos (position #\Space str :start start))
    (if pos
        (suffixarray (1+ pos) str (append indices (list pos)))
        indices)
)

(setq s (read-line))
(print (suffixarray 0 s ()))
