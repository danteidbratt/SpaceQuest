final class Asteroid extends Thing implements Vulnerable, Destructive {
  
  private final int damage;
  private boolean hasLanded;
  private final int deathSize;

  protected Asteroid(int size, Coordinates coordinates, color kolor, int speed, float direction, int damage, int deathSize) {
    super(size, coordinates, kolor, speed, direction);
    this.damage = damage;
    this.deathSize = deathSize;
    this.hasLanded = false;
  }

  public void takeDamage(int damage) {
    int newSize = size -= damage;
    setSize(newSize);
  }
  
  public boolean isDead() {
    return size <= deathSize || hasLanded();
  }
  
  public boolean isHitBy(Destructive destructive) {
    return overlapsWith(destructive.getHost());
  }
  
  public void inflictDamage(Vulnerable hero) {
    hero.takeDamage(this.getDamage());
    this.size = deathSize;
  }
  
  public int getDamage() {
    return this.damage;
  }
  
  public boolean hasLanded() {
    return this.hasLanded;
  }
  
  public Thing getHost() {
    return this;
  }
  
  public boolean shouldBeRemoved() {
    return isDead() || hasLanded();
  }
}
