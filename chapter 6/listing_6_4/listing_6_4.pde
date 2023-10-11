// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage pic;
float ratio;

void setup() {
  fullScreen();
  pic = loadImage("paine.jpg");
  ratio = float(pic.width) / float(pic.height);
}

void draw() {
  background(0);
  float w = wallpaperHomeCount() * width;
  float h = w / ratio;
  float x = map(wallpaperOffset(), 0, 1, 0, -(wallpaperHomeCount() - 1) * width);
  float y = 0.5 * (height - h);
  image(pic, x, y, w, h);
}
