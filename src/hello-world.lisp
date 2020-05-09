
(in-package #:common-lisp-user)

(defpackage #:example
  (:use :cl)
  (:export #:start))

(in-package #:example)

(defvar *port* nil)

(defvar *server* nil)

;;; Called at application initialization time.
(defun start ()
  (setf *port* (let ((port (uiop:getenv "PORT")))
		 (or (parse-integer port)
		     8080))
	*server* (make-instance 'hunchentoot:easy-acceptor
				:port *port*))
  (hunchentoot:start *server*)
  (format t "~&Server started on port ~d." *port*)
  (force-output)
  (loop :do (sleep 10)))





		   



