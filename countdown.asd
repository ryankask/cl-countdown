;;;; countdown.asd

(asdf:defsystem #:countdown
  :serial t
  :description "Displays upcoming London bus arrivals for a particular stop."
  :author "Ryan Kaskel <dev@ryankaskel.com>"
  :license "BSD"
  :depends-on (#:drakma #:cl-json #:cl-ppcre)
  :components ((:file "package")
               (:file "datetime")
               (:file "countdown")))
