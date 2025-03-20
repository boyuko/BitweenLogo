// Mover 類別，控制移動
class Mover {
  PVector position, start, target;
  float t;
  float duration = 60; // 持續幀數
  float time = 0;
  float shapeLength, startShapeLength,targetShapeLength;
  int currentOrderNumber;
  
  Mover(float x, float y, float _shapeLength, int _currentOrderNumber) {
    position = new PVector(x, y);
    shapeLength = _shapeLength;
    currentOrderNumber = _currentOrderNumber;
    target = position.copy();
    start = position.copy();
    
    targetShapeLength = shapeLength;
    startShapeLength = shapeLength;
    
    t = 1;
  }
  
  void update() {
    if (t < 1) {
      t = time / duration;
      float easeT = easeInOutQuad(t);
      shapeLength = lerp(startShapeLength, targetShapeLength, easeT);
      position.set(PVector.lerp(start, target, easeT));
      time++;
    }
  }
  
  void display() {
    rect(position.x, position.y, shapeLength, shapeLength);
  }
  
  void moveTo(PVector newTarget) {
    start.set(position);
    target.set(newTarget);
    
    startShapeLength = shapeLength;
    if(currentOrderNumber>3){
      targetShapeLength= insideLength;
    }else {
       targetShapeLength= outsideLength;
    }
    time = 0;
    t = 0;
  }
  
  // 二次加減速函數 (Ease In-Out)
  float easeInOutQuad(float t) {
    return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
  }
}
