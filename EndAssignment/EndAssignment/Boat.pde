class Boat {

  //calling classes
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
  float bars;
  boolean isMoving;

  Boat(int xPos, int yPos) { //constructor
    this.xPos = xPos;
    this.yPos = yPos;
    c=300;
    f=0.01;
  }

  void load() {
    boat = loadShape("boat.svg");
  }

  void render() {
    drops.show();
    pushMatrix();
    translate(xPos, yPos-300);
    rotate(totalRotation);
      pushMatrix();
      translate(0,670);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    shape(boat, 0, 210);
    popMatrix();
    
    shape(support, width/2,height/2);
  }

  void update() {
    swing(incomingVelocity, followingTorque);
    drops.update();
    if (abs(totalRotation) < 0.02) {
      isMoving = false;
    } else {
      isMoving = true;
    }
    
    //println(totalRotation, isMoving);
  };

  void swing(float incomingVelocity, float followingTorque) {
    float usedVelocity = angularVelocity - incomingVelocity; 
    float friction = usedVelocity * f;
    torque = (1 / c * totalRotation + friction);
    totalRotation += usedVelocity;
    angularVelocity += followingTorque - torque;
  }
  void particles() {
    if (totalRotation > 0.3 || totalRotation < -0.3) {
      drops.particleAdd(random(ship.xPos+150, ship.xPos-150) , yPos+400);
      println("it works");
    }
  }
}
