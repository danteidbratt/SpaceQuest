final class Star extends Thing {
  
  public Star(int size, Position position) {
    super(size, position);
  }
  
  public void drawThing() {
    fill(255);
    super.drawThing();
  }
}
