// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShader gradient;

void setup() {
  fullScreen(P3D);  
  gradient = loadShader("frag.glsl", "vert.glsl");
  gradient.set("resolution", float(width), float(height))  ;
  noStroke();
}

void draw() {
  shader(gradient);
  fill(255);
  gradient.set("pointer", float(mouseX), float(mouseY));  
  rect(0, 0, width, height);
  resetShader();
  fill(255);
  ellipse(mouseX, mouseY, 100, 100);
}
