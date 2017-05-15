class Background
{
  private int x;
  private int y;
  private int speed;
  private int len;
  
  public Background()
  {
    this.x = int(random(0,width+1));
    this.y = int(random(-500,-50));
    this.speed = int(random(20,35));
    this.len = int(random(100,300));
  }
  
  void disp()
  {
    stroke(255,255,255);
    strokeWeight(2);
    line(this.x, this.y, this.x, this.y+this.len); 
    strokeWeight(5);
  }
  
  void update()
  {
    this.y += this.speed;
    
    if(this.y >= displayHeight)
    {
      this.y = int(random(-500,-50));
    }
    if(x >= displayWidth) 
    {
      this.x = int(random(0,width+1));
    }
  }
}
