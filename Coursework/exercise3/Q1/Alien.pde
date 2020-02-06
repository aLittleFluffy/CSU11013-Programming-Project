class Alien {
  float x; float y;
  int dir = 1;
  PImage explode = loadImage("exploding.gif");
  int count;
  int heightDiff;
  int exploded;
  boolean special;
  float dy; float dx;
  float angle;
  PImage sprite;
  PImage A,B,C,D;
  Alien(int xpos, int ypos, PImage image){
    x = xpos; y = ypos;
    exploded = 0;
    count = 0;
    sprite = image;
    heightDiff = sprite.height; //<>//
    special = false;
  }
  Alien(int xpos, int ypos, PImage image, boolean special){
    x = xpos; y = ypos;
    dx = random(1,1.5); dy = random(1,1.25);
    exploded = 0;
    count = 0;
    sprite = image;
    heightDiff = sprite.height;
    this.special = special;
  }
  void move(){
    if(exploded<1){
      if(special){
        if(x<0 || (x+sprite.width >= width)){
          dx*=-1;
          dy*=-1;
          x+=dx;
          y+=dy+sin(angle);
          println(dx, ", ", dy);
          
        } else if(y<0 || (y+sprite.height>=height)){
          dx*=-1;
          dy*=-1;
          x+=dx;
          y+=dy;
          println(dx, ", ", dy);
        } else {
          x += dx;
          y += dy+sin(angle);
        }
        angle += TWO_PI/50;
        if(angle>=TWO_PI) angle=0;
      } else {
        // Normal
        if(x<0 || (x+sprite.width >= width)){
          if(count<heightDiff){
            y++;
            count++;
          } else {
            dir*=-1;
            x+=dir;
            count = 0;
          };
        } else {
          x += dir;
        }
      }
        
    }
  }
  void draw(){
    if(exploded>=1 && explode<25){
      image(explode, x, y, 30, 25);
      exploded++;
    } else if(exploded==0){        
      image(sprite, x, y, 30, 25);
    }
  }
  void explode(){/*
    if(exploded<1){
      // Load Pixels
      for(int x = 0; x<sprite.width;x++){
        for(int y=0; y<sprite.height; y++){
          //int loc = x + y*width;
          if(x<width/2){
            if(y<width/2){
              A.set(x,y,sprite.get(x,y));
            } else {
              C.set(x, y-width/2,sprite.get(x,y));
            }
          } else {
            if(y<width/2){
              B.set(x,y,sprite.get(x,y));
            } else {
              D.set(x,y-width/2,sprite.get(x,y));
            }
          }
        }
      }
      exploded = 1;
    }*/
    
    if(exploded==0){
      int toExplode = int(random(0,5));
      if(toExplode<1){
        exploded = 1;
      } else {
        exploded = 0;
      }
    }
  }
}
