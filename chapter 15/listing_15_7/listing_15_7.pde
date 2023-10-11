// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShape globe;
float angle;
PShader colorShader;

void setup() {
  fullScreen(P3D);
  colorShader = loadShader("colorfrag.glsl", "colorvert.glsl");
  globe = createShape(SPHERE, 300);
  globe.setFill(color(#4C92F2));
  globe.setStroke(false);
}

void draw() {    
  background(0);
  shader(colorShader);
  translate(width/2, height/2);
  rotateY(angle);  
  shape(globe);
  angle += 0.01;
}
