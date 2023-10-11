// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

ARTracker tracker;
ARAnchor touchAnchor;
PShape plant, rocket, selObject;
PImage plantImg, rocketImg;

void setup() {
  fullScreen(AR);  
  loadObjects();  
  tracker = new ARTracker(this);
  tracker.start();
  noStroke();  
}

void draw() {
  lights();
  drawObject(touchAnchor);  
  drawTrackables();
  drawUI();  
}

void mousePressed() {  
  if (mouseY < 200) {
    if (mouseX < 200) {
      selObject = plant;
    } else if (mouseX < 300) {
      selObject = rocket;
    }
  } else {
    if (touchAnchor != null) touchAnchor.dispose();
    ARTrackable hit = tracker.get(mouseX, mouseY);
    if (hit != null && validTrackable(hit)) touchAnchor = new ARAnchor(hit);
    else touchAnchor = null;    
  }
}

void drawTrackables() {  
  for (int i = 0; i < tracker.count(); i++) {
    ARTrackable t = tracker.get(i);
    if (!validTrackable(t)) continue;
    pushMatrix();
    t.transform();
    float lx = t.lengthX();
    float lz = t.lengthZ();    
    drawPlane(lx, lz);
    popMatrix();  
  }  
}

void drawPlane(float lx, float lz) {
  fill(255, 100);
  noStroke();
  beginShape(QUADS);
  vertex(-lx/2, 0, -lz/2);
  vertex(-lx/2, 0, +lz/2);
  vertex(+lx/2, 0, +lz/2);
  vertex(+lx/2, 0, -lz/2);
  endShape();  
}

float angle;
void drawObject(ARAnchor anchor) {
  if (anchor != null) {
    anchor.attach();
    rotateY(angle);
    shape(selObject);
    anchor.detach();
  }
  angle += 0.01;
}

void drawUI() {
  eye();
  image(plantImg, 0, 0, 200, 200);  
  image(rocketImg, 200, 0, 200, 200);  
  noFill();
  stroke(255, 0, 0);
  strokeWeight(10);
  float x = 0;
  if (selObject == rocket) x += 200;
  rect(x, 0, 200, 200);
}

boolean validTrackable(ARTrackable t) {
  return t.isFloorPlane() && t.lengthX() < 1 && t.lengthZ() < 1;
}

void loadObjects() {
  plant = loadShape("plant.obj");
  
  rocket = loadShape("rocket.obj");
  float dim = max(rocket.getWidth(), rocket.getHeight(), rocket.getDepth());
  float factor = 0.3 / dim;  
  rocket.scale(factor);

  plantImg = loadImage("plant-preview.png");
  rocketImg = loadImage("rocket-preview.png");

  selObject = rocket;  
}
