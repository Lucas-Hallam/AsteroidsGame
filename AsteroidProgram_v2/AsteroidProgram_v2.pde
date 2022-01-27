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
  size(500, 500);
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
  for (int i = 0; i < collidables.size(); i++) {
    collidables.get(i).move();
    collidables.get(i).show();
  }
  astI++;
  if (astI == 128) {
    astI = 0;
  }
}

//public void mousePressed() {
//((Spaceship) objects.get(0)).shoot();
//}
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
