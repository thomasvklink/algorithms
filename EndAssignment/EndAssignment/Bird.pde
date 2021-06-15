class Bird{
  
  PVector pos;
  PVector vel;
  PVector acc;
  float max;
  float force;
  color bird;
  int size;
  
   Bird(float x, float y) {  //constructor
    pos = new PVector(x, y);
    vel = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);
    max = 3;
    force = 0.01;
    bird = color(random(0, 255), random(0, 255), random(0, 255));
    size = 1;
  }
  
    void render() {
    float theta = vel.heading2D() + radians(90);
    fill(bird);
    noStroke();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    ellipse(0, 0, 10, 15);
    triangle(0, 0, 5, 10, -5, 10);
    popMatrix();
  }
  void update() {
    vel.add(acc); //Update speed
    vel.limit(max); //Limit the speed
    pos.add(vel); //Move the fish by add the velocity to the position
    acc.mult(0); //Reset acceleration
    borders();
  }
  
  void borders(){ //Variable for fish size? r?
    if (pos.x < -size) vel.x = - vel.x;
    if (pos.y < -size) vel.y = - vel.y;
    if (pos.x > width+size) vel.x = - vel.x;
    if (pos.y > height+size) vel.y = - vel.y;
  }
}
