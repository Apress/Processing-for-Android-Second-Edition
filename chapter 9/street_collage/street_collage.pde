// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;

LocationManager manager;
SimpleListener listener;
String provider;
LocationQueue queue = new LocationQueue();
ArrayList<LocationValue> path = new ArrayList<LocationValue>();
ArrayList<PImage> images = new ArrayList<PImage>();
PGraphics collage;
String apiKey = "<your API key>";

void setup () {
  fullScreen();
  orientation(LANDSCAPE);
  collage = createGraphics(width, height);
  collage.beginDraw();
  collage.background(0);
  collage.endDraw();
  requestPermission("android.permission.ACCESS_FINE_LOCATION", "initLocation");  
}

void draw() {  
  updateCollage();
  image(collage, 0, 0);
}

void updateCollage() {
  while (queue.available()) {
    LocationValue loc = queue.remove();
    if (0 < path.size()) {
      LocationValue last = path.get(path.size() - 1);
      if (last.distanceTo(loc) < loc.accuracy + last.accuracy) continue;
    }    
    path.add(0, loc);
    String url = "https://maps.googleapis.com/maps/api/streetview?location=" + 
                 loc.latitude + "," + loc.longitude + 
                 "&size=512x512&fov=90&pitch=-10&sensor=false&key=" + apiKey;
    images.add(requestImage(url));
    if (10 < images.size()) {
      images.remove(0);
    }
    
    for (int i = 0; i < images.size(); i++) {
      collage.beginDraw();
      PImage source = images.get(i);
      PImage crop = source.get(200, 56, 200, 400);
      float w = float(width) / 10;
      collage.image(crop, i * w, 0, w, height);
      collage.endDraw();      
    }
  }
}

void initLocation(boolean granted) {
  if (granted) {
    Context context = getContext();    
    listener = new SimpleListener();
    manager = (LocationManager) context.getSystemService(Context.LOCATION_SERVICE);
    provider = LocationManager.NETWORK_PROVIDER;
    if (manager.isProviderEnabled(LocationManager.GPS_PROVIDER)) {
      provider = LocationManager.GPS_PROVIDER;
    }
    manager.requestLocationUpdates(provider, 1000, 1, listener);
  }
}

class SimpleListener implements LocationListener {
  public void onLocationChanged(Location loc) {
    queue.add(new LocationValue(loc.getLatitude(), loc.getLongitude(), loc.getAccuracy()));
  }
  public void onProviderDisabled(String provider) { }
  public void onProviderEnabled(String provider) { }
  public void onStatusChanged(String provider, int status, Bundle extras) { }  
}

public void resume() {
  if (manager != null) {
    manager.requestLocationUpdates(provider, 1000, 1, listener);
  }
}

public void pause() {
  if (manager != null) {
    manager.removeUpdates(listener);
  }
}

class LocationValue {
  double latitude;
  double longitude;
  double accuracy;

  LocationValue(double lat, double lon, double acc) {
    latitude = lat;
    longitude = lon;
    accuracy = acc;
  }
  
  double distanceTo(LocationValue dest) {
    double a1 = radians((float)latitude);
    double a2 = radians((float)longitude);
    double b1 = radians((float)dest.latitude);
    double b2 = radians((float)dest.longitude);

    double t1 = Math.cos(a1) * Math.cos(a2) * Math.cos(b1) * Math.cos(b2);
    double t2 = Math.cos(a1) * Math.sin(a2) * Math.cos(b1) * Math.sin(b2);
    double t3 = Math.sin(a1) * Math.sin(b1);
    double tt = Math.acos(t1 + t2 + t3);

    return 6366000 * tt;
  }
}
  
class LocationQueue {
  LocationValue[] values = new LocationValue[10];
  int offset, count;
    
  synchronized void add(LocationValue val) {
    if (count == values.length) {
      values = (LocationValue[]) expand(values);
    }
    values[count++] = val;
  }
  
  synchronized LocationValue remove() {
    if (offset == count) {
      return null;
    }
    LocationValue outgoing = values[offset++];
    if (offset == count) {
      offset = 0;
      count = 0;
    }
    return outgoing;
  }
  
  synchronized boolean available() {
    return 0 < count;
  }  
}
