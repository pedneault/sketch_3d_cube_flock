public class BoisClone implements Cloneable
{    
    @Override
    public Boid clone() 
    {
        try 
        {
            Boid copy = (Boid)super.clone();
           
             copy=new Boid(copy.killerBoids,copy.boids, copy.position, copy.velocity, copy.acceleration, copy.r, copy.maxforce, copy.maxposition,copy.etat, copy.topSpeed);

            return copy;
        }
        catch (CloneNotSupportedException e)
        {
            return null;
        }
    }
}