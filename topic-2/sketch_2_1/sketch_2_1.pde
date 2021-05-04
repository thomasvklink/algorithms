/* topic: random function, array, distribution exercise 2.1 
Made by: Thomas van Klink & Tristan van Marle
For Algorithms in Creative Technology
4-5-2021*/

int diceSize = 100; 
int count1 = 0;
int count2 = 0;
int count3 = 0;
int count4 = 0;
int count5 = 0;
int count6 = 0;

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

  //the dots
  fill(0, 0, 0);
  int dots = int(random(1, 7));
  if (dots == 1 || dots == 3 || dots == 5)
    ellipse(width/2, height/2, diceSize/5, diceSize/5); 
  if (dots == 2 || dots == 3 || dots == 4 || dots == 5 || dots == 6) { 
    ellipse(width/2 - diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }
  if (dots == 4 || dots == 5 || dots == 6) {
    ellipse(width/2 - diceSize/4, height/2 + diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2 + diceSize/4, height/2 - diceSize/4, diceSize/5, diceSize/5);
  }
  if (dots == 6) {
    ellipse(width/2, height/2 - diceSize/4, diceSize/5, diceSize/5);
    ellipse(width/2, height/2 + diceSize/4, diceSize/5, diceSize/5);
  }

switch (dots) {
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
