// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen();
  strokeWeight(2 * displayDensity);
  stroke(121, 81, 49, 150);
  fill(255);
  background(255);
}

void draw() {
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
    ellipse(mouseX, mouseY, 13 * displayDensity, 13 * displayDensity);
    if (30 * displayDensity < dist(pmouseX, pmouseY, mouseX, mouseY)) {
      drawLeaves();
    }
  }
}

void drawLeaves() {
  int numLeaves = int(random(2, 5));
  for (int i = 0; i < numLeaves; i++) {
    float leafAngle = random(0, TWO_PI);
    float leafLength = random(20, 100) * displayDensity;        
    pushMatrix();
      translate(mouseX, mouseY);
      rotate(leafAngle);        
      line(0, 0, leafLength, 0);
      translate(leafLength, 0);
      pushStyle();
        noStroke();
        fill(random(170, 180), random(200, 230), random(80, 90), 190);
        float r = random(20, 50) * displayDensity;
        beginShape();
        int numSides = int(random(4, 8));
        for (float angle = 0; angle <= TWO_PI; angle += TWO_PI/numSides) {
          float x = r * cos(angle);
          float y = r * sin(angle);
          vertex(x, y);
        }
        endShape();
      popStyle();
    popMatrix();       
  }
}
