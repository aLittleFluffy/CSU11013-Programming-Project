class Alien {
  int x; int y;
  int dir = 1;
  PImage alienImage = loadImage("spacer.gif");
  PImage explode = loadImage("exploding.gif");
  int count;
  int heightDiff = alienImage.height;
  int exploded;
  boolean special;
  
  float angle;
  Alien(int xpos, int ypos, boolean isSpecial){
    x = xpos; y = ypos;
    exploded = 0;
    count = 0;
    special = isSpecial;
  }
  void move(){
    if(exploded<1){
      if(x<1 || (x+alienImage.width >= width)){
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
  void moveSpecial(){
    if(exploded<1){
      if(x<1 || (x+alienImage.width >= width)){
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
  void draw(){
    if(exploded>=1 && exploded<25){
      image(explode, x, y);
      exploded++;
    } else if(exploded==0){
      if(special){
        tint(0,153,204);
        image(alienImage, x, y);
        noTint();
      } else {
        image(alienImage, x, y);
      }
    }
  }
  void explode(){
    if(exploded==0){
      int toExplode = int(random(0,2));
      if(toExplode<1){
        exploded = 1;
      } else {
        exploded = 0;
      }
    }
  }
}
