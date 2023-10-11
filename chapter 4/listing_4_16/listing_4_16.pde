// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  rectMode(CENTER);
  PFont font = createFont("Monospaced", 40);
  textFont(font);
}

void draw() {
  background(255);
  fill(150, 10);
  for (int i = 0; i < 100; i++) {
    float w = 2 * (width/2 - random(0, width));    
    rect(width/2, height/2, w, w/width * height);
  }
  fill(255, 0, 0);
  text("Framerate " + frameRate, 10, 50);
}
