// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float angle = 0;
PShape cube;

void setup() {
  fullScreen(P3D);
  PImage tex = loadImage("mosaic.jpg");
  cube = createShape(BOX, 400);
  cube.setTexture(tex);
}

void draw() {
  background(#81B771);
  lights();
  translate(width/2, height/2);
  rotateY(angle);
  rotateX(angle*2);
  shape(cube);
  angle += 0.01;
}
