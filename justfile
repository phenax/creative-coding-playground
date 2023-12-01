sketch name *args:
  cd sketches/{{name}} && {{args}}

s1: (sketch "01" "glslViewer" "mandelbrot.frag")
s1_bqn: (sketch "01" "live-server" "--port=3000" "--no-browser" ".")

s2: (sketch "02" "glslViewer" "newton.frag")

s3: (sketch "03" "glslViewer" "flow.frag" "-testImage" "test.png")

s4: (sketch "04" "glslViewer" "polka.frag")

s5_run: (sketch "05" "racket" "dragon.rkt")
s5:
  npx nodemon -e rkt -x 'clear && just s5_run'

s6: (sketch "06" "glslViewer" "strange.frag")
