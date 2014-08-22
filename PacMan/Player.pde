class Player 
{
  Astar astar;

  int _posX;
  int _posY;

  int TargetX;
  int TargetY;

  int WaypointStart = 0;

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

    if (maze[TargetX][TargetY] == 0)
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
    } else
    {
      println("DO NOT try to enter walls!");
    }
  }

  void MoveAlongPath()
  {        
    if (!canMove) frameStart = frameCount;

    if (canMove && frameStart < frameCount)
    {      
      WaypointStart++;
      nextStep();
      currStep++;
      frameStart++; 
      // reset
      if (currStep >= max)
      {
        WaypointStart = 0;
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

  boolean PlayerOnTarget()
  {
    if (_posX == TargetX && _posY == TargetY)
      return true;
    else
      return false;
  }

  void draw() 
  {     
    if (astar != null) astar = null;
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;

    MoveAlongPath();

    stroke(0);
    // draw target
    if (TargetX != 0 && TargetY != 0 && !PlayerOnTarget())
    {
      fill(255, 0, 255);
      ellipse(TargetX*stepX + stepX/2, TargetY*stepY + stepY/2, stepX*0.3, stepY*0.3);

      // draw path
      fill(122);
      for (int i = WaypointStart; i < PathList.size () - 1; i++)
      {
        ellipse(PathList.get(i).getX()*stepX + stepX/2, PathList.get(i).getY()*stepY + stepY/2, stepX*0.1, stepY*0.1);
      }
    }



    // draw player
    fill(128, 255, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);
  }
}

