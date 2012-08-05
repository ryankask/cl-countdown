;;;; package.lisp

(defpackage #:countdown
  (:use #:cl)
  (:shadowing-import-from #:drakma #:http-request)
  (:shadowing-import-from #:cl-ppcre #:split)
  (:shadowing-import-from #:json #:decode-json-from-string))
