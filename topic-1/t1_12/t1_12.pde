Ball[] balls = new Ball[10];

void setup(){
  size(500,500);
  for (int i = 0; i < balls.length; i ++ ) { 
     balls[i] = new Ball(random(0,width), random(0,height/4));
   }
}

void draw(){
  background(0);
  for (int i = 0; i < balls.length; i ++ ) { 
     balls[i].run();
   }
}
