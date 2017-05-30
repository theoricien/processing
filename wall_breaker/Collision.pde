// COLLISION METHODS

 // METHODS
  int isCollisionCircleBloc(
      int c_X, 
      int c_Y, 
      int rayon,
      int rectangleX,
      int rectangleY,
      int rectangleWidth,
      int rectangleHeight)
  {
    int circleDistanceX = abs(c_X - rectangleX - rectangleWidth/2); // RX - RW car ton point est en haut à gauche
    int circleDistanceY = abs(c_Y - rectangleY - rectangleHeight/2); // RY - RW car ton point est en haut à gauche

    //int circleDistanceY = abs(c_Y - rectangleY - rectangleHeight/2);
   
    if(circleDistanceX <= rayon + rectangleWidth/2 && circleDistanceY <= rayon + rectangleHeight/2)
    {
      //on change le Y
      if(c_Y >= rectangleY && c_Y <= rectangleY + rectangleHeight)
      {
        return 1; 
      }
      // on change le X
      else
      {
        return 2; 
      }
    }
    return 0;
  }
  
  boolean isCollisionPowerRaquette(
      int x1, 
      int y1, 
      int rectangleX,
      int rectangleY)
  {
     int distance = rectangleY - y1;
     
     if(distance < 0 && x1 >= rectangleX && x1 <= rectangleX + 75)
     {
       return true; 
     }
    
     return false;   
  }
