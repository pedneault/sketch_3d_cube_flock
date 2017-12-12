class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(random(-0.02, 0.02), random(-0.02, 0.02),random(-0.02, 0.02));
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05),random(-0.05, 0.05));
    position = l.copy();
    lifespan = 100.0;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
  }

  // Method to display
  void display() {
    stroke(255,0,0, lifespan);
    fill(255,0,0, lifespan);
    pushMatrix();
    translate(position.x,  position.y,  position.z);
    box(1);
    popMatrix();
    
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
  
}