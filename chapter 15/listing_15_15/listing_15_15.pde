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
    
  earthShader = loadShader("EarthFrag.glsl");
  earthShader.set("dayTexture", earthDay);
  earthShader.set("nightTexture", earthNight);
  
  earth = createShape(SPHERE, 400);
  earth.setStroke(false);
}

void draw() {
  background(0);
 
  earthShader.set("mixFactor",  map(mouseX, 0, width, 0, 1)); 
  viewRotation += 0.001; 
 
  translate(width/2, height/2);
  
  shader(earthShader);
  pushMatrix();
  rotateY(viewRotation);
  shape(earth);
  popMatrix();  
}
