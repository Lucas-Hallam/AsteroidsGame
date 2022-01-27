class AdFloater extends Floater {
  protected double collisionRadius;
  public boolean collided(AdFloater f) {
    return (Math.sqrt(myCenterX - f.getX())*((myCenterX - f.getX())+(myCenterY - f.getY())*(myCenterY - f.getY())) >= collisionRadius+f.getRadius());
  }
  public double getX() {
    return myCenterX;
  }
  public double getY() {
    return myCenterY;
  }
  public double getRadius() {
    return collisionRadius;
  }
}
