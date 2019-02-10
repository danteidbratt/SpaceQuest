final class Factory {

  public Asteroid createAsteroid() {
    int size = 100;
    int radius = size / 2;
    int x = radius + (int) (random(width - size));
    int y = -radius;
    int speed = 5;
    Position position = new Position(x, y, speed);
    position.setDirection(DOWN, true);
    int damage = 20;
    int deathSize = 20;
    return new Asteroid(size, position, damage, deathSize);
  }

  public Ship createShip() {
    int size = 30;
    int x = width / 2;
    int y = height - 50;
    int speed = 8;
    Position position = new Position(x, y, speed);
    int health = 100;
    int fireDamage = 5;
    int fireVelocity = 10;
    int reloadTime = 2;
    int minReloadTime = 0;
    int reloadTimeDecrement = 2;
    return new Ship(
      size, 
      position, 
      health, 
      fireDamage, 
      fireVelocity, 
      reloadTime, 
      minReloadTime, 
      reloadTimeDecrement
      );
  }
  
  public Star createStar() {
    int size = 2;
    int x = (int) random(width);
    int y = 0;
    int speed = 8;
    int direction = DOWN;
    Position position = new Position(x, y, speed, direction);
    return new Star(size, position);
  }
  
}
