class Nodes
{
  int posX;
  int posY;
  int index;
  
  Nodes(int x, int y, int _index)
  {
    posX = x;  
    posY = y;
    index = _index;  
  }

  int getX()
  {
    return posX;
  }

  int getY()
  {
    return posY;
  }
  
  int getIndex()
  {
    return index;
  }

}
