import ddf.minim.*;

int i;
int deplacementX = 10;
int deplacementY = 7;
int deplacementPlaque = (mouseY);
int xpos = 400;
int ypos = 400;
int score = 0;
int minute;
int seconde;

PImage meGusta;
AudioPlayer musique;
Minim minim;

void setup() {
    
  frameRate(60);
  size(800,800);
  background(0);
  smooth();
  meGusta = loadImage("meGusta.png");
  minim = new Minim(this);
  musique = minim.loadFile("musique.mp3", 2048);
  musique.play();
    
}

void draw() {
 
  nettoyer();
  plaque();
  balle();
  deplacement();
  rebond();
  temps();
  score();
  
}

void plaque() {
 
  fill(255,255,255);
  rect(40,deplacementPlaque,15,100);
  
}

void balle() {
  
  image(meGusta, xpos, ypos, 60, 60);
  
}

void deplacement() {
  
    if (second() - seconde >= 1) {
      
      if(deplacementX >= 0) {
        deplacementX += 1;
      } else {
        deplacementX -= 1;
      }
      seconde = second();
      
    }
    

  
  xpos += deplacementX;
  ypos += deplacementY;
  
  deplacementPlaque = (mouseY);
  
}

void rebond() {
  
  if (xpos <= 55 && xpos >= 0 && ypos >= deplacementPlaque - 50 && ypos <= deplacementPlaque + 100) {
    deplacementX = int(random(0,2)) + abs(deplacementX);
  }
 
  if (xpos >= 770) {
    deplacementX = -deplacementX;
    score++;
  }
  
  if (ypos <= 0 || ypos >= 770) {
    deplacementY = -deplacementY;
  }
  
  if (xpos <= 0) {
    xpos = 400;
    ypos = 400;
    deplacementX = 5;
    deplacementY = int(random(1,3));
    score = 0;
    
    switch(deplacementY) {
      case 1:
      deplacementY = 3;
      break;
      case 2:
      deplacementY = -3;
      break;
    }
    
  }
  
}

void temps() {

  minute = minute();
  seconde = second();
  
  textSize(40);
  text(hour() + "h " + minute() + ":" + second(), 0, 40);
  
}

void score() {
 
  textSize(50);
  text(str(score),400,200);
  
}

void nettoyer() {
  clear();
  background(0);
}

void keyPressed() {
 
  switch(key) {
   
    case 's':
      if (deplacementY <= 0) {
        deplacementY = -3;
      } else {
        deplacementY = 3;
      }
      if (deplacementX <= 0) {
        deplacementX = -5;
      } else {
        deplacementX = 5;
      }
    break;
    
    case 'f':
      if (deplacementY <= 0) {
        deplacementY = -7;
      } else {
        deplacementY = 7;
      }
      if (deplacementX <= 0) {
        deplacementX = -10;
      } else {
        deplacementX = 10;
      }
    break;
    
  }
  
}

void stop()
{
  musique.close();
  minim.stop();
  super.stop();
}