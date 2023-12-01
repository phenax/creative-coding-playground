varying vec4 v_position;
uniform vec2 u_resolution;
uniform float u_time;

void main() {
  float ratio = u_resolution.x / u_resolution.y;
  vec2 pos = v_position.xy/vec2(1.0, ratio);

  float f = length(fract(pos * 10.0) - 0.5) * exp(-length(pos));
  f = abs(sin(f*30. + u_time)/3.);
  gl_FragColor = vec4(f*0.6, f*0.4, f*1.0, 1.0);
}
