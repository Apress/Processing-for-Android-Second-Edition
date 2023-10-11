// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float angle = 0;

void setup() {
  size(400, 400);
  background(150);
}

void draw() {
  rotate(angle);
  rect(0, 0, 300, 300);
  angle += 0.01 * PI; 
}
