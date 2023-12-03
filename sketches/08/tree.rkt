#lang sketching

(require racket/list)

(define (setup)
  (size 200 200)
  (frame-rate 20)
  (loop))

(define Line cons)
(define ->0 car)
(define ->1 cdr)
(define Point cons)
(define ->x car)
(define ->y cdr)
(define Rgb list)
(define ->r first)
(define ->g second)
(define ->b third)

(define (draw/line my-line)
  (let [ (p1 (->0 my-line)) (p2 (->1 my-line)) ]
    (line (->x p1) (->y p1) (->x p2) (->y p2))))

;; Parameters
(define iterations 50)
(define spoke-ratio 0.6)
(define total-spokes 8)
(define max-spoke-depth 10)
(define (start-length) (/ (min width height) 5))
(define (start-point) (Point (/ width 2) (/ height 2)))
(define min-curvature 0.5)
(define max-curvature 2.0)

;; State
(define current-iteration 0)
(define spoke-depth -2)
(define curvature 0.4)

(define (get-color n)
  (Rgb
   (* 255 (+ n 0.9))
   180 255))

(define (tentacle point len angle spokes)
  (let [
        (p2 (Point (+ (->x point) (* len (cos angle)))
                   (+ (->y point) (* len (sin angle)))))
        (color (get-color (/ spokes total-spokes) ))
        ]
    (stroke (->r color) (->g color) (->b color))
    (draw/line (Line point p2))
    (if (> spokes 1)
        (begin
          (tentacle p2 (* len spoke-ratio) (+ angle curvature) (- spokes 1))
          (tentacle p2 (* len spoke-ratio) (- angle curvature) (- spokes 1)))
        '())))

(define (draw)
  (color-mode 'hsb 255)
  (background 0)
  (stroke-weight 2)
  (stroke 255 255 255)

  (for-each
   (lambda (angle)
     (tentacle (start-point) (start-length) (* angle (/ 2π total-spokes)) spoke-depth))
   (range 0 total-spokes))

  (if (= current-iteration iterations)
      (no-loop)
      (begin
        (set! current-iteration (+ current-iteration 1))
        (set! spoke-depth (min (+ spoke-depth 1) max-spoke-depth))
        (if (> current-iteration 8)
            (set! curvature (min (max (+ curvature 0.02) min-curvature) max-curvature))
            '()))))

