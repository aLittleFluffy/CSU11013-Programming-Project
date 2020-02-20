Alien aliens[];
Player player;
PImage spacer;
PImage alternateSpacer;
PImage explode;
Bullet[] bullets;
Bomb[] bombs;
PFont font;

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
  bombs = new Bomb[10];
  initBombs(bombs);
  font = loadFont("Arial-BoldMT-200.vlw");
}

void draw(){
  if(!player.hit){
    if(allAliensDead(aliens)){
      fill(0);
      textSize(40);
      background(255);
      player.move(mouseX-(PADDLEWIDTH/2));
      player.draw();
      text("You Win!", SCREENX/2-(textWidth("You Win!")/2), SCREENY/2);
    } else {
      background(255);
      dropBomb(bombs, aliens);
      player.move(mouseX-(PADDLEWIDTH/2));
      moveArray(aliens);
      moveBullets(bullets);
      moveBombs(bombs);
      checkBombCollisions(bombs, player);
      checkCollisions(bullets, aliens);
      player.draw();
      drawArray(aliens);
      drawBullets(bullets);
      drawBombs(bombs);
      bulletCleanup();
    } 
  }
  else{
    // Game Over Text
    fill(0);
    textSize(40);
    player.move(mouseX-(PADDLEWIDTH/2));
    player.draw();
    text("Game Over", SCREENX/2-(textWidth("Game Over")/2), SCREENY/2);
  }
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
    if(/*bullets[i].collided ||*/ bullets[i].ypos<=0-bullets[i].bulletHeight){
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

void initBombs(Bomb[] bombs){
  for (int i = 0; i < bombs.length; i++) {
    bombs[i] = new Bomb(1000,1000);
  }
}

void moveBombs(Bomb[] bombs){
  for (int i = 0; i < bombs.length; i++) {
    if(!bombs[i].offScreen()){
      bombs[i].move();
    }
  }
}

void drawBombs(Bomb[] bombs){
  for (int i = 0; i < bombs.length; i++) {
    if(!bombs[i].offScreen()){
      bombs[i].draw();
    }
  }
}

void dropBomb(Bomb[] bombs, Alien[] aliens){
  for (int i = 0; i < aliens.length; i++) {
    if(aliens[i].explodedStatus == 0){
      // can drop bomb
      if(bombs[i].offScreen()){
        //randomly drop bomb
        if(int(random(1,500))==1) {
          bombs[i] = new Bomb(aliens[i].x+aliens[i].sprite.width/2,aliens[i].y+aliens[i].sprite.height);
          println("Bomb Dropped");
        }
      }
    }
  }
}

void checkBombCollisions(Bomb[] bombs, Player player){
  for (Bomb bomb : bombs) {
    if(bomb.collide(player)){
      println("collide");
      player.hit=true;
    }
  }
}

boolean allAliensDead(Alien[] aliens){
  boolean allDead = true;
  for (Alien alien : aliens) {
    allDead = allDead && (alien.explodedStatus>=1);
  }
  return allDead;
}
