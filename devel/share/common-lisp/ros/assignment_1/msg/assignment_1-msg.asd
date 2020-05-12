
(cl:in-package :asdf)

(defsystem "assignment_1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "bumper" :depends-on ("_package_bumper"))
    (:file "_package_bumper" :depends-on ("_package"))
    (:file "laser" :depends-on ("_package_laser"))
    (:file "_package_laser" :depends-on ("_package"))
  ))