// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage[] images;

void setup () {
  size(1000, 400);
  images = new PImage[5];
  for (int i = 0; i < 5; i++) {
    images[i] = loadImage("streetview" + (i + 1) + ".jpg");
  }
}

void draw() {
  background(0);
  for (int i = 0; i < 5; i++) {
    PImage crop = images[i].get(200, 56, 200, 400);
    image(crop, i * 200, 0);  
  }
}
