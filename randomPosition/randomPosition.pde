import processing.video.*;

Movie movieRect2Rect;


int numShapes = 8;  // 形狀數量
LocationStruct[] locationStructs;      // 存儲所有物體
Mover[] movers;      // 存儲所有物體
int sizeLength = 1000;
int currentOrder[];

float insideLength = sizeLength*198.79825/1000;
float outsideLength =  sizeLength*269/1000;

void setup() {
  size(1000, 1000,P2D);
  rectMode(CENTER);
  fill(255);
  noStroke();
  movieRect2Rect = new Movie(this, "rect2rectSplit.mp4");

  movers = new Mover[numShapes];
  locationStructs = new LocationStruct[numShapes];
  for (int i = 0; i < numShapes; i++) {
    locationStructs[i] = new LocationStruct(i);
  }
  currentOrder = new int[8];
   for (int i = 0; i < numShapes; i++) {
    currentOrder[i] = i;
  }
  for (int i = 0; i < numShapes; i++) {
    PVector pos = locationStructs[i].position;
    movers[i] = new Mover(pos.x, pos.y, locationStructs[i].shapeLength, i);
  }
}

void draw() {
  background(0);
  for (Mover m : movers) {
    m.update();
    m.display();
  }
  
  image(movieRect2Rect,0,height/2,sizeLength/2,sizeLength/2);

}

// 按鍵觸發移動 (按下空白鍵)
void keyPressed() {
  if (key == ' ') {
    //triggerMove();
    movieRect2Rect.jump(0);
          movieRect2Rect.play();

  }
}

// 觸發所有物體移動
void triggerMove() {
  // 確保全新的開始
  for (int i = 0; i < numShapes; i++) {
    locationStructs[i].isOccupied = false;
  }
  
  // 創建一個無環排列（每個元素都不在原位置）
  int[] newLocations = generateDerangement(currentOrder);
  
  // 應用新位置
  for (int i = 0; i < numShapes; i++) {
    int newLocation = newLocations[i];
    int temp = movers[newLocation].currentOrderNumber;
    movers[i].currentOrderNumber = newLocation;

    movers[i].moveTo(locationStructs[newLocation].position);
  }
}

// 生成一個無環排列（每個元素都不在原位置）
int[] generateDerangement(int oldOrder[]) {
  int[] result = new int[numShapes];
  boolean valid = false;
  int tryCount =0;
  
  while (!valid) {
    // 初始化位置數組（0到numShapes-1）
    for (int i = 0; i < numShapes; i++) {
      result[i] = oldOrder[i];
    }
    
    // Fisher-Yates 洗牌算法
    for (int i = numShapes - 1; i > 0; i--) {
      int j = floor(random(i + 1));
      // 交換元素
      int temp = result[i];
      result[i] = result[j];
      result[j] = temp;
    }
    
    // 檢查是否所有元素都不在原位置
    valid = true;
    for (int i = 0; i < numShapes; i++) {
      if (result[i] ==  oldOrder[i]) {
        valid = false;
        tryCount++;
        break;
      }
    }
  }
  println("sucess arrange"+ " try" + tryCount);

  currentOrder = result;
  return result;
}

void movieEvent(Movie movie) {
  movie.read();
}
