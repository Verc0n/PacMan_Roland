class Enemy_Random extends Enemy
{
  int last_rnd;
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
        if (RightFree() || LeftFree())
        {
          CurrentDirection = int(random(1,5));
          if (CurrentDirection == 2) CurrentDirection = 1;
        }
        break;
    
      case 2:
        if (RightFree() || LeftFree())
        {
          CurrentDirection = int(random(1,5));
          if (CurrentDirection == 1) CurrentDirection = 2;
        }
        break;

      case 3:
        if (UpFree() || DownFree())
        {
          CurrentDirection = int(random(1,5));
          if (CurrentDirection == 4) CurrentDirection = 3;
        }
        break;
    
      case 4:
        if (UpFree() || DownFree())
        {
          CurrentDirection = int(random(1,5));
          if (CurrentDirection == 3) CurrentDirection = 4;
        }
        break;
    }
    
    if(!RightFree() && !LeftFree() && !DownFree()) 
    {
      CurrentDirection = 1;
    }
    
    if (UpFree() && CurrentDirection == 1)
    {
      MoveUp();
    }
    
    else if (DownFree() && CurrentDirection == 2) 
    {
      MoveDown();
    }
    
    else if (RightFree() && CurrentDirection == 3) 
    {
      MoveRight();
    }
    
    else if (LeftFree() && CurrentDirection == 4) 
    {
      MoveLeft();
    }

    
  }


  void draw()
  {
    
    if (frameCount - frameStart >= 1)
    { 
      frameStart++;     
      RandomRunning();
    }
    
    super.draw(128,255,128);
  
  }

}
