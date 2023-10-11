PShape sun, earth, moon;
float sunAngle, earthAngle, moonAngle;

void setup() {
  fullScreen(P3D);
  orientation(LANDSCAPE);
  
  sun = createShape(SPHERE, 150);
  sun.setStroke(false);
  sun.setEmissive(color(255, 255, 255));
  sun.setTexture(loadImage("sun.jpg"));
  
  earth = createShape(SPHERE, 80);
  earth.setStroke(false);
  earth.setTexture(loadImage("earth.jpg"));
  
  moon = createShape(SPHERE, 30);
  moon.setStroke(false);
  moon.setTexture(loadImage("moon.jpg"));  
}

void draw() {
  background(0);  
  
  translate(width/2, height/2);
  rotateX(-QUARTER_PI);
  
  pointLight(255, 255, 255, 0, 0, 0);

  rotateY(sunAngle);
  shape(sun);
  
  pushMatrix();
  rotateY(earthAngle);
  translate(600, 0);
  shape(earth);
    
  pushMatrix();
  rotateY(moonAngle);
  translate(150, 0);  
  shape(moon);
  popMatrix();
  
  popMatrix();
    
  earthAngle += 0.01;
  moonAngle += 0.005;
  sunAngle += 0.001;
}
