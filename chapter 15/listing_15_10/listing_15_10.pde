// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShape globe;
float angle;
PShader lightShader;

void setup() {
  fullScreen(P3D);
  lightShader = loadShader("lightfrag.glsl", "lightvert.glsl");
  globe = createShape(SPHERE, 300);
  globe.setStroke(false);
}

void draw() {    
  background(0);
  shader(lightShader);
  pointLight(255, 255, 255, width, height/2, 500);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(globe);
  angle += 0.01;
}
