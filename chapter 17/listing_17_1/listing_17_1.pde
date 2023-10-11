// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.ar.*;

ARTracker tracker;

void setup() {
  fullScreen(AR);
  tracker = new ARTracker(this);
  tracker.start();
  noStroke();  
}

void draw() {
  for (int i = 0; i < tracker.count(); i++) {
    ARTrackable t = tracker.get(i);
    println("Trackable", i, t);
  }  
}
