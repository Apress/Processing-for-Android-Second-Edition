#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform int numBins;
uniform sampler2D texture;

varying vec4 vertColor;
varying vec4 vertTexCoord;

void main() {
  int si = int(vertTexCoord.s * float(numBins));
  int sj = int(vertTexCoord.t * float(numBins));
  gl_FragColor = texture2D(texture, vec2(float(si) / float(numBins), float(sj) / float(numBins))) * vertColor;
}
