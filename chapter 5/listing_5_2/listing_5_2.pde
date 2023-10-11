// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

boolean drawing = false;
float radius;

void setup() {
  fullScreen();
  noStroke();
  fill(100, 100);
}

void draw() {
  background(255);
  if (drawing) {
    ellipse(mouseX, mouseY, radius, radius);
  }
}

void mousePressed() {
  drawing = true;
  radius = 70 * displayDensity;
}

void mouseReleased() {  
  drawing = false;
}

void mouseDragged() {
  radius += 0.5 * displayDensity;
}
