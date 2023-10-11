// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

fullScreen();   
for (int x = 0; x < width; x++) {
  for (int y = 0; y < height; y++) {
    set(x, y, color(map(x, 0, width, 0, 255), map(y, 0, height, 0, 255), 255));
  }
}
