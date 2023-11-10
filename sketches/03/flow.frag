#define CELL_COUNT 10.0

varying vec4 v_position;
uniform vec2 u_resolution;
uniform float u_time;

uniform sampler2D testImage;

struct Particle {
  vec2 position;
  vec2 velocity;
};

bool is_between(vec2 pos, vec2 min, vec2 max) {
  return pos.x > min.x && pos.x < max.x && pos.y > min.y && pos.y < max.y;
}

void main() {
  float time = sin(u_time);
  vec2 uv = gl_FragCoord.xy/u_resolution.xy;
  float ratio = u_resolution.x / u_resolution.y;
  vec2 pos = uv/vec2(1.0, ratio);

  float cell_size = 1.0/CELL_COUNT;

  for (float i = 0.; i < CELL_COUNT; i++) {
    for (float j = 0.; j < CELL_COUNT; j++) {
      vec2 cell_pos = vec2(i, j) * cell_size;

      if (is_between(pos, cell_pos, cell_pos + vec2(cell_size, cell_size))) {
        vec4 tex = texture2D(testImage, cell_pos);
        float value = (tex.r + tex.g + tex.b) / 3.;
        gl_FragColor = vec4(value, value, value, 1.0);
      }
    }
  }
}
