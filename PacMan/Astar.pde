class Astar
{

  ArrayList<Node> OpenList;
  ArrayList<Node> CloseList;

  int[][] grid = new int[board.mazeWide][board.mazeHeigth];
  int[][] heuristic = new int[board.mazeWide][board.mazeHeigth];

  int StartX;
  int StartY;
  int TargetX;
  int TargetY;


  //Konstruktor
  Astar (int[][] _maze, int _StartX, int _StartY, int _TargetX, int _TargetY)
  {
    // save Start & Target parameters
    StartX = _StartX;
    StartY = _StartY;
    TargetX = _TargetX;
    TargetY = _TargetY;

    OpenList = new  ArrayList<Node>();
    CloseList = new  ArrayList<Node>();

    //save grid
    for (int i = 0; i < 22; i++)
      for (int j = 0; j < 22; j++)
      {  
        grid[i][j] = _maze[i][j];
      }

    getHeuristic();

    //add StartNode to openList
    Node startNode = new Node(StartX, StartY, 0, 0, -1 );
    OpenList.add(startNode);
    if(doAstar())
    {
      // Path bauen
      PathBack();
      
    }
    else
    {
      // Fehler ausgeben
      println("FEHLER!");
    }
  }

  void draw()
  {
  }

  boolean doAstar()
  {
    while (!TargetIsOnCloseList () && OpenList.size() > 0)
    {
      int lowestFCostIndex = LowestFCost();
      //a) Look for the lowest F cost square on the open list. We refer to this as the current square.
      Node currentNode = OpenList.get(lowestFCostIndex);

      //b) Switch it to the closed list.     
      CloseList.add(currentNode);      //! currentSquare Object?
      OpenList.remove(lowestFCostIndex);

      //c) Get adjacent squares to current square & add to OpenList.
      adjacentSquares(currentNode.getX(), currentNode.getY(), CloseList.size(), currentNode.getCost());
    }
    return TargetIsOnCloseList();
  }

  void PathBack()
  {
    
  }

  int LowestFCost()
  {
    int lowestF = 100000;
    int lowestNode = -1;

    for (int i = OpenList.size ()-1; i >= 0; i--) 
    {
      Node node = OpenList.get(i);
      if (node.getF() < lowestF)
      {
        lowestF = node.getF();
        lowestNode = i;
      }
    }

    return lowestNode;
  }


  void adjacentSquares(int _x, int _y, int parent, int currCost)      //! Ein Objekt übergeben?
  {
    //int _x = node.getX();
    //int _y = node.getY();

    //add left square
    if (grid[_x - 1][_y] == 0)    
    {
      int currNode = isOnOpenList(_x - 1, _y);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x-1, _y, currCost + 10, heuristic[_x-1][_y], parent));    
      else 
        BetterPath(currNode, _x-1, _y, currCost, heuristic[_x-1][_y]);
    }  

    //add right square
    if (grid[_x + 1][_y] == 0)
    {
      int currNode = isOnOpenList(_x + 1, _y);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x+1, _y, currCost + 10, heuristic[_x+1][_y], parent));
      else 
        BetterPath(currNode, _x+1, _y, currCost, heuristic[_x-1][_y]);
    }

    //add top square
    if (grid[_x][_y-1] == 0)
    {
      int currNode = isOnOpenList(_x, _y-1);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x, _y-1, currCost + 10, heuristic[_x][_y-1], parent));
      else 
        BetterPath(currNode, _x, _y-1, currCost, heuristic[_x-1][_y]);
    }

    //add bottom square
    if (grid[_x][_y+1] == 0)
    {
      int currNode = isOnOpenList(_x, _y+1);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x, _y+1, currCost + 10, heuristic[_x][_y+1], parent));
      else 
        BetterPath(currNode, _x, _y+1, currCost, heuristic[_x-1][_y]);
    }
  }

  // tries to find a better Path than before  
  void BetterPath(int currNode, int x, int y, int cost, int heuristic)
  {
    if (OpenList.get(currNode).getF() > (cost+heuristic))
    {
      OpenList.get(isOnOpenList(x, y)).set_Parent(currNode);
    }
  }


  int isOnOpenList(int x, int y)
  {
    for (int i = OpenList.size ()-1; i >= 0; i--)
    {
      if (OpenList.get(i).getX() == x) 
        if (OpenList.get(i).getY() == y) 
          return i;
    }
    return -1;
  }

  boolean TargetIsOnCloseList()
  {
    for (int i = CloseList.size ()-1; i >= 0; i--)
    {
      if (CloseList.get(i).getX() == TargetX) 
        if (CloseList.get(i).getY() == TargetY) 
          return true;
    }
    return false;
  }


  void getHeuristic()
  {
    int hX;
    int hY;
    int absHeuristic;

    for (int i = 0; i < 22; i++)
      for (int j = 0; j < 22; j++) 
      {
        //create heuristic with absolut value
        hX = abs(j - StartX);
        hY = abs(i - StartY);
        absHeuristic = hX + hY;

        //write in heuristic_grid
        heuristic[i][j] = absHeuristic;
      }
  }
}

