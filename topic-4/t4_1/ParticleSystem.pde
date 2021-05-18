//This is the class that calls the particles from the class Particle and puts them together in one ParticleSystem.

class ParticleSystem { //class initialisation

  //setting variables
  PVector pos;
  Particle[] particles;

  ParticleSystem(float x, float y) { //constructor
    pos=new PVector(x, y);
    particles = new Particle[1000];

    for (int i=0; i < particles.length; i++) {
      particles[i] = new Particle(x, y);
    }
  }

  void update() {
    for (int i=0; i<particles.length; i++) {
      particles[i].update();
      if (particles[i].isDead()) {
        //particles[i].remove();
      }
    }
  }

  void show() {
    for (int i=0; i<particles.length; i++) {
      particles[i].show();
    }
  }
}
