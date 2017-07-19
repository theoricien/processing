
// FIELDS
IntList listeX, listeY, pioupiou, pY;
int tX, tY; // TRIANGLE = PLAYER
int ecx; // SCORE
float s; // TIME

void setup()
{
  // INITIALIZATION
  size(640,480); // size(displayWidth, displayHeight);
  background(0);
  frameRate(60);
  listeX = new IntList();
  listeY = new IntList();
  pioupiou = new IntList();
  pY = new IntList();
  tX = width;
  tY = height/2;
  noCursor();
  s = millis(); // millisecondes
}

// UPDATE & DRAW
void draw()
{
  background(0); // CLEANER
  if(int(random(0,30)) == 0) // ADD BALLS
  {
    ajouterBalles();
  }
  // PIOUPIOU ATTACK
  if(mousePressed)
  {
    ajouterPioupiou();
  }
  
  dep(); // BALL MOVE
  col(); // BALL COLLISION
  disp(); // DRAW
  tY = mouseY; // Y OF THE TRIANGLE
}

//METHODS
void ajouterBalles()
{
  listeX.append(-30);
  listeY.append(int(random(0,height)));
}

void ajouterPioupiou()
{
  if(millis() - s >= 200) // SEND PIOUPIOU
  {
    pioupiou.append(tX); //
    pY.append(tY);
    s = millis();
  }
}

void dep()
{
 bB();
 bT();
 bP();
}

void bB()
{
  for(int i = 0; i<listeX.size(); i++)
  {
    listeX.add(i,2); 
  }
}
void bT()
{
 /* if(keyPressed == true)
  {
    if(key == CODED)
    {
      switch(keyCode)
      {
         case UP:
           tY-=3;
         break;
         case DOWN:
           tY+=3;
         break;
         case LEFT:
           tX-=3;
         break;
         case RIGHT:
           tX+=3;
         break;
      }
    }
  }
  */
}

void bP()
{
  for(int i =0; i<pioupiou.size();i++)
  {
    pioupiou.add(i,-10); 
  }
}

void col()
{
  for(int i =0; i < listeX.size(); i++)
  {
    for(int j =0; j < pioupiou.size(); j++)
    {
      // TEST SI BALLE isONCOLLISION W/ TRIANGLE
      if( dist(listeX.get(i),listeY.get(i),pioupiou.get(j),pY.get(j)) <= 15) //ERROR ?! WHY ? --> LIST OVERFLOWED ?
      {
        listeX.remove(i);
        listeY.remove(i);
        pioupiou.remove(j);
        pY.remove(j);
        ecx++; // SCORE++
      }
    }
  }
}

void disp()
{
  // BALLS
  for(int i = 0; i<listeX.size(); i++)
  {
    fill(int(random(255)),int(random(255)),int(random(255))); // EPILEPTIC COLOOORS
    ellipse(listeX.get(i),listeY.get(i),30,30);
  }
  // PLAYER
  noFill();
  stroke(255);
  strokeWeight(5);
  //triangle(tX,tY-20,tX+20,tY+20,tX-20,tY+20);
  triangle(tX-20,  tY,tX+20,  tY+20,  tX+20,  tY-20);
  
  // PIOUPIOU
  for(int i = 0; i<pioupiou.size();i++)
  {
    line(pioupiou.get(i),pY.get(i),pioupiou.get(i)-50,pY.get(i));
  }
  
  // SCORE
  noStroke();
  fill(255,255,255);
  textMode(CENTER);
  textSize(30);
  text((int)ecx,width/2,height/4);
}