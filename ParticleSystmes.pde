class ParticleSystems {
  ArrayList<ParticleSystem> ParticleSystem;

  ParticleSystems() {
    ParticleSystem = new ArrayList<ParticleSystem>();
  }
  
  void run() {
    if(ParticleSystem!=null)
    {
    for (ParticleSystem p : ParticleSystem) {
      p.addParticle();
      p.run();
      fill(167);
       if (p.isDead()) {
        ParticleSystem.remove(p);
        break;
      }
      
      
    }
    }
  }

  void addParticleSystem(PVector Position   ) {
    ParticleSystem.add(new ParticleSystem(Position));
  }
}