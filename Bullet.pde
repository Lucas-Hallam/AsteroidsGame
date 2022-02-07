public class Bullet extends AdFloater {
  boolean outside;
  public Bullet(double centerX, double centerY, double shootDirection) {
    corners = 4;
    outside = false;
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
    myXspeed = 8*Math.cos(shootDirection*PI/180);
    myYspeed = 8*Math.sin(shootDirection*PI/180);
    collisionRadius = maxDistance(xCorners, yCorners);
  }
  public void accelerate(double dAmount) {
  }
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myXspeed and myYspeed
    myCenterX += myXspeed;
    myCenterY += myYspeed;

    if (myCenterX > width)
    {
      outside = true;
    } else if (myCenterX<0)
    {
      outside = true;
    }
    if (myCenterY >height)
    {
      outside = true;
    } else if (myCenterY < 0)
    {
      outside = true;
    }
  }
  public boolean getOutside() {
    return outside;
  }
}
