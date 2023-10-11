// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float s = 0;

void setup() {
  size(400, 400);
  background(150);
}

void draw() {
  scale(s);
  rect(0, 0, 10, 10);
  s += 1;
  if (100 < s) s = 0;
}
