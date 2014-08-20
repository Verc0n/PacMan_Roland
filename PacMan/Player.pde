// representiert einen Spieler mit seinen Steinen
class Player 
{

  int _posX;
  int _posY;
  
  int TargetX;
  int TargetY;
    
  // constructor
  Player (int posX, int posY) 
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
  
  
  //MOVEMENT
   void mousePressed(int[][] maze)
   {
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
     
     
     
     TargetX = mouseX / stepX;
     TargetY = mouseY / stepX; 
      
     if(maze[TargetX][TargetY] == 0)
     {
     _posX = TargetX;
     _posY = TargetY;   
     }
   }
  
  /*
  void drawTargetMarker(int x, int y)
  {
    ellipse(x, y, width / board._sizeX, height / board._sizeY )
  }*/
  
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
  
  void keyPressed(int[][] maze)
  {
    if (key == CODED) 
    {
    if (keyCode == DOWN) 
      MoveDown(_posX, _posY, maze);
    
    if (keyCode == UP) 
      MoveUp(_posX, _posY, maze);
    
    if (keyCode == LEFT) 
      MoveLeft(_posX, _posY, maze);
    
    if (keyCode == RIGHT) 
      MoveRight(_posX, _posY, maze);
    }   
  }
   
   void draw() 
   {     
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
    
    stroke(0);
    fill(128, 255, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);
  }  

}

