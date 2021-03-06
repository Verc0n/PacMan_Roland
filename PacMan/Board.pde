class Board 
{
  int _sizeX;
  int _sizeY;
  int placeCounter = 0;
  
  int playerPosX;
  int playerPosY;
  
  int mazeWide = 22;
  int mazeHeigth = 22;
  
  int PlayerX;
  int PlayerY;
    
  boolean isLost = false;
    
  Collectibles collectible;
  Player player;
  Enemy_Follow enemy1;
  Enemy_Random enemy2;
  
  int[][] maze = new int[mazeWide][mazeHeigth];

  //----INITIALIZE-----
  // Konstrukor, legt ein neues Spielfeld der Größe sizeX * sizeY an.
  Board(int sizeX, int sizeY) 
  {
     _sizeX = sizeX;
     _sizeY = sizeY;
     collectible = new Collectibles(1,1);
     player = new Player(1,1);
     enemy1 = new Enemy_Follow(20,1);
     enemy2 = new Enemy_Random(1,12);  
     
     InitMaze();
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
    
    //BEISPIEL: Bewegung eines Enemies: enemy1.MoveDown(enemy1.getPosX(), enemy1.getPosY(), maze);
        
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
        }
        rect(x*stepX, y*stepY, stepX, stepY);
      }
      
      Collision();
      
      PlayerX = player.getPosX();
      PlayerY = player.getPosY();
      
            
      //Draw Player      
      player.draw();   
      enemy1.draw();
      enemy2.draw();
      collectible.draw();
    } 
  }

  //----FUNKTIONEN-----

  void InitMaze()
  {
     //Create Bausteine
     for (int i = 0; i < _sizeX; i++) 
      for (int j = 0; j < _sizeY; j++) 
      {  
          //Set Bausteine
          if (isBaustein(i,j,_sizeX,_sizeY)) CreateMaze(i,j,placeCounter);
      }  
    
      //Create Space
      for (int i = 0; i < _sizeX; i++) 
      for (int j = 0; j < _sizeY; j++) 
      {
        if (i == 1 || i == _sizeX - 2)      
          maze[i][j] = 0;
        else if (j == 1 || j == _sizeY - 2)
          maze[i][j] = 0;      
      }  
      
     //Create Wall around game
     for (int i = 0; i < _sizeX; i++) 
      for (int j = 0; j < _sizeY; j++) 
      {
        if (i == 0 || i == _sizeX - 1)      
          maze[i][j] = 1;
        else if (j == 0 || j == _sizeY - 1)
          maze[i][j] = 1;       
      }
  }
   
  int getPlayerX()
  {
    return PlayerX;
  }
   
  int getPlayerY()
  {
    return PlayerY;
  }
  
  void Collision()
  {
    // Damjan
    if (player._posX == enemy1.getPosX() && player._posY== enemy1.getPosY()
      ||player._posX == enemy2.getPosX() && player._posY== enemy2.getPosY())
      {  
        println("COLLISION! You Lose!");
        println("Please restart the game!");
        isLost = true;        
      }
      while (isLost) 
      {
      
      }
  }
   
  //Testet ob es sich um einen Baustein-Startplatz handelt
  boolean isBaustein(int i, int j, int _sizeX, int _sizeY)
  {
    if ((i-1)%5 == 0 && i < _sizeX - 5 && (j-1)%5 == 0 && j < _sizeY- 5)
         return true;
    else return false;
  }  
    
  // Ann-Kathrin  
  void CreateMaze(int i, int j,int place)
  {      
    
      if (place == 0 || place == 5 || place == 10 || place == 3)
      {
        Baustein_A1(i,j);      
      }
      else if (place == 15 || place == 12)
      {
        Baustein_A2(i,j); 
      }
      else
      {
        Baustein_B1(i,j);
      }
      
      placeCounter++;
  }
  
  
  //---BAUSTEINE
  void Baustein_A1(int iStart, int jStart)
  {
    for (int i = 0; i < 5; i++) 
      for (int j = 0; j < 5; j++) 
      {
        if (i >= 1 && j >= 1 && j <= 3)      
          maze[iStart + i][jStart + j] = 1;
      }
  }

  void Baustein_A2(int iStart, int jStart)
  {
    for (int i = 0; i < 5; i++) 
      for (int j = 0; j < 5; j++) 
      {
        if (i >= 0 && i <= 3 && j >= 1 && j <= 3)      
          maze[iStart + i][jStart + j] = 1;
      }
  }

  void Baustein_B1(int iStart, int jStart)
  {
    for (int i = 0; i < 5; i++) 
      for (int j = 0; j < 5; j++) 
      {
        if (i >= 1 && i <= 4 && j >= 0 && j <= 4)      
          maze[iStart + i][jStart + j] = 1;
      } 
  }
    
}

