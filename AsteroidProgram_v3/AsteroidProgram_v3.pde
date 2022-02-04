ArrayList <Star> stars = new ArrayList <Star>();
ArrayList <AdFloater> collidables = new ArrayList <AdFloater>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
boolean rTurning;
boolean accelerating;
boolean lTurning;
boolean deccelerating;
boolean hyper;
int numAsts, astI, numStars;
boolean exists;
public void setup() {
  size(750, 750);
  astI = 0;
  background(0);
  numAsts = 5;
  exists = true;
  numStars = 50 + (int)(25*Math.random());
  noStroke();
  for (int i = 0; i < numStars; i++) {
    Star star = new Star();
    stars.add(star);
  }
  Spaceship ship = new Spaceship(false);
  collidables.add(ship);
  stroke(255);
  strokeWeight(0);
  noStroke();
}
public void draw() {
  if (astI < 128*numAsts) {
    if (astI%128 == 0) {
      Asteroid newAst = new Asteroid();
      asteroids.add(newAst);
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
  if (accelerating) {
    collidables.get(0).accelerate(0.05);
  }
  if (deccelerating) {
    collidables.get(0).accelerate(-0.05);
  }
  if (rTurning) {
    collidables.get(0).turn(2);
  }
  if (lTurning) {
    collidables.get(0).turn(-2);
  }
  for (int i = collidables.size() - 1; i >= 0; i--) {
    exists = true;
    if (collidables.get(i).getClass() == Spaceship.class) {
      for (int j = asteroids.size() - 1; j >= 0; j--) {
        if (collidables.get(i).collided(asteroids.get(j))) {
          asteroids.remove(j);
        }
      }
    } else if (collidables.get(i).getClass() == Bullet.class) {
      for (int j = asteroids.size() - 1; j >= 0; j--) {
        if (exists == true) {
          if (collidables.get(i).collided(asteroids.get(j))) {
            collidables.remove(i);
            exists = false;
            asteroids.remove(j);
          }
        }
      }
    }
  }
  for (int i = collidables.size() - 1; i > 0; i--) {
    if (((Bullet) collidables.get(i)).getOutside()) {
      collidables.remove(i);
      i--;
    }
  }

  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
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
  text("Asteroids Left: " + asteroids.size(), width - 10, 40);
  strokeWeight(0);
  noStroke();
  for (int i = collidables.size() - 1; i >= 0; i--) {
    collidables.get(i).move();
    collidables.get(i).show();
  }
  astI++;
  if (astI > 128*numAsts) {
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
  ((Spaceship) collidables.get(0)).shoot();
}
void keyPressed(KeyEvent e) {
  if (e.getKeyCode() == 10) {
    hyper = true;
  } else {
    if (e.getKeyCode() == 37) {
      lTurning = true;
    }
    if (e.getKeyCode() == 39) {
      rTurning = true;
    }
    if (e.getKeyCode() == 38) {
      accelerating = true;
    }
    if (e.getKeyCode() == 40) {
      deccelerating = true;
    }
  }
}
void keyReleased(KeyEvent e) {
  if (e.getKeyCode() == 37) {
    lTurning = false;
  }
  if (e.getKeyCode() == 38) {
    accelerating = false;
  }
  if (e.getKeyCode() == 39) {
    rTurning = false;
  }
  if (e.getKeyCode() == 40) {
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
