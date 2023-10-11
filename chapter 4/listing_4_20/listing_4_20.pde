// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShape world;

void setup() {
  size(950, 620, P2D);
  orientation(LANDSCAPE);
  world = loadShape("World-map.svg");
  for (PShape child: world.getChildren()) {
    if (child.getName().equals("algeria")) child.setFill(color(255, 0, 0));    
  }
}

void draw() {
  background(255);
  shape(world);
}
