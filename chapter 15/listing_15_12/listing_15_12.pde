// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage earth;
PShape globe;
float angle;
PShader bwShader;

void setup() {
  fullScreen(P3D);
  bwShader = loadShader("bwfrag.glsl");
  earth = loadImage("earthmap1k.jpg");  
  globe = createShape(SPHERE, 300);
  globe.setTexture(earth);
  globe.setStroke(false);  
}

void draw() {    
  background(0);  
  shader(bwShader);    
  translate(width/2, height/2);
  rotateY(angle);  
  shape(globe);
  angle += 0.01;
}
