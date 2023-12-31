// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float angle = 0;

void setup() {
  fullScreen(P3D);
  fill(#AD71B7);
}

void draw() {
  background(#81B771);
  lights();
  translate(width/2, height/2);
  rotateY(angle);
  rotateX(angle*2);
  box(300);
  angle += 0.01;
}
