(in-package :asdf)

(defsystem :example
  :name "example"
  :description "Example cl-heroku application"
  :depends-on (:alexandria
	       :clsql :clsql-postgresql ;for database access
	       :hunchentoot)
  :components
  ((:static-file "example.asd")
   (:module :src
	    :serial t      
	    :components
	    ((:file "hello-world")
	     (:file "db")))))

