// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

PImage earth;
PShape globe;
float angle;
PShader embossShader;

ARTracker tracker;
ARAnchor anchor;

void setup() {
  fullScreen(AR);
  
  embossShader = loadShader("embossfrag.glsl");
  earth = loadImage("earthmap1k.jpg");  
  globe = createShape(SPHERE, 0.2);
  globe.scale(1, -1, 1);
  globe.setTexture(earth);
  globe.setStroke(false);
  
  tracker = new ARTracker(this);
  tracker.start();   
}

void draw() {    
  lights();
  
  if (mousePressed) {
    if (anchor != null) anchor.dispose();
    ARTrackable hit = tracker.get(mouseX, mouseY);
    if (hit != null && validTrackable(hit)) anchor = new ARAnchor(hit);
    else anchor = null;
  }

  if (anchor != null) {
    anchor.attach();
    shader(embossShader);
    rotateY(angle);
    shape(globe);
    resetShader();
    anchor.detach();
  }
  
  angle += 0.03;
}

boolean validTrackable(ARTrackable t) {
  return t.isFloorPlane() && t.lengthX() < 1 && t.lengthZ() < 1;
}
