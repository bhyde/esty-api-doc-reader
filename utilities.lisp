(in-package "EADR")

(defun make-keyword (text)
  (intern (string-upcase text) #.(symbol-package :key)))

(defun pathname-in-eadr (relative-pathname)
  (cl-fad:merge-pathnames-as-file
   (asdf:COMPONENT-PATHNAME (asdf:find-system "eadr"))
   relative-pathname))

(defun load-whole-file (filename)
  (with-open-file (s filename)
    (let ((pad #.(make-string 100000)))
      (let ((chars (read-sequence pad s)))
        (subseq pad 0 chars)))))


