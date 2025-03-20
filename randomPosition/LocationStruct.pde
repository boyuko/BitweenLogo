class LocationStruct {
  int orderNumber;
  PVector position;
  float shapeLength;
  boolean isOccupied = false;
  
  LocationStruct(int _orderNumber) {
    orderNumber = _orderNumber;
    if (orderNumber==0) {
      shapeLength = outsideLength;
      position = new PVector(shapeLength/2, shapeLength/2);
    } else if (orderNumber==1) {
      shapeLength = outsideLength;
      position = new PVector(width - shapeLength/2, shapeLength/2);
    } else if (orderNumber==2) {
      shapeLength = outsideLength;
      position = new PVector(width - shapeLength/2, height - shapeLength/2);
    } else if (orderNumber==3) {
      shapeLength = outsideLength;
      position = new PVector(shapeLength/2, height - shapeLength/2);
    } else if (orderNumber==4) {
      shapeLength = insideLength;
      position = new PVector(width/2-shapeLength/2, height/2 - shapeLength/2);
    } else if (orderNumber==5) {
      shapeLength = insideLength;
      position = new PVector(width/2+shapeLength/2, height/2 - shapeLength/2);
    } else if (orderNumber==6) {
      shapeLength = insideLength;
      position = new PVector(width/2+shapeLength/2, height/2 + shapeLength/2);
    } else if (orderNumber==7) {
      shapeLength = insideLength;
      position = new PVector(width/2-shapeLength/2, height/2 + shapeLength/2);
    }
  }
}
