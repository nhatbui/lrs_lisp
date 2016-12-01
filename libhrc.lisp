#! /usr/local/bin/clisp

;;; (c) 2016 Nhat Bui

(defun _split-sequence (char str start indices) 
    (let ((pos (position char str :start start)))
         (if pos
            (_split-sequence char str (1+ pos) (append indices (list (substring str start pos))))
            (append indices (list (substring str start)))))
)

(defun split-sequence (char str)
    (_split-sequence char str 0 ())
)

(defun _findall (char str start indices)
    (let ((pos (position char str :start start)))
         (if pos
             (_findall char str (1+ pos) (append indices (list pos)))
             indices))
)

(defun findall (char str)
    (_findall char str 0 ())
)

(defun _join (str-seq char result)
    (if str-seq
        (_join (rest str-seq) char (concatenate 'string result char (car str-seq)))
        result)
)

(defun join (str-seq char)
    (_join (rest str-seq) char (car str-seq))
)

(defun _seq< (seq1 seq2 index)
    (cond
        ((and (not seq1) (not seq2)) NIL)
        ((and (not seq1) seq2) index)
        ((and seq1 (not seq2)) NIL))
    (let ((s1 (first seq1))
          (s2 (first seq2)))
         (cond
             ((string< s1 s2) index)
             ((string> s1 s2) NIL)
             ((string= s1 s2) (_seq< (cdr seq1) (cdr seq2) (1+ index)))))
)

(defun seq< (seq1 seq2)
    (_seq< seq1 seq2 0)
)

(defun makesuffixes (itemslist suffixes)
    (if itemslist 
        (makesuffixes (rest itemslist) (append suffixes (list itemslist)))
        suffixes)
)

(defun makesuffixarray (tokenindices tokens)
    (let ((suffixes (makesuffixes tokenindices ())))
         (sort suffixes #'(lambda (x y) (seq< x y)) :key #'(lambda (x) (subseq tokens (first x)))))
)

(defun _tokenseqlength (seq count)
    (if seq
        (_tokenseqlength (cdr seq) (+ count (length (car seq)) 1))
        count)
)

(defun tokenseqlength (seq)
    (_tokenseqlength seq 0)
)    

(defun findlcs (suffix1 suffix2)
    ;; Find new longest common prefix if larger than bestlcp
    (let ((len (seq< suffix1 suffix2)))
         (if len
             (subseq suffix1 0 len)
             NIL))
)

(defun checkconsecutive (lcslen p1 p2)
    (if (= lcslen (- p1 p2))
        T
        NIL)
)

(defun lcsfromsuffixes (suffixes tokens)
    (let ((suffix1 (first suffixes))
          (suffix2 (second suffixes)))
         (findlcs (subseq tokens (first suffix1)) (subseq tokens (first suffix2))))
)


(defun checklrs (suffixes tokens positions lrs)
    (let ((lcs (lcsfromsuffixes suffixes tokens)))
         (let ((lcslen (tokenseqlength lcs))
               (p1 (nth (first (first suffixes)) positions))
               (p2 (nth (first (second suffixes)) positions)))
              (if (and lcs
                       (> lcslen (tokenseqlength lrs))
                       (checkconsecutive lcslen p1 p2))
                  lcs
                  lrs)))
)

(defun _findlrs (suffixes tokens positions lrs)
    ;; Find the longest repeating substring for this suffix array
    (let ((lrs (checklrs suffixes tokens positions lrs)))
         (if (> (list-length suffixes) 1)
             lrs
             (_findlrs (cdr suffixes) tokens (cdr positions) lrs)))
)


(defun findlrs (suffixes tokens positions)
    (_findlrs suffixes tokens positions NIL)
)

(defun _range (count i l)
    (if (> count 0) 
        (_range (1- count) (1+ i) (append l (list i)))
        l)
)

(defun range (count)
    (_range count 0 ())
)

(let ((s (read-line))) 
     (let ((tokens (split-sequence #\Space s))
           (strpos (findall #\Space s)))
          (setq strpos (append (list 0) (mapcar #'1+ strpos)))
          (let ((tokenidx (range (length tokens))))
               (let ((suffixarray (makesuffixarray tokenidx tokens)))
                    (print (findlrs suffixarray tokens strpos))))))

