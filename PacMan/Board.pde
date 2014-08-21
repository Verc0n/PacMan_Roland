class Board 
{
  int _sizeX;
  int _sizeY;
  int placeCounter = 0;
  
  int playerPosX;
  int playerPosY;
  
  int mazeWide = 22;
  int mazeHeigth = 22;
    
  Collectibles[][] collectible;
  Player player;
  
  int[][] maze = new int[mazeWide][mazeHeigth];

  //----INITIALIZE-----
  // Konstrukor, legt ein neues Spielfeld der Größe sizeX * sizeY an.
  Board(int sizeX, int sizeY) 
  {
    _sizeX = sizeX;
    _sizeY = sizeY;
     collectible = new Collectibles[sizeX][sizeY];
     player = new Player(1,1);
     
     InitMaze();
  }
  
 void keyPressed()
 {
   player.keyPressed(maze); 
 }
 
 void mousePressed()
 {
   player.mousePressed(maze);
 }
 

  //----UPDATE-----
  //Draw Board
  void draw() 
  {
    int stepX = width / _sizeX;
    int stepY = height / _sizeY;
    
    //Get PlayerPosition
    playerPosX = player.getPosX();
    playerPosY = player.getPosY();
    
    
    //Draw Walls
    for (int x = 0; x < _sizeX; x++) 
    {
      for (int y = 0; y < _sizeY; y++) 
      {
        noStroke();        
        if (maze[x][y] == 1) fill(0);
        else 
        {
          fill(255);
          //Draw Collectibles
          if (collectible[x][y] != null)  collectible[x][y].draw();
        }
        rect(x*stepX, y*stepY, stepX, stepY);
      }
      
      //Draw Player
      
      player.draw();   
    } 
  }

  //----FUNKTIONEN-----

  void InitMaze()
  {
     //Create Wall around game
     for (int i = 0; i < _sizeX; i++) 
      for (int j = 0; j < _sizeY; j++) 
      {
        if (i == 0 || i == _sizeX - 1)      
          maze[i][j] = 1;
        else if (j == 0 || j == _sizeY - 1)
          maze[i][j] = 1;       
     
          //Set Bausteine
          if (isBaustein(i,j,_sizeX,_sizeY))CreateMaze(i,j,placeCounter);
          
         
      }    
  }
   
  //Testet ob es sich um einen Baustein-Startplatz handelt
  boolean isBaustein(int i, int j, int _sizeX, int _sizeY)
  {
    if ((i-1)%5 == 0 && i < _sizeX - 5 && (j-1)%5 == 0 && j < _sizeY- 5)
         return true;
    else return false;
  }  
  
  void CreateMaze(int i, int j,int place)
  {
    if (place % 2 == 0)
      Baustein_A1(i,j);
    else 
      Baustein_B1(i,j);
      
      placeCounter++;
  }
  
  
  //---BAUSTEINE
  void Baustein_A1(int iStart, int jStart)
  {
    for (int i = 0; i < 5; i++) 
      for (int j = 0; j < 5; j++) 
      {
        if (i >= 1 && i <= 3 && j >= 1 && j <= 3)      
          maze[iStart + i][jStart + j] = 1;
      }
  }

  void Baustein_B1(int iStart, int jStart)
  {
    for (int i = 0; i < 5; i++) 
      for (int j = 0; j < 5; j++) 
      {
        if (i >= 1 && i <= 3 && j >= 0 && j <= 4)      
          maze[iStart + i][jStart + j] = 1;
      }
  
  
  }





}

  
  
  






