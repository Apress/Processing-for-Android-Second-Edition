// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  //fullScreen();
  size(2340, 1080);
  strokeWeight(2);
  stroke(0);
  fill(255);
}

void draw() {
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

void keyPressed() {
  save("img.png");  
}
