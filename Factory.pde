final class Factory {

  public Asteroid createAsteroid() {
    int size = 100;
    int radius = size / 2;
    int x = radius + (int) (random(width - size));
    int y = -radius;
    Coordinates coordinates = new Coordinates(x, y);
    color kolor = color(255, 0, 0);
    int speed = 5;
    float direction = 0;
    int damage = 20;
    int deathSize = 50;
    return new Asteroid(size, coordinates, kolor, speed, direction, damage, deathSize);
  }

  public Ship createShip() {
    int size = 30;
    int x = width / 2;
    int y = height - 50;
    Coordinates coordinates = new Coordinates(x, y);
    color kolor = color(255);
    int speed = 10;
    int health = 100;
    int fireDamage = 10;
    int fireVelocity = 15;
    int reloadTime = 4;
    int minReloadTime = 0;
    int reloadTimeDecrement = 2;
    return new Ship(
      size, 
      coordinates,
      kolor,
      speed,
      health, 
      fireDamage, 
      fireVelocity, 
      reloadTime, 
      minReloadTime, 
      reloadTimeDecrement
      );
  }
  
  public Star createStar() {
    int size = 4;
    int x = (int) random(width);
    int y = 0;
    Coordinates coordinates = new Coordinates(x, y);
    color kolor = color(255);
    int speed = 8;
    int direction = 0;
    return new Star(size, coordinates, kolor, speed, direction);
  }
}
