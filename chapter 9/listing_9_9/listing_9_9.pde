// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PGraphics collage;

void setup () {
  size(1000, 400);  
  collage = createGraphics(1000, 400);
  collage.beginDraw();
   for (int i = 0; i < 5; i++) {
    PImage source = loadImage("streetview" + (i + 1) + ".jpg");
    PImage crop = source.get(200, 56, 200, 400);
    collage.image(crop, i * 200, 0);      
  } 
  collage.endDraw();
}

void draw() {
  image(collage, 0, 0);
}
