public class BoidsMachine
{
    private Boid boid;

    public BoidsMachine(Boid boid)
    { 
        this.boid = boid; 
    }

    public Boid makeboid()
    {    
        return boid.clone();
    }
}