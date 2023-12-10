#lang sketching

(define (setup)
  (size 1920 1080)
  (fullscreen)
  (smoothing 'smoothed)
  (no-cursor)
  ;; (frame-rate 1)
  ;; (loop)
  (no-loop)
  )

;; Config
(define iterations 14)
(define init-segment 900)

;; State
(define current-iteration 19)

(define Line cons)
(define ->0 car)
(define ->1 cdr)
(define Point cons)
(define ->x car)
(define ->y cdr)

(define (draw/line my-line)
  (let [ (p1 (->0 my-line)) (p2 (->1 my-line)) ]
    (line (->x p1) (->y p1) (->x p2) (->y p2))))

(define (split-line my-line dir)
  (let* [
         (x1 (->x (->0 my-line)))
         (y1 (->y (->0 my-line)))
         (x2 (->x (->1 my-line)))
         (y2 (->y (->1 my-line)))
         (len (dist x1 y1 x2 y2))
         (sidelen (sqrt (/ (* len len) 2)))
         (theta (atan2 (- y2 y1) (- x2 x1)))
         (slope (+ theta (* (/ pi 4) dir)))
         (p3 (Point
              (+ x1 (* sidelen (cos slope)))
              (+ y1 (* sidelen (sin slope)))))
         ]
    (cons (Line (->0 my-line) p3) (Line p3 (->1 my-line)))))

(define (dragon-curve my-line dir iteration)
  (let [ (lines (split-line my-line dir)) ]
    (if (<= iteration 0)
        (list (->0 lines) (->1 lines))
        (append
         (dragon-curve (->0 lines) 1 (- iteration 1))
         (dragon-curve (->1 lines) -1 (- iteration 1))))))

(define (draw)
  (background 21 18 31)
  (stroke-weight 1)
  (stroke-cap 'round)
  (stroke-join 'round)
  (stroke 50 39 99)
  (let* [
         (p1 (Point (- (/ width 2) (/ init-segment 2.38)) (- (/ height 2) (/ init-segment 6) ) ))
         (l1 (Line p1 (Point (+ (->x p1) init-segment) (->y p1))))
         ]
    (for-each draw/line (dragon-curve l1 1 current-iteration)))

  ;; (if (= current-iteration iterations)
  ;;     (no-loop)
  ;;     (set! current-iteration (+ current-iteration 1)))
  )

