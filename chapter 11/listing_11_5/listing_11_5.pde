// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

int totSec = 24 * 60 * 60;
PFont font;

void setup() {
  font = createFont("Serif", 62);
  textAlign(LEFT, CENTER);
}

void draw() {
  background(0);  
  int sec = 60 * 60 * hour() + 60 * minute() + second();
  float a = map(sec, 0, totSec, PI, 0);
  float x = map(sec, 0, totSec, 0, width);  
  float r = sec < totSec/2 ? map(sec, 0, totSec/2, 90, 50) : 
                             map(sec, totSec/2, totSec, 50, 90);
  
  int t = totSec - sec;  
  String strt = str(t);
  int n = strt.length();
  float d = (width - x) / n;
  textFont(font, 1.75 * d);

  float rad = 0.5 * width;
  float diam = width;
  if (wearAmbient()) {    
    fill(255);
    text(strt, x, rad);    
  } else {
    fill(255);
    ellipse(rad, rad, diam, diam);
    noStroke();
    fill(0);
    beginShape();
    vertex(0, 0);
    vertex(rad, 0);
    float cx = r * cos(a);
    float cy = r * sin(a);
    bezierVertex(rad + cx, cy, x, rad - r, x, rad);
    vertex(x, rad);
    bezierVertex(x, rad + r, rad + cx, diam - cy, rad, diam);
    vertex(0, diam);
    endShape(CLOSE);
    
    fill(0, 170);
    text(strt, x, rad);    
  }  
}
