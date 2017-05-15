// MANAGE OF DIFFERENTS POWER
int MAX_SPEED_BALL = 10;
int MAX_SPEED_RAQUETTE = 10;

void applyPower(int k)
{
   switch(power[k].Get_Rand())
   {
     case 1:
       if(ball.Get_Speed() < MAX_SPEED_BALL) 
       {
         ball.speedPower();
       }
       else
       {
         powerDefault(); 
       }
     break;
     case 2:
       if(raquette.Get_Speed() < MAX_SPEED_RAQUETTE)
       {
         raquette.speedPower();
       }
       else
       {
         powerDefault();
       }
     break;
     case 3:
     break;
     default:
     break;
   }
}




void powerDefault()
{
  applyPower(k);
}