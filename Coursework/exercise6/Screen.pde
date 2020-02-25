class Screen{
    ArrayList<Widget> widgets;
    boolean selected;
    color backgroundColor;
    // Widget widget1, widget2;
    Screen(int backgroundColor, Widget widget1, Widget widget2, boolean selected){
        this.backgroundColor = color(backgroundColor); 
        widgets = new ArrayList<Widget>();
        // this.widget1 = widget1;
        // this.widget2 = widget2;
        this.selected = selected;
        widgets.add(widget1); widgets.add(widget2);
    }

    void draw(){
      if(selected){
        background(backgroundColor);
        drawWidgets();
      }
    }

    int getEvent(int mousex, int mousey){
        int event = 0;
        for(Widget widget : widgets){
            event = widget.getEvent(mousex, mousey);
            println("clicked: ",event);
            return event;
        }
        return event;
    }
    void drawWidgets(){
      if(selected){
        for(Widget widget : widgets){
            widget.draw();
        }
      }
        
    }
}
