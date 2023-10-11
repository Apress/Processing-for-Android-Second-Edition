// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;

Context context;
SensorManager manager;
Sensor sensor;
SensorListener listener;

int offset = -1;
int steps;

void setup() {
  frameRate(1);
  strokeCap(ROUND);
  stroke(255);
  noFill();
  textFont(createFont("SansSerif", 18 * displayDensity));
  textAlign(CENTER, CENTER);
  requestPermission("android.permission.ACTIVITY_RECOGNITION", "initCounter");
}

void draw() {
  background(0);
  if (wearAmbient()) strokeWeight(1);
  else strokeWeight(10);
  float angle = map(min(steps, 100), 0, 100, 0, TWO_PI);
  arc(width/2, height/2, width/2, width/2, PI + HALF_PI, PI + HALF_PI + angle);
  if (steps == 0) text("0 steps", 0, 0, width, height);    
}

void initCounter(boolean granted) {
  if (granted) {
    Context context = getContext();
    manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
    sensor = manager.getDefaultSensor(Sensor.TYPE_STEP_COUNTER);  
    listener = new SensorListener();  
    manager.registerListener(listener, sensor, SensorManager.SENSOR_DELAY_NORMAL);
  }
}

class SensorListener implements SensorEventListener {
  void onSensorChanged(SensorEvent event) {
    if (offset == -1) offset = (int)event.values[0]; 
    steps = (int)event.values[0] - offset;
  }
  void onAccuracyChanged(Sensor sensor, int accuracy) { }
}
