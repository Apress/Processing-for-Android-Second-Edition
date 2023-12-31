// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

PImage img;
size(800, 533, P2D);
img = loadImage("paine.jpg");  
beginShape();
texture(img);
vertex(100, 0, 0, 0);
vertex(width - 100, 0, img.width, 0);
vertex(width, height, img.width, img.height);
vertex(0, height, 0, img.height);
endShape();
