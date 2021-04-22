Ball[] balls = new Ball[10];
void setup() {
  size(500, 500);
  for (int i = 0; i < balls.length; i ++ ) { 
    balls[i] = new Ball(random(0, width), random(0, height/4));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < balls.length; i ++ ) { 
    balls[i].run();
    for (int l=i+1; l<balls.length; l++) { 
      collide( balls[i], balls[l]);
    }
  }
}

void collide(Ball ball1, Ball ball2) {
  float distance =PVector.dist(ball1.position.copy().add(ball1.speed), ball2.position.copy().add(ball2.speed));
  if (distance <= ball1.ballSize + ball2.ballSize) {
    PVector richting1 = PVector.sub(ball1.position, ball2.position).normalize();
    PVector richting2 = PVector.sub(ball2.position, ball1.position).normalize();

    PVector a1 = richting1.mult(PVector.dot(ball1.speed, richting1));
    PVector a2 = richting2.mult(PVector.dot(ball2.speed, richting2));

    ball1.speed.sub(a1).add(a2);
    ball2.speed.sub(a2).add(a1);
  }
}
