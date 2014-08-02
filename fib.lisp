(defpackage #:fib
  (:nicknames :fib)
  (:use #:cl))

(declaim (optimize (speed 3) (space 0) (debug 0) (safety 0)))

(in-package #:fib)
(export '(run))

(defun fibRec (qianVal zuoVal rem) 
  (if (= 0 rem) zuoVal (fibRec zuoVal (+ qianVal zuoVal) (- rem 1))))

(defun do-fib (x) 
  (cond
    ((= x 0) 0)
    ((= x 1) 1)
    (t (fibRec 0 1 (- x 1)))))

(defun do-work (acc rem)
  (if (= 0 rem) acc (do-work 
                     (+ acc (do-fib (mod (+ 1 acc) 50))) 
                     (- rem 1))))

(defun run ()
  (defvar start (get-internal-real-time))
  (format t "~d ~%"		     
	  (do-work 0 
		   (parse-integer (nth 1 sb-ext:*posix-argv*))))
  (defvar duration (- (get-internal-real-time) start))
  (format t "LANGUAGE  Lisp  ~d ~%" duration))


(sb-ext:save-lisp-and-die "lsfib" :toplevel #'run :executable t)
