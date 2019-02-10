final class Ship extends Thing implements Vulnerable, Armed {

  private int health;
  private int fireDamage;
  private int fireVelocity;
  private boolean firing;
  private int reloadTime;
  private final int minReloadTime;
  private final int reloadTimeDecrement;
  private int cooldown;

  public Ship(int size, Position position, int health, int fireDamage, int fireVelocity, int reloadTime, int minReloadTime, int reloadTimeDecrement) {
    super(size, position);
    this.health = health;
    this.fireDamage = fireDamage;
    this.fireVelocity = fireVelocity;
    this.reloadTime = reloadTime;
    this.minReloadTime = minReloadTime;
    this.reloadTimeDecrement = reloadTimeDecrement;
    this.cooldown = 0;
    this.firing = false;
  }

  public void setDirection(int direction, boolean trueOrFalse) {
    position.setDirection(direction, trueOrFalse);
  }

  public void drawThing() {
    fill(0, 255, 0);
    super.drawThing();
  }

  public void takeDamage(int damage) {
    health -= damage;
  }

  public boolean isDead() {
    return health <= 0;
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

  public void applyCooldown() {
    if (cooldown > 0) {
      cooldown--;
    }
  }

  public boolean isReadyToFire() {
    return cooldown == 0;
  }

  public Projectile fire() {
    cooldown += reloadTime;
    return new Projectile(getPosition(), fireDamage, fireVelocity, UP);
  }
}
