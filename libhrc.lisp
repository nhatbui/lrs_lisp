;;; (c) 2016 Nhat Bui

#! /usr/local/bin/clisp

(defun suffixarray (str)
    (defparameter i 0)
    (defparameter len (length str))
    (defparameter suffixArray ())
    (loop while (< i len)
        do (cond
               ((and (char-equal (char str i) #\Space)
                     (< (1+ i) len))
                (setq suffixArray (append suffixArray (list (symbol-value 'i))))
               ))
        (setq i (1+ i)))
    suffixArray
)

(setq s (read-line))
(print (suffixarray s))
