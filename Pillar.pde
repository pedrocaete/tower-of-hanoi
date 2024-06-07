public class Pillar {
  
  float Width;
  float Height;
  float xPos;
  float yPos;

  public Pillar (int i) {
  this.Width = 10;
  this.Height = 440;
  this.xPos = 142.5 + i * (142.5 + Width);
  this.yPos = 150;
  }
  
  public void show() {
    noStroke();
    fill(#46201B);
    rect(0, height - 10, width, Width);
    rect(xPos, yPos, Width, Height);
  }
}
