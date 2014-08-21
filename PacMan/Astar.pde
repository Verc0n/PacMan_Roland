class Astar
{

  ArrayList<Node> OpenList;
  ArrayList<Node> CloseList;

  int[][] grid;
  int[][] heuristic;
  //int[][] F;
  
  int StartX;
  int StartY;
  int TargetX;
  int TargetY;
  
  int currentSquare;
   
  
  
  //Konstruktor
  Astar (int[][] _maze, int _StartX, int _StartY, int _TargetX, int _TargetY)
  {
      // save Start & Target parameters
      StartX = _StartX;
      StartY = _StartY;
      TargetX = _TargetX;
      TargetY = _TargetY;

    //save grid
    for(int i = 0; i < 22; i++)
      for(int j = 0; j < 22; j++)
      {  
        grid[i][j] = _maze[i][j];

      }
      
      getHeuristic();
      
      //add StartNode to openList
      OpenList.add(new Node(StartX, StartY, 0, 0, 0 ));    

  }
  
  void draw()
  {
   
  
  }

  void doAstar()
  {
    if (!TargetIsOnClosedList && OpenList.size() == 0)
    {
    //a) Look for the lowest F cost square on the open list. We refer to this as the current square.
    Node currentNode = OpenList.get(LowestFCost());
   
    //b) Switch it to the closed list.     
    CloseList.add(currentNode);      //! currentSquare Object?
    OpenList.remove(LowestFCost());
    
    //c) Get adjacent squares to current square & add to OpenList.
    adjacentSquares(currentNode.getX(), currentNode.getY(), CloseList.size(), currentNode.getCost()); 
       
    }
  }
  
  int LowestFCost()
  {
    int lowestF = 100000;
    int lowestNode = -1;
    
    for (int i = OpenList.size()-1; i >= 0; i--) 
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
        BetterPath(currNode);
    }  
           
    //add right square
    if (grid[_x + 1][_y] == 0)
    {
      int currNode = isOnOpenList(_x + 1, _y);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x+1, _y, currCost + 10, heuristic[_x+1][_y], parent));
      else 
        BetterPath(currNode);
    }
    
    //add top square
    if (grid[_x][_y-1] == 0)
    {
      int currNode = isOnOpenList(_x, _y-1);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x, _y-1, currCost + 10, heuristic[_x][_y-1], parent));
      else 
        BetterPath(currNode);
    }
    
    //add bottom square
    if (grid[_x][_y+1] == 0)
    {
      int currNode = isOnOpenList(_x, _y+1);         //!Überprüfen ob bereits eine Node besteht
      if (currNode == -1)
        OpenList.add(new Node(_x, _y+1, currCost + 10, heuristic[_x][_y+1], parent));
      else 
        BetterPath(currNode);      
    }
  }
  
    
  void BetterPath(int currNode)
  {
    currNode = 0;
  }
  
  
  int isOnOpenList(int x, int y)
  {
    for (int i = OpenList.size()-1; i >= 0; i--)
    {
      if (OpenList.get(i).getX() == x) 
        if (OpenList.get(i).getY() == y) 
          return i;      
    }
    return -1;
  }
  
  boolean TargetIsOnClosedList
  {
    for (int i = ClosedList.size()-1; i >= 0; i--)
    {
      if (ClosedList.get(i).getX() == TargetX) 
        if (ClosedList.get(i).getY() == TargetY) 
          return true;      
    }
    return false;
  }
  

  void getHeuristic()
  {
    int hX;
    int hY;
    int absHeuristic;
    
    for(int i = 0; i < 22; i++)
      for(int j = 0; j < 22; j++) 
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
