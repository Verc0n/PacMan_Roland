class Enemy 
{
   Astar astar;
  
  public int _posX;
  public int _posY;
  
  int TargetX;
  int TargetY;
    
  // constructor
  public Enemy (int posX, int posY) 
  {
    _posX = posX;
    _posY = posY;
  }
        
  int getPosX() {
    return _posX;
  }

  int getPosY() {
    return _posY;
  }
  
    
  void MoveUp(int posX, int posY, int[][] maze)
  {
    if(maze[posX][posY-1] == 0)
      _posY--; 
  }
  
  void MoveDown(int posX, int posY, int[][] maze)
  {
    if(maze[posX][posY+1] == 0)
      _posY++; 
  }
  
  void MoveLeft(int posX, int posY, int[][] maze)
  {
    if(maze[posX-1][posY] == 0)
      _posX--; 
  }
  
  void MoveRight(int posX, int posY, int[][] maze)
  {
    if(maze[posX+1][posY] == 0)
      _posX++; 
  }
  

   
   void draw() 
   {     
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
    
    stroke(0);
    fill(128, 128, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);
  }  

}

