int MAX_CONFETTI = 30;

class Confetties {

  //this makes an array of 30 confettis
  Confetti[] confetti = new Confetti[MAX_CONFETTI]; 
  // number of confettis that is created already
  int generated;

  Confetties() {
    generated = 0;
  }

  void update() {
    // collision detection
    for (int k=0; k<generated-1; k++) {   
      for (int l=k+1; l<generated; l++) { 
        collide( confetti[k], confetti[l]);
      }
    }
    
    // movement
    for (int k=0; k<generated; k++) {         
      confetti[k].update();
    }
  }

  void render() {
    for (int k=0; k<generated; k++) {           
      confetti[k].render();
    }
  }

  void collide(Confetti confetti1, Confetti confetti2) {
    // compare each confetti with all confettis having a higher index
    // where the actual highest index is i

    float distx = confetti2.confettiPos.x+confetti2.speed.x - confetti1.confettiPos.x-confetti1.speed.x;
    float disty = confetti2.confettiPos.y+confetti2.speed.y - confetti1.confettiPos.y-confetti1.speed.y;
    float distance = sqrt(distx*distx + disty*disty);
    float minDist = confetti1.radius + confetti2.radius;

    if (distance < minDist) {    // physics of collission
      float angle = atan2(disty, distx);
      float sine = sin(angle);
      float cosine = cos(angle); 

      float ax = cosine * confetti1.speed.x + sine * confetti1.speed.y;
      float ay = cosine * confetti1.speed.y - sine * confetti1.speed.x;

      // change of the movement vector of the first confetti
      confetti1.set_speed(ax, ay);                   

      ax = cosine * confetti2.speed.x + sine * confetti2.speed.y;
      ay = cosine * confetti2.speed.y - sine * confetti2.speed.x;

      // change of the movement vector of the second confetti
      confetti2.set_speed(ax, ay);
    }
  }


  void  mousePressedEvent() {
    // a new confetti is only created here!
    if ( generated < MAX_CONFETTI) { 
      confetti[generated] = new Confetti();   
      generated++;
    };
  }
}
