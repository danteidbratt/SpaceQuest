final class Projectile extends Thing implements Destructive {
  
  private final int damage;
  private boolean hasLanded;
  
  public Projectile(Coordinates coordinates, color kolor, int damage, int speed, float direction) {
    super(10, coordinates, kolor, speed, direction);
    this.damage = damage;
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
  
  public Thing getHost() {
    return this;
  }
}
