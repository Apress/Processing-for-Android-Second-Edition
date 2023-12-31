// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

float minSize = 50;
float maxSize = 100;
ArrayList<ColorDot> dots;

void setup() {
  size(800, 480);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  dots = new ArrayList<ColorDot>();
}

void draw() {
  background(0, 0, 0);  
  
  if (random(1) < 0.1) {
    dots.add(new ColorDot());
  }  
  
  for (int i = dots.size() - 1; i >= 0 ; i--) {
    ColorDot d = dots.get(i);
    d.update();
    d.display();
    if (d.colorAlpha < 1) {
      dots.remove(i);
    }    
  }  
}

class ColorDot {
  float posX, posY;
  float rad, maxRad;
  float colorHue, colorAlpha;
  
  ColorDot() {
    posX = int(random(1, width/maxSize)) * maxSize;
    posY = int(random(1, height/maxSize)) * maxSize;
    rad = 0.1;
    maxRad = random(minSize, maxSize);    
    colorHue = random(0, 360);    
    colorAlpha = 70;
  }
  
  void update() {
    if (rad < maxRad) {
      rad *= 1.5; 
    } else {
      colorAlpha -= 0.3;
    }
  }
  
  void display() {
    fill(colorHue, 100, 100, colorAlpha);
    ellipse(posX, posY, rad, rad);
  }
}
