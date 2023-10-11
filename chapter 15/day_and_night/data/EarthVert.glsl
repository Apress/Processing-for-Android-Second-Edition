uniform mat4 transform;
uniform mat4 modelview;
uniform mat4 texMatrix;

attribute vec4 position;
attribute vec4 color;
attribute vec2 texCoord;

varying vec4 vertColor;
varying vec4 vertTexCoord;
varying float azimuth;

uniform int width;
uniform int height;

#define PI 3.1415926538

void main() {
  gl_Position = transform * position; 
  vec3 v = position.xyz - vec3(float(width)/2.0, float(height)/2.0, 0.0);
  azimuth = PI - sign(v.z) * acos(v.x / length(v.xz));
  vertColor = color;
  vertTexCoord = texMatrix * vec4(texCoord, 1.0, 1.0);
}
