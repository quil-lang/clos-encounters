;;;; abstract-class.lisp

(in-package :clos-encounters)

(defclass abstract-class (closer-mop:standard-class)
  ()
  (:documentation "Metaclass for Abstract Classes"))


(defmethod closer-mop:validate-superclass ((sub abstract-class) (sup closer-mop:standard-class))
  t)

;; So that classes whose metaclass is ABSTRACT-CLASS can have
;; subclasses whose metaclass is STANDARD-CLASS
(defmethod closer-mop:validate-superclass ((sub closer-mop:standard-class) (sup abstract-class))
  t)

(defmethod make-instance ((class abstract-class) &rest ignore)
  (declare (ignore ignore))
  (error "Abstract class ~s cannot be instantiated" (class-name class)))
