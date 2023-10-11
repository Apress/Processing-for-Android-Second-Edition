// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.vr.*;

PMatrix3D mat = new PMatrix3D();

void setup() {
  fullScreen(STEREO);
  hint(ENABLE_STROKE_PERSPECTIVE);
}

void draw() {
  background(120);
  translate(width/2, height/2);
  lights();

  noStroke();
  pushMatrix();
  rotateY(millis()/1000.0);
  fill(#E3993E);
  box(150);
  popMatrix();

  eye();
  stroke(#2FB1EA);
  strokeWeight(50);
  line(100, -100, 0, 0, 0, 10000);
}
