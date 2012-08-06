;;;; package.lisp

(defpackage #:countdown
  (:use #:cl)
  (:shadowing-import-from #:drakma #:http-request)
  (:shadowing-import-from #:split-sequence #:split-sequence)
  (:shadowing-import-from #:json #:decode-json-from-string))
