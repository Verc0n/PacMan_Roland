class Node
{
  int posX;
  int posY;

  int cost;
  int heuristic;
  
  int parent;
  
  int F;
  
  Node(int x, int y, int _cost, int _heuristic, int _parent)
  {
    posX = x;  
    posY = y;
    cost = _cost;
    heuristic = _heuristic;
    parent = _parent;
  }

  int getX()
  {
    return posX;
  }

  int getY()
  {
    return posY;
  }
  
  int getCost()
  {
    return cost;
  }

  int getF()
  {
    return cost + heuristic;  
  }

  int get_Parent()
  {
    return parent;  
  }

  void set_Parent(int index)
  {
    parent = index;
  }
}
