// represäntiert einen Spieler mit seinen Steinen
class Player 
{

  int _posX;
  int _posY;
    
  // constructor
  Player (int posX, int posY) 
  {
    _posX = posX;
    _posY = posY;
    
    
    
    
  }
  
  // Methode, um einen Zug durchzuführen
   void draw() 
   {
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
    
    stroke(0);
    fill(128, 255, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.8, stepY*0.8);
  }
  
  
}

