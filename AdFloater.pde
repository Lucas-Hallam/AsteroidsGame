public class AdFloater extends Floater {
  protected double collisionRadius;
  public boolean collided(AdFloater f) {
    return ((myCenterX - f.getX())*(myCenterX - f.getX())+(myCenterY - f.getY())*(myCenterY - f.getY()) <= (collisionRadius+f.getRadius())*(collisionRadius+f.getRadius()));
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getXSp() {
    return myXspeed;
  }
  public double getYSp() {
    return myYspeed;
  }
  public double getRadius() {
    return collisionRadius;
  }
  public double getDirection() {
    return myPointDirection%360;
  }
}
