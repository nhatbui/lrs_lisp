#! /usr/local/bin/clisp

;;; (c) 2016 Nhat Bui

(defun findall (char str start indices) 
    (setq pos (position char str :start start))
    (if pos
        (findall char  str (1+ pos) (append indices (list pos)))
        indices)
)

(setq s (read-line))
(setq indices (findall #\Space s 0 ()))
(print
    (sort indices #'(lambda (x y) (string< (substring s x) (substring s y)))))
