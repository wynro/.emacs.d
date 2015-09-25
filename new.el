(progn 
  (setq l '(1 2 3))
  (prog1 
      (print (car l))
      (setq l (cdr l))
  )
)

(defun max(a) (_max (car a) (cdr a)))

(defun _max(a b) (if (eq b nil) a (if (> (car b) a) (_max (car b) (cdr b)) (_max a (cdr b)))))

(defun mean(a) (/ (suma a) (length a)))

(suma (list 1 2 3 3 ))

(mean (list 1 2 4))
(cdr (list 1 2 3))
(_max 1 (list 2 3))

(max (list 1 3 2 4 64 7 5 56 65 8 9 65 4))

(defun suma(a) (_suma (car a) (cdr a)))
(defun _suma(a b) (if (eq b nil) a (_suma (+ a (car b)) (cdr b))))

(defun foo (fn l)
  (mapcar fn l))

(defun bar(x) (+ 1 x))

(foo (lambda(x) "Sumar 3"  (+ 3 x)) '(1 2 3))

(defun extract-first(l)
(prog1 (car l) (setq l (cdr l)))
)

(progn (setq l '(1 2 3)) (prog1 (print (car l)) (setq l (cdr l))) (prog1 (print (car l)) (setq l (cdr l))) (prog1 (print (car l)) (setq l (cdr l))))
