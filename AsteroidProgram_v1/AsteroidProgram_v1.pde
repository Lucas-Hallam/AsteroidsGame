ArrayList <Star> stars = new ArrayList <Star>();
ArrayList <Floater> objects = new ArrayList <Floater>();
boolean rTurning;
boolean accelerating;
boolean lTurning;
boolean deccelerating;
boolean hyper;
int numStars;
public void setup() {
  size(500, 500);
  background(0);
  numStars = 50 + (int)(25*Math.random());
  for (int i = 0; i < numStars; i++) {
    Star star = new Star();
    stars.add(star);
  }
  Spaceship ship = new Spaceship(false);
  objects.add(ship);
}
public void draw() {
  if (hyper == true) {
    stars.clear();
    objects.clear();
    numStars = 50 + (int)(25*Math.random());
    for (int i = 0; i < numStars; i++) {
      Star star = new Star();
      stars.add(star);
    }
    Spaceship ship = new Spaceship(true);
    objects.add(ship);
    hyper = false;
  }
  background(0);
  for (int i = 0; i < numStars; i++) {
    stars.get(i).show();
  }
  //for (int i = objects.size()-1; i > 0; i--) {
  //for (int j = i-1; j >= 0; j--) {
  //if (objects.get(i).collided(objects.get(j))) {
  //if (objects.get(i).getClass() == Spaceship.class) {
  //} else if (objects.get(i).getClass() == Bullet.class) {
  //objects.remove(i);
  //} else {
  //Asteroid newAsteroid = new Asteroid();
  //objects.add(newAsteroid);
  //newAsteroid = new Asteroid();
  //objects.add(newAsteroid);
  //objects.remove(i);
  //}
  //if (objects.get(j).getClass() == Spaceship.class) {
  //} else if (objects.get(j).getClass() == Bullet.class) {
  //objects.remove(j);
  //} else {
  //Asteroid newAsteroid = new Asteroid();
  //objects.add(newAsteroid);
  //newAsteroid = new Asteroid();
  //objects.add(newAsteroid);
  //objects.remove(j);
  //}
  //}
  //}
  if (accelerating) {
    objects.get(0).accelerate(0.1);
  }
  if (deccelerating) {
    objects.get(0).accelerate(-0.1);
  }
  if (rTurning) {
    objects.get(0).turn(1);
  }
  if (lTurning) {
    objects.get(0).turn(-1);
  }
  for (int i = 0; i < objects.size(); i++) {
    objects.get(i).move();
    objects.get(i).show();
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
