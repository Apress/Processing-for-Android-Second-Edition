// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShape earth;
PShader earthShader;

float viewRotation;

void setup() {  
  fullScreen(P3D);
  
  PImage earthDay = loadImage("Solarsystemscope_texture_2k_earth_daymap.jpg");
  PImage earthNight = loadImage("Solarsystemscope_texture_2k_earth_nightmap.jpg");
  
  earthShader = loadShader("EarthFrag.glsl", "EarthVert.glsl");
  earthShader.set("dayTexture", earthDay);
  earthShader.set("nightTexture", earthNight);
  earthShader.set("width", width);
  earthShader.set("height", height);
  
  earth = createShape(SPHERE, 400);
  earth.setStroke(false);
}

void draw() {
  background(0);
 
  float targetAngle = map(mouseX, 0, width, 0, TWO_PI);  
  viewRotation += 0.05 * (targetAngle - viewRotation); 
 
  translate(width/2, height/2);
  
  shader(earthShader);
  pushMatrix();
  rotateY(viewRotation);
  shape(earth);
  popMatrix();  
}
