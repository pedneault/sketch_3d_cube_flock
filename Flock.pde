class Flock {
  ArrayList<Boid> boids;

  Flock() {
    boids = new ArrayList<Boid>();
  }

  void run() {
    for (Boid b : boids) {
      b.run(boids);
    }
  }

  void addBoid(Boid br) {
    boids.add(br);
  }

  
ArrayList<Boid>  getBoids()
  {
    return boids;
    
  }
  
  

}