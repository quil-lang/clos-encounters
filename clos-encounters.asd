(asdf:defsystem #:clos-encounters
  :description "A collection of OOP patterns benefiting from the CLOS MOP."
  :author "Colin O'Keefe"
  :license "Unlicense"
  :version "0.1.0"
  :pathname "src/"
  :depends-on (#:closer-mop)
  :components ((:file "package")
               (:file "abstract-class")
               (:file "singleton-class")))
