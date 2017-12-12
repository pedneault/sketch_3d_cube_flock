import peasy.*;
import processing.opengl.*;


PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3; 

Aquarium aquarium;
int  SizeX=400;
int SizeY=400;
int  SizeZ=400;
int BoidSize=5;
int KillerSize=15;
int nbBoids=50;
int nbKillerBoids=2;
boolean demo=false;
boolean keyReleas;
void setup() {
//  size(1280, 720, P3D);
  
  fullScreen(P3D);

aquarium=new Aquarium( SizeX, SizeY, SizeZ, BoidSize, KillerSize, nbBoids, nbKillerBoids);


g3 = (PGraphics3D)g;
cam = new PeasyCam(this, 0,0,0,800);

keyReleas=true;
}

void draw() {
  
  
    if (keyPressed&&keyReleas==true)
    {
      if (key == 'd') {
        if(demo==false)
        {
         demo=true;
         keyReleas=false;
        }
        else
        {
        demo=false;
         keyReleas=false;
        }
      }
    }
  background(0);
  aquarium.run();
 
    
}
   void keyReleased()
{
keyReleas=true;
}