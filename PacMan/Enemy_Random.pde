// Damjan 
class Enemy_Random extends Enemy
{
  // CurrentDirection: 1 = Up, 2 = Down, 3 = Left, 4 = Right
  int CurrentDirection = 2;

  Enemy_Random(int posX, int posY)
  {
    super(posX, posY);
  }

  void RandomRunning()
  {
    switch(CurrentDirection)
    {
    case 1:
      MoveUp();
      if (RightFree() || LeftFree())
      {
        int rnd= int(random(3));
        if (rnd==0) CurrentDirection =3;
        else if (rnd==1) CurrentDirection =4;
      }   

      break;
    case 2:
      MoveDown();
      if (RightFree() || LeftFree())
      {
        int rnd= int(random(3));
        if (rnd==0) CurrentDirection =3;
        else if (rnd==1)CurrentDirection =4;
      }   

      break;
    case 3:
      MoveLeft();
      if (UpFree() || DownFree())
      {
        int rnd= int(random(3));
        if (rnd==0) CurrentDirection =1;
        else if (rnd==1)CurrentDirection =2;
      }   

      break;
    case 4:
      MoveRight();
      if (UpFree() || DownFree())
      {
        int rnd= int(random(3));
        if (rnd==0) CurrentDirection =1;
        else if (rnd==1)CurrentDirection =2;
      }   
      break;
    }
    
        if(!RightFree() && !LeftFree() && !DownFree()) 
    {
      CurrentDirection = 1;
    }
  }

  void draw()
  {

    if (frameCount - frameStart >= 1)
    { 
      frameStart++;     
      RandomRunning();
    }

    super.draw(128, 255, 128);
  }
}

