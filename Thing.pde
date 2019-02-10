abstract class Thing {
  
  protected final Coordinates coordinates;
  protected int size;
  protected float radius; 
  protected float direction;
  protected boolean moving;
  protected int speed;
  protected color kolor;
  
  protected Thing(int size, Coordinates coordinates, color kolor, int speed, float direction) {
    this.coordinates = coordinates;
    this.setSize(size);
    this.speed = speed;
    this.kolor = kolor;
    this.direction = direction;
    this.moving = true;
  }
  
  protected Thing(int size, Coordinates coordinates, color kolor, int speed) {
    this.coordinates = coordinates;
    this.setSize(size);
    this.speed = speed;
    this.kolor = kolor;
    this.direction = 0;
    this.moving = false;
  }
  
  protected void setSize(int size) {
    this.size = size;
    this.radius = float(size) / 2;
  }
  
  public void updateCoordinates() {
    if (moving) {
      coordinates.update(direction, speed);
    }
  }
  
  protected boolean overlapsWith(Thing other) {
    int x1 = coordinates.getX();
    int y1 = coordinates.getY();
    int x2 = other.getCoordinates().getX();
    int y2 =  other.getCoordinates().getY();
    float safeDistance = radius + other.getRadius();
    return dist(x1, y1, x2, y2) <= safeDistance;
  }
  
  public Coordinates getCoordinates() {
    return coordinates;
  }
  
  public void drawThing() {
    fill(kolor);
    ellipse(coordinates.getX(), coordinates.getY(), size, size);
  }
  
  public float getRadius() {
    return radius;
  }
  
  public boolean isOutOfBounds() {
    int x = coordinates.getX();
    int y = coordinates.getY();
    return x + radius < 0 || y + radius < 0 || x > width + radius || y > height + radius;
  }
  
  public boolean shouldBeRemoved() {
    return false;
  }
  
}
