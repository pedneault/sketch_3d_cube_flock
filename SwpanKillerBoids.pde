public class SwpanKillerBoids implements Command {
Aquarium a;
   public SwpanKillerBoids(Aquarium a) {
     this.a=a;
   }

   public void execute(){
  
    a.flockkillerboids.addKillerboids(new KillerBoid(new PVector( random (width), random (height)), new PVector (15, 15,15)));

   }
}