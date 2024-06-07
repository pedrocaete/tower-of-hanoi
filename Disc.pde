public class Disc {


  float dWidth;
  float dHeight;
  float xPos;
  float yPos;
  float color1, color2, color3;

  public Disc (int i){
    this.dWidth = 130;
    this.dHeight = dWidth/3;
    this.dWidth -= i*10;
    this.xPos = (width/2 -dWidth)/2;
    this.yPos = height - (dHeight*(i+1)) -10;
    this.color1 = random(255);
    this.color2 = random(255);
    this.color3 = random(255);
  }
  
  public Disc(){
  
  }
  
  public void show(){
    fill(color1, color2, color3);
    rect(xPos,yPos,dWidth,dHeight);
  }
  
}
