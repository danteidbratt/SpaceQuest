final class Asteroid extends Thing implements Vulnerable, Destructive {
  
  private final int damage;
  private boolean hasLanded;
  private final int deathSize;

  protected Asteroid(int size, Position position, int damage, int deathSize) {
    super(size, position);
    this.damage = damage;
    this.deathSize = deathSize;
    this.hasLanded = false;
  }

  public void takeDamage(int damage) {
    int newSize = size -= damage;
    setSize(newSize);
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

  public boolean isDead() {
    return size <= deathSize || hasLanded();
  }
  
  public boolean shouldBeRemoved() {
    return isDead() || hasLanded();
  }

  public void drawThing() {
    fill(255, 0, 0);
    super.drawThing();
  }
}
