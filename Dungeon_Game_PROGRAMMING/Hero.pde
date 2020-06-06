class Hero {
  float x, y, d, hp,speed;

  Hero() {
    x = width/2;
    y=height/2;
    d=30;
    speed= 5;
    hp = 30;
  }

  void show() {
    fill(blue);
    stroke(blue);
    ellipse(x, y, d, d);
    strokeWeight(0);
    line(x, y, mouseX, mouseY);
  }

  void act() {
    if (wkey) y=y - speed;
    if (skey) y=y+speed;
    if (akey) x=x-speed;
    if (dkey) x=x+speed;

    if (n) checkNorthExit();
    if (s) checkSouthExit();
    if (e) checkEastExit();
    if (w) checkWestExit();
  }

  void checkNorthExit() {
    if (dist(x, y, width/2, 50) <40) {
      roomy = roomy -1;
      x= width/2;
      y= height/2;
      switchRoom();
    }
  }

  void checkSouthExit() {
    if (dist(x, y, width/2, height - 50) <40) {
      roomy = roomy +1;
      x= width/2;
      y= height/2;
      switchRoom();
    }
  }

  void checkEastExit() {
    if (dist(x, y, width-50, height/2) < 40) {
      roomx = roomx +1;
      x= width/2;
      y= height/2;
      switchRoom();
    }
  }

  void checkWestExit() {
    if (dist(x, y, 50, height/2) < 40) {
      roomx = roomx -1;
      x= width/2;
      y = height/2;
      switchRoom();
    }
  }
  ////check for walls
  //if (x < 100) x=100;
  //if (x > width- 100) x = width -100;
  //if (y < 100) y = 100;
  //if (y> height-100) y = height -100;
}
