
(in-package #:example.compile)

(format t "~%About to load system \"example\".")
(ql:quickload '#:example)

(setf uiop:*image-entry-point* 'example:start)

(format t "~&example loaded, about to create executable.")
(uiop:dump-image "/example/lispapp"
   :executable t
   #+sbcl :compression #+sbcl t)

