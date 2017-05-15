class Power
{
  //FIELDS
  //private PImage image;
  private int x;
  private int y;
  private int blocWidth;
  private int blocHeight;
  private int vit;
  private boolean isDropped;
  private color c;
  private int rand;
  
  //CONSTRUCTOR
  public Power()
  {
    this.x = 0;
    this.y = 0;
    this.blocWidth = 0;
    this.blocHeight = 0;
    this.vit = 2;
    this.isDropped = false;
  }
  
  // GETTER
  
  public int Get_X()
  {
    return this.x;
  }
  
  public int Get_Y()
  {
    return this.y; 
  }
  
  public int Get_Rand()
  {
     return this.rand; 
  }
  
  // METHODS
  
  // Après collision Balle-Bloc && Random_Success
  public void drop(int x, int y, int xWidth, int yHeight, int col) // arg int index
  {
     this.isDropped = true;
     this.blocWidth = xWidth;
     this.blocHeight = yHeight;
     this.x = x;
     this.y = y;
     this.rand = col;
     switch(col)
     {
        case 1:
          this.c = color(255,0,0);
          break;
        case 2:
          this.c = color(0,255,0);
          break;
        case 3:
          this.c = color(0,0,255);
          break;
     }
     //println(this.x + " " + this.y + " " + this.blocWidth + " " + this.blocHeight);
  }
  
  public void move()
  {
      if(this.isDropped == true)
      {
        this.y += this.vit;
      }
  }
  
  public void disp()
  {
     if(this.isDropped == true)
     {
       fill(this.c);
       rect(this.x + blocWidth/2 - 5, this.y + blocHeight/2 - 5, 15, 15); 
     }
  }
  
  public void destroy()
  {
     this.x = -10;
     this.y = -10;
     this.isDropped = false;
  }
  
  public void defaut()
  {
      
  }
}