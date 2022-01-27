class Asteroid extends AdFloater {
  protected double rotSpeed;
  Asteroid() {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -10;
    xCorners[1] = -31;
    xCorners[2] = -17;
    xCorners[3] = 5;
    xCorners[4] = -2;
    xCorners[5] = 11;
    xCorners[6] = 30;
    xCorners[7] = 14;
    yCorners[0] = 8;
    yCorners[1] = 12;
    yCorners[2] = -2;
    yCorners[3] = -19;
    yCorners[4] = -8;
    yCorners[5] = -15;
    yCorners[6] = -5;
    yCorners[7] = 30;
    myColor = color(120);
    rotSpeed = Math.random();
    myCenterX = width*Math.random();
    myCenterY = height*Math.random();
    myXspeed = 4*Math.random()-2;
    myYspeed = 4*Math.random()-2;
    collisionRadius = maxDistance(xCorners, yCorners);
  }
  public void move () {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed; 
    super.turn(rotSpeed);
    
    if (myCenterX > width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if (myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }  
}
