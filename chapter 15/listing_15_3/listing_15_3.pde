// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShader simple;
float angle;

void setup() {
  fullScreen(P3D);  
  simple = loadShader("frag.glsl", "vert.glsl");
  shader(simple);
  noStroke();
}

void draw() {  
  background(255);
  translate(width/2, height/2);
  rotateY(angle);
  beginShape(QUADS);
  normal(0, 0, 1);
  fill(50, 50, 200);
  vertex(-200, +200);
  vertex(+200, +200);
  fill(200, 50, 50);
  vertex(+200, -200);
  vertex(-200, -200);
  endShape();  
  angle += 0.01;
}
