// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/androidbook/

int x = 0;

void setup() {
  fullScreen();
  strokeWeight(2);
  stroke(255);  
}

void draw() {
  background(50);
  line(x, 0, x, height); //<>//
  x = x + 1;
  if (width < x) x = 0;
}
