// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float[] angle;
float[] radius;
float shift;
int num = 20; 

void setup() {
  size(500, 500);
  angle = new float[num];
  radius = new float[num];
  for (int i = 0; i < num; i++) {
    angle[i] = random(0, TWO_PI);
    radius[i] = random(100, width/2);
  }
}

void draw() {
  background(255);

  float centerX = width/2;
  float centerY = height/2;
  
  fill(183, 7, 7, 50);
  stroke(183, 7, 7);
  strokeWeight(1);
  beginShape();
  for (int i = 0; i < num; i++) {
    vertex(centerX, centerY);
    float x = centerX + radius[i] * cos(angle[i] + shift);
    float y = centerY + radius[i] * sin(angle[i] + shift);
    bezierVertex(centerX, centerY, mouseX, mouseY, x, y);    
  }
  endShape(CLOSE);
  
  shift += 0.01;
}
