//mode framework===============================
int mode; 
final int INTRO= 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;
//colours=======================
color blue = #03E4FF;
color yellow= #F3F707;
color red = #FF0505;
color orange = #FAAC03;
color white = #FFFFFF;
color black = #000000;
//movement==================
boolean akey, dkey, skey, wkey, enterkey;
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;

//object variables and lists
Hero myHero;

//map variables
PImage map, spawner;
int roomx, roomy, mapWidth, mapHeight; //x and y coordinates of where you are in the map
boolean n, s, e, w; // are there doors in these directions

void setup() {
  size(800, 800);
  myHero = new Hero();
  mode = GAME;
  map = loadImage("map.png");
  spawner = loadImage("spawner.png");
  roomx= 2;
  roomy= 1;
  mapWidth = map.width;
  mapHeight = map.height;
  switchRoom();

  bulletList = new ArrayList <Bullet>();
  enemyList = new ArrayList <Enemy>();
  enemyList.add(new Explode(2, 1));
  enemyList.add(new Chaser (2, 1,200,200));
  enemyList.add(new Spawner(2, 1));
  enemyList.add(new Ring(2, 1));
  enemyList.add(new Explode(2, 1));
}


void draw() {
  background(255);
  if (mode == INTRO) intro(); //intro
  else if (mode == GAME) game();   //play the game
  else if (mode == GAMEOVER)  gameOver(); //game over
  else if (mode == PAUSE)   pause(); //pause
  else println("mode error");

  myHero.show();
  myHero.act();
}
void keyPressed() {
  if (key == 'a') akey = true;
  if (key == 'd') dkey = true;
  if (key == 's') skey = true;
  if (key == 'w') wkey = true;
  if (keyCode == ENTER) enterkey = true;
}

void keyReleased() {
  if (key == 'a') akey= false;
  if (key == 'd') dkey = false;
  if (key == 's') skey = false;
  if (key == 'w') wkey = false;
  if (keyCode == ENTER) enterkey = true;
}

void mousePressed() {
  if (mode == INTRO) introClicks();
  else if (mode == GAME) gameClicks();
  else if (mode == GAMEOVER) gameoverClicks();
  else if (mode == PAUSE) pauseClicks();
}

void mouseReleased() {
  bulletList.add(new Bullet());
}
