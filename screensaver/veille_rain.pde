import java.awt.*;
PImage screenshot;
Rain[] r = new Rain[100];

void setup()
{
 fullScreen();
 try {
    screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(0, 0, displayWidth, displayHeight)));
  } catch (AWTException e) { }
  
 for(int i = 0; i< r.length; i++){
   r[i] = new Rain(); 
 }
}

void draw()
{
 image(screenshot,0,0); 
 
  for(int i = 0; i< r.length; i++){
   r[i].update();
   r[i].disp();
 }
}