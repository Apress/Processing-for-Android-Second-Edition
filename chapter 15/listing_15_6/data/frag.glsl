#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform vec2 resolution;
uniform vec2 pointer;

varying vec4 vertColor;

void main() {
  float maxr = pointer.x / resolution.x;
  float maxg = pointer.y / resolution.y;
  float gradx = gl_FragCoord.x / resolution.x;
  float grady = gl_FragCoord.y / resolution.y;
  gl_FragColor = vec4(maxr * gradx * vertColor.r, maxg * grady * vertColor.g, vertColor.b, 1);
}