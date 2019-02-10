final class Position {

  private boolean up = false;
  private boolean down = false;
  private boolean left = false;
  private boolean right = false;
  private int x;
  private int y;
  private int speed;
  
  public Position(int x, int y, int speed, int direction) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.setDirection(direction, true);
  }

  public Position(int x, int y, int speed) {
    this.x = x;
    this.y = y;
    this.speed = speed;
  }

  public void setDirection(int direction, boolean trueOrFalse) {
    if (direction == UP) {
      up = trueOrFalse;
    } else if (direction == DOWN) {
      down = trueOrFalse;
    } else if (direction == LEFT) {
      left = trueOrFalse;
    } else if (direction == RIGHT) {
      right = trueOrFalse;
    }
  }

  public void update() {
    if (right) {
      x += speed;
    }
    if (left) {
      x -= speed;
    }
    if (down) {
      y += speed;
    }
    if (up) {
      y -= speed;
    }
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }
}
