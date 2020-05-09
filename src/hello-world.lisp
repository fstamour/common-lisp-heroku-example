
(in-package #:common-lisp-user)

(defpackage #:example
  (:use :cl)
  (:export #:start))

(in-package #:example)

(defvar *port* 8080)

(defvar *server*
  (make-instance 'hunchentoot:easy-acceptor
		 :port *port*))

;;; Called at application initialization time.
(defun start ()
  (hunchentoot:start *server*)
  (format t "~&Server started on port ~d." *port*)
  (force-output)
  (loop :do (sleep 10)))





		   



