(define bars-num 8)
(set-num-frequency-bins (+ bars-num 1))

(define (get-colour n)
  (vector (sin n) (sin (- 0 n)) (cos (- 0 n))))
(define (x-bars n)
  (cond ((not (= n 0))
	 (translate (vector 1.5 0 0))
	 (with-state
	  (scale (vector 1 1 0.5))
	  (draw-cube))
	 (x-bars (- n 1)))))

(define (y-bars n fn)
  (cond ((not (= n 0))
	 (with-state 
	  (colour (get-colour n))
	  (x-bars (fn n)))
	 (translate (vector 0 1.5 0))
	 (y-bars (- n 1) fn))))

(define (bars n)
  (y-bars n (lambda (n) (floor (/ (gh n) 10)))))

(every-frame (bars bars-num))