class Bloc
{
  // FIELDS
  private int x;
  private int y;
  private int longueur;
  private int largeur;
  private color c;
  private int resist;
  private int oldRes;
  private int oldX;
  private int oldY;
  private color oldC;

  // CONSTRUCTOR
  public Bloc(int indexX, int indexY, int resist)
  {
   this.longueur = displayWidth/11;
   this.largeur = displayHeight/11/2;
   this.x = indexX * (this.longueur*(1+1/11)); 
   this.y = indexY * (this.largeur*(1+1/11));
   this.c = color(255-resist*30,0,0);  
   this.oldC = this.c;
   this.resist = resist;
   this.oldRes = this.resist;
   this.oldX = this.x;
   this.oldY = this.y;
  }
  
  // GETTER
  public int Get_oldX()
  {
     return this.oldX; 
  }
  
  public int Get_oldY()
  {
     return this.oldY; 
  }
  
  public int Get_X()
  {
    return this.x;
  }
  
  public int Get_Y()
  {
    return this.y; 
  }
  
  public int Get_Width()
  {
    return this.longueur; 
  }
  
  public int Get_Height()
  {
    return this.largeur; 
  }
  
  // METHODS

  public void disp()
  {
    fill(c);
    rect(this.x, this.y, this.longueur, this.largeur); 
  }
  
  public int destroy() // = MOVE TO TRASH BIN
  {
     this.resist--;
     this.c = color(255-resist*30,0,0);
     if(this.resist <= 0)
     {
       this.x = -this.longueur;
       this.y = -this.largeur;
       return 1;
     }
     else
     {
       return 0;
     }
  }

  
  public void undestroy()
  {
      this.resist = this.oldRes;
      this.x = this.oldX;
      this.y = this.oldY;
      this.c = this.oldC;
  }
  
}
