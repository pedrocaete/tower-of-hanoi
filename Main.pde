import java.util.Stack;

Stack<Disc>[] tower = new Stack[3];
Pillar pillar[] = new Pillar[3];
int move = -1;
int referencedDisc = 0;
void setup() {
  size(600, 600);
  int totalDiscs = 10;
  
  for (int i = 0; i < 3; i++) {
    tower[i] = new Stack<>();
    pillar[i] = new Pillar(i);
  }
    
  for (int i = 0; i < totalDiscs; i++) {
    tower[0].push(new Disc(i));
    Disc disc = tower[0].peek();  
    disc.show();
  }
}

void draw() {
  background(255);
  
  
  for (int i = 0; i < 3; i++) {
    pillar[i].show();
    for (Disc disc : tower[i])
      disc.show();
  }
  
  Disc d = tower[referencedDisc].peek();
  d.show();
  
  if(move == 1){
    d.xPos = mouseX - d.dWidth/2;
    d.yPos = mouseY - d.dHeight/2;
  }
}

public void mousePressed(){  
  //Disc that is been referenced
  Disc d = tower[referencedDisc].peek();
  Disc[] disc = new Disc[3];

  //Create a instance of peek disc for each tower
  for (int i = 0; i < 3; i ++){
    if (!tower[i].isEmpty()){
      disc[i] = tower[i].peek();
    }
    else{
      disc[i] = new Disc();
    }
  }

  //To the disc follows the mouse after it is mousePressed
  for (int i =0; i < 3; i ++){
    if (mouseX >= disc[i].xPos && mouseX <= disc[i].xPos + disc[i].dWidth &&
        mouseY >= disc[i].yPos && mouseY <= disc[i].yPos + disc[i].dHeight) {
      move = -move;
      referencedDisc = i;
      d = tower[referencedDisc].peek(); 
    }
  }
  //Repositions the disc after a click in a allowed local
  if (mouseX >= d.xPos && mouseX <= d.xPos + d.dWidth &&
      mouseY >= d.yPos && mouseY <= d.yPos + d.dHeight) {
    for (int i = 0; i < 3; i ++){
      if(mouseY >= pillar[i].yPos && mouseY <= pillar[i].yPos + pillar[i].Height){
        if (move == -1 && mouseX >= pillar[i].xPos -25 && mouseX <= pillar[i].xPos + pillar[i].Width + 25){
          tower[referencedDisc].pop();
          d.xPos = pillar[i].xPos - d.dWidth/2 + 5;
          d.yPos = height - (d.dHeight * (tower[i].size() + 1)) - 10;  
          disc[i] = tower[i].push(d); 
          referencedDisc = i;
        }
      }
    }
  }  
}
