// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import ketai.sensors.*;

KetaiSensor sensor;
float rotationX, rotationY, rotationZ;
float offsetX, offsetY, offsetZ;

void setup() {
  fullScreen(P3D);
  orientation(LANDSCAPE);
  sensor = new KetaiSensor(this);
  sensor.start();
  rectMode(CENTER);
  fill(180);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  rotateZ(rotationZ - offsetZ);
  rotateY(rotationX - offsetX);
  rotateX(rotationY - offsetY);
  box(height * 0.3);
}

void onGyroscopeEvent(float x, float y, float z) {
  rotationX += 0.1 * x;
  rotationY += 0.1 * y;
  rotationZ += 0.1 * z;
}

void mousePressed() {
  offsetX = rotationX; 
  offsetY = rotationY; 
  offsetZ = rotationZ;
}
