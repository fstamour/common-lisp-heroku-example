
(in-package #:cl-user)

(defpackage #:example.compile
    (:use :cl))

(in-package #:example.compile)

(load (make-pathname :directory (pathname-directory *load-pathname*) :defaults "example.asd"))

(ql:quickload
 (asdf:system-depends-on
  (asdf:find-system "example")))

(setf uiop:*image-entry-point* #'(lambda ()
				   (format t "~%About to load \"compile.lisp\".")
				   (load "compile.lisp")))

(uiop:dump-image "dependencies.core"
   :executable t
   #+sbcl :compression #+sbcl t)

