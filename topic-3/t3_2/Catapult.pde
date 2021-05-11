class Catapult { //class initialisation

  //setting variables
  PVector pos;
  Ball ball;

  Catapult(float x, float y, Ball ball_) {  //constructor
    pos=new PVector(x, y);
    ball = ball_;
  }
  void show() {
    noStroke();
    rectMode(CENTER);
    fill(139, 69, 19);

    //creating the catapult
    rect(pos.x, pos.y, 40, 130, 200);
    pushMatrix();
    translate((pos.x+40), (pos.y-90));
    rotate(radians(220));
    rect(0, 0, (40), (130), (200));  
    popMatrix();
    pushMatrix();
    translate((pos.x-40), (pos.y-90));
    rotate(radians(140));
    rect(0, 0, (40), (130), (200));  
    popMatrix();

    //incorporating ball
    ball.show();
    ball.update();
  }

  void dragHandler(float initMouseX, float initMouseY) {
    ball.drag(initMouseX, initMouseY);
  }
  void releasedHandler(float initMouseX, float initMouseY, float ballMovementX, float ballMovementY) {
    ball.released(initMouseX, initMouseY, ballMovementX, ballMovementY);
  }
}
