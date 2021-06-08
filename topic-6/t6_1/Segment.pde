class Segment {

  float v;
  float m;
  float F;
  float angle;
  float f;
  float c;
  
  Segment(float x, float y) {
    c =100;
    f = 0.1;
    F=0;
    v=0;
    m=1;
    angle = 0;
  }

  void show() {
    
  }

  void update(float v, float f) {
    F= F/m;
    v += F;
    angle += v;
    F = angle/c+f;
    println(F);
  }
}
