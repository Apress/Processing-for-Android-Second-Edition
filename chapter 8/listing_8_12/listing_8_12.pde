// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import ketai.sensors.*;

KetaiSensor sensor;
float rotationZ, offsetZ;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  sensor = new KetaiSensor(this);
  sensor.start();
  rectMode(CENTER);
  fill(180);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotate(rotationZ - offsetZ);
  rect(0, 0, height * 0.3, height * 0.3);
}

void onGyroscopeEvent(float x, float y, float z) {
  rotationZ += 0.1 * z;
}

void mousePressed() {
  offsetZ = rotationZ;
}
