// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

ARTracker tracker;
ARAnchor anchor;
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
    if (mousePressed) updateAnchor();
    if (anchor != null) placeDrawing();    
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
    pushStyle();
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
    popStyle();
    endShape(); 
    popMatrix();
  }
}

void updateAnchor() {
  if (anchor != null) anchor.dispose();
  ARTrackable hit = tracker.get(mouseX, mouseY);
  if (hit != null && validTrackable(hit)) {
    anchor = new ARAnchor(hit);
  } else {
    anchor = null;
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
    canvas.stroke(121, 81, 49, 150);
    canvas.strokeWeight(2 * displayDensity);
    if (mousePressed) {
      canvas.line(pmouseX, pmouseY, mouseX, mouseY);
      canvas.ellipse(mouseX, mouseY, 13 * displayDensity, 13 * displayDensity);
      if (30 * displayDensity < dist(pmouseX, pmouseY, mouseX, mouseY)) {
        drawLeaves();
      }
    }
    canvas.endDraw();
    image(canvas, 0, 0, width, height);
  }
}

void drawLeaves() {
  int numLeaves = int(random(2, 5));
  for (int i = 0; i < numLeaves; i++) {
    float leafAngle = random(0, TWO_PI);
    float leafLength = random(20, 100) * displayDensity;        
    canvas.pushMatrix();
      canvas.translate(mouseX, mouseY);
      canvas.rotate(leafAngle);        
      canvas.line(0, 0, leafLength, 0);
      canvas.translate(leafLength, 0);
      canvas.pushStyle();
        canvas.noStroke();
        canvas.fill(random(170, 180), random(200, 230), random(80, 90), 190);
        float r = random(20, 50) * displayDensity;
        canvas.beginShape();
        int numSides = int(random(4, 8));
        for (float angle = 0; angle <= TWO_PI; angle += TWO_PI/numSides) {
          float x = r * cos(angle);
          float y = r * sin(angle);
          canvas.vertex(x, y);
        }
        canvas.endShape();
      canvas.popStyle();
    canvas.popMatrix();       
  }
}

void placeDrawing() {
  anchor.attach();
  noStroke();
  beginShape(QUAD);      
  float r = float(canvas.width) / canvas.height;      
  texture(canvas);
  vertex(0, 0, 0, canvas.height);
  vertex(0, 1, 0, 0);
  vertex(r, 1, canvas.width, 0);
  vertex(r, 0, canvas.width, canvas.height);
  endShape();
  anchor.detach();  
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
  return t.isTracking() && t.isFloorPlane() && 
         0.25 < t.lengthX() && t.lengthX() < 1 && 0.25 < t.lengthZ() && t.lengthZ() < 1;
}
