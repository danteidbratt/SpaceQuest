interface Destructive {
  void inflictDamage(Vulnerable otherThing);
  int getDamage();
  boolean hasLanded();
  Thing getHost();
}
