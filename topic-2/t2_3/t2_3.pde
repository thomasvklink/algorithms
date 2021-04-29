// Algorithms for Creative technology 2.3
// Tristan van Marle, Thomas van Klink
// based on example by Daniel Shiffman from "The Nature of Code" lines 13, 17-18, 20

void setup() {
  size(600, 600);
  background(230);
}

void draw() {}

void paint(){
  
  float xloc = randomGaussian();
  float yloc = randomGaussian();
  float size = randomGaussian();

  float sd = 60;                
  float xMean = width/2;        
  float yMean = height/2;
  xloc = ( xloc * sd ) + xMean;  
  yloc = ( yloc * sd ) + yMean;
  size = ( size * 8);

  fill(12,22,247);
  noStroke();
  circle(xloc, yloc, size);  
  
}

void mousePressed(){
  for(int i = 0; i < 200; i++){
    paint();
  }
}

void keyPressed(){
  background(230);
}
