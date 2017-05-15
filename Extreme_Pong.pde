import ddf.minim.*;

// LOCAL FIELDS
AudioPlayer music;
Minim minim;

Ball ball;
Raquette raquette;
Bloc[] blocs;
Power[] power;
Background[] rain;
//PImage bground;
int k = 0;
int score;
int debug;
//test
int powerScore;
int selectionMenu;
color bColor;
boolean isUp;
boolean isDown;
boolean mlgBool;
boolean isBegin;
boolean isMenu;
float r;
PImage quit;
PImage play;
PImage title;
//boolean isEnd;

int m = 0;

// INITIALIZATION
void setup()
{
  fullScreen();
  //frameRate(30);
  mlgBool = false;
  blocs = new Bloc[500];
  score = 0;
  raquette = new Raquette(150, 255);
  power = new Power[500];
  rain = new Background[25];
  isMenu = true;
  isUp = true;
  isDown = false;
  selectionMenu = 0;
  quit = loadImage("quit.png");
  play = loadImage("play.png");
  title = loadImage("title.png");
  minim = new Minim(this);
  music = minim.loadFile("music.mp3", 2048);
  music.play();
  //bground = loadImage("fond.png");
  //bground.resize(width,height);
  for(int y = 0; y < 12; y++)
  {
    for(int x = 0; x < 11; x++)
    { 
     
      blocs[k] = new Bloc(x,y,Resist(y));
      power[k] = new Power();
      k++;
      
    }
  }
  for(int i = 0; i< rain.length; i++)
  {
   rain[i] = new Background(); 
  }
  isBegin = false;
  //isEnd = false;
}

// UPDATE AND SHOW
void draw()
{
  for(int m = 0; m < 2; m++)
  {
    update();
    show();
  }
}

// ARITHMETIC OPERATIONS
void update()
{
  
  if(isBegin == true && isMenu == false)
  {
    ball.move(); // Update de la balle
  }
  raquette.move(); // Update de la raquette
  
  for(int i = 0; i< rain.length; i++)
  {
    rain[i].update();
  }

  // Collision entre Balle-Raquette
  if(isBegin == true && isMenu == false)
  {
    switch(isCollisionCircleBloc(ball.Get_X(),ball.Get_Y(),ball.Get_Radius(),raquette.Get_X(),raquette.Get_Y(),raquette.Get_Width(),raquette.Get_Height()))
     {
       case 1:
         ball.Oppose_Vitesse_X();
         break;
       case 2:
         ball.Oppose_Vitesse_Y();
         break;
     }
     
     k=0;
     for(int i = 0; i < 12; i++)
     {
      for(int j = 0; j < 11; j++)
      { 
        // Collision entre Valle-Blocs
        switch(isCollisionCircleBloc(ball.Get_X(), ball.Get_Y(), ball.Get_Radius(), blocs[k].Get_X(), blocs[k].Get_Y(), blocs[k].Get_Width(), blocs[k].Get_Height()))
        {
          case 1:
            // random à mettre
            if(blocs[k].destroy() == 1 && int(random(0,6)) == 5)
            {
              power[k].drop(blocs[k].Get_oldX(), blocs[k].Get_oldY(), blocs[k].Get_Width(), blocs[k].Get_Height(),int(random(0,4)));
            }
            // AVANT car sinon bah il a les coord où le bloc meurt
            ball.Oppose_Vitesse_X();
            ball.move();
            score++;
          break;
          case 2:
            if(blocs[k].destroy() == 1 && int(random(0,6)) == 5)
            {
              power[k].drop(blocs[k].Get_oldX(), blocs[k].Get_oldY(), blocs[k].Get_Width(), blocs[k].Get_Height(),int(random(0,4)));
            }
            ball.Oppose_Vitesse_Y();
            ball.move();
            score++;
          break;
        }
        
        // Collision entre Power-Raquette
        if(isCollisionPowerRaquette(power[k].Get_X() + 5, power[k].Get_Y() + 10, raquette.Get_X(), raquette.Get_Y()))
        {
           power[k].destroy();
           powerScore++;
           // APPLY POWER
           applyPower(k);
        }
        else if(power[k].Get_Y() > height+10)
        {
           power[k].destroy(); 
        }
        
        power[k].move();
        k++;      
      }
     }
  }
   
   // IF LOOSE
   if(isBegin == true && isMenu == false)
   {
     if(ball.Get_Y() + ball.Get_Radius() >= height)
     {
       isBegin = false;
       //isEnd = true;
       
       // REPLACE BLOCS & KILL POWERS
       k=0;
       for(int i = 0; i < 12; i++)
       {
         for(int j = 0; j < 11; j++)
         { 
           blocs[k].undestroy();
           power[k].destroy();
           
           // Pour le départ
           raquette.Set_isStarted_False();
           
           // RESET POWERS
           mlgBool = false;
           ball.defaut();
           raquette.defaut();
           score = 0;
           
           k++;
         }
       }

     }
   }
   
  }



// DRAW ON THE SCREEN RESULTS OF UPDATE
void show()
{
  background(25,25,25);
  //image(bground,0,0);
  if(mlgBool == true)
  {

  }
  
  for(int i = 0; i< rain.length; i++)
  {
    rain[i].disp();
  }
   
  if(isBegin == true && isMenu == false)
  {
    ball.disp();
  }

  if(isMenu == false)
  {
    raquette.disp();
  }
  
  k = 0;
  if(isMenu == false)
  {
    for(int i = 0; i < 12; i++)
    {
      for(int j = 0; j < 11; j++)
      { 
        blocs[k].disp();
        power[k].disp();
        k++;
      }
    }
  }
  fill(255);
  textSize(20);
  if(isMenu == false)
  {
    text(score,width/2,height*2/3);
  }
  //text("Power:" + powerScore, (3*width)/4, height/2); 
  if(isMenu == true)
  {
    image(play,width/2 - 216/2,height/3 - 78/4);
    image(quit,width/2 - 187/2,2*height/3 - 83/4);
    image(title,width/2-303,height/10);
     if(isUp == true)
     {
       stroke(255,255,255);
       strokeWeight(5);
       fill(0);
       triangle(width/3, height/3,  width/3 + 20, height/3 + 20,  width/3, height/3 + 40);
       triangle(2*width/3, height/3,  2*width/3 - 20, height/3 + 20,  2*width/3, height/3 + 40);
     }
     else
     {
       stroke(255,255,255);
       strokeWeight(5);
       fill(0);
       triangle(width/3, 2*height/3,  width/3 + 20, 2*height/3 + 20,  width/3, 2*height/3 + 40);
       triangle(2*width/3, 2*height/3,  2*width/3 - 20, 2*height/3 + 20,  2*width/3, 2*height/3 + 40);
     }
  }
}

void keyPressed()
{
  if(key == 's')
  {
    save("img"+m+".jpg");
    m++;
  }
  if(keyPressed == true && isMenu == false)
  {
    if(key == ' ')
    {
      if(isBegin == false)
      {
        raquette.ok();
        ball = new Ball(raquette.Get_X() + raquette.Get_Width()/2, raquette.Get_Y() - raquette.Get_Height()/2 - 10, 20, 5, 5, 255); // -10 car vitesse balle = 5
      }
      isBegin = true;
    }
  }
  
  if(keyPressed == true && isMenu == true)
  {
    if(keyCode == UP && isUp == false)
    {
      selectionMenu = 0;
      isUp = true;
      isDown = false;
    }
    if(keyCode == DOWN && isDown == false)
    {
      selectionMenu = 1;
      isDown = true;
      isUp = false;
    }
    if(keyCode == ENTER)
    {
      if(isUp == true)
      {
          isMenu = false;
      }
      if(isDown == true)
      {
          exit();
      }
    }
  }
}

int Resist(float a){
  if(a<12 && a>=9){
    return 1;
  }
  else if(a<9 && a>=6){
    return 2;
  }
  else if(a<6 && a>=3){
    return 3;
  }
  else if(a<3 && a>=0){
    return 4;
  }
 return 0;
 }
 
void stop()
{
  music.close();
  minim.stop();
  super.stop();
}