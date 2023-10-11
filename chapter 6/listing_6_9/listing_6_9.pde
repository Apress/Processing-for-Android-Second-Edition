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
  background(255);
}

void draw() {  
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
}

void mousePressed() {
  background(255);
}

class Particle {
  float x, y, r;
  float dx, dy;
  color c;
  
  Particle() {
    x = random(0, width);
    y = random(0, height);    
    pickDirection();
    r = random(10, 50) * displayDensity;
    c = color(random(0, 255), random(0, 255), random(0, 255));
  }
  
  void update() {
    x += dx;
    y += dy;
    if (x < 0 || width < x) x = random(0, width);
    if (y < 0 || height < y) y = random(0, height);
    if (random(0, 1) < 0.02) pickDirection();
  }

  void pickDirection() {
    float a = random(0, TWO_PI);
    float s = random(-2, 2);
    dx = s * cos(a);
    dy = s * sin(a);    
  }
  
  void display() {
    fill(c);
    ellipse(x, y, r, r);
  }
}
