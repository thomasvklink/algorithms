class Flower {
  Segment [] segment;

  Flower(int segmentNr) {
    segment = new Segment[segmentNr];
    for (int i=0; i<segment.length; i++) {
      segment[i] = new Segment(width/2, height/8);
    }
  }
  void show() {
    //insert flower
    for (int i=0; i<segment.length; i++) {
      segment[i].show();
    }
    pushMatrix();
    translate(width/2, height/2);
    for  (int i=0; i<segment.length; i++){
     rotate(segment[i].angle);
     line(0,0,0,100);
     translate(0,100);
    }
    popMatrix();
  }

  void update() {
    for (int i=1; i<segment.length-1; i++) {
    segment[i].update(segment[i-1].v, segment[i+1].F);
    }
  }
}
