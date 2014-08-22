// Ann-Kathrin
class Enemy_Follow extends Enemy
{
  int TargetX;
  int TargetY;

  Enemy_Follow(int posX, int posY)
  {
    super(posX, posY);
  }

  void FollowPlayer()
  {
    if (astar != null) astar = null;

    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;

    TargetX = board.getPlayerX(); // stepX;
    TargetY = board.getPlayerY(); // stepY; 

    println("TX " + TargetX);
    println("TY " + TargetY);

    Astar astar = new Astar(board.maze, _posX, _posY, TargetX, TargetY);

    _posX = astar.PathList.get(astar.PathList.size()-2).getX();
    _posY = astar.PathList.get(astar.PathList.size()-2).getY();
  }

  void draw()
  {
    if (frameCount - frameStart >= 2)
    {
      frameStart = frameStart + 2;     
      FollowPlayer();
    }

    super.draw(255, 0, 0);
  }
}

