class RectAngle extends physic {
  
  public float x,y,lenX,lenY;
  float leftTop,leftBot,rightTop,rightBot;
  RectAngle(int x, int y, float lenX, float lenY) {
    this.x = x;
    this.y = y;
    this.lenX = lenX;
    this.lenY = lenY;
  }
  
  float[] getPositions() {
    leftTop = x;
    leftBot = x+lenX;
    rightTop = y;
    rightBot = y+lenY;
    float array[] = {leftTop,leftBot,rightTop,rightBot};
    
    return array;
  }

 
  void display() {
    rect(x,y,lenX,lenY);
    fill(255,100,0,100);
  }
}
