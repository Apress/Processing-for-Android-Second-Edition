// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

ARTracker tracker;
PGraphics canvas;

boolean drawingMode = false;
float uiHeight = 150 * displayDensity;

void setup() {
  fullScreen(AR);
  
  canvas = createGraphics(width, height, P2D);
  initDrawing();
  
  tracker = new ARTracker(this);
  tracker.start();
  
  textFont(createFont("Arial", uiHeight/2));
  textAlign(CENTER, CENTER);
}

void draw() {
  if (!drawingMode) {
    lights();
    drawFloors();
  }
  
  eye();
  updateDrawing();
  drawUI();  
}

void drawFloors() {
  for (int i = 0; i < tracker.count(); i++) {
    ARTrackable trackable = tracker.get(i);
    if (!validTrackable(trackable)) continue;
    pushMatrix();
    trackable.transform();
    fill(200, 20, 20, 80);
    noStroke();
    beginShape();
    float[] points = trackable.getPolygon();
    for (int n = 0; n < points.length / 2; n++) {
      float x = points[2 * n];
      float z = points[2 * n + 1];
      vertex(x, 0, z);
    }
    endShape(); 
    popMatrix();
  }
}

void initDrawing() {
  canvas.beginDraw();
  canvas.background(255, 0);  
  canvas.endDraw();  
}

void updateDrawing() {
  if (drawingMode) {
    canvas.beginDraw();
    canvas.stroke(0);
    canvas.strokeWeight(2 * displayDensity);
    if (mousePressed) canvas.line(pmouseX, pmouseY, mouseX, mouseY);
    canvas.endDraw();
    image(canvas, 0, 0, width, height);
  }
}

void drawUI() {  
  fill(0);
  rect(0, 0, width, uiHeight);
  fill(255);
  if (drawingMode) {
    text("PLACE DRAWING", 0, 0, width, uiHeight);     
  } else {
    text("NEW DRAWING", 0, 0, width, uiHeight); 
  }  
}

void mousePressed() {
  if (mouseY < uiHeight) {
    drawingMode = !drawingMode;
    if (drawingMode) initDrawing();
  }
}

boolean validTrackable(ARTrackable t) {
  return t.isTracking() && t.isFloorPlane() && t.lengthX() < 1 && t.lengthZ() < 1;
}
