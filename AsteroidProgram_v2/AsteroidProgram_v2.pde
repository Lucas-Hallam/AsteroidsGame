ArrayList <Star> stars = new ArrayList <Star>();
ArrayList <AdFloater> collidables = new ArrayList <AdFloater>();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
boolean rTurning;
boolean accelerating;
boolean lTurning;
boolean deccelerating;
boolean hyper;
int astI;
int numStars;
public void setup() {
  size(750, 750);
  astI = 0;
  background(0);
  numStars = 50 + (int)(25*Math.random());
  for (int i = 0; i < numStars; i++) {
    Star star = new Star();
    stars.add(star);
  }
  Spaceship ship = new Spaceship(false);
  collidables.add(ship);
}
public void draw() {
  if (astI == 0) {
    Asteroid newAst = new Asteroid();
    asteroids.add(newAst);
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
    collidables.get(0).turn(1);
  }
  if (lTurning) {
    collidables.get(0).turn(-1);
  }
  for (int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).move();
    asteroids.get(i).show();
  }
  for (int i = collidables.size() - 1; i >= 0; i--) {
    collidables.get(i).move();
    collidables.get(i).show();
  }
  for (int i = collidables.size() - 1; i > 0; i--) {
    if (((Bullet) collidables.get(i)).getOutside()) {
      collidables.remove(i);
      i--;
    }
  }
  for (int i = collidables.size() - 1; i >= 0; i--) {
    if (collidables.get(i).getClass() == Spaceship.class) {
      for (int j = asteroids.size() - 1; j >= 0; j--) {
        if (collidables.get(i).collided(asteroids.get(j))) {
          asteroids.remove(j);
          // Add two small asteroids
        }
      }
    //} else if (collidables.get(i).getClass() == Bullet.class){
      //for (int j = asteroids.size() - 1; j >= 0; j--) {
        //if (collidables.get(i).collided(asteroids.get(j))) {
          //collidables.remove(i);
          //asteroids.remove(j);
          // Add two small asteroids
        //}
      //}
    }
  }
  astI++;
  if (astI == 1000000000) {
    astI = 0;
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
