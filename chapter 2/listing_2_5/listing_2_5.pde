// Processing for Android: 
// Create Mobile, Sensor-Aware, and XR Applications Using Processing
// Andres Colubri
// https://andrescolubri.net/processing-for-android-book

size(600, 300);  

strokeWeight(2);

// Draw a rectangle in the bottom of the screen
beginShape();
vertex(5, 250);
vertex(590, 250);
vertex(590, 290);
vertex(5, 290);
endShape(CLOSE);

// Draw a star-like shape in right side
beginShape();
vertex(330, 25);
vertex(390, 90);
vertex(510, 10);
vertex(460, 120);  
vertex(510, 270);  
vertex(410, 180);
vertex(310, 270);
vertex(360, 150);
endShape(CLOSE);  

// Draw a small triangle right above the star shape
beginShape();
vertex(350, 30);
vertex(410, 30);
vertex(390, 75);
endShape();

ellipse(70, 80, 70, 70);
