

/* PART 1/2
void setup(){
  Widget widget1, widget2,widget3;
  size(400, 400);
  stdFont=loadFont("ArialMT-36.vlw"); textFont(stdFont);
  widget1=new Widget((width/2)-(100/2), 100, 100, 40,"red", color(100), stdFont,EVENT_BUTTON1);
  widget2=new Widget((width/2)-(100/2), 200, 100, 40,"green", color(100), stdFont, EVENT_BUTTON2);
  widget3=new Widget((width/2)-(100/2), 300, 100, 40,"blue", color(100), stdFont, EVENT_BUTTON3);
  widgetList = new ArrayList();
  widgetList.add(widget1); widgetList.add(widget2);widgetList.add(widget3);
}
void draw(){
  for(int i = 0; i<widgetList.size(); i++){
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
}
void mousePressed(){
  int event;
  for(int i = 0; i<widgetList.size(); i++){
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX,mouseY);
    switch(event) {
      case EVENT_BUTTON1:
      println("red");
      aWidget.widgetColor = color(255,0,0);
      break;
      case EVENT_BUTTON2:
      println("green");
      aWidget.widgetColor = color(0,255,0);
      break;
      case EVENT_BUTTON3:
      println("blue");
      aWidget.widgetColor = color(0,0,255);
      break;
      default:
      aWidget.widgetColor = color(100);
      break;
    }
  }
}
void mouseMoved(){
  int event;
  for(Widget widget : widgetList){
    event = widget.getEvent(mouseX, mouseY);
    if(event!= EVENT_NULL){
      widget.strokeColour = color(255);
    } else {
      widget.strokeColour = color(0);
    }
  }
}
*/
//  Widget(int x,int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event){
//     Screen(color backgroundColor, Widget widget1, Widget widget2, int screenNum){
//   widget1=new Widget((width/2)-(100/2), 100, 100, 40,"red", color(100), stdFont,EVENT_BUTTON1);

// PART 2
ArrayList<Screen> screens;
int selectedScreen;
void setup(){
  size(400,400);
  stdFont=loadFont("ArialMT-36.vlw"); textFont(stdFont);
  Screen screen1, screen2;
  Widget widget1, widget2;
  int xpos = (width/2)-(100/2);
  widget1 = new Widget(xpos, 100, 100, 40, "Button 1", color(255,0,0), stdFont, EVENT_BUTTON1);
  widget2 = new Widget(xpos, 200, 100, 40, "Forward", color(0,255,0), stdFont, EVENT_BUTTON3);
  color colour = color(0);
  screen1 = new Screen( colour);
  screen1.addWidget(widget1); screen1.addWidget(widget2);

  widget1 = new Widget(xpos, 100, 100, 40, "Button 2", color(0,0,255), stdFont, EVENT_BUTTON2);
  widget2 = new Widget(xpos, 200, 100, 40, "Backward", color(173,216,230), stdFont, EVENT_BUTTON4);
  colour = color(100);
  screen2 = new Screen(colour);
  screen2.addWidget(widget1); screen2.addWidget(widget2);

  screens = new ArrayList<Screen>();
  screens.add(screen1); screens.add(screen2);
}
void draw(){
  background(255);
  screens.get(selectedScreen).draw();
}

void mousePressed(){ 
  int event = screens.get(selectedScreen).getEvent(mouseX, mouseY);
  //println(event);
  switch(event) {
    case EVENT_BUTTON1:
      // println("Button 1 pressed");
      // screens.get(0).selected = false;
      // screens.get(1).selected = true;
      selectedScreen = 1;
      break;
    case(EVENT_BUTTON2):
      selectedScreen = 0;
      break;
    case EVENT_BUTTON3:
      println("Forward Pressed");
      // println("Button 2 Pressed");
      // screens.get(1).selected = false;
      // screens.get(0).selected = true;
      selectedScreen = 0;
      break;
    case(EVENT_BUTTON4):
      println("Backward Pressed");
      //selectedScreen.widgets.get(1).pressed();
      selectedScreen = 1;
      break;
  }
  
}

void mouseMoved(){
  int event;
  Screen screen = screens.get(selectedScreen); 
  
  for(Widget widget : screen.widgets){
    event = widget.getEvent(mouseX, mouseY);
    if(event!= EVENT_NULL){
      widget.strokeColour = color(255);
    } else {
      widget.strokeColour = color(0);
    }
  }
}
