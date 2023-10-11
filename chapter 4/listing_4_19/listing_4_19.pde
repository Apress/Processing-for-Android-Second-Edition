// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

size(450, 200, P2D);
PShape cc = loadShape("cc.svg");
PShape moz = loadShape("mozilla.svg");
PShape ruby = loadShape("ruby.svg");
translate(30, 50);
cc.setFill(color(170, 116, 0));
cc.setStroke(color(255, 155, 0));
shape(cc);
translate(cc.width + 30, 0);
shape(moz);
translate(moz.width + 30, 0);
shape(ruby);
