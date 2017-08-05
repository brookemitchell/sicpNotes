;; 1.1.6 Conditional Expressions and Predicates
;; --------------------------------------------

(define (square x) (* x x ))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (abs x)
  (if (< x 0) (- x) x))

(define (abs2 x)
  (cond ((< x 0) (- x))
        (else x)))

;; *Exercise 1.3:* Define a procedure that takes three numbers as
;; arguments and returns the sum of the squares of the two larger
;; numbers.

(define (sum-of-squares-largest a b c)
  (cond
   ((and (> a b) (> b c)) (sum-of-squares a b))
   ((and (> a b) (> c b)) (sum-of-squares a c))
   ((and (> b a) (> a c)) (sum-of-squares b a))
   (else (sum-of-squares b c))
   )
  )

(= (sum-of-squares-largest 3 2 1)  13)
(= (sum-of-squares-largest 3 1 2)  13)
(= (sum-of-squares-largest 1 2 3)  13)
((= (sum-of-squares-largest 1 2 3)  1))

;; *Exercise 1.4:* Observe that our model of evaluation allows for
;; combinations whose operators are compound expressions.  Use this
;; observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))


;; *Exercise 1.5:* Ben Bitdiddle has invented a test to determine
;; whether the interpreter he is faced with is using
;; applicative-order evaluation or normal-order evaluation.  He
;; defines the following two procedures:

;; function that returns itself
(define (p) (p))

(define (test x y)
  ;; if normal order will delay evaluation till used.
  ;; will test if (= x 0) -> #t, return 0, won't evaluate y
  ;; if applicative will evaluate x & y args first.
  ;; will hang since y is recursive loop
  ;; in both cases (if #t a b) won't evaluate b
  (if (= x 0) 0 y)
  )

;; Then he evaluates the expression
(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses
;; applicative-order evaluation?  What behavior will he observe with
;; an interpreter that uses normal-order evaluation?  Explain your
;; answer. (Assume that the evaluation rule for the special form
;; `if' is the same whether the interpreter is using normal or
;; applicative order: The predicate expression is evaluated first,
;; and the result determines whether to evaluate the consequent or
;; the alternative expression.)


;; explanation given inlite
