// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

ArrayList<PVector> vertices;
ArrayList<PVector> cpoints;
Boolean addNewVertex;
PVector lastVertex;
PVector lastCPoint;

void setup() {
  size(500, 500);
  strokeWeight(2);
  vertices = new ArrayList();
  cpoints = new ArrayList();
  addNewVertex = true;
}

void draw() {
  background(255);
  
  noFill();
  stroke(0);  
  beginShape();  
  for (int i = 1; i < vertices.size(); i++) {    
    PVector v0 = vertices.get(i - 1);
    PVector cp0 = cpoints.get(i - 1).copy();
    PVector v = vertices.get(i);
    PVector cp = cpoints.get(i);
    cp0.sub(v0);
    cp0.rotate(PI);
    cp0.add(v0);
    vertex(v0.x, v0.y);      
    bezierVertex(cp0.x, cp0.y, cp.x, cp.y, v.x, v.y);
  }
  endShape();
  
  stroke(170);
  if (0 < vertices.size()) {
    line(lastVertex.x, lastVertex.y, mouseX, mouseY);
  }
  noStroke();
  if (addNewVertex) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseReleased() {
  if (addNewVertex) {
    lastVertex = new PVector(mouseX, mouseY);
    lastCPoint = lastVertex.copy();
    vertices.add(lastVertex);    
    cpoints.add(lastCPoint);
    if (1 < vertices.size()) {
      addNewVertex = false;
    }
  } else {
    addNewVertex = true;
  }
}

void mouseMoved() {
  if (!addNewVertex) {
    lastCPoint.x = mouseX;
    lastCPoint.y = mouseY;
  }      
}
