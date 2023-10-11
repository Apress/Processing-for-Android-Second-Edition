// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage streetImage;
String apiKey = "<your API key>";

void setup() {
  size(512, 512); 
  streetImage = requestImage("https://maps.googleapis.com/maps/api/streetview?" +
                             "size=512x512&location=42.3742025,-71.1292058&" + 
                             "fov=100&heading=230&key=" + apiKey);
}

void draw() {
  if (0 < streetImage.width && 0 < streetImage.height) {
    image(streetImage, 0, 0, width, height);
  }
}
