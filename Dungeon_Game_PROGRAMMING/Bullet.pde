class Bullet {

float x, y, d, vx, vy;
boolean alive;

  Bullet() {
    x= myHero.x;
    y= myHero.y;
    d= 10;
    alive = true;
    PVector direction = new PVector (mouseX-x , mouseY-y);
    direction.setMag(15);
   
    vx= direction.x;
   vy = direction.y;
  }

  void show() {
    fill(red);
    stroke(red);
    ellipse(x,y,d,d);
    
  }

  void act() {
    x=x+vx;
    y=y+vy;
    
    if (x <0 || x> width || y<0 || y> height) {
      alive = false;
    }
  }
}
