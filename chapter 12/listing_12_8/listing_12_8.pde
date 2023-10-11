// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

int bpm;

void setup() {
  fullScreen();
  frameRate(1);
  textFont(createFont("SansSerif", 28 * displayDensity));
  textAlign(CENTER, CENTER);
  thread("generateData");
}

void draw() {
  background(0);
  text(bpm + " beats/min", 0, 0, width, height);      
}

void generateData() {
  while (true) {
    bpm = int(random(60, 100));
    delay(2000);
  }
}
