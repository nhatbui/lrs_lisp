#! /usr/local/bin/clisp

;;; (c) 2016 Nhat Bui

(defun _findLongest (li best)
  (if (not li)
    best
    (_findLongest (cdr li) (if (> (length (car li)) (length best)) (car li) best)))
)

(defun findLongest (li)
  (_findLongest li "")
)

(defun findlcp (a b)
  (let ((i (string< a b)))
    (subseq a 0 i))
)

(defun getSuffix (pos str)
  (subseq str pos)
)

(defun _makeLCPList (suffixarr str l)
  (let ((lcp (findlcp (getSuffix (first suffixarr) str) (getSuffix (second suffixarr) str))))
    (if (<= (list-length suffixarr) 2)
      (append l (cons lcp ()))
      (_makeLCPList (cdr suffixarr) str (append l (cons lcp ())))))
)

(defun makeLCPList (suffixarr str)
  (_makeLCPList suffixarr str ())
)

(defun _range (count i l)
  (if (>= i count)
      l
      (_range count (1+ i) (append l (cons i ()))))
)

(defun range (count)
    (_range count 0 ())
)

(let ((s (read-line)))
  (let ((suffixarray (sort (range (length s)) #'(lambda (x y) (string< x y)) :key #'(lambda (i) (subseq s i)))))
    (let ((lcplist (makeLCPList suffixarray s)))
      (let ((lrs (findLongest lcplist)))
        (print lrs))))
)
