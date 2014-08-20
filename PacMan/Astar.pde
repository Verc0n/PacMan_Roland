static class Astar
{

  ArrayList<Nodes> OpenList;
  ArrayList<Nodes> CloseList;

  int[][] grid;
  int[][] cost;
  int[][] heuristic;
  int[][] F;
  
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

    //save grid & generate costs
    for(int i = 0; i < 22; i++)
      for(int j = 0; j < 22; j++)
      {  
        grid[i][j] = _maze[i][j];
        
        // getCost
        if(grid[i][j] == 0) cost[i][j] = 10;

      }
      
      getHeuristic();
      getF();
      
      //OpenList.add();
  }
  
  void draw()
  {
  
  
  
  
  
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

  void getF()
  {
    for(int i = 0; i < 22; i++)
      for(int j = 0; j < 22; j++) 
      {
        //combine cost + heuristic to get F in grid
        F[i][j] = cost[i][j] + heuristic[i][j];
      }
  
  }
  
  














}
