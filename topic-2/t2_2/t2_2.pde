int diceSize = 100; 
int count1 = 0;
int count2 = 0;
int count3 = 0;
int count4 = 0;
int count5 = 0;
int count6 = 0;
int randomDots;
void setup() {
  frameRate(10);
  size(600, 600);
  noLoop();
}

void draw() {
  background(65, 105, 225); 

  //the dice
  fill(255, 255, 255); 
  rectMode(CENTER);
  rect(width/2, height/2, diceSize, diceSize, diceSize/5);

  //the randomDots
  fill(0, 0, 0);
  int[] dots = { 1, 2, 3, 4, 5, 6, 6};
  randomDots = dots[(int)random(dots.length)];
  if (randomDots == 1 || randomDots == 3 || randomDots == 5)
    ellipse(width/2, height/2, diceSize/5, diceSize/5); 
  if (randomDots == 2 || randomDots == 3 || randomDots == 4 || randomDots == 5 || randomDots == 6) { 
    ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (randomDots == 4 || randomDots == 5 || randomDots == 6) {
    ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (randomDots == 6) {
    ellipse(width/2, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }

  switch (randomDots) {
  case 1:
    count1++;
    break;
  case 2:
    count2++;
    break;
  case 3:
    count3++;
    break;
  case 4:
    count4++;
    break;
  case 5:
    count5++;
    break;
  case 6:
    count6++;
    break;
  }

  println(count1, count2, count3, count4, count5, count6);

  //rolling of the dice
  if (mousePressed && mouseButton == LEFT)
    noLoop();
}
void mousePressed() {
  loop();
}
