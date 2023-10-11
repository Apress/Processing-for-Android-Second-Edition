// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage earth;
PShader bwShader;

void setup() {
  fullScreen(P2D);
  bwShader = loadShader("bwfrag.glsl");
  earth = loadImage("earthmap1k.jpg");  
}

void draw() {  
  image(earth, 0, 0, width, height);
  filter(bwShader);
}
