Board board;


// initialisiert das Spiel, wird einmal am Anfang aufgerufen
void setup() 
{
  size(640, 640);
  frameRate(3);
  
  int boardsizeX = 22;
  int boardsizeY = 22;
  
  board = new Board(boardsizeX, boardsizeY); 
}
 
 
// wird regelmäßig aufgerufen und aktualisiert den Spielstand 
void draw() 
{
  background(0);
  
  board.draw();
    
}
 




