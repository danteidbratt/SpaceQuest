final class Ship extends Thing implements Vulnerable, Armed {

  private int up = 0;
  private int down = 0;
  private int left = 0;
  private int right = 0;
  private int health;
  private int fireDamage;
  private int fireVelocity;
  private boolean firing;
  private int reloadTime;
  private final int minReloadTime;
  private final int reloadTimeDecrement;
  private int cooldown;

  public Ship(int size, Coordinates coordinates, color kolor, int speed, int health, int fireDamage, int fireVelocity, int reloadTime, int minReloadTime, int reloadTimeDecrement) {
    super(size, coordinates, kolor, speed);
    this.health = health;
    this.fireDamage = fireDamage;
    this.fireVelocity = fireVelocity;
    this.reloadTime = reloadTime;
    this.minReloadTime = minReloadTime;
    this.reloadTimeDecrement = reloadTimeDecrement;
    this.cooldown = 0;
    this.firing = false;
  }

  public void setDirection(int arrowKey, int onOrOff) {
    if (arrowKey == UP) {
      up = onOrOff;
    } else if (arrowKey == DOWN) {
      down = onOrOff;
    } else if (arrowKey == LEFT) {
      left = onOrOff;
    } else if (arrowKey == RIGHT) {
      right = onOrOff;
    }
    
    // coordinates.setDirection(direction);
    // coordinates.setMoving(horizontal != 0 || vertical != 0);
  }
  
  public void updateCoordinates() {
    int horizontal = right - left;
    int vertical = down - up;
    direction = atan2(horizontal, vertical);
    moving = horizontal != 0 || vertical != 0;
    super.updateCoordinates();
  }
  
  public void checkWalls() {
    if (coordinates.getX() <= radius) {
      left = 0;
    }
    if (coordinates.getX() > width - radius) {
      right = 0;
    }
    if (coordinates.getY() < radius) {
      up = 0;
    }
    if (coordinates.getY() > height - radius) {
      down = 0;
    }
  }

  public void takeDamage(int damage) {
    health -= damage;
  }

  public boolean isDead() {
    return health <= 0;
  }
  
  public boolean isHitBy(Destructive destructive) {
    return overlapsWith(destructive.getHost());
  }
  
  public boolean shouldBeRemoved() {
    return isDead();
  }

  public void increaseFireRate() {
    if (reloadTime > minReloadTime) {
      reloadTime -= reloadTimeDecrement;
    }
  }

  public void setFiring(boolean firing) {
    this.firing = firing;
  }

  public boolean isFiring() {
    return firing;
  }

  public boolean isReadyToFire() {
    if (cooldown <= 0) {
      return true;
    }
    cooldown--;
    return false;
  }

  public Projectile fire() {
    cooldown += reloadTime;
    return new Projectile(new Coordinates(coordinates), kolor, fireDamage, fireVelocity, PI);
  }
}
