(defsystem eadr
  :serial t
  :depends-on (cl-fad esrap-peg cl-ppcre cl-json)
  :components ((:file "packages")
               (:file "utilities")
               (:file "parse-scraps")))
  
