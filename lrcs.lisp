#! /usr/local/bin/clisp

;;; (c) 2016 Nhat Bui

(defun _split-sequence (char str start indices) 
    (let ((pos (position char str :start start)))
         (if (not pos)
            (append indices (list (substring str start)))
            (_split-sequence char str (1+ pos) (append indices (list (substring str start pos))))))
)

(defun split-sequence (char str)
    (_split-sequence char str 0 ())
)

(defun _findall (char str start indices)
    (let ((pos (position char str :start start)))
         (if (not pos)
             indices
             (_findall char str (1+ pos) (append indices (list pos)))))
)

(defun findall (char str)
    (_findall char str 0 ())
)

(defun _join (str-seq char result)
    (if (not str-seq)
        result
        (_join (rest str-seq) char (concatenate 'string result char (first str-seq))))
)

(defun join (str-seq char)
    (_join (rest str-seq) char (first str-seq))
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
             ((string= s1 s2) (_seq< (rest seq1) (rest seq2) (1+ index)))))
)

(defun seq< (seq1 seq2)
    (_seq< seq1 seq2 0)
)

(defun makesuffixarray (tokenindices tokens)
     (sort tokenindices #'(lambda (x y) (seq< x y)) :key #'(lambda (x) (subseq tokens x)))
)

(defun _tokenseqlength (seq count)
    (if (not seq)
        count
        (_tokenseqlength (rest seq) (+ count (length (first seq)) 1)))
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
    (if (= lcslen (abs (- p1 p2)))
        T
        NIL)
)

(defun lcsfromsuffixes (suffixes tokens)
    (let ((suffix1 (first suffixes))
          (suffix2 (second suffixes)))
         (findlcs (subseq tokens suffix1) (subseq tokens suffix2)))
)


(defun checklrcs (suffixes tokens positions lrcs)
    (let ((lcs (lcsfromsuffixes suffixes tokens)))
         (let ((lcslen (tokenseqlength lcs))
               (p1 (nth (first suffixes) positions))
               (p2 (nth (second suffixes) positions)))
              (if (and lcs
                       (> lcslen (tokenseqlength lrcs))
                       (checkconsecutive lcslen p1 p2))
                  lcs
                  lrcs)))
)

(defun _findlrcs (suffixes tokens positions lrcs)
    ;; Find the longest repeating substring for this suffix array
    (let ((lrcs (checklrcs suffixes tokens positions lrcs)))
         (if (<= (list-length suffixes) 2)
             lrcs
             (_findlrcs (cdr suffixes) tokens positions lrcs)))
)

(defun findlrcs (suffixes tokens positions)
    (_findlrcs suffixes tokens positions NIL)
)

(defun _range (count i l)
    (if (<= count 0) 
        l
        (_range (1- count) (1+ i) (append l (list i))))
)

(defun range (count)
    (_range count 0 ())
)

(let ((s (read-line))) 
     (let ((tokens (split-sequence #\Space s))
           (strpos (append (list 0) (mapcar #'1+ (findall #\Space s)))))
          (let ((tokenidx (range (length tokens))))
               (let ((suffixarray (makesuffixarray tokenidx tokens)))
                    (let ((lrcs (findlrcs suffixarray tokens strpos)))
                         (print (join lrcs (list #\Space))))))))

