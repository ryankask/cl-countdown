;;;; countdown.asd

(asdf:defsystem #:countdown
  :serial t
  :description "Show nearby bus information."
  :author "Ryan Kaskel <dev@ryankaskel.com>"
  :license "BSD"
  :depends-on (#:drakma #:cl-json #:cl-ppcre)
  :components ((:file "package")
               (:file "datetime")
               (:file "countdown")))
