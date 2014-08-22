class Enemy 
{
   Astar astar;
  
  public int _posX;
  public int _posY;
  
  int TargetX;
  int TargetY;
  
  int frameStart = 0;
    
  // constructor
  public Enemy (int posX, int posY) 
  {
    _posX = posX;
    _posY = posY;
    
  }
        
  int getPosX() 
  {
    return _posX;
  }

  int getPosY() 
  {
    return _posY;
  }
  
   boolean UpFree()
  {
    if (board.maze[_posX][_posY-1] == 1)  return false;
    else return true;
  }
  
  boolean DownFree()
  {
    if (board.maze[_posX][_posY+1] == 1)  return false;
    else return true;
  }
  
  boolean RightFree()
  {
    if (board.maze[_posX+1][_posY] == 1)  return false;
    else return true;
  }
  
  boolean LeftFree()
  {
    if (board.maze[_posX-1][_posY] == 1)  return false;
    else return true;
  }
  
  void MoveUp()
  {
    if(board.maze[_posX][_posY-1] == 0)
      _posY--; 
  }
  
  void MoveDown()
  {
    if(board.maze[_posX][_posY+1] == 0)
      _posY++; 
  }
  
  void MoveLeft()
  {
    if(board.maze[_posX-1][_posY] == 0)
      _posX--; 
  }
  
  void MoveRight()
  {
    if(board.maze[_posX+1][_posY] == 0)
      _posX++; 
  } 

   
   void draw(int r, int g, int b) 
   {  
      
      int stepX = width / board._sizeX;
      int stepY = height / board._sizeY;
    
      stroke(0);
      fill(r, g, b);
     
      ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);

  }  

}

