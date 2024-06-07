import java.util.Stack;

Stack<Disc>[] tower = new Stack[3];
Pillar pillar = new Pillar();
int move = -1;
int i = 0;
void setup() {
  size(600, 600);
  int totalDiscs = 10;
  
  for (int i = 0; i < 3; i++) {
    tower[i] = new Stack<>();
  }
    
  for (int i = 0; i < totalDiscs; i++) {
    tower[0].push(new Disc(i));
    Disc disc = tower[0].peek();  
    disc.show();
  }
}

void draw() {
  background(255);
  pillar.show();
  for (int i = 0; i < 3; i++) {
    for (Disc disc : tower[i])
      disc.show();
  }
  Disc d = tower[0].peek();
  d.show();
  if(move == 1){
    d.xPos = mouseX;
    d.yPos = mouseY;
  }
}

public void mousePressed(){  
 Disc d = tower[i].peek();
 
  //To the disc follows the mouse after it is pressed
  if (mouseX >= d.xPos && mouseX <= d.xPos + d.dWidth &&
      mouseY >= d.yPos && mouseY <= d.yPos + d.dHeight) {
    move = -move;
  }
  
  if (mouseX >= d.xPos && mouseX <= d.xPos + d.dWidth &&
      mouseY >= d.yPos && mouseY <= d.yPos + d.dHeight) {
    //Repositions the disc after a click in a allowed local
    if(mouseY >= pillar.yPos && mouseY <= pillar.yPos + pillar.pHeight){
      if (move == -1 && mouseX >= pillar.xPos1 && mouseX <= pillar.xPos1 + pillar.pWidth){
        d.xPos = pillar.xPos1 - d.dWidth/2 + 5;
        d.yPos = height - d.dHeight - 10;  
        tower[0].push(d); 
        tower[i].pop();
        print("Pinto");
        print(tower[i].size());
        print(tower[0].size());
        i = 0;
      }
      else if (move == -1 && mouseX >= pillar.xPos2 && mouseX <= pillar.xPos2 + pillar.pWidth){
        d.xPos = pillar.xPos2 - d.dWidth/2 + 5;
        d.yPos = height - d.dHeight - 10;   
        tower[1].push(d); 
        tower[i].pop();
        print("penis");
        print(tower[i].size());
        print(tower[1].size());
        i = 1;
      }
      else if (move == -1 && mouseX >= pillar.xPos3 && mouseX <= pillar.xPos3 + pillar.pWidth){
        d.xPos = pillar.xPos3 - d.dWidth/2 + 5;
        d.yPos = height - d.dHeight - 10;  
        tower[2].push(d);
        tower[i].pop();
        print("Vagina");
        print(tower[i].size());
        print(tower[2].size());
        i = 2;
      }
    }
  }
}
