public class Disc {


  float dWidth;
  float dHeight;
  float xPos;
  float yPos;
  int dTotal;
  
  public Disc(int dTotal) {
    this.dTotal = dTotal;
    this.dWidth = 130;
    this.dHeight = dWidth/3;
  }
  
  void initialize(){
    for(int i = 1; i <= dTotal; i++){
      this.tower.push(i);
      this.xPos = (width/2 - 5 -dWidth)/2;
      this.yPos = height - (dHeight*i) - 10;
      fill(random(255),random(255),random(255));
      rect(xPos,yPos,dWidth,dHeight);
      dWidth -= 10;
    }
  }
  
  void move(){
    if(
  }
  
}
