float gravity = 0.9;
RectAngle r = new RectAngle(20,20,200,50);
RectAngle r2 = new RectAngle(20,80,200,50);

//RectAngle objs = {r,r2};

class physic {
  public float speedX;
  public float speedY;
  public float accerlationX;
  public float accerlationY;
  public float frictionX;
  public float frictionY;
  public float distanceX;
  public float distanceY;
  
  float getSpeedX() {
    return speedX;
  }
  float getSpeedY() {
    return speedY;
  }
  float getAccerlationX() {
    return accerlationX;
  }
  float getAccerlationY() {
    return accerlationY;
  }
  float getFrictionX() {
    return frictionX;
  }
  float getFrictionY() {
    return frictionY;
  }
  float getDistanceX() {
    return distanceX;
  }
  float getDistanceY() {
    return distanceY;
  }
  
  void getSpeedX(float speedX) {
    this.speedX = speedX;
  }
  void getSpeedY(float speedY) {
    this.speedY = speedY;
  }
  void setAccerlationX(float accerlationX) {
    this.accerlationX = accerlationX;
  }
  void setAccerlationY(float accerlationY) {
    this.accerlationY = accerlationY;
  }
  void setFrictionX(float frictionX) {
    this.frictionX = frictionX;
  }
  void setFrictionY(float frictionY){
    this.frictionY = frictionY;
  }
  void setDistanceX(float distanceX) {
    this.distanceX = distanceX;
  }
  void setDistanceY(float distanceY) {
    this.distanceY = distanceY;
  }
  
}
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

  void update() {
    speedX += accerlationX;
    speedY += accerlationY;
    x += speedX;
    y += speedY;
    
    if (y+lenY > 600) {
      y = 600-lenY;
      speedY = 0;
    }
  }
  
  void display() {
    rect(x,y,lenX,lenY);
    fill(255,100,0,100);
  }
}



void setup() {
  r.setAccerlationY(gravity);
  r2.setAccerlationY(gravity);
  size(600,600);
  surface.setTitle("Hello World!");
  surface.setResizable(true);
  surface.setLocation(100, 100);
  //RectAngle r = new RectAngle(20,20,15,25);
  r.display();
  float array[] = r.getPositions();
  println("x "+array[0]+" x "+array[1]+" y "+array[2]+" y "+array[3]);
  r2.display();  
}

/*
void mouseDragged() {
  float array[] = r.getPositions();
  println("solüst: "+array[0]+ " solalt: "+array[1]+
  " sagüst: "+array[2]+" sagalt: "+array[3]);
  println("mouseX: "+mouseX+" mouseY: "+mouseY);
  if (mouseX >= r.x & mouseX <= r.x+r.lenX & mouseY <= r.lenY+r.y & mouseY >= r.y) {
    r.x = mouseX;
    r.y = mouseY;
  }
  //r.display();
}
*/

void draw() {
  background(127);
  r.display();
  r2.display();
  r.update();
  r2.update();
  frameRate(10);
}
