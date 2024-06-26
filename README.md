# `CLOS-ENCOUNTERS`

A system including a few common OOP Patterns. 

- `abstract-class` 
- `singleton-class` 

## Example: Global DB

``` lisp

(defclass db ()
  ((person-table :initform (make-hash-table))
   (job-table :initform (make-hash-table)))
  (:metaclass singleton-class))
  
;; whenever you need to acces your DB you can instantiate the DB class:

(run-query (make-instance 'db) my-query) 

;; This works (though is perhaps a little goofy) because 

(eq (make-instance 'db) (make-instance 'db)) 

;; will always return T

```


# Example: Platonic Forms 

``` lisp 

(defclass aristotelian-espresso ()
  ((grind :initarg :grind)
   (roast :initarg :roast))
  (:metaclass abstract-class))
  
(make-instance 'aristotelian-espresso
    :grind :moderate
    :roast :moderate)
    
;; Abstract class ARISTOTELIAN-ESPRESSO cannot be instantiated
;;      [Condition of type SIMPLE-ERROR]
```


# Why?

This is a duplicate of a subset of of the functionality exposed in
[tfeb-lis-hax](https://github.com/tfeb/tfeb-lisp-hax). We reimplement
it here because `tfeb`'s library makes a decision to lazy load the
`closer-mop` system dependency in a way that does not agree with the
build process of [quilc](https://github.com/quil-lang/quilc) and
[qvm](https://github.com/quil-lang/qvm).  See [this
issue](https://github.com/quil-lang/quilc/issues/917) for context.

