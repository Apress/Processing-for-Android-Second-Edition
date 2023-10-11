// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen();
  background(180);
  strokeWeight(10 * displayDensity);
  stroke(100, 100);
}

void draw() {  
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

  
