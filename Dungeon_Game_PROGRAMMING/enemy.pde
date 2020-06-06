class Enemy { 

  float x, y, vx, vy, d;
  int myRoomX, myRoomY;
  int hp;

  Enemy(int _myRoomX, int _myRoomY) {
    x = random(100, width-100);
    y = random (100, height -100);
    myRoomX = _myRoomX;
    myRoomY = _myRoomY;
    vx = 0;
    vy = 0;
    d = 30;
    hp = 5;
  }
  void show() {
    noStroke();
    fill (orange);
    ellipse(x, y, d, d);
    textSize(15);
    fill(0);
    text(hp, x, y);
  }

  void act() {
    x= x+vx;
    y=y +vy;


    checkCollisions();
  }

  void checkCollisions() {
    int i =0;
    while (i<bulletList.size()) {
      Bullet b = bulletList.get(i);
      if (dist(b.x, b.y, x, y) < b.d/2 +d/2) {
        hp = hp - 1;
        b.alive = false;
      }
      i++;
    }
  }
}

//CHASER=============================================

class Chaser extends Enemy {
  //Enemy; super class    Chaser: subclass
  Chaser(int _myRoomX, int _myRoomY, float _x, float _y) {
    super(_myRoomX, _myRoomY);
    d=50;
    hp=3;
    x = _x;
    y = _y;
  }

  void show() {
    fill(255, 0, 255);
    ellipse (x, y, d, d);
  }

  void act() {
    x= x+vx;
    y=y+vy;

    PVector direction = new PVector (myHero.x-x, myHero.y-y);
    direction.setMag(3);

    vx= direction.x;
    vy = direction.y;
    super.checkCollisions();
  }
}

//PORTAL SPAWNER AND SPAWNERS======================================

class Spawner extends Enemy {
  int timer ;
  Spawner( int _myRoomX, int _myRoomY) {
    super( _myRoomX, _myRoomY);
    d = 100;
    hp = 20;
    timer = 50;
  }

  void show() {
    imageMode(CENTER);
    image(spawner, x, y, d, d);
  }


  void act() {
    timer--;
    if (timer < 0) {
      enemyList.add(new Chaser(myRoomX, myRoomY, x, y));
      timer = 50;
    }

    super.checkCollisions();
  }
}

//RING OF DAMAGE ENEMY=========================================
class Ring extends Enemy {
  float dd;
  Ring ( int _myRoomX, int _myRoomY) {
    super( _myRoomX, _myRoomY);
    d = 250;
    dd = 50;
    hp = 3;
  }

  void show() {
    stroke(black);
    noFill();
    ellipse (x, y, d, d);
    noStroke();
    fill (red);
    ellipse (x, y, dd, dd);
  }

  void act() {
    x= x+vx;
    y=y+vy;

    PVector direction = new PVector (myHero.x-x, myHero.y-y);
    direction.setMag(3);

    vx= direction.x;
    vy = direction.y;

    int i =0;
    while (i<bulletList.size()) {
      Bullet b = bulletList.get(i);
      if (dist(b.x, b.y, x, y) < b.d/2 + dd/2 ) {
        hp = hp - 1;
        b.alive = false;
      }
      i++;
    }
  }
}

//exploding enemy
class Explode extends Enemy { 
  int timer, speed;
  boolean explosion, alive;
  Explode(int _myRoomX, int _myRoomY) {
    super( _myRoomX, _myRoomY);
    d = 50;
    hp=3;
    alive = true;
    timer = 80;
    speed = 4;
  }

  void show() {
    fill(orange);
    ellipse(x, y, d, d);
  }

  void act() {
    x= x+vx;
    y=y+vy;

    PVector direction = new PVector (myHero.x-x, myHero.y-y);
    direction.setMag(speed);

    vx= direction.x;
    vy = direction.y;

    //explosion collision
    if (dist(myHero.x, myHero.y, x, y) < myHero.d/2 + d/2) {
      myHero.hp = hp - 5;
      explosion = true;
    }

    if (explosion == true) {
      d = d+ 2;
      fill(red);
      ellipse(x, y, d, d);
      timer--;
    }

    if (timer == 0) {
      hp=0;
    }

   super.checkCollisions();
   
  }
}
