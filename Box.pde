class Box {
int  boxsizeX;
int  boxsizeY;
int  boxsizeZ;
float r=0;
  void display() {
    stroke(255,0,255);
    noFill();
 
       
       if(demo==true)
       {
          rotateY(r);
          r=r+0.005;
       }
          
          
         box(  boxsizeX,boxsizeY,boxsizeZ);

  
   
  }
  
  
  Box(int x,int y,int z)
  {
 boxsizeX=x;
 boxsizeY=y;
 boxsizeZ=z;

  
  }
}