import java.util.*;

private final Factory factory = new Factory();
private final ArrayList<Ship> ships = new ArrayList<Ship>();
private final ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>();
private final ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
private final ArrayList<Star> stars = new ArrayList<Star>();
private int score = 0;
private int starCooldown = 0;
private int starInterval = 10;

void setup() {
  fullScreen();
  noCursor();
  background(0);
  spawnShip();
}

void draw() {
  updateBackground();
  updateShip();
  move(asteroids);
  move(projectiles);
  move(stars);
  checkCollisions(ships, asteroids);
  checkCollisions(asteroids, projectiles);
}

private void updateShip() {
  Iterator<Ship> iterator = ships.iterator();
  int deaths = 0;
  while (iterator.hasNext()) {
    Ship ship = iterator.next();
    if (ship.shouldBeRemoved()) {
      iterator.remove();
      deaths++;
    } else {
      ship.checkWalls();
      ship.updateCoordinates();
      if (ship.isReadyToFire() && ship.isFiring()) {
        projectiles.add(ship.fire());
      }
      ship.drawThing();
    }
  }
  for (int i = 0; i < deaths; i++) {
    spawnShip();
  }
}

private <T extends Thing> void move(ArrayList<T> t) {
  Iterator<T> iterator = t.iterator();
  while (iterator.hasNext()) {
    Thing thing = iterator.next();
    thing.updateCoordinates();
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

private <V extends Vulnerable, D extends Destructive> void checkCollisions(ArrayList<V> vulnerables, ArrayList<D> destructives) {
  for (Vulnerable vulnerable : vulnerables) {
    for (Destructive destructive : destructives) {
      if (vulnerable.isHitBy(destructive)) {
        destructive.inflictDamage(vulnerable);
      }
    }
  }
}

void updateBackground() {
  background(0);
  if (starCooldown == 0) {
    stars.add(factory.createStar());
    starCooldown += starInterval;
  } else {
    starCooldown--;
  }
}

void keyPressed() {
  if (arrowKey()) {
    setDirection(keyCode, 1);
  } else if (key == ' ') {
    setFiring(true);
  } else if (key == 'a') {
    spawnAsteroid();
  }
}

void keyReleased() {
  if (arrowKey()) {
    setDirection(keyCode, 0);
  } else if (key == ' ') {
    setFiring(false);
  }
}

private void setDirection(int direction, int move) {
  for (Ship ship : ships) {
    ship.setDirection(direction, move);
  }
}

private void setFiring(boolean firing) {
  for (Ship ship : ships) {
    ship.setFiring(firing);
  }
}

private void spawnShip() {
  ships.add(factory.createShip());
}

private void spawnAsteroid() {
  asteroids.add(factory.createAsteroid());
}

private boolean arrowKey() {
  return keyCode <= 40 && keyCode >= 37;
}
