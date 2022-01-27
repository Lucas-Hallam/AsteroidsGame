private class Bullet extends AdFloater {
  Bullet(double centerX, double centerY, double shootDirection) {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -3;
    xCorners[1] = -3;
    xCorners[2] = 3;
    xCorners[3] = 3;
    yCorners[0] = 1;
    yCorners[1] = 0;
    yCorners[2] = 0;
    yCorners[3] = 1;
    myCenterX = centerX;
    myCenterY = centerY;
    myPointDirection = shootDirection;
    myColor = color((float) 255, (float) 255, (float) 255);
    myXspeed = 5*Math.cos(shootDirection);
    myYspeed = 5*Math.sin(shootDirection);
    collisionRadius = maxDistance(xCorners, yCorners);
  }
  public void turn(double degreesOfRotation) {
  }
  public void accelerate(double dAmount) {
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
