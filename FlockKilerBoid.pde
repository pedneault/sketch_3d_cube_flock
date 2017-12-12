class FlockKillerBoid {
  ArrayList<KillerBoid> Killerboids;

  FlockKillerBoid() {
    Killerboids = new ArrayList<KillerBoid>();
  }

  void run() {
    for (KillerBoid k : Killerboids) {
      k.run();
    }
  }

  void addKillerboids(KillerBoid k) {
   Killerboids.add(k);
  }


}