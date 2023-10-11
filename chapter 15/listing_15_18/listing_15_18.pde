// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import java.time.Instant;
import java.time.ZoneOffset;
import ketai.sensors.*; 

PShape earth;
PShader earthShader;

float viewRotation;
float earthRotation;

KetaiLocation location;
float longitude;

void setup() {  
  fullScreen(P3D);
  
  PImage earthDay = loadImage("Solarsystemscope_texture_2k_earth_daymap.jpg");
  PImage earthNight = loadImage("Solarsystemscope_texture_2k_earth_nightmap.jpg");

  PGraphicsOpenGL pgl = (PGraphicsOpenGL)g; 
  pgl.textureWrap(REPEAT);

  earthShader = loadShader("EarthFrag.glsl", "EarthVert.glsl");
  earthShader.set("dayTexture", earthDay);
  earthShader.set("nightTexture", earthNight);
  earthShader.set("width", width);
  earthShader.set("height", height);
  
  earth = createShape(SPHERE, 400);
  earth.setStroke(false);
  
  location = new KetaiLocation(this);
}

void draw() {
  background(0);

  Instant instant = Instant.now();
  int hour = instant.atZone(ZoneOffset.UTC).getHour();
  int minute = instant.atZone(ZoneOffset.UTC).getMinute();
  float utcTime = 60 * hour + minute;
  earthRotation = map(utcTime, 0, 1439, HALF_PI - PI, HALF_PI + PI);
  earthShader.set("earthRotation", earthRotation);
 
  viewRotation = longitude - earthRotation;
  
  translate(width/2, height/2);
  
  shader(earthShader);
  pushMatrix();  
  rotateY(viewRotation);
  shape(earth);
  popMatrix();
}

void onLocationEvent(double lat, double lon) {
  longitude = radians((float)lon + 210);
}
