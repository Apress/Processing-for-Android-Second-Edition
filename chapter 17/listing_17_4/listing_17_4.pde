// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

ARTracker tracker;
ArrayList<ARAnchor> trackAnchors = new ArrayList<ARAnchor>();

void setup() {
  fullScreen(AR);
  tracker = new ARTracker(this);
  tracker.start();
  noStroke();  
}

void draw() {
  lights();
  drawAnchors();
  drawTrackables();
}

void trackableEvent(ARTrackable t) {
  if (trackAnchors.size() < 10 && validTrackable(t)) {
    trackAnchors.add(new ARAnchor(t, 0, 0, 0));
  }
}

void drawAnchors() {
  for (ARAnchor anchor : trackAnchors) {
    if (anchor.isTracking()) drawSphere(anchor, 0.05);
    if (anchor.isStopped()) anchor.dispose();
  }
  tracker.clearAnchors(trackAnchors);   
}

void drawTrackables() {
  for (int i = 0; i < tracker.count(); i++) {
    ARTrackable t = tracker.get(i);
    if (!validTrackable(t)) continue;
    pushMatrix();
    t.transform();
    float lx = t.lengthX();
    float lz = t.lengthZ();    
    if (mousePressed && t.isSelected(mouseX, mouseY)) {
      fill(255, 0, 0, 100);
    } else {
      fill(255, 100);
    }
    drawPlane(lx, lz);    
    popMatrix();  
  }  
}

void drawSphere(ARAnchor anchor, float r) {
  anchor.attach();
  fill(#CF79F5);
  sphere(r);
  anchor.detach();
}

void drawPlane(float lx, float lz) {
  beginShape(QUADS);
  vertex(-lx/2, 0, -lz/2);
  vertex(-lx/2, 0, +lz/2);
  vertex(+lx/2, 0, +lz/2);
  vertex(+lx/2, 0, -lz/2);
  endShape();  
}

boolean validTrackable(ARTrackable t) {
  return t.isFloorPlane() && t.lengthX() < 1 && t.lengthZ() < 1;
}
