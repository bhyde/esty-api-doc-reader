(in-package "EADR")

(defun make-keyword (text)
  (intern (string-upcase text) #.(symbol-package :key)))

(defun pathname-in-package (relative-pathname &optional (*package* *package*))
  (cl-fad:merge-pathnames-as-file
   (asdf:component-pathname
    (asdf:find-system
     (string-downcase ;; find-system downcases symbols names, but not strings.
      (package-name *package*))))
   relative-pathname))

(defun pathname-in-eadr (relative-pathname)
  (pathname-in-package relative-pathname #.*package*))

(defun load-whole-file (filename)
  (with-open-file (s filename)
    (let ((pad #.(make-string 100000)))
      (let ((chars (read-sequence pad s)))
        (subseq pad 0 chars)))))


