#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define TWO_PI 6.2831853076

uniform sampler2D dayTexture;
uniform sampler2D nightTexture;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying float azimuth;

void main() {
  vec2 st = vertTexCoord.st;
  vec4 dayColor = texture2D(dayTexture, st);
  vec4 nightColor = texture2D(nightTexture, st);
  gl_FragColor = mix(dayColor, nightColor, azimuth / TWO_PI) * vertColor;
}