class Flower {
  Segment [] segment;

  Flower(int segmentNr) {
    segment = new Segment[segmentNr];
    for (int i=0; i<segment.length; i++) {
      segment[i] = new Segment(width/2, height/8);
    }
  }
  void show() {
    pushMatrix();
    translate(width/2, height);
    for  (int i=0; i<segment.length; i++) {
      rotate(segment[i].totalRotation);
      stroke(0, 255, 0);
      strokeWeight(10);
      line(0, 0, 0, -50);
      if (i == segment.length-1) {
        pushMatrix();
        translate(0, -40);


        //for loop!

        //first petal
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(255, 222, 222);
        ellipse(0, -40, 50, 50);

        //second petal
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(255, 222, 222);
        rotate(radians(72));
        ellipse(0, -40, 50, 50);

        //third petal
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(255, 222, 222);
        rotate(radians(72));
        ellipse(0, -40, 50, 50);

        //fourth petal
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(255, 222, 222);
        rotate(radians(72));
        ellipse(0, -40, 50, 50);

        //fifth petal
        strokeWeight(2);
        stroke(0, 0, 0);
        fill(255, 222, 222);
        rotate(radians(72));
        ellipse(0, -40, 50, 50);
        popMatrix();

        fill(255, 255, 0);
        noStroke();
        ellipse(0, -40, 50, 50);
      }
      translate(0, -50);
    }
    popMatrix();
  }

  void update() {
    segment[0].update(0, segment[1].followingTorque);
    for (int i=1; i<segment.length-1; i++) {
      segment[i].update(segment[i-1].incomingVelocity, segment[i+1].followingTorque);
    }
    segment[segment.length - 1].update(segment[segment.length -2].incomingVelocity, 0);
  }
}
