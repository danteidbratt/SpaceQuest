final class Coordinates {

  private int x;
  private int y;
  
  public Coordinates(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public Coordinates(Coordinates other) {
    this.x = other.getX();
    this.y = other.getY();
  }
  
  public void update(float direction, int speed) {
    x += (sin(direction) * speed);
    y += (cos(direction) * speed);
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}
