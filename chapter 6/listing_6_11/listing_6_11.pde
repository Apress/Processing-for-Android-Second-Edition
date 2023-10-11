// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

Particle[] particles;
float noiseScale = 0.001;
float time = 0;
float timeStep = 0.01;
PImage img;

void setup() {
  fullScreen();
  img = loadImage("paine_cropped.jpg");
  img.loadPixels(); 
  particles = new Particle[50];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  noStroke();
  background(0);
}

void draw() {  
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
  time += timeStep;
}

class Particle {
  float x, y, r;
  float speed;
  color c;
  
  Particle() {
    x = random(0, width);
    y = random(0, height);    
    speed = random(-2, 2);
    r = random(5, 10) * displayDensity;
  }
  
  void update() {
    float n = noise(noiseScale * x, noiseScale * y, time);    
    float a = map(n, 0, 1, 0, TWO_PI);
    x += speed * cos(a);
    y += speed * sin(a);
    
    if (width < x) x = 0;
    if (x < 0) x = width - 1;
    if (height < y) y = 0;
    if (y < 0) y = height - 1;
    
    getColor();
  }

  void getColor() {
    int i = int(map(x, 0, width, 0, img.width - 1));
    int j = int(map(y, 0, height, 0, img.height - 1));
    c = img.get(i, j);    
  }

  void display() {
    fill(red(c), green(c), blue(c), 10);
    ellipse(x, y, r, r);
  }
}
