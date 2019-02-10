interface Armed {
  void increaseFireRate();
  
  void setFiring(boolean firing);
  
  boolean isFiring();
  
  void applyCooldown();
  
   boolean isReadyToFire();
  
  Projectile fire();
}
