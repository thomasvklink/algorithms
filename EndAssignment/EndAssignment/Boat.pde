/*
  This is a class Boat that call forth the svg file of the boat as well as the constraints which are on the ship and the drops that drip of the ship.
  It handles the formula's for the mass spring damper as well.
*/

class Boat {

  //calling classes
  Control control;
  ParticleSystem drops;

  //settting variables for position
  int xPos;
  int yPos;

  //calling in the PShape
  PShape boat;
  PShape support;

  //setting variables for the formula's of the mass-spring damper system
  float incomingVelocity;
  float followingTorque;
  float torque = 0.001;
  float f;
  float c;
  float angularVelocity = 0.001;
  float totalRotation = 0.0;

  float rotation;
  float bars = 20;
  boolean isMoving;
  float timer;
  
  int seat = 0;

  Boat(int xPos, int yPos) { //constructor
    drops = new ParticleSystem(xPos, yPos);
    this.xPos = xPos;
    this.yPos = yPos;
    c=300;
    f=0.01;
  }

  void load() {
    boat = loadShape("boat.svg");
    support = loadShape("support.svg");
  }

  void render(Guest[] guests) {
    
    pushMatrix();
    translate(xPos, yPos-300);
    rotate(totalRotation);

    //Seat 1
    //-Guest
    pushMatrix();
    translate(-165, 655);
    if (seat > 0){
    guests[0].render(0, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(-165, 655);
    rotate(bars-3.2);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();


    //Seat 2
    //-Guest
    pushMatrix();
    translate(-120, 660);
    if (seat > 1){
    guests[1].render(0, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(-120, 660);
    rotate(bars-3.2);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 3
    //-Guest
    pushMatrix();
    translate(-75, 665);
    if (seat > 2){
    guests[2].render(0, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(-75, 665);
    rotate(bars-3.2);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 4
    //-Guest
    pushMatrix();
    translate(-25, 670);
    if (seat > 3){
    guests[3].render(0, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(-25, 670);
    rotate(bars-3.2);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //MIDDLE OF BOAT

    //Seat 5
    //-Guest
    pushMatrix();
    translate(0, 670);
    if (seat > 4){
    guests[4].render(25, 2);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(0, 670);
    rotate(-bars);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 6
    //-Guest
    pushMatrix();
    translate(50, 670);
    if (seat > 3){
    guests[5].render(25, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(50, 670);
    rotate(-bars);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 7
    //-Guest
    pushMatrix();
    translate(95, 665);
    if (seat > 2){
    guests[6].render(25, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(95, 665);
    rotate(-bars);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 8
    //-Guest
    pushMatrix();
    translate(140, 660);
    if (seat > 1){
    guests[7].render(25, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(140, 660);
    rotate(-bars);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    //Seat 9
    //-Guest
    pushMatrix();
    translate(185, 655);
    if (seat > 0){
    guests[8].render(25, 0);
    }
    popMatrix();
    //-Bar
    pushMatrix();
    translate(185, 655);
    rotate(-bars);
    stroke(0);
    rect(0, 0, 40, 1);
    popMatrix();

    shape(boat, 0, 210);
    popMatrix();
    shape(support, width/2, height/2-100);
  }

  void update() {
    drops.update();
    swing(incomingVelocity, followingTorque);
    if (abs(totalRotation) < 0.03) {
      isMoving = false;
    } else {
      isMoving = true;
    }
    particles();
  };

  void swing(float incomingVelocity, float followingTorque) {
    float usedVelocity = angularVelocity - incomingVelocity; 
    float friction = usedVelocity * f;
    torque = (1 / c * totalRotation + friction);
    totalRotation += usedVelocity;
    angularVelocity += followingTorque - torque;
  }

  void particles() {
    if (!isMoving) {
      pushMatrix();
      translate(xPos, yPos+370);
      rotate(totalRotation);
      drops.show();
      popMatrix();
      drops.particleAdd(random(-300, 300), 0);
    }
  }
}
