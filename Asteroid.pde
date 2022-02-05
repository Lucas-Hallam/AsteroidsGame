public class Asteroid extends AdFloater {
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
  public void showSpawn()  //Draws the floater at the current position  
  {             
    fill(200);   
    stroke(200);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float) myCenterX, (float) myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++) {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
}
