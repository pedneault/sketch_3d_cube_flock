class BoidFloking extends boidsEtat{


void update( Boid boid)
{
    PVector sep = boid.separate(boid.boids);   // Separation
    PVector ali = boid.align(boid.boids);      // Alignment
  PVector coh = boid.cohesion(boid.boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
   coh.mult(1.0);
    // Add the force vectors to acceleration
    boid.applyForce(sep);
   boid.applyForce(ali);
    boid.applyForce(coh);
    
 PVector esc = boid.escape (  aquarium.flockkillerboids.Killerboids   );
 if (esc != null) {
      boid.etat=new BoidEscape();
    }
    
    
    
    
 }
    
}