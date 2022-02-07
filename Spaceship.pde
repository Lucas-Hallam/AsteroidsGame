public class Spaceship extends AdFloater {
  protected int shots;
  protected Bullet newBullet, newBullet2;
  public Spaceship(boolean random) {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -13;
    xCorners[1] = -6;
    xCorners[2] = -13;
    xCorners[3] = 8;
    xCorners[4] = 2;
    xCorners[5] = 12;
    xCorners[6] = 2;
    xCorners[7] = 8;
    yCorners[0] = 5;
    yCorners[1] = 0;
    yCorners[2] = -5;
    yCorners[3] = -14;
    yCorners[4] = -8;
    yCorners[5] = 0;
    yCorners[6] = 8;
    yCorners[7] = 14;
    myColor = color((float) 0, (float) 255, (float) 0);
    myXspeed = 0;
    myYspeed = 0;
    collisionRadius = maxDistance(xCorners, yCorners);
    if (random == false) {
      myCenterX = width/2;
      myCenterY = height/2;
      myPointDirection = 0;
    } else {
      myCenterX = width*Math.random();
      myCenterY = height*Math.random();
      myPointDirection = 360*Math.random();
    }
  }
  public void shoot() {
    newBullet = new Bullet(myCenterX+10*Math.cos(myPointDirection*PI/180)-13.5*Math.sin(myPointDirection*PI/180),
      myCenterY+13.5*Math.cos(myPointDirection*PI/180)+10*Math.sin(myPointDirection*PI/180),
      myPointDirection);
    newBullet2 = new Bullet(myCenterX+10*Math.cos(myPointDirection*PI/180)+14.5*Math.sin(myPointDirection*PI/180),
      myCenterY-14.5*Math.cos(myPointDirection*PI/180)+10*Math.sin(myPointDirection*PI/180),
      myPointDirection);
      noStroke();
    collidables.add(newBullet);
    collidables.add(newBullet2);
    shots++;
  }
  public int getShots() {
    return shots;
  }
}
