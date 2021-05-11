class Drop { //class initialisation

  //setting variables
  PVector position;
  PVector speed;
  PVector gravity;
  PVector wind;
  float windNoise;

  Drop(float x, float y) {  //constructor
    position=new PVector(x, y);
    speed=new PVector(random(0.1, 0.2), random(1, 1.5));
    gravity = new PVector(0, 0.2);
    wind = new PVector(0, 0);
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
      translate(position.x, position.y+15);
      rotate(speed.heading()-radians(90));
      circle(0, 0, 10);
      triangle(-5, 0, 0, -15, 5, 0);
    popMatrix();
  }

  void update() {
    position.add(speed);
    position.add(gravity);
    reset();
  }

  void wind(int pressed, float offset) {
    windNoise = noise(offset);
    if (pressed == UP) {
      speed.x = speed.x + windNoise;
    } else if (pressed == DOWN) {
      speed.x = speed.x - windNoise;
    }
  }

  void reset() {
    if (position.y > height+10) {
      position.y = -10;
    }
    if (position.x > width+10) {
      position.x = -10;
    }
  }
}
