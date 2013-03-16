(in-package "EADR")

;; This reads the files we captured with the shell script ./step1.sh
;; This is roughly in top down order.


(defvar *api-element-info* (make-hash-table :test #'equal))

(defmacro api-element-info (name) 
  `(gethash ,name *api-element-info*))

(defun load-all-api-elements ()
  (clrhash *api-element-info*)
  (with-open-file (s (pathname-in-eadr "scrapped_data/api-elements"))
    (loop for element = (or (read-line s nil nil) 
                            (return *api-element-info*))
         do (setf (api-element-info (make-keyword element))
                  (parse-api-element-info element)))))

(defun dump-api-decl ()
  (with-open-file (s (pathname-in-eadr "api-decl.lisp")
                     :direction :output 
                     :if-exists :rename-and-delete)
    (format s ";; This was automatically generated.")
    (format s "~&;; notice there is no in-package form")
    (loop
       initially (format s "~2&( ;; <<-- start the giant plist")
       finally (format s "~2&) ;; <<-- end the giant plist~&")
       for name being each hash-key of *api-element-info*
       as decl = (api-element-info name)
       do (format s "~3&~s~&" name)
         (pprint decl s)))
  (with-open-file (s (pathname-in-eadr "api-decl.json")
                     :direction :output 
                     :if-exists :rename-and-delete)
    (json:encode-json *api-element-info* s)))
         

(defun parse-api-element-info (name)
  (let ((offset 0)
        (text (load-whole-file
               (pathname-in-eadr 
                (format nil "scrapped_data/~a.txt" (string-downcase name))))))
    (setf zzz text)
    (labels ((next (g)
               "Returns the text matched by the grammar and advances offset past that."
               (multiple-value-bind (form new-offset)
                   (parse g text :junk-allowed t :start offset)
                 (setf offset new-offset)
                 form))
             (snip (delimeter)
               "Returns the text upto the the string delimeter, 
                sets offset just after that delimeter"
               (let ((next-offset (search delimeter text)))
                 (subseq text
                         (shiftf offset (+ next-offset (length delimeter)) )
                         next-offset)))
             (tidy (text)
               (cl-ppcre:regex-replace "\\s*$" text "")))
      (let (name overview fields associations methods)
        (setf name (next '<name>))
        (snip "Overview[anchor]")
        (next '<ws>)
        (setf overview (tidy (snip "Fields[anchor]")))
        (snip "Description")
        (let ((fields-text (snip "Associations[anchor]")))
          (setf fields (parse '<fields> fields-text)))
        (let ((ass-text (tidy (snip "Methods[anchor]"))))
          (setf aaa ass-text)
          (setf associations (parse '<associations> ass-text)))
        (setf bbb (subseq text offset))
        (setf methods (next '<methods>))
        `(:name ,name 
                :overview ,overview
                :fields ,fields
                :associations ,associations
                :methods ,methods)))))


;;;; Grammar for various sections of those files.


;;;; Fields

(defrule <fields> (and (+ <field>) <ws>)
  (:lambda (x) (first x)))
(defrule <field> (and (? <ws>) <id> <ws> <visiblity> <ws> <pscope> <ws> <type> <ws> <description>)
  (:destructure (a id b vis c pscope d type e description)
     (declare (ignore a b c d e))
     `(:id ,id :visiblity ,vis :permission-scope ,pscope :type ,type :description ,description)))
(defrule <visiblity> (or "public/private" "public" "private")  
  (:lambda (x) (make-keyword x)))
(defrule <description> (and <text> (* <more-description>))
  (:destructure (a b) (apply #'concatenate 'string a b)))
(defrule <more-description> (and (or #\return #\newline)
                                 "                                           "
                                 <text>)
  (:destructure (a b c) (declare (ignore a b)) c))

;;;; Associations

(defrule <associations> (or <association-table> <no-associations>))
(defrule <no-associations> (and <ws> "This resource has no associations.")
  (:constant nil))
(defrule <association-table> (and <association-header> <actual-associations>)
  (:lambda (x) (second x)))
(defrule <association-header>
    (and <ws> "Association" <ws> "Visibility Level" <ws> "Permission Scope" <ws> "Type" <ws> "Description")
  (:constant nil))
(defrule <actual-associations> (+ <actual-association>))
(defrule <actual-association>
    (and (? <ws>) <id> <ws> <visiblity> <ws> <pscope> <ws> <type> <ws> <description>)
  (:destructure (a id b vis c pscope d type e description)
     (declare (ignore a b c d e))
     `(:id ,id :visiblity ,vis :permission-scope ,pscope :type ,type :description ,description)))


;;;; Methods

(defrule <methods> (+ <method>))
(defrule <method>
    (and <ws> <id> "[anchor]" <method-name> <synopsis> <http-method> <method-uri> <parameters> <oauth?> <method-pscope>)
  (:destructure (a b c name synopsis http-method method-uri parameters oauth? method-pscope)
    (declare (ignore a b c))
    `(:method-name ,name
                   :synopsis ,synopsis
                   :http-method ,http-method
                   :method-uri ,method-uri
                   :parameters ,parameters
                   :oauth? ,oauth?
                   :pscope ,method-pscope)))
(defrule <method-name> (and <ws> "Method Name" <ws> <id>)
  (:lambda (x) (fourth x)))
(defrule <synopsis> (and <ws> "Synopsis" <ws> <text>)
  (:lambda (x) (fourth x)))
(defrule <http-method> (and <ws> "HTTP Method" <ws> "GET")
  (:lambda (x) (declare (ignore x)) :get))
(defrule <method-uri> (and <ws> "URI" <ws> <text>)
  (:lambda (x) (fourth x)))
(defrule <parameters> (or <no-parameters> <actual-parameters>))
(defrule <no-parameters> (and <ws> "Parameters" <ws> "none")
  (:lambda (x) (declare (ignore x)) nil))
(defrule <actual-parameters> (and <parameter-header> (+ <a-parameter>))
  (:lambda (x) (second x)))
(defrule <parameter-header> (and <ws> "Name" <ws> "Required" <ws> "Default" <ws> "Type")
  (:constant :ph))
(defrule <a-parameter> (and (or (and <ws> "Parameters" <ws>) <ws>)
                            <id> <ws> <y-or-n>
                            <spaces>
                            (or (and <value> <spaces> <type>)  (and <type>)))
  (:destructure (a id b required c remainder) 
                (declare (ignore a b c))
                `(:id ,id :required ,required 
                      ,@(if (cdr remainder) 
                            `(:default ,(first remainder) :type ,(third remainder))
                            `(:default nil :type ,(first remainder))))))
(defrule <oauth?> (and <ws> "Requires OAuth" <ws> <y-or-n>)
  (:lambda (x) (fourth x)))
(defrule <method-pscope> (and <ws> "Permission Scope" <ws> "none")
  (:lambda (x) (declare (ignore x)) nil))


;;;; Building blocks

(defrule <type> (or <array-type> <map-type> <enum-type> <id>))
(defrule <array-type> (and "array(" <id> ")")
  (:lambda (x) `(array-of ,(second x))))
(defrule <map-type> (and "map(" <id> "," <id> ")")
  (:destructure (a key b value c)
                (declare (ignore a b c))
                `(map ,key ,value)))
(defrule <enum-type> (and "enum(" <id> (+ (and ", " <id>)) ")")
  (:destructure (a first rest b)
                  (declare (ignore a b))
                  `(enum ,first ,@(mapcar #'second rest))))

(defrule <pscope> (or "none" "transactions_r" "billing_r" "email_r" "profile_r"
                      "shops_rw" "cart_rw" "address_w" "address_r" 
                      "listings_r" "listings_w"
                      "feedback_r" "favorites_rw" 
                      "cart_rw")
  (:lambda (x) (let ((x (make-keyword x)))
                 (if (eq x :none) nil x))))



;;;; Misc grammer for terminals and such.

(defrule <text> (+ (character-ranges (#\space #\~))) ;; aka the rest of this line
  (:lambda (x) (coerce x 'string)))
(defrule <y-or-n> (or "Y" "N")
  (:lambda (x) (if (string= "Y" x) t nil)))
(defrule <spaces> (+ " ") (:constant nil))
(defrule <ws> (+ <space>) (:constant nil))
(defrule <space> (or " " #\linefeed #\return "[anchor]") (:constant nil))
(defrule <id> (+ (character-ranges (#\a #\z) (#\A #\Z) (#\0 #\9) #\_))
  (:lambda (x) (coerce x 'string)))
(defrule <value> (or <id> <integer>))
(defrule <integer> (+ (character-ranges (#\0 #\9)))
  (:lambda (x) (parse-integer (coerce x 'string))))
(defrule <name> (and <ws> <id>)
  (:destructure (w i)
     (declare (ignore w))
     i))
