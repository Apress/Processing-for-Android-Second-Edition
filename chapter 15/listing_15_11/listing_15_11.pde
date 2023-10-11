// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage earth;
PShape globe;
float angle;
PShader texlightShader;

void setup() {
  fullScreen(P3D);
  texlightShader = loadShader("texlightfrag.glsl", "texlightvert.glsl");
  earth = loadImage("earthmap1k.jpg");  
  globe = createShape(SPHERE, 300);
  globe.setTexture(earth);
  globe.setStroke(false);  
}

void draw() {    
  background(0);
  shader(texlightShader);
  pointLight(255, 255, 255, width, height/2, 500);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(globe);
  angle += 0.01;
}
