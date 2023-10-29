sketch name *args:
  cd sketches/{{name}} && {{args}}

# week1: (sketch "week-1" "uiua" "run" "--no-format")

week1: (sketch "week-1" "npx" "live-server" "--port=3000" "--no-browser" ".")

# week1-w:
#   npx nodemon -e ua -x 'clear && just week1'

