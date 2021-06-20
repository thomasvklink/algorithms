/*
This is the class that calls the particles from the class Particle and puts them together in one ParticleSystem object.
*/

class ParticleSystem { //class initialisation

  //Referencing classes & creating arraylist
  ArrayList<Particle> particles;

  ParticleSystem(float x, float y) { //constructor
    particles = new ArrayList<Particle>();
  }
  void particleAdd(float posX, float posY) {
      //Creating objects
    for (int i=0; i < 5; i++) {
      particles.add(new Particle(posX, posY));
    }
  }

  void update() {
    //update the particles if they are within the size of the arraylist
    for (int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) { //If the particle is dead, reset it.
        particles.remove(i);
      }
    }
  }

  void show() {
    //ahow the particles if they are within the size of the arraylist
    for (int i=0; i<particles.size(); i++) {
      Particle p = particles.get(i);
      p.show();
    }
  }
}
