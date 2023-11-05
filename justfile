sketch name *args:
  cd sketches/{{name}} && {{args}}

s1: (sketch "01" "glslViewer" "mandelbrot.frag")
s1_bqn: (sketch "01" "live-server" "--port=3000" "--no-browser" ".")
s2: (sketch "02" "glslViewer" "newton.frag")


# week1:
#   npx nodemon -e ua -x 'clear && just sketch week1 uiua run --no-format'


