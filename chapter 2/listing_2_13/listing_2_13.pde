// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float angle;

void setup() {
  size(400, 400);
}

void draw() {
  background(170);
  translate(width/2, height/2);
  rotate(angle);
  rect(0, 0, 70, 70);
  pushMatrix();
    line(0, 0, 130, 0);
    translate(130, 0);  
    rotate(2 * angle);
    rect(0, 0, 30, 30);
    pushMatrix();
      rotate(angle);
      line(0, 0, 50, 0);
      ellipse(50, 0, 15, 15);
    popMatrix();
  popMatrix();
  rotate(angle);
  line(0, 0, 0, 180);
  translate(0, 180);
  ellipse(0, 0, 30, 30);  
  angle += 0.01;
}
