import tech.lity.rea.skatolo.*;
import tech.lity.rea.skatolo.events.*;
import tech.lity.rea.skatolo.gui.controllers.*;

import fr.inria.papart.multitouch.*;

public class MyApp extends PaperScreen {

    Skatolo skatolo;
    
    public void settings() {
	setDrawingSize(297, 210);
	loadMarkerBoard(Papart.markerFolder + "A4-default.svg", 297, 210);
	setDrawOnPaper();
	setQuality(2f);
    }
    
    void setup() {
	skatolo = new Skatolo(this.parent, this);
	// Disable the main (screen) mouse pointer
	skatolo.getMousePointer().disable();
	skatolo.setAutoDraw(false);

	skatolo.addHoverButton("button")
	    .setPosition(0, 60)
	    .setSize(30, 20)
	    ;

	skatolo.addHoverToggle("toggle")
	    .setPosition(100, 60)
	    .setSize(30, 20)
	    ;
      
    }

    // this value is automagically changed by skatolo. 
    boolean toggle = false;
    
    int backgroundColor;
    // this method is automagically called when the button is pressed.
    void button(){
	backgroundColor += 1;
	if(backgroundColor == 10)
	    backgroundColor = 0;
    }
    
    public void drawOnPaper() {

	// background of the sheet is blue
	colorMode(HSB, 10, 1, 1);
	clear();
	background(backgroundColor, 1, 1);

	TouchList touchList =  new TouchList();
	// use the paper-projected mouse pointer
	SkatoloLink.addMouseTo(touchList, skatolo, this);
	SkatoloLink.updateTouch(touchList, skatolo);
	
	skatolo.draw(getGraphics());
    
	if(toggle){
	    fill(2, 0.2f, 0.5f);
	    rect(10, 150, 100, 75);
	}
    }
}
