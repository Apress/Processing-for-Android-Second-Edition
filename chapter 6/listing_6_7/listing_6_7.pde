// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

Particle[] particles;

void setup() {
  fullScreen();
  particles = new Particle[50];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  noStroke();
}

void draw() {
  background(255); 
  for (int i = 0; i < particles.length; i++) {
    particles[i].display();
  }
}

class Particle {
  float x, y, r;
  color c;
  
  Particle() {
    x = random(0, width);
    y = random(0, height);
    r = random(10, 50) * displayDensity;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
}
