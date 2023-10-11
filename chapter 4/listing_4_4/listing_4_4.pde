// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  size(500, 500);
}

void draw() {
  background(170);
  
  fill(250);
  stroke(50);
  strokeWeight(2);
  beginShape();
  vertex(50, 50);
  bezierVertex(50, 50, mouseX, mouseY, 450, 450);
  endShape(CLOSE);
  
  strokeWeight(2);
  stroke(50);
  line(450, 450, mouseX, mouseY);
  noStroke();
  fill(250, 100, 100);
  ellipse(mouseX, mouseY, 15, 15);
}
