/*
  This is a class that forms the background of the sketch. The dock on which the pirate ship stands.
*/

class Environment{//class initialisation
  
  //creating variables for position
  int xPos;
  int yPos;
  
  //creating variables for the guests
  int spots = 0;
  boolean queue = false;
 
 //calling in the PShape
  PShape boardwalk;
  
  Environment(int xPos, int yPos){//constructor
    this.xPos = xPos;
    this.yPos = yPos;
  }
  
  void load(){
    //load PShape
    boardwalk = loadShape("boardwalk.svg");
  }
  
  void update(){
    switch(ship.seat){
      case 0:
      spots = 0;
      break;
      case 1:
      spots = 2;
      break;
      case 2:
      spots = 4;
      break;
      case 3:
      spots = 6;
      break;
      case 4:
      spots = 8;
      break;
      case 5:
      spots = 9;
      queue = true;
      break;
    }
    
    if (queue){
      spots = 0;
      if (ship.seat == 0){
      queue = false;
      }
    }
    
  }
  
  void render(Guest[] guests){
    //making of the shape as well as rendering the guests
    shape(boardwalk, xPos, yPos-5);
    for (int i = 0; i < guests.length-spots; i++){
      guests[i].render((xPos+300)+(25*i),yPos+420);
    }
  }
}
