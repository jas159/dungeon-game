void game() {



  //draw room
  stroke(0);
  strokeWeight(1);
  fill(255);
  rect (100, 100, 600, 600);

  //map
  image(map, 700, 100, 100, 100);

  line (0, 0, 100, 100);
  line (800, 0, 700, 100);
  line (0, 800, 100, 700);
  line(800, 800, 700, 700);





  //exits
  noStroke();
  fill(0);
  if (n) ellipse (width/2, 50, 50, 50);
  if (s) ellipse (width/2, height - 50, 50, 50);
  if (w) ellipse (50, height/2, 50, 50);
  if (e) ellipse (width-50, height/2, 50, 50);


  int i =0;
  while (i< bulletList.size()) {
    Bullet b = bulletList.get(i);
    if (b.alive == true) {
      b.show();
      b.act();
      i++;
    } else { 
      bulletList.remove(i);
    }
  }

  i = 0;
  while ( i<enemyList.size()) {
    Enemy e = enemyList.get(i);
    if (e.hp > 0) {
      if (e.myRoomX == roomx && e.myRoomY == roomy) {
        e.show();
        e.act();
      }
      i++;
    } else {
      enemyList.remove(i);
    }
  }



  //pausing 
  if (enterkey) mode = PAUSE;
}

void gameClicks() {
}


void switchRoom() {

  n = s = w = e = false;

  //color here = map.get(roomx, roomy);
  color up = map.get(roomx, roomy -1);
  color down = map.get(roomx, roomy+1);
  color right = map.get(roomx+1, roomy);
  color left = map.get(roomx-1, roomy);

  if (up != white) n = true;
  if (down != white) s = true;
  if (right !=white) e = true;
  if (left != white) w = true;
}
