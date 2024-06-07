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
  Disc d = tower[i].peek();
  d.show();
  if(move == 1){
    d.xPos = mouseX;
    d.yPos = mouseY;
  }
}

public void mousePressed(){  
  Disc d = tower[i].peek(); 
  Disc[] disc = new Disc[3];

  //Create a instance of peek disc for each tower
  for (int j = 0; j < 3; j ++){
    if (!tower[j].isEmpty()){
      disc[j] = tower[j].peek();
    }
    else{
      disc[j] = new Disc();
    }
  }

  //To the disc follows the mouse after it is mousePressed
  for (int j =0; j < 3; j ++){
    if (mouseX >= disc[j].xPos && mouseX <= disc[j].xPos + disc[j].dWidth &&
        mouseY >= disc[j].yPos && mouseY <= disc[j].yPos + disc[j].dHeight) {
      d = tower[j].peek();
      i = j;
      move = -move;
      d = tower[i].peek(); 
    }
  }
  
  //Repositions the disc after a click in a allowed local
  if (mouseX >= d.xPos && mouseX <= d.xPos + d.dWidth &&
      mouseY >= d.yPos && mouseY <= d.yPos + d.dHeight) {
    if(mouseY >= pillar.yPos && mouseY <= pillar.yPos + pillar.pHeight){
      if (move == -1 && mouseX >= pillar.xPos1 && mouseX <= pillar.xPos1 + pillar.pWidth){
        d.xPos = pillar.xPos1 - d.dWidth/2 + 5;
        d.yPos = height - (d.dHeight * (tower[0].size() + 1)) - 10;  
        disc[0] = tower[0].push(d); 
        tower[i].pop();
        i = 0;
      }
      else if (move == -1 && mouseX >= pillar.xPos2 && mouseX <= pillar.xPos2 + pillar.pWidth){
        d.xPos = pillar.xPos2 - d.dWidth/2 + 5;
        d.yPos = height - (d.dHeight * (tower[1].size() + 1)) - 10;   
        disc[1] = tower[1].push(d); 
        tower[i].pop();
        i = 1;
      }
      else if (move == -1 && mouseX >= pillar.xPos3 && mouseX <= pillar.xPos3 + pillar.pWidth){
        d.xPos = pillar.xPos3 - d.dWidth/2 + 5;
        d.yPos = height - (d.dHeight * (tower[2].size() + 1)) - 10;  
        disc[2] = tower[2].push(d);
        tower[i].pop();
        i = 2;
      }
    }
  }
}
