


class Boid extends BoisClone{
  ArrayList <KillerBoid> killerBoids;
  float escapeDistance=100;
  float escapeWeight=100;
  ArrayList<Boid> boids;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;   
  float maxposition;    
  boidsEtat etat;
  float topSpeed=5;
  
  
    Boid(float size) {
    acceleration = new PVector(0, 0,0);

    float angle = random(TWO_PI);
   float angle1 = random(TWO_PI);
   float angle2 = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle1),cos(angle2));
    position=new PVector(0, 0,0);
    r = size;
    maxposition = 2;
    maxforce = 0.03;
    
  }
  
      Boid(  ArrayList <KillerBoid>  killerBoids,ArrayList<Boid> boids,PVector position,PVector velocity,PVector acceleration,float r,float maxforce,float maxposition,boidsEtat etat,float topSpeed) {
  this.killerBoids=killerBoids;
  this.boids=boids;
  this.position=new PVector( position.x,position.y,position.z);
  this.velocity=new PVector( velocity.x,velocity.y,velocity.z);
  this.acceleration=new PVector( acceleration.x,acceleration.y,acceleration.z);
  this.r=r;
  this.maxforce=maxforce;   
  this.maxposition=maxposition;    
  this.etat=etat;
  this.topSpeed=topSpeed;
  


  }

   void setKillerBoids(ArrayList<KillerBoid> killerBoids) {
    this.killerBoids = killerBoids;
  }


  void run(ArrayList<Boid> boids) {
  this.boids=boids;
  
  if(etat==null)
  {etat=new BoidFloking();}
  etat.update(this);
    fill(167);


    update();
   borders();
    render();
  }

  void applyForce(PVector force) {
   
    acceleration.add(force);
  }

 
  void update() {

    velocity.add(acceleration);

    velocity.limit(maxposition);
    position.add(velocity);
   
    acceleration.mult(0);
  }

  
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  

    desired.normalize();
    desired.mult(maxposition);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce); 
    return steer;
  }

  void render() {
  
    float theta = velocity.heading2D() + radians(90);
  
      stroke(255);
  fill(167);
  

    pushMatrix();
    translate(position.x, position.y,position.z);
    rotateX(theta);
    rotateY(theta);
    rotateZ(theta);
   
beginShape();
vertex(-r, -r, -r);
vertex( r, -r, -r);
vertex(   0,    0,  r);
endShape(CLOSE);

beginShape();
vertex(r, -r, -r);
vertex( r,  r, -r);
vertex(   0,    0,  r);
endShape(CLOSE);

beginShape();
vertex( r, r, -r);
vertex(-r, r, -r);
vertex(   0,   0,  r);
endShape(CLOSE);

beginShape();
vertex(-r,  r, -r);
vertex(-r, -r, -r);
vertex(   0,    0,  r);
endShape(CLOSE);

beginShape();
vertex( r,  r, -r);
vertex(-r, r, -r);
vertex(-r, -r, -r);
vertex( r, -r, -r);
endShape(CLOSE);
 
    popMatrix();
  }


  void borders() {
   
  int i= int(this.position.x);
   int j= int(this.position.z);

   
    if(position.x > aquarium.box.boxsizeX/2-r/2) {
      position.x= aquarium.box.boxsizeX/2-r/2;
      velocity.x*=-1;
    }
    else if (position.x < -aquarium.box.boxsizeX/2 + r/2) {
      position.x = -aquarium.box.boxsizeX/2+ r/2 ;
      velocity.x*=-1;
    }
    
    
    
    if (position.y > aquarium.box.boxsizeY/2-r/2-aquarium.terrain.getterrain( i,j)) {
      position.y = aquarium.box.boxsizeY/2-r/2-aquarium.terrain.getterrain( i,j) ;
      velocity.y*= -1;
    }
    else if (position.y < -aquarium.box.boxsizeY/2 - r/2) {
      position.y= -aquarium.box.boxsizeY/2-r/2;
      velocity.y*= -1;
    }
    
    
    if (position.z > aquarium.box.boxsizeZ/2-r/2) {
      position.z = aquarium.box.boxsizeZ/2-r/2;
      velocity.z*= -1;
    }
    else if (position.z < -aquarium.box.boxsizeZ/2 + r/2) {
      position.z = -aquarium.box.boxsizeZ/2 + r/2;
      velocity.z*= -1;
    
  }
 
    
  }



  PVector escape (ArrayList<KillerBoid> killerBoid) {
    PVector result = null;
    int count = 0;
    
    if(killerBoid!=null)
    {
    for (KillerBoid k : killerBoid) {
      float distanceToKillerBoid = PVector.dist(position, k.position);
      
      if (distanceToKillerBoid < escapeDistance) {
        if (result == null) {
          result = new PVector (0, 0,0);
        }
        result.add(PVector.sub(position, k.position));
        count++;
      }
    }
    
    if (result != null && count > 0) {
      result.div(count);
      result.limit(topSpeed);

    }
    }
    
    return result;
  }


  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 35.0f;
    PVector steer = new PVector(0, 0, 0);
    int count = 0;

    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
     
      if ((d > 0) && (d < desiredseparation)) {
       
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        
        steer.add(diff);
        count++;           
      }
    }

    if (count > 0) {
      steer.div((float)count);
    }

    
    if (steer.mag() > 0) {
      

     
      steer.normalize();
      steer.mult(maxposition);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

 
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 50;
    PVector sum = new PVector(0, 0,0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);
     
   
      sum.normalize();
      sum.mult(maxposition);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } 
    else {
      return new PVector(0, 0,0);
    }
  }

    PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 75;
    PVector sum = new PVector(0, 0,0);  
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position);
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } 
    else {
      return new PVector(0, 0,0);
    }
  }
}