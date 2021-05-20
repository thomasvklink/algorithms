//This is the class that calls the particles from the class Particle and puts them together in one ParticleSystem object.

class ParticleSystem { //class initialisation

  //setting variables
  PVector pos;
  ArrayList<Particle> particles;

  ParticleSystem(float x, float y) { //constructor
    pos= new PVector(x, y);
    particles = new ArrayList<Particle>();
  }
  void mouseAdd(float posX, float posY) {
    for (int i=0; i < 5; i++) {
      particles.add(new Particle(posX, posY));
    }
  }

  void update() {
    for (int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) { //If the particle is dead, reset it.
        //p.reset(posX, posY); //Position is passed to respawn the particle on the correct location
        particles.remove(i);
      }
    }
  }

  void show() {
    for (int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.show();
    }
  }
}
