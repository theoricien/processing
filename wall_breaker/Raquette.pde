class Raquette
{
 //FIELDS
 private int x;
 private int y;
 private int longueur;
 private int largeur;
 private color c;
 private int speed;
 private boolean isStarted;
 //private PImage sprite;
 
 private int oldSpeed;
 
 // CONTRUCTOR
 public Raquette(int longueur, color c)
 {
  this.x = width/2;
  this.y = 9*height/10;
  this.longueur = longueur;
  this.largeur = 25;
  this.c = c;
  this.speed = 10;
  this.isStarted = false;
  
  this.oldSpeed = this.speed;
 }
 
 // SETTER
 public void defaut()
 {
  this.speed = this.oldSpeed; 
 }
 
 public void speedPower()
 {
   this.speed *= 1.25;
 }
 
 // GETTER
 
 public int Get_Speed()
 {
   return this.speed;  
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
 
 // SETTERS
 public void Set_isStarted_False()
 {
    this.isStarted = false; 
 }
 
 // METHODS
 
 public void disp()
 {
   fill(this.c);
   rect(this.x, this.y, this.longueur, this.largeur, 5); 
   if(this.isStarted == false)
   {
      ellipse(this.x + this.longueur/2, this.y, 20,20); 
   }
 }
 
 public void move()
 {
   if(keyPressed == true)
   {
     if(keyCode == RIGHT)
     {
       this.x += speed; 
     }
     if(keyCode == LEFT)
     {
       this.x -= speed; 
     }
   }
 }
 
 public void begin()
 {
    this.isStarted = false;
 }
 
 public void ok()
 {
    this.isStarted = true; 
 }

 
}
