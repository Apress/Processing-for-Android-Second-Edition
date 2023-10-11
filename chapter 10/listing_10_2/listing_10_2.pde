// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

void setup() {
  fullScreen();
  frameRate(1);
  textFont(createFont("Serif-Bold", 48 * displayDensity));
  textAlign(CENTER, CENTER);
  fill(255);  
}

void draw() {
  background(0);
  if (wearInteractive()) {
    String str = hour() + ":" + nfs(minute(), 2) + ":" + nfs(second(), 2);
    text(str, width/2, height/2);     
  }  
}
