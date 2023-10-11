// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PShape world;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  world = loadShape("World-map.svg");
  world.scale(height/world.getHeight());
  shapeMode(CENTER);
}

void draw() {  
  background(255);
  translate(width/2, height/2);
  shape(world);
}
