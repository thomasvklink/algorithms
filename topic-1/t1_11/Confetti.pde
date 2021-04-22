class Confetti {

  color c;        // a confetti has a colour
  PVector confettiPos;     // a confetti has an x-position
  float radius;    // a confetti has a radius;
  PVector speed;       // the confetti moves with some speed in x direction


  //constructor: gives values to the variables
  Confetti() { 
    //random pinkish colour
    c = color(int(random(180, 255)), int(random(0, 150)), int(random(100, 200)));  //pinkish

    //random radius and position
    radius = random(10, 25);
    confettiPos = new PVector(random(radius, width-radius), random(radius, height-radius));

    // random speed
    speed = new PVector(random(-3, 4), random(-3,4));               // speed in x-direction
    while (speed== new PVector(0, 0)) speed = new PVector(random(-3, 4), random(-3,4)); // nonzero speed
  }

  void render() {
    //noStroke();
    fill(c);
    ellipse(confettiPos.x, confettiPos.y, 2*radius, 2*radius);
  }

  void update() {
    //if the confetti reaches the left wall or the right wall, it bounces
    if ((confettiPos.x > width) || (confettiPos.x < 0)) {
      speed.x = -speed.x;
    }
    confettiPos.add(speed);
    //if the confetti reaches the top wall or the botton wall, it bounces
    if ((confettiPos.y > height) || (confettiPos.y <0)) {
      speed.y = -speed.y;
    }
    confettiPos.add(speed) ;
  }

  void set_speed(float dx, float dy) {
    speed = new PVector(dx, dy);
  }
}
