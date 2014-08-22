class Player 
{
   Astar astar;
  
  int _posX;
  int _posY;
  
  int TargetX;
  int TargetY;
  
  boolean canMove = false;
  
  int currStep = 0;
  int max = 0;    
  int frameStart = frameCount;
  
  ArrayList<Vector2> PathList;
    
  // constructor
  Player (int posX, int posY) 
  {
    _posX = posX;
    _posY = posY;
    
     PathList = new  ArrayList<Vector2>();
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
     if (astar != null) astar = null;
     
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
     
     
     
     TargetX = mouseX / stepX;
     TargetY = mouseY / stepX; 
      
     if(maze[TargetX][TargetY] == 0)
     {
       Astar astar = new Astar(maze, _posX, _posY, TargetX, TargetY);
       PathList.clear();
     
       for (int i = astar.PathList.size ()-1; i >= 0; i--) 
       {
         PathList.add(astar.PathList.get(i));
       }
     
       println("Pathlist: " + PathList.size ());
     
       max = PathList.size();
       canMove = true; 
     }
     else
     {
       println("DO NOT try to enter walls!");
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
   
  void MoveAlongPath()
  {        
    if (!canMove) frameStart = frameCount;
    
    if (canMove && frameStart < frameCount)
    {      
      nextStep();
      currStep++;
      frameStart++;
      if (currStep >= max)
      {
        currStep = 0;
        canMove = false;
      }
    }
  }
  
    void nextStep()
  {
    _posX = PathList.get(currStep).getX();
    _posY = PathList.get(currStep).getY();
  
  }
   
   void draw() 
   {     
     if (astar != null) astar = null;
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;

    MoveAlongPath();
    
    stroke(0);
    // draw target
    if (TargetX != 0 && TargetY != 0)
    {
      fill(255, 0, 255);
      ellipse(TargetX*stepX + stepX/2, TargetY*stepY + stepY/2, stepX*0.3, stepY*0.3);
    }
    // draw player
    fill(128, 255, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);
    

  }  

}

