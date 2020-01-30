Player thePlayer;
Player theComputer;
Ball theBall;

int playerScore;
int computerScore;
float scaleMultiplier;
boolean cont;
void settings(){
    size(SCREENX, SCREENY);
}
void setup(){
    thePlayer = new Player(SCREENY-MARGIN- PADDLEHEIGHT);
    thePlayer.player = true;
    theComputer = new Player(0+MARGIN);
    theBall = new Ball();
    ellipseMode(RADIUS);
    playerScore = 0; computerScore = 0;
    cont = true;
    PFont myFont = loadFont("SansSerif-20.vlw");
    textFont(myFont);
    thePlayer.score = 0;
    theComputer.score = 0;
    scaleMultiplier = random(1,2);
}
void draw() {
    if(cont){
        background(0);
        thePlayer.move(mouseX);
        theComputer.computerMove();
        
        thePlayer.draw();
        theComputer.draw();
        theBall.move();
        if(theBall.y>SCREENY/2){
            theBall.collide(thePlayer);
        } else theBall.collide(theComputer);
        int scored = theBall.score();
        if(scored!=0){
          reset(scored);
        }
        thePlayer.draw();
        theComputer.draw();
        theBall.draw();
    } else {
        reset(0);
    }
    
}
void reset(int scorer){
    cont = false;
    // pauses and resets gameplay.
    theBall.x = SCREENX/2;
    theBall.y = SCREENY/2;
    theBall.gameReset();
    if(theComputer.score>=3){
        text(" YOU LOSE\nGAME OVER", SCREENX/2-50, SCREENY/4);
        theComputer.reset();
        thePlayer.reset();
        scaleMultiplier = 1;
    } else if(thePlayer.score>=3){
        text("YOU WIN\nGAME OVER", SCREENX/2-50, SCREENY/4);
        theComputer.reset();
        thePlayer.reset();
        scaleMultiplier = 1;
    } else if((thePlayer.score<3) && (theComputer.score<3)){
        if(scorer == -1){
            theComputer.score();
        } else if(scorer==1) {
            thePlayer.score();
            theComputer.dx*=1.5;
        }
        if(scorer!=0){
            scaleMultiplier++;
        }
    } 
}

void mousePressed(){
    scaleMultiplier*=random(1,2);
    cont = true;
}
