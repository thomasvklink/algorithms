/*
  This is a class that calls a list of birds from the Bird class. 
  Furthermore, in this class the principle of Flocking is created and applied to the birds.
*/

class Flocking {//class initialisation
  
  //Reference class & creating Arraylist
  ArrayList<Bird> birds;

  Flocking() { //constructor
    //Creating object
    birds = new ArrayList<Bird>();
  }
  
  void render() {
    for (Bird f : birds) {
      f.render();
    }
  }

  void update() {
    for (Bird f : birds) {
      f.update();
      for (Bird other : birds) {
        if ( f != other) {
          PVector v1 = sep(f, other);
          PVector v2 = coh(f, other);
          PVector v3 = ali(f, other);
          // Arbitrarily weight these forces
          v1.mult(4.0); //Seperation
          v2.mult(1.0); //Cohesion
          v3.mult(1.0); //Alignment
          //Apply force vectors
          apply(f, v1);
          apply(f, v2);
          apply(f, v3);
        }
      }
    }
  }

  void apply(Bird f, PVector force) {
    f.acc.add(force);
  }
  //separation PVector gets value
  PVector sep(Bird f, Bird other) { 
    float desiredseparation = 25.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    float d = PVector.dist(f.pos, other.pos);
    // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
    if ((d > 0) && (d < desiredseparation)) {
      // Calculate vector pointing away from neighbor
      PVector diff = PVector.sub(f.pos, other.pos);
      diff.normalize();
      diff.div(d);        // Weight by distance
      steer.add(diff);
      count++;            // Keep track of how many
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(f.max);
      steer.sub(f.vel);
      steer.limit(f.force);
    }
    return steer;
  }
  
  //alignment PVector gets value
  PVector ali(Bird f, Bird other) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);
    int count = 0;

    float d = PVector.dist(f.pos, other.pos);
    if ((d > 0) && (d < neighbordist)) {
      sum.add(other.vel);
      count++;
    }
    if (count > 0) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(f.max);
      PVector steer = PVector.sub(sum, f.vel);
      steer.limit(f.force);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }
  
  //cohesion PVector gets value
  PVector coh(Bird f, Bird other) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    float d = PVector.dist(f.pos, other.pos);
    if ((d > 0) && (d < neighbordist)) {
      sum.add(other.pos); // Add position
      count++;
    }
    if (count > 0) {
      sum.div(count);
      return seek(f, sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }

  PVector seek(Bird f, PVector target) {
    PVector desired = PVector.sub(target, f.pos);  // A vector pointing from the position to the target
    // Normalize desired and scale to maximum speed
    desired.normalize();
    desired.mult(f.max);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, f.vel);
    steer.limit(f.force);  // Limit to maximum steering force
    return steer;
  }

  void addBird(Bird f) {
    //add the birds onto the sketch
    birds.add(f);
  }
}
