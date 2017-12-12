class Terrain {
private int cols,row;
private int scl;
private int w;
private int h;
private int z;
private float[][] terrain;

private float flyingx=0;
private float flyingy=0;

Terrain(int sclr,int wr,int hr,int zr,float flyingxr,float flyingyr)
{
scl=sclr;
w =wr;
h=zr;
z=hr;
flyingx=flyingxr;
flyingy=flyingyr;
cols =w/scl+1;
row= h/scl+1;
terrain =new float[cols][row];

}

void input()
{  

stroke(255);
fill(0,255,0);


}


void update()
{
 flyingy+=0;
  float yoff=flyingx;
 for(int y=0;y<row;y++)
    { float xoff=flyingy;
    for(int x=0;x<cols;x++)
      {
        if(x==0 ||y==0||x==cols-1 ||y==row-1  )
        {
      terrain[x][y]=0;
      
        }
        else
        {
            terrain[x][y]=map(noise(xoff,yoff),0,1,-25,75);
        }
        
      xoff+=0.1;
      }
       yoff+=0.1;
   }
}




void display()
{ pushMatrix();
  rotateX(1.5707964);
 translate(-w/2,-h/2,-z/2);

 for(int y=0;y<row-1;y++)
    { 
      beginShape(TRIANGLE_STRIP);
  for(int x=0;x<cols;x++)
  {
vertex(x*scl,y*scl,terrain[x][y]);
vertex(x*scl,(y+1)*scl,terrain[x][y+1]);

    }
    endShape();
    }
popMatrix();
}


float getterrain(int x,int y)
{
  
    /*
     text(nf(x),-60,0,0);
    text(nf(y),-60,20,0);
    */
    x=x+aquarium.box.boxsizeX/2;
    y=y+aquarium.box.boxsizeY/2;
    /*
    text(nf(x),0,0,0);
    text(nf(y),0,20,0);
    */
    x=x/scl+1;
    y=y/scl+1;
    /*
    text(nf(x),60,0,0);
    text(nf(y),60,20,0);
     */
if(x>1&&y>1&& x<row-1&&y<cols)
{
   //text(nf(terrain[x][y],3,3),0,40,0);
  return terrain[x][y];

}
return 0;
}



}