#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D dayTexture;
uniform sampler2D nightTexture;

uniform float mixFactor;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {    
  vec2 st = vertTexCoord.st;
  vec4 dayColor = texture2D(dayTexture, st);
  vec4 nightColor = texture2D(nightTexture, st);
  gl_FragColor = mix(dayColor, nightColor, mixFactor) * vertColor;
}