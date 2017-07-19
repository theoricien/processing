class Rain
{
  int x = int(random(-width,width+1));
  int y = int(random(-500,-50));
  int speed = int(random(7,15));
  int len = int(random(10,30));
  
  void disp()
  {
    stroke(0,0,255);
    strokeWeight(5);
    line(x,y,x+len/2,y+len); 
  }
  
  void update()
  {
    x += speed;
    y += speed;
    
    if(y >= displayHeight)
    {
      y = int(random(-500,-50));
    }
    if(x >= displayWidth) 
    {
      x = int(random(-width,width+1));
    }
  }
}