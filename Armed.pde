interface Armed {
  void increaseFireRate();
  
  void setFiring(boolean firing);
  
  boolean isFiring();
  
   boolean isReadyToFire();
  
  Projectile fire();
}
