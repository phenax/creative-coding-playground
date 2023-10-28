sketch name *args:
  cd sketches/{{name}} && {{args}}

newton-p5: (sketch "newton-p5" "npx" "live-server" "--port=3000" "--no-browser" ".")

