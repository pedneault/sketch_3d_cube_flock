class BoidEscape extends boidsEtat{


void update( Boid boid)
{
   PVector esc = boid.escape(aquarium.flockkillerboids.Killerboids);
    if (esc != null) {  
    
      esc.mult (boid.escapeWeight);
      boid.applyForce (esc);
  
     }
      else
{
  boid.etat=new BoidFloking();
}

}
}