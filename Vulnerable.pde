interface Vulnerable {
  void takeDamage(int damage);
  boolean isDead();
  boolean isHitBy(Destructive destructive);
}
