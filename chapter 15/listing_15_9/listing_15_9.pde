// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage earth;
PShape globe;
float angle;
PShader pixShader;

void setup() {
  fullScreen(P3D);
  pixShader = loadShader("pixelated.glsl", "texvert.glsl");
  earth = loadImage("earthmap1k.jpg");  
  globe = createShape(SPHERE, 300);
  globe.setTexture(earth);
  globe.setStroke(false);
}

void draw() {    
  background(0);    
  shader(pixShader);
  pixShader.set("numBins", int(map(mouseX, 0, width, 0, 100)));
  translate(width/2, height/2);
  rotateY(angle);  
  shape(globe);
  angle += 0.01;
}
