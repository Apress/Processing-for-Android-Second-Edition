// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

int vertCount = 100;
float outerRad = 250;
float innerRad = 220;
float shift;

void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  translate(width/2, height/2);
  background(150);
  beginShape(QUAD_STRIP);
  for (int i = 0; i <= vertCount; i++) {
    float a = map(i, 0, vertCount, 0, TWO_PI);
    outerRad = 250 + 10 * cos(shift + 2 * a);
    innerRad = 220 + 5 * sin(shift + 4 * a);    
    float x0 = outerRad * cos(a);
    float y0 = outerRad * sin(a);
    float x1 = innerRad * cos(a);
    float y1 = innerRad * sin(a);      
    vertex(x0, y0);
    vertex(x1, y1);
  }
  endShape();  
  shift += 0.1;
}
