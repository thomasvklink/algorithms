class Wall {
  PVector pos;
  float wallHeight = 200;
  color wallColor;
  Wall(float xPos, float yPos) {
    pos = new PVector(xPos, yPos);
    wallColor = color(0, 0, 255);
  }

  void show() {
    fill(wallColor);
    rect(pos.x, pos.y, 25, wallHeight);
  }

  void collision(Ball ball) {
    if (ball.pos.x > wall.pos.x-ball.r && ball.pos.x < wall.pos.x + 25 && ball.pos.y > wall.pos.y-wallHeight/2) {
      ball.speed=ball.speed.mult(-1);
      wallColor = color(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}
