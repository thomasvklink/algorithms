class Segment {

  float v;
  float m;
  float F;
  float angle;
  float f;
  float c;
  
  Segment(float x, float y) {
    c =100;
    f = 10;
    F=3;
    v=0;
    m=100;
    angle = 0.2;
  }

  void show() {
    
  }

  void update(float v, float F) {
    //F = F/m;
    //v += F;
    //angle += v;
    //F = angle/c + (f*v);
    v += F/m;
    angle += v;
    F = -((angle/c) + (f * v));
    println(F, v, f);
    println(angle);
  }
}
