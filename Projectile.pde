final class Projectile extends Thing implements Destructive {
  
  private final int damage;
  private boolean hasLanded;
  
  public Projectile(Position position, int damage, int speed, int direction) {
    super(10, new Position(position.getX(), position.getY(), speed, direction));
    this.damage = damage;
  }
  
  public void drawThing() {
    fill(255);
    ellipse(position.getX(), position.getY(), size, size);
  }
  
  public void inflictDamage(Vulnerable asteroid) {
    asteroid.takeDamage(getDamage());
    hasLanded = true;
  }
  
  public boolean shouldBeRemoved() {
    return hasLanded();
  }
  
  public int getDamage() {
    return damage;
  }
  
  public boolean hasLanded() {
    return hasLanded;
  }
  
  
  
  
}
