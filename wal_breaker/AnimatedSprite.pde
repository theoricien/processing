
public enum DIRECTION
{
  HORIZONTAL,
  VERTICAL
}

public class AnimatedSprite
{
   // FIELDS
   private int x;
   private int y;
   private int index;
   //private PImage img;
   private DIRECTION direction;
   private int offset;
   private int time;
   
   // CONSTRUCTOR
   public AnimatedSprite(String nom, int x, int y, DIRECTION d, int offset)
   {
     this.x = x;
     this.y = y;
     this.direction = d;
     //this.img = loadImage(nom);
     this.offset = offset;
     this.time = millis();
   }
   
   // METHODS
   
   
   // UPDATE AND DRAW
   public void Update()
   {
      if(millis() - this.time >= 16)
      {
        if(this.direction == direction.HORIZONTAL)
        {
          // if + nb img
          this.x += this.offset;
        }
        else
        {
          this.y += this.offset;
        }
        
        this.time = millis();
      }
   }
   
   public void Draw()
   {
     //image(this.img,this.x,this.y);
     rect(this.x,this.y,20,100);
   }
   
}
