public class Disc {


  float dWidth;
  float dHeight;
  float xPos;
  float yPos;
  
  public Disc (int i){
    this.dWidth = 130;
    this.dHeight = dWidth/3;
    this.dWidth -= i*10;
    this.xPos = (width/2 -dWidth)/2;
    this.yPos = height - (dHeight*(i+1)) -10;
  }
  
  public void show(){
      fill(random(255),random(255),random(255));
      rect(xPos,yPos,dWidth,dHeight);
    }
  }
