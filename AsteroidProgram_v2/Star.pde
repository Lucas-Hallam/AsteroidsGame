class Star {
  private int c;
  private float myX,myY,mySize;
  public Star() {
    c = color((float) (256*Math.random()), (float) (256*Math.random()), (float) (256*Math.random()));
    myX = (float) (width*Math.random());
    myY = (float) (height*Math.random());
    mySize = (float) (4*Math.random()+2);
  } 
  public void show() {
    fill(c);
    stroke(c);
    ellipse(myX,myY,mySize,mySize);
  }
}
