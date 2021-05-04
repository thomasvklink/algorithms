/* topic: 2 x 1D Perlin noise and seeds exercise 2.5
Made by: Thomas van Klink & Tristan van Marle
For Algorithms in Creative Technology
4-5-2021*/

float xoff = 0.0;
float yoff = 0.0;
float xincrement = 0.01; 
float yincrement = 0.015;

void setup() {
  size(640, 360);
  background(0);
  noStroke();
}

void draw() {
  // Create an alpha blended background
  fill(0, 10);
  rect(0,0,width,height);
  
  // Get a noise value based on xoff and scale it according to the window's width
  float n = noise(xoff)*width;
  float m = noise(yoff)*height;
  
  // With each cycle, increment xoff
  xoff += xincrement;
  yoff += yincrement;
  
  // Draw the ellipse at the value produced by perlin noise
  fill(200);
  ellipse(n,m, 64, 64);
}
