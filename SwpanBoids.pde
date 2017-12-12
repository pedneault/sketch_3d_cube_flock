public class SwpanBoids implements Command {
Boid b;
Aquarium a;
   public SwpanBoids(Aquarium a) {
     this.a=a;
   }

   public void execute(){
      Boid b = new Boid(5);
      a.flock.addBoid(b);
    
     
   }
}