// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

Circle[] circles = new Circle[100];

void setup() {
  size(800, 800);
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  translate(width/2, height/2);  
  for (int i = 0; i < circles.length; i++) {
    circles[i].display();
  }  
}

class Circle {
  float centerX, centerY, radius, weight;
  color fillColor, strokeColor;
  float rotAngle, rotSpeed;
  Circle() {
    centerX = random(-width/2, width/2);
    centerY = random(-height/2, height/2);
    radius = random(10, 100);
    weight = random(2, 15);
    rotSpeed = random(0.005, 0.02);
    rotAngle = 0;
    fillColor = color(random(255), random(255), random(255));
    strokeColor = color(random(255), random(255), random(255));
  }
  void display() {
    pushMatrix();
      rotate(rotAngle);
   
      pushStyle();
        stroke(strokeColor);
        strokeWeight(weight);
        fill(fillColor);
        ellipse(centerX, centerY, radius, radius);
      popStyle();
      
    popMatrix();
    rotAngle += rotSpeed;
  }
}

void keyPressed() {
  save("img.png");  
}
