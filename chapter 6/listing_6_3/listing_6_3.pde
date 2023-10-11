// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage pic;
fullScreen();
pic = loadImage("paine.jpg");
imageMode(CENTER);
float r = float(pic.width) / float(pic.height);
float h = width / r;
image(pic, width / 2, height / 2, width, h);
