// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import android.os.Environment;

PImage currImage;
ArrayList<String> imageNames = new ArrayList<String>();
String defImageName = "default.jpg";

int numParticles = 100;
Particle[] particles;
float noiseScale = 0.001;
float time = 0;
float timeStep = 0.01;

int lastChange;
int swapInterval = 30;

void setup() {
  fullScreen();
  if (!wallpaperPreview()) {
    requestPermission("android.permission.READ_EXTERNAL_STORAGE", "scanForImages");
  }
  loadRandomImage();
  particles = new Particle[numParticles];
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
  int t = millis();
  if (swapInterval * 1000 < t - lastChange) {
    loadRandomImage();
    lastChange = t;
  }  
}

void loadRandomImage() {
  if (imageNames.size() == 0) {
    currImage = resizeAndCenterCrop(defImageName, 800);
  } else {
    int i = int(random(1) * imageNames.size());
    String fn = imageNames.get(i);
    currImage = resizeAndCenterCrop(fn, 800);
  }
}

void scanForImages(boolean grantedPermission) {
  if (grantedPermission) {
    File dcimDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);    
    String[] subDirs = dcimDir.list();    
    if (subDirs == null) return;    
    for (String d: subDirs) {
      if (d.charAt(0) == '.') continue;
      File fullPath = new File (dcimDir, d);  
      File[] listFiles = fullPath.listFiles();
      for (File f: listFiles) {
        String filename = f.getAbsolutePath().toLowerCase();
        if (filename.endsWith(".jpg")) imageNames.add(filename);
      }
    }
  }
}

PImage resizeAndCenterCrop(String fn, int h) {
  PImage src = loadImage(fn);
  float imgRatio = float(src.width) / float(src.height);  
  int w = int(imgRatio * h);
  src.resize(w, h);
  float screenRatio = float(width) / float(height);
  int wCrop = int(screenRatio * h);
  return src.get(w / 2 - wCrop / 2, 0, wCrop, h);
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
    int i = int(map(x, 0, width, 0, currImage.width - 1));
    int j = int(map(y, 0, height, 0, currImage.height - 1));
    c = currImage.get(i, j);    
  }

  void display() {
    fill(red(c), green(c), blue(c), 10);
    ellipse(x, y, r, r);
  }
}
