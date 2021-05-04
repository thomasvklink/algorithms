float xPos = 0;
float yPos = height*2;
float inc = 0.01;
float offset = 0;

PImage car;

void setup() {
  size(1000, 200);
  imageMode(CENTER);
  car = loadImage("image.png");
}

void draw() {
  background(12,120,247);
  landscape();
  road();
  car();
}

void landscape() {
  offset += inc;
  
  stroke(255, 206, 8);
  beginShape(LINES);
  for (int i = 0; i<width; i++) {
    float n = noise((offset+(i*0.003)))*height;
    vertex(xPos+i, yPos);
    vertex(xPos+i, yPos-n);
  };
  endShape();
  
}

void road(){
  noStroke();
  fill(20);
  rect(0, height-40, width, 35);
  
  for (int i = 0; i < width; i+=20){
    fill(255,0,0);
    rect(0+i, height-45, 10, 5);
  }
  for (int i = 0; i < width; i+=20){
    fill(255);
    rect(10+i, height-45, 10, 5);
  }
  
  for (int i = 0; i < width; i+=20){
    fill(255,0,0);
    rect(0+i, height-5, 10, 5);
  }
  for (int i = 0; i < width; i+=20){
    fill(255);
    rect(10+i, height-5, 10, 5);
  }
}

void car(){
  image(car,width/2,height/2+55);
  car.resize(250,0);
}
 
