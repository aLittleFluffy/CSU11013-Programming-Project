Alien aliens[];
Player player;
PImage spacer;
PImage alternateSpacer;
PImage explode;
Bullet[] bullets;
void settings(){
  size(SCREENX, SCREENY);
}
void setup(){
  aliens = new Alien[10];
  spacer = loadImage("spacer.gif");
  alternateSpacer= loadImage("spacer2.png");
  explode = loadImage("exploding.gif");
  initArray(aliens);
  player = new Player(SCREENY-MARGIN);
  bullets = new Bullet[0];
}
void draw(){
  background(255);
  player.move(mouseX-(PADDLEWIDTH/2));
  moveArray(aliens);
  moveBullets(bullets);
  checkCollisions(bullets, aliens);
  player.draw();
  drawArray(aliens);
  drawBullets(bullets);
  bulletCleanup();
  println(bullets.length);
}
void initArray(Alien alienArr[]){
  for(int i=0; i<alienArr.length; i++){
    if(int(random(0,2))==int(random(0,2))) alienArr[i] = new Alien(0+i*(alternateSpacer.width+1),0, alternateSpacer, explode);
    else alienArr[i] = new Alien(0+i*(spacer.width+1),0, spacer, explode);
  }
}
void drawArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
    alienArr[i].draw();
  }
}
void moveArray(Alien alienArr[]){
  for (int i = 0; i < alienArr.length; ++i) {
      alienArr[i].move();
  }
}
void mousePressed() {
  Bullet newBullet = new Bullet(mouseX);
  bullets = (Bullet[])append(bullets, newBullet);
}

void moveBullets(Bullet[] bullets){
  if(bullets.length>0){
    for (Bullet bullet : bullets) {
      bullet.move();
    }
  }
}
void drawBullets(Bullet[] bullets){
  if(bullets.length>0){
    for (Bullet bullet : bullets) {
      bullet.draw();
    }
  }
}
void checkCollisions(Bullet[] bullets, Alien[] alienArr){
  if(bullets.length>0){
    for (Bullet bullet: bullets) {
      for (Alien alien : alienArr) {
        bullet.checkCollide(alien);
      }
    }
  }
}
void bulletCleanup(){
  for(int i=0; i<bullets.length;i++){
    // Add logic to remove bullets that have left the screen or collided
    if(bullets[i].collided || bullets[i].ypos<=0-bullets[i].bulletHeight){
      bullets = remove(bullets, i);
    }
  }
}
Bullet[] remove(Bullet bulletArr[], int index ){
  printArray(bulletArr);
  for(int i = index+1; i<bulletArr.length; i++){
    bulletArr[i-1] = bulletArr[i];
  }
  printArray(bulletArr);
  return (Bullet[])shorten(bulletArr);
}
