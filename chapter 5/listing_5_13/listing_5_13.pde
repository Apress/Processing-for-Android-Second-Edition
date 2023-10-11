// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

String text = "touch the screen to type something";
boolean keyboard = false;

void setup() {
  fullScreen();
  textFont(createFont("Monospaced", 25 * displayDensity));
  textAlign(CENTER);
  fill(100);
}

void draw() {
  background(200);
  text(text, 0, 20, width, height - 40);
}

void keyReleased() {
  if (key == DELETE || key == BACKSPACE) {
    text = text.substring(text.length() - 1);
  } else {
    text += key;
  }
}

void mouseReleased() {
  if (!keyboard) {;
    text = "";
    openKeyboard();
    keyboard = true;
  } else {
    closeKeyboard();
    keyboard = false;
  }
}
