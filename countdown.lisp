;;;; countdown.lisp

(in-package #:countdown)

(setq drakma:*header-stream* nil)
(setq drakma:*text-content-types* (cons '("application" . "json")
                                        drakma:*text-content-types*))

(defparameter *my-stop-id* 54249) ;; Vauxhall Bridge Rd / Victoria Stn (M)
(defparameter *request-url* "http://countdown.api.tfl.gov.uk/interfaces/ura/instant_V1?StopCode1=~d&ReturnList=StopPointName,DestinationText,LineName,EstimatedTime")

(defun make-tfl-request (stop-id)
  (http-request (format nil *request-url* stop-id)))

(defun parse-tfl-json (response)
  "The TfL's API doesn't return real JSON for 'performance' reasons. We trim the response, turn it into legal JSON, then parse it."
  (decode-json-from-string
   (format nil "[~{~a~^, ~}]"
           (rest (split-sequence #\Newline (make-tfl-request *my-stop-id*))))))

(defun parse-tfl-response (response)
  (let ((upcoming-arrivals nil)
        (now (get-unix-time)))
    (dolist (arrival (parse-tfl-json response))
      (let* ((modified-arrival (rest arrival))
             (expected-time (fourth modified-arrival)))
        (setf (fourth modified-arrival) (/ (- (/ expected-time 1000) now) 60))
        (push modified-arrival upcoming-arrivals)))
    upcoming-arrivals))

(defun fetch-countdown-info ()
  (sort (parse-tfl-response (make-tfl-request *my-stop-id*))
        #'(lambda (x y) (< (fourth x) (fourth y)))))

(defun print-upcoming-bus-arrivals ()
  (dolist (upcoming-bus-arrival (fetch-countdown-info))
    (destructuring-bind (stop-name bus-number destination-name minutes)
        upcoming-bus-arrival
      (format t "Bus ~a to ~a will arrive in ~,2f minutes~%~%"
              bus-number destination-name minutes))))
