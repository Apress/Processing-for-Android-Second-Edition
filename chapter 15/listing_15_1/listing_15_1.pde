// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float angle;

void setup() {
  size(400, 400, P3D);
  noStroke();
}

void draw() {
  background(255);
  perspective();
  camera();
  pointLight(255, 255, 255, 200, 200, -300);
  translate(200, 200);
  rotateY(angle += 0.01);  
  beginShape(QUADS);
  normal(0, 0, 1);
  fill(50, 50, 200);
  vertex(-100, +100);
  vertex(+100, +100);
  fill(200, 50, 50);
  vertex(+100, -100);
  vertex(-100, -100);
  endShape();
}
