color bckColor = #EA6411; 

void setup() {
  fullScreen();
  requestPermission("android.permission.READ_EXTERNAL_STORAGE", "handlePermission");
}

void draw() {
  background(bckColor);
}

void handlePermission(boolean granted) {
  if (granted) bckColor = #58EA11; 
}
