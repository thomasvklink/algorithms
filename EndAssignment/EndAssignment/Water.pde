/* this is a class for making the water under the boat.
The water moves in calm waves made by perlin 2D noise
Based on assignment 2.8 AiC by Thomas van Klink & Tristan van Marle and based on Shiffman's noiseWave*/

class Water { //class initialisation

//creating variable for y-offset
  float yoff = 0.0;   

  Water() { //constructor
  }

  void movingWater() {
    //creating the water
    stroke(5, 38, 123);
    beginShape();
    float xoff = 0;  
    fill(5, 38, 123);
    //giving the y value different values for every 15x so that we get smooth waves
    for (int x = 0; x < width; x+=15) {
      float y = map(noise(xoff, yoff), 0, 1, 200, 300);
      vertex(x*1.01, y*4);
      xoff+=0.01;
    }
    yoff+=0.005;
    vertex(width, height*4);
    vertex(0, height*4);
    endShape(CLOSE);
  }
}
