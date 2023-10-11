// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage img;

void setup() {
  fullScreen();
  img = resizeAndCenterCrop("paine.jpg", 1080);
}

void draw() {  
  image(img, 0, 0, width, height);
  image(img, 0, 0);  
}

PImage resizeAndCenterCrop(String fn, int h) {
  PImage src = loadImage(fn);
  float imgRatio = float(src.width) / float(src.height);  
  int w = int(imgRatio * h);
  src.resize(w, h);
  
  float screenRatio = float(width) / float(height);
  int wCrop = int(screenRatio * h);
  return src.get(w / 2 - wCrop / 2, 0, wCrop, h);
}
