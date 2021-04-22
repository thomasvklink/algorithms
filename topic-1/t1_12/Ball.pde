class Ball {  
  float positionX;
  float positionY;
  float speedX = 0.5;
  float speedY = 0.5;
  int directionX = 1;
  int directionY = 1;
  int ballSize = 15; 

  Ball(float positionX, float positionY) { //Paramters
    this.positionX = positionX;
    this.positionY = positionY;
  }

  void run() { //Run the animating
    update();
    display();
  }

  void update() { //Animate the confetti
    positionX = positionX + (speedX*directionX);
    positionY = positionY + (speedY*directionY);
    
    if (positionX > width-ballSize || positionX < ballSize){
      directionX *= -1;
    }
    if (positionY > height-ballSize || positionY < ballSize){
      directionY *= -1;
    }
  }

  void display() {
    noStroke();
    ellipse(positionX, positionY, ballSize, ballSize);
  }

}
