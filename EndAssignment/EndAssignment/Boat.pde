class Boat {

  int xPos;
  int yPos;

  PShape boat;

  float incomingVelocity;
  float followingTorque;
  float torque = 0.001;
  float f;
  float c;
  float angularVelocity = 0.001;
  float totalRotation = 1.5;
  
  float rotation;
  boolean isMoving;
  color control;

  Boat(int xPos, int yPos) {
    this.xPos = xPos;
    this.yPos = yPos;
    c=300;
    f=0.01;
  }

  void load() {
    boat = loadShape("boat.svg");
  }

  void render() {
    pushMatrix();
    translate(xPos, yPos-200);
    rotate(totalRotation);
    shape(boat, 0, 230);
    popMatrix();
  }
  
  void update(){
    swing(incomingVelocity, followingTorque);
    
    if (abs(totalRotation) < 0.02){
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

}
