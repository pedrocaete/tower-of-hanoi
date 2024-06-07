public class Pillar {
  
  float pWidth = 10;
  float pHeight = 440;
  float xPos1 = 142.5;
  float xPos2 = xPos1 + 142.5 + pWidth;
  float xPos3 = xPos2 + 142.5 + pWidth;
  float yPos = 150;

  public void show() {
    noStroke();
    fill(#46201B);
    rect(0, height - 10, width, pWidth);
    rect(xPos1, yPos, pWidth, pHeight);
    rect(xPos2, yPos, pWidth, pHeight);
    rect(xPos3, yPos, pWidth, pHeight);
  }
}
