float rectX = 0f;
float circleY = 0f;

float rectLength = 200;
float centerRectLength = 360;
float edge = 900;

float direction=1;
void setup() {
  size(1200,1200);
  rectMode(CENTER); // 設定矩形的繪製模式為中心
}

void draw() {
  background(0);
  translate(150,150);
   fill(255);
   noStroke();

  strokeWeight(20);
  /*
  // 畫上方和下方的矩形
  rect(-rectLength / 2+edge-rectX, rectLength / 2, rectLength, rectLength);
  rect(rectLength / 2 + circleY, edge - rectLength / 2, rectLength, rectLength);
  circle(edge - rectLength / 2, -rectLength / 2+edge-circleY, rectLength);
  circle(rectLength / 2, rectX + rectLength / 2, rectLength);
  */
  // 計算正確的線條端點
  /*
   float x1 = -rectLength / 2+edge-offset(-PI/4);
  float y1 = rectLength / 2;
  float x2 = rectLength / 2 + offset(-PI/4);
  float y2 = edge - rectLength / 2;

  float x3 = edge - rectLength / 2;
  float y3 = -rectLength / 2+edge-offset(-PI/2+PI/8);
  float x4 = rectLength / 2;
  float y4 = offset(-PI/2+PI/8) + rectLength / 2;
  */
  float x1 ,y1,x2,y2,x3,y3,x4,y4;
  
  if(direction>0){
    x1 = -rectLength / 2+edge-offset(0);
    y1 = rectLength / 2;
    x2 = rectLength / 2 + offset(PI/2);
    y2 = edge - rectLength / 2;

    x3 = edge - rectLength / 2;
    y3 = -rectLength / 2+edge-offset(PI/2);
    x4 = rectLength / 2;
    y4 = rectLength / 2+offset(0);
  }else{
    
     x1 = -rectLength / 2+edge;
     y1 = rectLength / 2+offset(0);
     x2 = rectLength / 2 ;
     y2 = edge - rectLength / 2- offset(0);

    x3 = edge - rectLength / 2-offset(0);
    y3 = -rectLength / 2+edge;
    x4 = rectLength / 2+offset(0);
    y4 = rectLength / 2;
  }
  
   // 畫上方和下方的矩形
  rect( x1,y1, rectLength, rectLength);
  rect(x2,y2, rectLength, rectLength);
  circle(x3,y3, rectLength);
  circle(x4,y4, rectLength);
   stroke(255);
   strokeWeight(2);
  // 畫線
  line(x1, y1, x2, y2);
  line(x3, y3, x4, y4);

  // 計算兩條線的交點
  float denom = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
  float interX = 0;
  float interY = 0;
  if (denom != 0) {
    interX = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / denom;
    interY = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / denom;
    
    // 在交點處畫一個小矩形
    noStroke();
    //rect(interX, interY, centerRectLength, centerRectLength); // 以交點為中心
    
  }
  /*
  float centerX1 = interX+centerRectLength/2;
  float centerY1 = interY-centerRectLength/2;
  float centerX2 = interX+centerRectLength/2;
  float centerY2 = interY+centerRectLength/2;
  float centerX3 = interX-centerRectLength/2;
  float centerY3 = interY+centerRectLength/2;
  float centerX4 = interX-centerRectLength/2;
  float centerY4 = interY-centerRectLength/2;
  */
  
  
  float centerX1 = (3*x1+x2)/4;
  float centerY1 = (3*y1+y2)/4;
  float centerX2 = (3*x3+x4)/4;
  float centerY2 = (3*y3+y4)/4;
  float centerX3 = (x1+3*x2)/4;
  float centerY3 = (y1+3*y2)/4;
  float centerX4 = (x3+3*x4)/4;
  float centerY4 = (y3+3*y4)/4;
  
  
  

  beginShape();
  vertex(centerX1,centerY1);
  vertex(centerX2,centerY2);
  vertex(centerX3,centerY3);
  vertex(centerX4,centerY4);
  endShape(CLOSE);
  
  
  
  //stroke(255,0,0);
  //noFill();
  //line(x1, y1+rectLength/2,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  //line(x1-rectLength/2, y1,(centerX1+centerX4)/2,(centerY1+centerY4)/2);
  /*beginShape();
  vertex(x1,y1+rectLength/2);
  bezier(x1, y1+rectLength/2,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  bezier(x1-rectLength/2, y1,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX4)/2,(centerY1+centerY4)/2);
  endShape(CLOSE); */
  
  beginShape();
  vertex(x1-rectLength/2,y1);
  vertex(x1, y1+rectLength/2);
  bezierVertex(x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  vertex((centerX1+centerX4)/2,(centerY1+centerY4)/2);
  bezierVertex(centerX1,centerY1,x1-rectLength/2,y1+rectLength/2,x1-rectLength/2,y1);
  endShape(); 

  beginShape();
  vertex(x3-rectLength/2,y3);
  vertex(x3, y3-rectLength/2);
  bezierVertex(x3-rectLength/2,y3-rectLength/2,centerX2,centerY2,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  vertex((centerX2+centerX3)/2,(centerY2+centerY3)/2);
  bezierVertex(centerX2,centerY2,x3-rectLength/2,y3-rectLength/2,(x3-rectLength/2),y3);
  endShape(); 
  
  beginShape();
  vertex(x2+rectLength/2,y2);
  vertex(x2, y2-rectLength/2);
  bezierVertex(x2+rectLength/2,y2-rectLength/2,centerX3,centerY3,(centerX3+centerX4)/2,(centerY3+centerY4)/2);
  vertex((centerX2+centerX3)/2,(centerY2+centerY3)/2);
  bezierVertex(centerX3,centerY3,x2+rectLength/2,y2-rectLength/2,x2+rectLength/2,y2);
  endShape(); 
  
  beginShape();
  vertex(x4+rectLength/2,y4);
  vertex(x4, y4+rectLength/2);
  bezierVertex(x4+rectLength/2,y4+rectLength/2,centerX4,centerY4,(centerX3+centerX4)/2,(centerY3+centerY4)/2);
  vertex((centerX4+centerX1)/2,(centerY4+centerY1)/2);
  bezierVertex(centerX4,centerY4,x4+rectLength/2,y4+rectLength/2,x4+rectLength/2,y4);
  endShape(); 



  //bezier(x1, y1+rectLength/2,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  //bezier(x1-rectLength/2, y1,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX4)/2,(centerY1+centerY4)/2);

  rectX = (cos(frameCount * 0.01) / 2 + 0.5) * (edge - rectLength);
  circleY = (sin(frameCount * 0.01) / 2 + 0.5) * (edge - rectLength);
}

float speed = 0.01;  // 控制擺動速度
float amplitude = 300; // 最大擺動範圍
int lastCycle = 0; // 記錄上一個 sin 波完成的循環次數

float offset(float timeOffset){
  float tempOffset = sin(-PI/2+frameCount * speed + timeOffset)/2+0.5; // 範圍 [-1, 1]
  
  // 計算當前的循環次數（完整的 sin 週期 = 2PI）
  int currentCycle = int((frameCount * speed + timeOffset) / TWO_PI);
  
  // 當 sin 進入新的循環時，變更 direction
  if (currentCycle != lastCycle) {
   // direction *= -1;
    lastCycle = currentCycle; // 更新循環計數
  }
  
  return tempOffset * amplitude; // 讓 offset 來回擺動並反轉方向
}
