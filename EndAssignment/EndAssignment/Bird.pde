/*
  This is a class Bird that call forth the gif for the birds to create a flapping bird. 
  This bird will later on be used in the flocking class.
*/

class Bird {//class initialisation

  //variables to use the gif
  PApplet app; 
  Gif bird;
  
  //PVectors which are used for movement
  PVector pos;
  PVector vel;
  PVector acc;
  //variables which are used for movement
  float max;
  float force;
  
  //variables which are used for limiting the flying field of the birds
  int xSize;
  int ySize;

  Bird(float x, float y, PApplet app) {  //constructor
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);
    max = 3;
    force = 0.01;
    xSize = 50;
    xSize = 100;
    bird = new Gif(app, "bird1.gif");
    bird.loop();
  }

  void render() {
    //creating the bird
    float theta = vel.heading(); //making sure the bird flies in the correct way
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    tint(0, 0, 0);
    image(bird, 0, 0, 50, 100);
    popMatrix();
  }
  void update() {
    vel.add(acc); //Update speed
    vel.limit(max); //Limit the speed
    pos.add(vel); //Move the bird by adding the velocity to the position
    acc.mult(0); //Reset acceleration
    borders();
  }

  void borders() {
    //check if the bird would fly to far outside the screen and have the bird then move the opposite way
    if (pos.x < -xSize) vel.x = - vel.x;
    if (pos.y < -ySize) vel.y = - vel.y;
    if (pos.x > width+xSize) vel.x = - vel.x;
    if (pos.y > height/6+ySize) vel.y = - vel.y;
  }
}
