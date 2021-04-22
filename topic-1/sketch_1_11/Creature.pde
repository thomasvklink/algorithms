class Creature {
  float creatureX;
  float creatureY;
  float creatureMovementX;
  float creatureMovementY;
  float speedX;
  float speedY;
  float creatureWidth;
  float creatureHeight;
  float rectangleCurve;
  boolean isSelected;
  boolean dontSelectMore;
  color resetColor;
  Eyes eye;

  Creature (float initCreatureX, float initCreatureY) {
    creatureX = initCreatureX;
    creatureY = initCreatureY;
    speedX = random( - 4, 4);
    speedY = random( - 4, 4);
    creatureWidth = 80;
    creatureHeight = 100;
    rectangleCurve = (creatureX-width*0.2);
    isSelected = false;
    dontSelectMore = false;
    resetColor = color (57, 255, 20);


    eye = new Eyes(creatureX, creatureY);
  }

  void display() {
    noStroke();
    ellipseMode(CENTER);
    rectMode(CENTER);
    fill(resetColor);

    //

    //triangle head left
    triangle((creatureX-42), (creatureY-36), (creatureX-21), (creatureY+3), (creatureX-63), (creatureY+3));


    //ellipse head middle
    ellipse((creatureX), (creatureY-21), (39), (39));

    //rectangle head right
    rect((creatureX+45), (creatureY-19.2), (39), (39));
    eye.setPosition(creatureX, creatureY);
    eye.display();

    //left neck
    fill(resetColor);
    pushMatrix();
    translate((creatureX-30), (creatureY+12));
    rotate(radians(320));
    rect(0, 0, (9), (51), (129));  
    popMatrix();

    //middle neck
    pushMatrix();
    translate(creatureX, (creatureY+12));
    rotate(radians(360)); 
    rect(0, 0, (9), (37.5), (129));  
    popMatrix();

    //right neck
    pushMatrix();
    translate((creatureX+33), (creatureY+12));
    rotate(radians(220));
    rect(0, 0, (9), (37.5), (129));  
    popMatrix();

    //body
    rectangleCurve = (creatureY/(0.015*height));
    rect(creatureX, (creatureY+60), (90), (75), (rectangleCurve));

    //left leg
    pushMatrix();
    translate((creatureX-37.5), (creatureY+102));
    rotate(radians(220));
    rect(0, 0, (21), (69), (129));  
    popMatrix();

    //right leg
    pushMatrix();
    translate((creatureX+37.5), (creatureY+102));
    rotate(radians(320));
    rect(0, 0, (21), (69), (129));  
    popMatrix();
  } 

  void update() {
    creatureX = creatureX + speedX;
    creatureY = creatureY + speedY;
    if ((creatureX > width - creatureWidth/1.32 && speedX > 0) || (creatureX < creatureWidth/1.33 && speedX < 0)) {
      speedX = -speedX;
    }
    if ((creatureY > width - creatureHeight/1.23 && speedY > 0) || (creatureY < creatureHeight/3.7 && speedY < 0)) {
      speedY = -speedY;
    }
  }
  void mouse(float initCreatureX, float initCreatureY) {
    if (dist(creatureX, 0, initCreatureX, 0) <= creatureWidth && dist(0, creatureY, 0, initCreatureY) <= creatureHeight && dontSelectMore == false)
    {
      speedX = 0;
      speedY = 0;
      isSelected = true;
    }
  }
  
  void test(float initCreatureX, float initCreatureY) {
    if (dist(creatureX, creatureY, initCreatureX, initCreatureY) <= creatureWidth){
      speedX = 0;
      speedY = 0;
      isSelected = true;
    }
  }

  void released(float initCreatureX, float initCreatureY, float initCreatureMovementX, float initCreatureMovementY) {
    if (isSelected) {
      speedX = speedX + (initCreatureX - initCreatureMovementX)/2;
      speedY = speedY + (initCreatureY - initCreatureMovementY)/2;
      isSelected = false;
    }
  }

  void dragged(float initCreatureX, float initCreatureY) {
    if (isSelected) {
      creatureX = initCreatureX;
      creatureY = initCreatureY;
      isSelected = true;
    }
    eye.dragged(initCreatureX, initCreatureY);
  }
  void key() {
    eye.pressed();
  }
}
