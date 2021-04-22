class Ball {  
  PVector position;
  PVector speed;
  int directionX = 1;
  int directionY = 1;
  int ballSize = 15; 

  Ball(float positionX, float positionY) { //Parameters
    position = new PVector(random(0, width), random(0, height));
    speed = new PVector(random(-3,4),random(-3,4));
  }

  void run() { //Run the animating
    update();
    display();
  }

  void update() { //Animate the confetti
    position.add(speed);

    if (position.x > width-ballSize || position.x < ballSize) {
      speed.x = speed.x*-1;
    }
    if (position.y > height-ballSize || position.y < ballSize) {
      speed.y = speed.y *-1;
    }
  }

  void display() {
    noStroke();
    ellipse(position.x, position.y, ballSize*2, ballSize*2);
  }
}
