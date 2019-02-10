import java.util.*;

private final Factory factory = new Factory();
private Ship ship;
private final ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
private final ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
private final ArrayList<Star> stars = new ArrayList<Star>();
private int score = 0;
private int starCooldown = 0;
private int starInterval = 10;

void setup() {
  size(500, 800);
  background(0);
  ship = factory.createShip();
}

void draw() {
  background(0);
  updateShip();
  updateBackground();
  move(asteroids);
  move(projectiles);
  move(stars);
  checkShipCollisions();
  checkAsteroidCollisions();
}

private void updateShip() {
  if (ship.shouldBeRemoved()) {
    ship = factory.createShip();
  }
  ship.updatePosition();
  if (ship.isReadyToFire()) {
    if (ship.isFiring()) {
      projectiles.add(ship.fire());
    }
  } else {
    ship.applyCooldown();
  }
  ship.drawThing();
}

private <T extends Thing> void move(ArrayList<T> t) {
  Iterator<T> iterator = t.iterator();
  while (iterator.hasNext()) {
    Thing thing = iterator.next();
    thing.updatePosition();
    if (thing.isOutOfBounds() || thing.shouldBeRemoved()) {
      if (thing.getClass() == Asteroid.class && thing.shouldBeRemoved()) {
        println(++score);
      }
      iterator.remove();
    } else {
      thing.drawThing();
    }
  }
}

private void checkShipCollisions() {
  for (Asteroid asteroid : asteroids) {
    if (ship.overlapsWith(asteroid)) {
      asteroid.inflictDamage(ship);
    }
  }
}

private void checkAsteroidCollisions() {  
  for (Projectile projectile : projectiles) {
    for (Asteroid asteroid : asteroids) {
      if (asteroid.overlapsWith(projectile)) {
        projectile.inflictDamage(asteroid);
      }
    }
  }
}

void updateBackground() {
  if (starCooldown == 0) {
    stars.add(factory.createStar());
    starCooldown += starInterval;
  } else {
    starCooldown--; 
  }
}

void keyPressed() {
  if (arrowKey()) {
    ship.setDirection(keyCode, true);
  } else if (key == ' ') {
    ship.setFiring(true);
  } else if (key == 'a') {
    asteroids.add(factory.createAsteroid());
  }
}

void keyReleased() {
  if (arrowKey()) {
    ship.setDirection(keyCode, false);
  } else if (key == ' ') {
    ship.setFiring(false);
  }
}

private boolean arrowKey() {
  return keyCode <= 40 && keyCode >= 37;
}
