(defsystem eadr
  :serial t
  :depends-on (cl-fad esrap-peg cl-ppcre)
  :components ((:file "packages")
               (:file "utilities")
               (:file "parse-scraps")))
  
