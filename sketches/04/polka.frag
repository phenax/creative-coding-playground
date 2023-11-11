varying vec4 v_position;
uniform vec2 u_resolution;
uniform float u_time;

#define DOTS 32.

const float segment = 2.0 / (DOTS + 1.);

void main() {
  float time = u_time * 2.;

  float ratio = u_resolution.x / u_resolution.y;
  vec2 pos = (v_position.xy - 1.0)/vec2(1.0, ratio);

  vec2 cell_pos = abs(floor(pos / segment)) - 0.5;
  int alt = int(mod(cell_pos.x + cell_pos.y, 2.));

  float radius = (sin(time - length(pos + 0.5)) + 1.)*0.02;
  if (alt == 0) {
    radius = (0.04 - radius);
  }

  gl_FragColor = vec4(0., 0., 0., 1.);
  if (length(pos - 0.0 + cell_pos*segment) < radius) {
    if (alt == 0) {
      gl_FragColor = vec4(.17, .24, .31, 1.);
    } else {
      gl_FragColor = vec4(0.75, 0.22, 0.17, 1.);
    }
  }
}

