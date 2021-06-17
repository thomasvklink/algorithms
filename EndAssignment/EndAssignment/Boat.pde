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
  float bars = 20;
  boolean isMoving;

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

  void render() {
    drops.show();
    pushMatrix();
    translate(xPos, yPos-300);
    rotate(totalRotation);
    
      //Seat 1
      pushMatrix();
      translate(-165,655);
      rotate(bars-3.2);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    
      //Seat 2
      pushMatrix();
      translate(-120,660);
      rotate(bars-3.2);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    
      //Seat 3
      pushMatrix();
      translate(-75,665);
      rotate(bars-3.2);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    
      //Seat 4
      pushMatrix();
      translate(-75,665);
      rotate(bars-3.2);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    
      //Seat 5
      pushMatrix();
      translate(-25,670);
      rotate(bars-3.2);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
    
      //MIDDLE OF BOAT
      
      //Seat 6
      pushMatrix();
      translate(0,670);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
      
      //Seat 7
      pushMatrix();
      translate(50,670);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
      
      //Seat 8
      pushMatrix();
      translate(95,665);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
      
      //Seat 9
      pushMatrix();
      translate(140,660);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
      
      //Seat 10
      pushMatrix();
      translate(185,655);
      rotate(-bars);
      stroke(0);
      rect(0,0,40,1);
      popMatrix();
      
    shape(boat, 0, 210);
    popMatrix();
    
    shape(support, width/2,height/2-100);
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
