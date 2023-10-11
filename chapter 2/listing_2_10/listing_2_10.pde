// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float x = 0;

void setup() {
  size(400, 400);
  background(150);
}

void draw() {
  translate(x, 0);
  rect(0, 0, 300, 300);
  x += 2;
  if (width < x) x = -300; 
}
