varying vec4 v_position;
uniform vec2 u_resolution;
uniform float u_time;

#define MAX_ITERATIONS 100
#define DOTS 32.

void main() {
  float time = u_time * 2.;

  float ratio = u_resolution.x / u_resolution.y;
  vec2 pos = v_position.xy/vec2(1.0, ratio);

  gl_FragColor = vec4(0., 0., 0., 1.);

  float segment = 2.0 / (DOTS + 1.);

  for (float i = 0.; i < DOTS; i++) {
    for (float j = 0.; j < DOTS; j++) {
      int alt = int(mod(i + j, 2.));
      vec2 step = vec2(segment * (i + 1.0), segment * (j + 1.0));
      float radius = (sin(time - length(pos)) + 1.)*0.02;
      if (alt == 0) {
        radius = (0.04 - radius);
      }

      if (length(pos - 1. + step) < radius) {
        if (alt == 0) {
          gl_FragColor = vec4(.17, .24, .31, 1.);
        } else {
          gl_FragColor = vec4(0.75, 0.22, 0.17, 1.);
        }
      }
    }
  }
}

