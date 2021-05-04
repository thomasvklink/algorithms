// Daniel Shiffman
// The Nature of Code
// http://natureofcode.com
float s;
float increment = 0.02;
void setup() {
  size(640, 360);
  noLoop();
}

void draw() {
  background(0);
 for(int i=0; i <10; i++){
  s = millis(); 
 }
  // Optional: adjust noise detail here
  // noiseDetail(8,0.65f);

  loadPixels();

  float xoff = 0.0; // Start xoff at 0

  // For every x,y,t coordinate in a 3D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height; y++) {
      yoff += increment; // Increment yoff
      float toff = 0.0; // for every yoff, start toff at 0
      for (int t = 0; t < s; t++) {
        toff += increment; // Increment toff
        // Calculate noise and scale by 255
        float bright = noise(xoff, yoff, toff)*255; 
        // Try using this line instead
        //float bright = random(0,255);

        // Set each pixel onscreen to a grayscale value
        pixels[x+y*width] = color(bright);
      }
    }
  }

  updatePixels();
}
