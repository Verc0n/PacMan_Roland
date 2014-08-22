// Klasse, die einen Spielstein repräsentiert
class Collectibles 
{
  int _posX;
  int _posY;
  
  
  //----INITIALIZE-----
  Collectibles(int posX, int posY) 
  {
    _posX = posX;
    _posY = posY;
  }
      
  void removeStone() {
    _posX = -1;
    _posY = -1;
  }
  
  int getPosX() {
    return _posX;
  }

  int getPosY() {
    return _posY;
  }

  void draw() 
  {
    int stepX = width / board._sizeX;
    int stepY = height / board._sizeY;
    
    stroke(128, 255, 255);
    fill(128, 255, 255);
    ellipse(_posX*stepX + stepX/2, _posY*stepY + stepY/2, stepX*0.5, stepY*0.5);
  }

}  
