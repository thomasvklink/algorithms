class Boat {

  int xPos;
  int yPos;

  PShape boat;
  PShape support;

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

  Boat(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    c=300;
    f=0.01;
    bars = 20;
  }

  void load() {
    boat = loadShape("boat.svg");
    support = loadShape("support.svg");
  }

  void render() {
    pushMatrix();
    translate(xPos, yPos-200);
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
  
  void update(){
    swing(incomingVelocity, followingTorque);
    
    if (abs(totalRotation) < 0.02){
      isMoving = false;
    } else {
      isMoving = true;
    }
    
    //if (bars == 
    
    //bars = bars + 0.1;
    println(bars);
    
    //println(totalRotation, isMoving);
  };
  
  void swing(float incomingVelocity, float followingTorque) {
    float usedVelocity = angularVelocity - incomingVelocity; 
    float friction = usedVelocity * f;
    torque = (1 / c * totalRotation + friction);
    totalRotation += usedVelocity;
    angularVelocity += followingTorque - torque;
  }

}
