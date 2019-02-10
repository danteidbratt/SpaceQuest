abstract class Thing {
  
  protected final Position position;
  protected int size;
  protected int radius; 
  
  protected Thing(int size, Position position) {
    this.position = position;
    this.setSize(size);
  }
  
  protected void setSize(int size) {
    this.size = size;
    this.radius = size / 2;
  }
  
  public void updatePosition() {
    position.update();
  }
  
  public Position getPosition() {
    return position;
  }
  
  public void drawThing() {
    ellipse(position.getX(), position.getY(), size, size);
  }
  
  public int getRadius() {
    return radius;
  }
  
  public boolean overlapsWith(Thing otherThing) {
    return dist(position.getX(), position.getY(), otherThing.getPosition().getX(), otherThing.getPosition().getY()) <= (radius + otherThing.getRadius());
  }
  
  public boolean isOutOfBounds() {
    int x = position.getX();
    int y = position.getY();
    return x + radius < 0 || y + radius < 0 || x > width + radius || y > height + radius;
  }
  
  public boolean shouldBeRemoved() {
    return false;
  }
  
}
