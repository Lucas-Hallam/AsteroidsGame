ArrayList <Star> stars = new ArrayList <Star>();
ArrayList <AdFloater> collidables = new ArrayList <AdFloater>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
boolean rTurning, accelerating, lTurning, deccelerating, hyper, exists1, exists2, started;
int numAsts, astI, tickNum, numStars;
double lives;
Asteroid newAst;
public void setup() {
  size(750, 750);
  astI = 0;
  background(0);
  numAsts = 5;
  tickNum = 200;
  exists1 = true;
  exists2 = true;
  started = false;
  lives = 3;
  numStars = 50 + (int)(25*Math.random());
  for (int i = 0; i < numStars; i++) {
    Star star = new Star();
    stars.add(star);
  }
  Spaceship ship = new Spaceship(false);
  collidables.add(ship);
  strokeWeight(30);
  textSize(50);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  text("Click to start" + ((Spaceship) collidables.get(0)).getShots(), width - 10, 20);
  stroke(255);
  strokeWeight(0);
  noStroke();
  noLoop();
}
public void draw() {
  if (astI < tickNum*numAsts) {
    if (astI%tickNum == 0) {
      newAst = new Asteroid();
    } else if (astI%tickNum == 100) {
      asteroids.add(newAst);
      exists2 = false;
    }
  }
  if (hyper == true) {
    stars.clear();
    collidables.clear();
    asteroids.clear();
    numStars = 50 + (int)(25*Math.random());
    for (int i = 0; i < numStars; i++) {
      Star star = new Star();
      stars.add(star);
    }
    Spaceship ship = new Spaceship(true);
    collidables.add(ship);
    hyper = false;
    astI = 0;
  }
  background(0);
  for (int i = 0; i < numStars; i++) {
    stars.get(i).show();
  }
  if (accelerating == true) {
    collidables.get(0).accelerate(0.05);
  }
  if (deccelerating == true) {
    collidables.get(0).accelerate(-0.05);
  }
  if (rTurning == true) {
    collidables.get(0).turn(3);
  }
  if (lTurning == true) {
    collidables.get(0).turn(-3);
  }
  for (int i = collidables.size() - 1; i >= 0; i--) {
    exists1 = true;
    if (i == 0) {
      for (int j = asteroids.size() - 1; j >= 0; j--) {
        if (collidables.get(i).collided(asteroids.get(j))) {
          //if (asteroids.get(j).getClass() == Asteroid.class) {
            //SmallAsteroid sAsteroid1 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY());
            //SmallAsteroid sAsteroid2 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY());
            //SmallAsteroid sAsteroid3 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY(), asteroids.get(j), sAsteroid1, sAsteroid2);
            //asteroids.add(sAsteroid1);
            //asteroids.add(sAsteroid2);
            //asteroids.add(sAsteroid3);
            //lives -= 0.5;
          //}
          asteroids.remove(j);
          lives -= 1;
        }
      }
    } else if (i != 0) {
      for (int j = asteroids.size() - 1; j >= 0; j--) {
        if (exists1 == true) {
          if (collidables.get(i).collided(asteroids.get(j))) {
            collidables.remove(i);
            exists1 = false;
            //if (asteroids.get(j).getClass() == Asteroid.class) {
              //SmallAsteroid sAsteroid1 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY());
              //SmallAsteroid sAsteroid2 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY());
              //SmallAsteroid sAsteroid3 = new SmallAsteroid(asteroids.get(j).getX(), asteroids.get(j).getY(), asteroids.get(j), sAsteroid1, sAsteroid2);
              //asteroids.add(sAsteroid1);
              //asteroids.add(sAsteroid2);
              //asteroids.add(sAsteroid3);
            //}
            asteroids.remove(j);
          }
        }
      }
    }
  }
  if (astI < tickNum*numAsts) {
    if (exists2 == true) {
      newAst.move();
      newAst.showSpawn();
    }
  }
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  for (int i = collidables.size() - 1; i >= 0; i--) {
    collidables.get(i).move();
    collidables.get(i).show();
  }
  strokeWeight(20);
  textSize(20);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  textAlign(LEFT, LEFT);
  text("CenterX: " + (int) collidables.get(0).getX(), 10, 20);
  text("CenterY: " + (int) collidables.get(0).getY(), 10, 40);
  text("PointDirection: " + (int) collidables.get(0).getDirection(), 10, 60);
  text("myXspeed: " + (int) (10*collidables.get(0).getXSp()), 10, 80);
  text("myYspeed: " + (int) (10*collidables.get(0).getYSp()), 10, 100);
  textAlign(RIGHT, LEFT);
  text("Shots: " + ((Spaceship) collidables.get(0)).getShots(), width - 10, 20);
  text("Asteroids Left: " + asteroids.size(), width - 10, 60);
  text("Lives: " + lives, width - 10, 40);
  strokeWeight(0);
  noStroke();
  astI++;
  if (lives == 0) {
    strokeWeight(30);
    textSize(50);
    stroke(255, 255, 255);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    text("Game Over", width/2, height/2);
    noLoop();
  }
  if (astI > tickNum*numAsts) {
    if (asteroids.size() == 0) {
      strokeWeight(30);
      textSize(50);
      stroke(255, 255, 255);
      fill(255, 255, 255);
      textAlign(CENTER, CENTER);
      text("Victory!", width/2, height/2);
      noLoop();
    }
  }
}
public void mousePressed() {
  if (started == true) {
    ((Spaceship) collidables.get(0)).shoot();
  } else {
    started = true;
  }
}
public void keyPressed() {
  if (keyCode == 10) {
    hyper = true;
    astI = 0;
    lives = 3;
    loop();
  } else {
    if (keyCode == 37) {
      lTurning = true;
    }
    if (keyCode == 39) {
      rTurning = true;
    }
    if (keyCode == 38) {
      accelerating = true;
    }
    if (keyCode == 40) {
      deccelerating = true;
    }
  }
}
public void keyReleased(KeyEvent e) {
  if (keyCode == 37) {
    lTurning = false;
  }
  if (keyCode == 38) {
    accelerating = false;
  }
  if (keyCode == 39) {
    rTurning = false;
  }
  if (keyCode == 40) {
    deccelerating = false;
  }
}
public double maxDistance(int[] a, int[] b) {
  double max = 0;
  for (int i = 0; i < a.length; i++) {
    if (Math.sqrt(a[i]*a[i]+b[i]*b[i]) > max) {
      max = Math.sqrt(a[i]*a[i]+b[i]*b[i]);
    }
  }
  return max;
}
