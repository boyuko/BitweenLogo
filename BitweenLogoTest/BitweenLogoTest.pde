float rectX = 0f;
float circleY = 0f;

float rectLength = 200;
float centerRectLength = 360;
float edge = 900;

float delay1 = 0.0, delay2 = 0.5, delay3 = 1.0, delay4 = 0.5, delay5=1.0, delay6=1.5, delay7 =1.0, delay8=1.5, delay9=2.0, delay10= 1.5, delay11=2.0, delay12=2.5; // 延遲時間

float direction=1;
//float x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4;
float x1 = -rectLength / 2+edge;
float y1 = rectLength / 2;
float z1 = 0;

float x2 = rectLength / 2;
float y2 = edge - rectLength / 2;
float z2 =0;

float x3 = edge - rectLength / 2;
float y3 = -rectLength / 2+edge;
float z3 = 0;

float x4 = rectLength / 2;
float y4 = rectLength / 2;
float z4 =0;

float targetX1, targetY1, targetZ1, targetX2, targetY2, targetZ2, targetX3, targetY3, targetZ3, targetX4, targetY4, targetZ4;
float startX1, startY1, startZ1, startX2, startY2, startZ2, startX3, startY3, startZ3, startX4, startY4, startZ4;

float lerpTime = 0.5;
float startTime;
boolean isLerping = false;
boolean needsNewTarget = false;




void setup() {
  size(900, 900, P3D);
  smooth();
  rectMode(CENTER); // 設定矩形的繪製模式為中心
}

void draw() {
  background(0);

  //translate(150, 150);


  fill(255);
  noStroke();

  if (isLerping) {
    float currentTime = millis();
    float t1 = constrain((currentTime - startTime - delay1 * 1000) / (lerpTime * 1000), 0, 1);
    float t2 = constrain((currentTime - startTime - delay2 * 1000) / (lerpTime * 1000), 0, 1);
    float t3 = constrain((currentTime - startTime - delay3 * 1000) / (lerpTime * 1000), 0, 1);
    float t4 = constrain((currentTime - startTime - delay4 * 1000) / (lerpTime * 1000), 0, 1);
    float t5 = constrain((currentTime - startTime - delay5 * 1000) / (lerpTime * 1000), 0, 1);
    float t6 = constrain((currentTime - startTime - delay6 * 1000) / (lerpTime * 1000), 0, 1);
    float t7 = constrain((currentTime - startTime - delay7 * 1000) / (lerpTime * 1000), 0, 1);
    float t8 = constrain((currentTime - startTime - delay8 * 1000) / (lerpTime * 1000), 0, 1);
    float t9 = constrain((currentTime - startTime - delay9 * 1000) / (lerpTime * 1000), 0, 1);
    float t10 = constrain((currentTime - startTime - delay10 * 1000) / (lerpTime * 1000), 0, 1);
    float t11= constrain((currentTime - startTime - delay11 * 1000) / (lerpTime * 1000), 0, 1);
    float t12 = constrain((currentTime - startTime - delay12 * 1000) / (lerpTime * 1000), 0, 1);

    t1 = easeInOut(t1);
    t2 = easeInOut(t2);
    t3 = easeInOut(t3);
    t4 = easeInOut(t4);
    t5 = easeInOut(t5);
    t6 = easeInOut(t6);
    t7 = easeInOut(t7);
    t8 = easeInOut(t8);
    t9 = easeInOut(t9);
    t10 = easeInOut(t10);
    t11 = easeInOut(t11);
    t12 = easeInOut(t12);

/*
    x1 = lerp(startX1, targetX1, t1);
    y1 = lerp(startY1, targetY1, t2);
    z1 = lerp(startZ1, targetZ1, t3);


    x2 = lerp(startX2, targetX2, t4);
    y2 = lerp(startY2, targetY2, t5);
    z2 = lerp(startZ2, targetZ2, t6);

    x3 = lerp(startX3, targetX3, t7);
    y3 = lerp(startY3, targetY3, t8);
    z3 = lerp(startZ3, targetZ3, t9);

    x4 = lerp(startX4, targetX4, t10);
    y4 = lerp(startY4, targetY4, t11);
    z4 = lerp(startZ4, targetZ4, t12);

    if (t12 >= 1.0) {
      isLerping = false;
      needsNewTarget = true; // 延遲更新目標
    }
    */
  }

  if (needsNewTarget) {
    generatePositions();
    needsNewTarget = false;
  }

  // x1 = mouseX;
  //y1 = mouseY;

  strokeWeight(20);


  // 畫上方和下方的矩形
  //z1= -offset(0);
  push();
  translate(0, 0, z1);
  rect( x1, y1, rectLength, rectLength);
  pop();

  //z2= -offset(PI);
  push();
  translate(0, 0, z2);
  rect(x2, y2, rectLength, rectLength);
  pop();

  //z3= -offset(PI/2);
  push();
  translate(0, 0, z3);
  circle(x3, y3, rectLength);
  pop();

  //z4= -offset(PI*3/2);
  push();
  translate(0, 0, z4);
  circle(x4, y4, rectLength);
  pop();



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
   
   z1 = -offset(0, 0.02);
   z2 = -offset(PI, 0.02 );
   z3 = -offset(PI/7, 0.03);
   z4 = -offset(PI/7+PI, 0.03);


  float centerX1 = (3*x1+x2)/4;
  float centerY1 = (3*y1+y2)/4;
  float centerZ1 = (3*z1+z2)/4;

  float centerX2 = (3*x3+x4)/4;
  float centerY2 = (3*y3+y4)/4;
  float centerZ2 = (3*z3+z4)/4;

  float centerX3 = (x1+3*x2)/4;
  float centerY3 = (y1+3*y2)/4;
  float centerZ3 = (z1+3*z2)/4;

  float centerX4 = (x3+3*x4)/4;
  float centerY4 = (y3+3*y4)/4;
  float centerZ4 = (z3+3*z4)/4;





  beginShape();
  vertex(centerX1, centerY1, centerZ1);
  vertex(centerX2, centerY2, centerZ2);
  vertex(centerX3, centerY3, centerZ3);
  vertex(centerX4, centerY4, centerZ4);
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
  vertex(x1-rectLength/2, y1, z1);
  vertex(x1, y1+rectLength/2, z1);
  bezierVertex(x1-rectLength/2, y1+rectLength/2, z1, centerX1, centerY1, centerZ1, (centerX1+centerX2)/2, (centerY1+centerY2)/2, (centerZ1+centerZ2)/2);
  vertex((centerX1+centerX4)/2, (centerY1+centerY4)/2, (centerZ1+centerZ4)/2);
  bezierVertex(centerX1, centerY1, centerZ1, x1-rectLength/2, y1+rectLength/2, z1, x1-rectLength/2, y1, z1);
  endShape();

  beginShape();
  vertex(x3-rectLength/2, y3, z3);
  vertex(x3, y3-rectLength/2, z3);
  bezierVertex(x3-rectLength/2, y3-rectLength/2, z3, centerX2, centerY2, centerZ2, (centerX1+centerX2)/2, (centerY1+centerY2)/2, (centerZ1+centerZ2)/2);
  vertex((centerX2+centerX3)/2, (centerY2+centerY3)/2, (centerZ2+centerZ3)/2);
  bezierVertex(centerX2, centerY2, centerZ2, x3-rectLength/2, y3-rectLength/2, z3, (x3-rectLength/2), y3, z3);
  endShape();

  beginShape();
  vertex(x2+rectLength/2, y2, z2);
  vertex(x2, y2-rectLength/2, z2);
  bezierVertex(x2+rectLength/2, y2-rectLength/2, z2, centerX3, centerY3, centerZ3, (centerX3+centerX4)/2, (centerY3+centerY4)/2, (centerZ3+centerZ4)/2);
  vertex((centerX2+centerX3)/2, (centerY2+centerY3)/2, (centerZ2+centerZ3)/2);
  bezierVertex(centerX3, centerY3, centerZ3, x2+rectLength/2, y2-rectLength/2, z2, x2+rectLength/2, y2, z2);
  endShape();

  beginShape();
  vertex(x4+rectLength/2, y4, z4);
  vertex(x4, y4+rectLength/2, z4);
  bezierVertex(x4+rectLength/2, y4+rectLength/2, z4, centerX4, centerY4, centerZ4, (centerX3+centerX4)/2, (centerY3+centerY4)/2, (centerZ3+centerZ4)/2);
  vertex((centerX4+centerX1)/2, (centerY4+centerY1)/2, (centerZ4+centerZ1)/2);
  bezierVertex(centerX4, centerY4, centerZ4, x4+rectLength/2, y4+rectLength/2, z4, x4+rectLength/2, y4, z4);
  endShape();

  stroke(255, 0, 0);
  strokeWeight(2);
  noFill();
  // 畫線
  //line(x1, y1, z1, x2, y2, z2);
  //line(x3, y3, z3, x4, y4, z4);



  //bezier(x1, y1+rectLength/2,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX2)/2,(centerY1+centerY2)/2);
  //bezier(x1-rectLength/2, y1,x1-rectLength/2,y1+rectLength/2,centerX1,centerY1,(centerX1+centerX4)/2,(centerY1+centerY4)/2);

  rectX = (cos(frameCount * 0.01) / 2 + 0.5) * (edge - rectLength);
  circleY = (sin(frameCount * 0.01) / 2 + 0.5) * (edge - rectLength);
  
}

//float speed = 0.01;  // 控制擺動速度
float amplitude = 500; // 最大擺動範圍
int lastCycle = 0; // 記錄上一個 sin 波完成的循環次數

float offset(float timeOffset, float speed) {
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

void keyPressed() {
  if (key == 'X' || key == 'x') {
    generatePositions();
  }
}
float randomRange = 150;
float randomZRange = 300;


float easeInOut(float t) {
  t = t < 0.5 ? 4 * t * t * t : 1 - pow(-2 * t + 2, 3) / 2;
  return t;
}
void generatePositions() {
  startX1 = x1;
  startX2 = x2;
  startX3 = x3;
  startX4 = x4;
  startY1 = y1;
  startY2 = y2;
  startY3 = y3;
  startY4 = y4;
  startZ1 = z1;
  startZ2 = z2;
  startZ3 = z3;
  startZ4 = z4;

  targetX1 = -rectLength / 2+edge-random(randomRange);
  targetY1 = rectLength / 2+random(randomRange);
  targetZ1 = -random(randomZRange);

  targetX2 = rectLength / 2 +random(randomRange);
  targetY2 = edge - rectLength / 2-random(randomRange);
  targetZ2 =-random(randomZRange);

  targetX3 = edge - rectLength / 2-random(randomRange);
  targetY3 = -rectLength / 2+edge-random(randomRange);
  targetZ3 = -random(randomZRange);

  targetX4 = rectLength / 2+random(randomRange);
  targetY4 = rectLength / 2+random(randomRange);
  targetZ4 = -random(randomZRange);
  startTime = millis();
  isLerping = true;
}
