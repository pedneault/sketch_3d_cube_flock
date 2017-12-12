class ParticleSystem 
{
  ArrayList<Particle> particles;
  PVector origin;
  float lifespan;
  
  
  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();

    lifespan = 50.0;
  
  
  
  }

  void addParticle() {
  particles.add(new Particle(origin));

  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
    lifespan--;
      
  }
  
  
    boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
}