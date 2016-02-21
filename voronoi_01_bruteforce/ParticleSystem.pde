class ParticleSystem {

  ArrayList<Particle> particles;
  boolean displayParticles;

  ParticleSystem(int regions, boolean displayParticles) {

    particles = new ArrayList<Particle>();

    for (int i = 0; i < regions; i++) {
      Particle p = new Particle();
      particles.add(p);
    }

    this.displayParticles = displayParticles;
  }

  void update() {
    for (Particle p : particles) {
      p.update();
      if (p.isDead()) {
        p.rebirth(random(width), random(height));
      }
    }
  }

  void display() {
    if (displayParticles) {
      for (Particle p : particles) {
        ellipse(p.position.x, p.position.y, 5, 5);
      }
    }
  }

  int getClosestRegion(int x, int y) {

    float dist = MAX_FLOAT;
    int offset = 0;

    for (int f=0; f<particles.size(); f++) {

      Particle p = particles.get(f);

      float tempDist = p.getDistance(x, y);

      if (tempDist < dist) {
        dist = tempDist;
        offset = f;
      }
    }
    return offset;
  }
}