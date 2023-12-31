// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

import processing.vr.*;

float angle;
boolean flyMode = false;
PVector flyStep = new PVector();

void setup() {
  fullScreen(STEREO);
  textureMode(NORMAL);
  createBase(300, 70, 20);
  createButtons(300, 100, 380, 130);
}

void calculate() {
  if (mousePressed) {
    if (leftButton.selected) angle -= 0.01;
    if (rightButton.selected) angle += 0.01;
    if (flyMode) {
      getEyeMatrix(eyeMat);
      flyStep.add(2 * eyeMat.m02, 2 * eyeMat.m12, 2 * eyeMat.m22);
    }
  }
  if (mousePressed && !selectingUI() && !flyMode) {
    updateStrokes();
  }
}

void draw() {
  background(0);  
  translate(width/2, height/2);
  ambientLight(40, 40, 40);
  directionalLight(200, 200, 200, 0, +1, -1);
  translate(-flyStep.x, -flyStep.y, -flyStep.z);
  drawBase();
  drawStrokes();
  if (flyMode) drawWings();
  drawUI();
}

void mouseReleased() {
  if (resetButton.selected) {
    clearDrawing(); 
    angle = 0;
  } else if (flyToggle.selected) { 
    flyToggle.toggle();
    if (flyToggle.state == 0) {
      flyMode = false;
      flyStep.set(0, 0, 0);
    } else {
      flyMode = true;
    }
  } else {
    startNewStroke();
  }
}
