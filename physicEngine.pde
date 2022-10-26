float gravity = 0.9;
float speedY,speedX;
RectAngle r = new RectAngle(20,20,200,50);
//RectAngle r2 = new RectAngle(20,80,200,50);
RectAngle r3 = new RectAngle(360,20,200,50);
//RectAngle r4 = new RectAngle(360,80,200,50);

RectAngle[] rects = {r,r3};
float[][] collision = new float[rects.length][4];

void setup() {
  gravity();
  for (int i=0;i<1;i++) {
    rects[i].frictionY = 0.5;
  }
  
  size(600,600);
  surface.setTitle("Physics Engine");
  surface.setResizable(true);
  surface.setLocation(100, 100);
}


void draw() {
  background(127);
  for (int i=0;i<rects.length;i++) {
   rects[i].display(); 
  }
  update();
  frameRate(20);
}

void frictionX(int i) {
  if (rects[i].speedX > 0) {
    rects[i].speedX -= rects[i].frictionX; 
   } else {
    rects[i].speedX += rects[i].frictionX; 
   }  
}

void frictionY(int i) {
  if (rects[i].speedY > 0) {
    rects[i].speedY -= rects[i].frictionY; 
   } else {
    rects[i].speedY += rects[i].frictionY; 
   }  
}

void stopX(int i) {
  rects[i].frictionX=0;
  rects[i].speedX = 0; 
  rects[i].accerlationX = 0;
}

void stopY(int i) {
  rects[i].frictionY=0;
  rects[i].speedY = 0;
  rects[i].accerlationY=0;
}

void Xdimention(int i) {
   rects[i].speedX += rects[i].accerlationX;
   frictionX(i);
   rects[i].x += rects[i].speedX;
   speedX = rects[i].speedX; 
}

void Ydimention(int i) {
   rects[i].speedY += rects[i].accerlationY;
   frictionY(i);
   rects[i].y += rects[i].speedY;
   speedY = rects[i].speedY;  
}
void update() {
  
  for (int i=0;i<rects.length;i++) {
    
   Xdimention(i);
   Ydimention(i);

   collision[i][0] = rects[i].x;
   collision[i][1] = rects[i].y;
   collision[i][2] = rects[i].lenX;
   collision[i][3] = rects[i].lenY;
   edge();
  }
  
}

void edge() {
  for (int i=0;i<rects.length;i++) {
   if  (collision[i][0] < 0 || collision[i][0]+collision[i][2] > width) {
     if (abs(rects[i].speedX) < abs(rects[i].frictionX)) {
       stopX(i);
     }
     rects[i].speedX = -speedX;
   }
   if (collision[i][1] < 0 || collision[i][1]+collision[i][3] > height) {
     if (abs(rects[i].speedY) < abs(rects[i].frictionY)) {
       stopY(i);
     }
     rects[i].speedY = -speedY; 
   }
  }
}  

void gravity() {
 for (int i=0;i<rects.length;i++){
  rects[i].accerlationY += gravity; 
 }
}
