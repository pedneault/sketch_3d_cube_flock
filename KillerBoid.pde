class KillerBoid {
  ArrayList<Boid> boids;
  Boid boid;
  PVector force;
  PVector size = new PVector();
  int closestboid = -1;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;    
  KillerboidEtat etat;
  PVector target;
  float topSpeed;
  float atTarget;
  int timer;
int timerReset=15000;
boolean countDownTimer()
{
timer=timer-second();
  if(timer<=0)
  {
  timer=timerReset;
  return false;
  }
   return true;
}


   KillerBoid(PVector position,PVector size   ) {
    acceleration = new PVector(0, 0,0);
    target = new PVector(0,0,0);
 float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle),cos(angle));
    
    this.size=size;
    this.position = position;
    r = size.x+10;
    timer=timerReset;
    topSpeed =1;
 
      
  }

  void borders() {
    
  int i= int(this.position.x);
   int j= int(this.position.z);

    if(position.x > aquarium.box.boxsizeX/2) {
      position.x= aquarium.box.boxsizeX/2;
      velocity.x*=-1;
    }
    else if (position.x < -aquarium.box.boxsizeX/2) {
      position.x = -aquarium.box.boxsizeX/2;
      velocity.x*=-1;
    }
    
    
    
    if (position.y > aquarium.box.boxsizeY/2-aquarium.terrain.getterrain( i,j)) {
      position.y = aquarium.box.boxsizeY/2-aquarium.terrain.getterrain( i,j) ;
      velocity.y*= -1;
    }
    else if (position.y < -aquarium.box.boxsizeY/2 ) {
      position.y= -aquarium.box.boxsizeY/2;
      velocity.y*= -1;
    }
    
    
    if (position.z > aquarium.box.boxsizeZ/2) {
      position.z = aquarium.box.boxsizeZ/2;
      velocity.z*= -1;
    }
    else if (position.z < -aquarium.box.boxsizeZ/2 ) {
      position.z = -aquarium.box.boxsizeZ/2;
      velocity.z*= -1;
    
  }
  
    
    
  }
  
        void run() {
; if(etat==null)
  {etat=new KillerBoidMoving();}
  
  etat.update(this);


   borders();
    render();
  }


 
 

  void applyForce(PVector force) {
   
    acceleration.add(force);
  }
  
void render() {
  
   
      stroke(127,0,0);
      
      fill(255,0,0);

    pushMatrix();
    translate(position.x, position.y,position.z);

   
    box(size.x,size.y,size.z);
 
   
    popMatrix();
  }
  
  
    boolean moveToTarget() {
    float distanceToTarget = PVector.dist(target, position);
    
    PVector desired = PVector.sub(target, position);
    
    if (distanceToTarget > atTarget) {
      
     // angle = velocity.heading();      
      
      velocity = desired;
      velocity.normalize();
      velocity.mult(topSpeed);
      
      position.add (velocity);
      return false;
    } else {
      return true;
    }
  }
  
  void setTarget (float x, float y, float z) {
    target.x = x;
    target.y = y;
     target.z = z;
  }
  
  
  
  
    void setboid(int boidsIndex) {
  
    boid = boids.get(boidsIndex);
    setTarget (boid.position.x, boid.position.y,boid.position.z);   
  }
  
   void setboids(ArrayList<Boid> boids) {
    this.boids = boids;
  }
  
  boolean atTarget()
{
if(boid!=null)
{
    float distance = PVector.dist(boid.position, position);
      
  if(distance<=0+boid.r/2+r/2)
  {  
    
    aquarium.ps.addParticleSystem(boid.position);
    boids.remove(boid);
return false;
  }
}
return true;

}


  
  
   int seekboid() {

    float minDistance = width * height*100;

     this.setBoids(aquarium.flock.getBoids());
    for (int i = 0; i < boids.size(); i++ ) {
      boid = boids.get(i);
      
      float distance = PVector.dist(boid.position, position);
      
      if (distance < minDistance) {
        minDistance = distance;
        closestboid = i;
      }      
    }
    
    
    
    if (boids.size() == 0) {
      closestboid = -1;
    }
    
    return closestboid;
}
  
  
  
   void setBoids(ArrayList<Boid> boids) {
    this.boids = boids;
  }

  

  
  
  
  
  
  
}