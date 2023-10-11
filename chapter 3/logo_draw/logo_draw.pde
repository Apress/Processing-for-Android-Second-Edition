// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

size(800, 800);
background(255);
noStroke();
fill(170);
ellipse(400, 400, 800,800);
translate(width/2, height/2);
stroke(0);
strokeWeight(2);
int numLeaves = int(random(4, 8));
for (int i = 0; i < numLeaves; i++) {
  pushMatrix();  
    float leafAngle = random(0, TWO_PI);
    float leafLength = random(100, 250);
    rotate(leafAngle);
    line(0, 0, leafLength, 0);
    translate(leafLength, 0);  
    pushStyle();
      noStroke();
      fill(random(170, 180), random(200, 230), random(80, 90), 190);
      float r = random(50, 100);
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
