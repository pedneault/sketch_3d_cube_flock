class KillerBoidMoving extends KillerboidEtat{


void update(KillerBoid killerBoid)
{
 

if(killerBoid.countDownTimer())
{
killerBoid.topSpeed=1;
killerBoid.position.add(killerBoid.velocity);

}
else
{
 killerBoid.etat=new KillerBoidHunting();
}

}
}