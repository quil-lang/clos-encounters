;;;; singleton-class.lisp

(in-package :clos-encounters)

(defclass singleton-class (closer-mop:standard-class)
  ((instance :reader singleton-class-instance
             :initarg :instance
             :documentation "The instance of a singleton class."))
  (:documentation "Metaclass for singleton classes."))


(defmethod closer-mop:validate-superclass ((sub singleton-class) (sup closer-mop:standard-class))
  t)

(defmethod make-instance ((class singleton-class) &rest kwargs)
  (declare (ignorable kwargs))
  (if (slot-boundp class 'instance)
      (slot-value class 'instance)
      (setf (slot-value class 'instance) (call-next-method))))
