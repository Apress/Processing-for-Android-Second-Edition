// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen();
  noStroke();
}

void draw() {
  background(0);
  float r = 50 * displayDensity;
  int maxi = int(width/r);
  int maxj = int(height/r);
  for (int i = 0; i <= maxi; i++) {
    float x = map(i, 0, maxi, 0, width);
    for (int j = 0; j <= maxj; j++) {
      float y = map(j, 0, maxj, 0, height);
      ellipse(x, y, r, r);
    }
  }
}
