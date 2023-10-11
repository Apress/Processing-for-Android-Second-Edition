// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.vr.*;

void setup() {
  fullScreen(STEREO);
}

void draw() {
  background(120);
  translate(width/2, height/2);

  lights();

  noStroke();
  fill(#E3993E);
  beginShape(QUAD);
  vertex(-75, -75);
  vertex(+75, -75);
  vertex(+75, +75);
  vertex(-75, +75);
  endShape(QUAD);
  
  eye();
  stroke(47, 177, 234, 150);
  strokeWeight(50);
  point(0, 0, 100);
}
