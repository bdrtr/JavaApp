class RectAngle extends physic {
  
  public float x,y,lenX,lenY;
  public float leftTop,leftBot,rightTop,rightBot;
  RectAngle(int x, int y, float lenX, float lenY) {
    this.x = x;
    this.y = y;
    this.lenX = lenX;
    this.lenY = lenY;
  }
  
  float[] topLeft() {
    float[] values = {x,y};
    return values;
  }
  
  float[] topRight() {
    float[] values = {(float)x+lenX,y};
    return values;
  }  
  
  float[] botLeft() {
    float[] values = {x,y+lenY};
    return values;
  }
  
  float[] botRight() {
    float[] values = {x+lenX,y+lenY};
    return values;
  }  
 
  void display() {
    rect(x,y,lenX,lenY);
    fill(255,100,0,100);
  }
}  
