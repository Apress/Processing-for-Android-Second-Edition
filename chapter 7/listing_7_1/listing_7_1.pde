// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;

Context context;
SensorManager manager;
Sensor sensor;

void setup() {
  fullScreen();  
  context = getContext();
  manager = (SensorManager)context.getSystemService(Context.SENSOR_SERVICE);
  sensor = manager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
}

void draw() {
}
