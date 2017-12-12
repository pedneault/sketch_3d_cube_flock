class Aquarium
{


float r;
Flock flock;
ParticleSystems ps;
FlockKillerBoid flockkillerboids;
Box box;
Terrain terrain;
Command spanwboids;
Command spanwkillerboids;
Spanw s;
        Boid        clone;
        Boid        prot; 
        BoidsMachine bm; 


Aquarium(int SizeX,int SizeY,int SizeZ,int BoidSize,int KillerSize,int nbBoids,int nbKillerBoids)
{
prot       = new Boid(BoidSize); 
bm         = new BoidsMachine(prot); 
   
   
spanwboids =new SwpanBoids(this);
spanwkillerboids =new SwpanKillerBoids(this);



    s = new Spanw();
     ps= new ParticleSystems();
   box = new Box(SizeX,SizeY,SizeZ);  
   terrain =new Terrain(10,box.boxsizeX,box.boxsizeY,box.boxsizeZ,0,0);
      ps= new ParticleSystems();
   flock = new Flock();
 
 
  for (int i=0; i<nbBoids; i++)
        {
          clone=bm.makeboid();
           flock.addBoid(clone);
             
        }
 /*
   for (int i = 0; i < nbBoids; i++) {
     
    flock.addBoid(new Boid(BoidSize));

  }  */
  
 flockkillerboids=new FlockKillerBoid();
   for (int i = 0; i < nbKillerBoids; i++) {
    flockkillerboids.addKillerboids(new KillerBoid(new PVector( random (width), random (height)), new PVector (KillerSize, KillerSize,KillerSize)));
  }  

}





void run()
{
       if (keyPressed&&keyReleas==true) {
      if (key == '1') {
     
     s.storeAndExecute(spanwboids);
      keyReleas=false;
      
      }
    }   
    
     if (keyPressed&&keyReleas==true) {
      if (key == '2') {
        
     s.storeAndExecute(spanwkillerboids);
      keyReleas=false;
      
      }
    }   
    
  
  
 box.display(); 
    terrain.input();
    terrain.update();
    terrain.display();
    flock.run();
    flockkillerboids.run();
    ps.run();

}


}