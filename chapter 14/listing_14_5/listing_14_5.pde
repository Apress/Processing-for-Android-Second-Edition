// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage texmap;

void setup() {
  fullScreen(P3D);
  texmap = loadImage("woodstock.png");
  textureMode(NORMAL);
  noStroke();
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateY(0.01 * frameCount);
  scale(displayDensity);
  beginShape(QUAD);
  texture(texmap);
  vertex(-150, -150, 0, 0);
  vertex(-150, 150, 0, 1);
  vertex(150, 150, 1, 1);
  vertex(150, -150, 1, 0);
  endShape();
}
