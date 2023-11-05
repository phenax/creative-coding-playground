varying vec4 v_position;
uniform vec2 u_resolution;
uniform float u_time;
uniform float u_mouse;

#define MAX_ITERATIONS 100

vec2 cdiv(vec2 a, vec2 b) {
  float r = length(b);
  float theta = atan(b.y, b.x);
  return vec2(cos(theta), sin(theta)) * (dot(a, b) / (r * r));
}

vec2 cpow(vec2 z, float n) {
  float r = length(z);
  float theta = atan(z.y, z.x);
  return pow(r, n) * vec2(cos(n * theta), sin(n * theta));
}

void main() {
  float time = 1.1 + mod(u_time * 1000.0, 100000.0) / 10000.0;
  // float time = 4.0;

  float ratio = u_resolution.x / u_resolution.y;
  vec2 pos = v_position.xy/vec2(1.0, ratio);

  vec2 c = 2.0 * (pos - vec2(0.0, 0.0));
  vec2 z = vec2(0.0, 0.0);
  int i;

  vec2 prevZ = z;
  for (i = 0; i < MAX_ITERATIONS; i++) {
    prevZ = z;
    z = cpow(z, time) + c;

    if (length(z - prevZ) > 10.0) {
      break;
    }
  }

  if (i == MAX_ITERATIONS) {
    gl_FragColor = vec4(27., 14., 50., 255.0) / 255.;
  } else if (i > 5) {
    gl_FragColor = vec4(97., 42., 191., 255.0) / 255.;
  } else if (i > 4) {
    gl_FragColor = vec4(150., 191., 69., 255.0) / 255.;
  } else if (i > 3) {
    gl_FragColor = vec4(230., 123., 40., 255.0) / 255.;
  } else if (i > 2) {
    gl_FragColor = vec4(27., 14., 50., 255.0) / 255.;
  } else {
    gl_FragColor = vec4(0., 0., 0., 1.);
  }
}

