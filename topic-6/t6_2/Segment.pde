class Segment {

  float incomingVelocity;
  float followingTorque;
  float torque = 0.05;
  float f;
  float c;
  float angularVelocity = 0.01;
  float totalRotation = 0.5;

  Segment() {
    c = 100;
    f = 0.03;
  }


void update(float incomingVelocity, float followingTorque) {
  //comments!
  float usedVelocity = angularVelocity - incomingVelocity; 
  float friction = usedVelocity * f;
  torque = (1 / c * totalRotation + friction);
  totalRotation += usedVelocity;
  angularVelocity += followingTorque - torque;
}
}
