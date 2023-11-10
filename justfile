sketch name *args:
  cd sketches/{{name}} && {{args}}

s1: (sketch "01" "glslViewer" "mandelbrot.frag")
s1_bqn: (sketch "01" "live-server" "--port=3000" "--no-browser" ".")
s2: (sketch "02" "glslViewer" "newton.frag")
s3: (sketch "03" "glslViewer" "flow.frag" "-testImage" "test.png")
s4: (sketch "04" "glslViewer" "polka.frag")


# week1:
#   npx nodemon -e ua -x 'clear && just sketch week1 uiua run --no-format'


