/*2.1.5. Programming assingment "creature" Tristan van Marle
 10-09-2020
 */
int amount =10;
Creature[] Aliens = new Creature[amount];


void setup() {
  size (1000, 1000);
  for (int i=0; i<amount; i++) {
    Aliens[i]= new Creature (width/2, height/2);
  }
}

void draw() {
  background(13, 72, 120);
  for (int i=0; i<amount; i++) {
    Aliens[i].display();
    Aliens[i].update();
  }
}

void mouseDragged() {
  for (int i=0; i<amount; i++) {
    Aliens[i].dragged(mouseX, mouseY);
  }
}

void mousePressed() {
  for (int i=0; i<amount; i++) {
    Aliens[i].mouse(mouseX, mouseY);
    if (Aliens[i].isSelected)
    {
      for (int a=0; a<amount; a++) {
        if (i!=a) {
          Aliens[a].isSelected = false;
        }
      }
    }
  }
}
  void keyPressed() {
    for (int i=0; i<amount; i++) {
      Aliens[i].key();
    }
  }
  void mouseReleased() {
    for (int i=0; i<amount; i++) {
      Aliens[i].released(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
