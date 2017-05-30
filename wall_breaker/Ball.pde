class Ball
{
 // FIELDS
 private int x;
 private int y;
 private int radius;
 private int vitesse_x;
 private int vitesse_y;
 //private PImage sprite;
 private color c;
 
 private int oldVitesseX;
 private int oldVitesseY;
 
 // CONSTRUCTOR
 public Ball(int x, int y, int taille, int vx, int vy, color c)
 {
   this.x = x;
   this.y = y;
   this.radius = taille;
   this.vitesse_x = vx;
   this.vitesse_y = vy;
   this.c = c;
   
   this.oldVitesseX = this.vitesse_x;
   this.oldVitesseY = this.vitesse_y;
 }
 
 // SETTER
 public void defaut()
 {
   this.vitesse_x = this.oldVitesseX; 
   this.vitesse_y = this.oldVitesseY;
 }
 
 public void speedPower()
 {
   this.vitesse_x *= 1.25;
   this.vitesse_y *= 1.25;
 }
 
public  void Oppose_Vitesse_X()
 {
   this.vitesse_x = -this.vitesse_x;
 }
 
 public void Oppose_Vitesse_Y()
 {
   this.vitesse_y = -this.vitesse_y;
 }
 
 public void Set_X(int x)
 {
   this.x = x;
 }
 
 public void Set_Y(int y)
 {
   this.y = y; 
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
 
 public int Get_Radius()
 {
   return this.radius; 
 }
 
 public boolean isDown()
 {
   return this.y >= height - this.radius;
 }
 
 public int Get_Speed()
 {
   return this.vitesse_x; 
 }
 
 // METHODS
 public void disp()
 {
   fill(this.c);
   ellipse(this.x,this.y,this.radius,this.radius); 
 }
 
 public void move()
 {
   this.x += this.vitesse_x;
   this.y += this.vitesse_y;
   
   if(this.x - this.radius/2 <= 0 || this.x + this.radius/2 >= width)
   {
     this.vitesse_x = -this.vitesse_x;
   }
   
   if(this.y - this.radius/2 <= 0)
   {
     this.vitesse_y = -this.vitesse_y;
   }
 }
 
 public void unmove()
 {
   this.vitesse_x = 0;
   this.vitesse_y = 0;
 }
 
 public void undisp(int b1, int b2, int b3)
 {
   fill(b1,b2,b3);
   ellipse(this.x,this.y,this.radius,this.radius); 
 }
 
 public void reset()
 {
   this.vitesse_x = int(random(-10,11));
   this.vitesse_y = int(random(-10,11));
 }
 
 
}
