public class SmallAsteroid extends Asteroid {
  SmallAsteroid(double x, double y) {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -5;
    xCorners[1] = -15;
    xCorners[2] = -9;
    xCorners[3] = 3;
    xCorners[4] = -1;
    xCorners[5] = 6;
    xCorners[6] = 15;
    xCorners[7] = 7;
    yCorners[0] = 4;
    yCorners[1] = 6;
    yCorners[2] = -1;
    yCorners[3] = -10;
    yCorners[4] = -4;
    yCorners[5] = -8;
    yCorners[6] = -2;
    yCorners[7] = 15;
    myColor = color(120);
    rotSpeed = Math.random();
    myCenterX = x;
    myCenterY = y;
    myXspeed = 4*Math.random()-2;
    myYspeed = 4*Math.random()-2;
    collisionRadius = maxDistance(xCorners, yCorners);
  }
  SmallAsteroid(double x, double y, Asteroid parent, SmallAsteroid partner1, SmallAsteroid partner2) {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -5;
    xCorners[1] = -15;
    xCorners[2] = -9;
    xCorners[3] = 3;
    xCorners[4] = -1;
    xCorners[5] = 6;
    xCorners[6] = 15;
    xCorners[7] = 7;
    yCorners[0] = 4;
    yCorners[1] = 6;
    yCorners[2] = -1;
    yCorners[3] = -10;
    yCorners[4] = -4;
    yCorners[5] = -8;
    yCorners[6] = -2;
    yCorners[7] = 15;
    myColor = color(120);
    rotSpeed = Math.random();
    myCenterX = x;
    myCenterY = y;
    myXspeed = parent.getXSp()-partner1.getXSp()-partner2.getXSp();
    myYspeed = parent.getYSp()-partner1.getYSp()-partner2.getYSp();
    collisionRadius = maxDistance(xCorners, yCorners);
  }
}
