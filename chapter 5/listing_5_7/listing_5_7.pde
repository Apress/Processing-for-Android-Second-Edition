// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen();
  noStroke();
  colorMode(HSB, 350, 100, 100);
  textFont(createFont("SansSerif", displayDensity * 24));
}

void draw() {
  background(30, 0, 100);
  fill(30, 0, 20);
  text("Number of touch points: " + touches.length, 20, displayDensity * 50);
  for (int i = 0; i < touches.length; i++) {
    println("area", touches[i].area);
    println("pressure", touches[i].pressure);
    float s = displayDensity * map(touches[i].area, 0, 0.1, 30, 300);
    fill(30, map(touches[i].pressure, 0, 0.5, 0, 100), 70, 200);
    ellipse(touches[i].x, touches[i].y, s, s);
  }
}

void touchStarted() {
  println("Touch started");
}

void touchEnded() {
  println("Touch ended");
}

void touchMoved() {
  println("Touch moved");
}
