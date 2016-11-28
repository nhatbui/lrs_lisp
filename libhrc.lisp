#! /usr/local/bin/clisp

;;; (c) 2016 Nhat Bui

(defun findall (char str start indices) 
    (setq pos (position char str :start start))
    (if pos
        (findall char  str (1+ pos) (append indices (list (1+ pos))))
        indices)
)

(defun findlcp (i1 i2 doc bestlcp)
    ;; Find new longest common prefix if larger than bestlcp
    (setq s1 (substring doc i1))
    (setq s2 (substring doc i2))
    (setq len (string< s1 s2))
    (if (and (> len (length bestlcp)) (= (+ i2 len) (1- i1)))
        (substring s1 0 len)
        bestlcp)
)

(defun findlrs (index suffixes doc lrs)
    ;; Find the longest repeating substring for this suffix array
    (setq s1start (nth (1- index) suffixes))
    (setq s2start (nth index suffixes))
    (setq lrs (findlcp s1start s2start doc lrs))
    (if (>= (1+ index) (list-length suffixes))
        lrs
        (findlrs (1+ index) suffixes doc lrs))
)

(setq s (read-line))
(setq s (string-left-trim '(#\Space) s))
(setq indices (findall #\Space s 0 ()))
(setq indices (append (list 0) indices))
(setq suffixes
    (sort indices #'(lambda (x y) (string< (substring s x) (substring s y)))))
(print (findlrs 1 suffixes s NIL))

