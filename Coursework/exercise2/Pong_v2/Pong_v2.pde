Ball  gameBall;
Player player;
Player computer;

boolean cont;

void settings(){
    size(SCREENX, SCREENY);
}

void setup(){
    player = new Player(0+MARGIN);
    computer = new Player(SCREENX - MARGIN - PADDLEWIDTH);
    gameBall = new Ball();
    ellipseMode(RADIUS);
    cont = true;
    player.score = 0;
    computer.score = 0;
    PFont myFont = loadFont("SansSerif-20.vlw");
    textFont(myFont);
}

void draw() {
    if(cont){
        background(0);
        player.move(mouseY-(PADDLEHEIGHT/2));
        computer.computerMove();
        
        player.draw();
        computer.draw();
        gameBall.move();
        if(gameBall.x<SCREENY/2){
            gameBall.collide(player);
        } else gameBall.collide(computer);
        int scored = gameBall.score();
        if(scored!=0){
          reset(scored);
        }
        player.draw();
        computer.draw();
        gameBall.draw();
        text("Current Speed:\n"+sqrt(pow(gameBall.dx,2)+pow(gameBall.dy,2)),PADDLEWIDTH+MARGIN+10,50);
        text(player.score, SCREENX/2-100, 50);
        text(computer.score, SCREENX/2+100, 50);
    } else {
        reset(0);
    }
    
}

void reset(int scorer){
    cont = false;
    gameBall.gameReset();
    // Scoring logic
    if(computer.score>=3){
        text("Game Over\nYou Lose", SCREENX/2, SCREENY/2);
        fullReset();
    } else if(player.score>=3){
      text("Game Over\nYou Win", SCREENX/2, SCREENY/2);
      fullReset();
    } else {
      if(scorer == -1){
        player.score();
        computer.dy*=SPEED_MUL;
      } else if(scorer == 1){
        computer.score();
        //gameBall.ballSpeed*=SPEED_MUL;
      }
    }
    
}
void fullReset(){
  computer.score = 0;
  player.score = 0;
}
void mousePressed(){
    cont = true;
}
