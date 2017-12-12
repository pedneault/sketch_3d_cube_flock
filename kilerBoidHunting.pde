class KillerBoidHunting extends KillerboidEtat{


void update(KillerBoid killerBoid)
{

 if(killerBoid.atTarget())
 {
killerBoid.topSpeed=3;
if(killerBoid.seekboid()>=0)
{
killerBoid.setboid(killerBoid.seekboid());
killerBoid.moveToTarget();
}
else
{
 killerBoid.etat=new KillerBoidMoving();
}

 }
 else
 {

 killerBoid.etat=new KillerBoidMoving();
 
 }  
}
}