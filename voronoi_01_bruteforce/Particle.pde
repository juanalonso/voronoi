class Particle {

  final int EUCLIDEAN = 1;
  final int MANHATTAN = 2;
  final int CHEBYSHEV = 3;

  PVector velocity;
  PVector position;  
  PVector gravity = new PVector(0, 0);
  final int distMetric = EUCLIDEAN;


  Particle() {
    rebirth(random(width), random(height));
  }


  void rebirth(float x, float y) {
    float a = random(TWO_PI);
    float speed = random(1, 4);
    velocity = new PVector(cos(a), sin(a));
    velocity.mult(speed);
    position = new PVector(x, y);
  }


  boolean isDead() {
    return (position.x < 0 || position.y < 0 || position.x > width || position.y > height);
  }


  public void update() {
    velocity.add(gravity);
    position.add(velocity);
  }


  float getDistance(int x, int y) {

    float distance = 0;

    switch(distMetric) {
    case EUCLIDEAN:
      distance = dist(position.x, position.y, x, y);
      break;
    case MANHATTAN:
      distance = abs(position.x-x) + abs(position.y - y);
      break;
    case CHEBYSHEV:
      distance = max (abs(position.x-x), abs(position.y - y));
      break;
    }

    return distance;
  }
}