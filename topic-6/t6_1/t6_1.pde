  
  Flower flower;
  int flowerLength = 5;
  void setup(){
    size(600,600);
    flower = new Flower(flowerLength);
  }
  
  void draw(){
    background(0,0,200,100);
    flower.show();
    flower.update();
  }
