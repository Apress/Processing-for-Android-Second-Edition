// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

size(900, 300);

fill(200, 100, 100);
beginShape();
for (float angle = 0; angle <= TWO_PI; angle += TWO_PI/4) {
  float x = 150 + 100 * cos(angle);
  float y = 150 + 100 * sin(angle);
  vertex(x, y);
}
endShape(CLOSE);

fill(100, 200, 100);
beginShape();
for (float angle = 0; angle <= TWO_PI; angle += TWO_PI/6) {
  float x = 450 + 100 * cos(angle);
  float y = 150 + 100 * sin(angle);
  vertex(x, y);
}
endShape(CLOSE);

fill(100, 100, 200);
beginShape();
for (float angle = 0; angle <= TWO_PI; angle += TWO_PI/8) {
  float x = 750 + 100 * cos(angle);
  float y = 150 + 100 * sin(angle);
  vertex(x, y);
}
endShape(CLOSE);
