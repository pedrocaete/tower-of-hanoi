import java.util.Stack;

Stack<Disc>[] tower = new Stack[3];
Pillar pillar[] = new Pillar[3];
int move = -1;
int referencedDisc = 0;
float size = random (110, 135);
int totalDiscs = 5;
boolean win = false;
Timer timer = new Timer();

void setup() {
  size(600, 600);
  
  for (int i = 0; i < 3; i++) {
    tower[i] = new Stack<>();
    pillar[i] = new Pillar(i);
  }
    
  for (int i = 0; i < totalDiscs; i++) {
    tower[0].push(new Disc(i,size));
    Disc disc = tower[0].peek();  
    disc.show();
  }
}

void draw() {
  
  if(win == false){
    background(255);
    
    timer.show();
    timer.update();

    for (int i = 0; i < 3; i++) {
      pillar[i].show();
      for (Disc disc : tower[i])
        disc.show();
    }
    
    Disc d = tower[referencedDisc].peek();
    d.show();
    
    //To the disc follows the mouse after it is mousePressed
    if (move == 1) {
      d.xPos = mouseX - d.Width/2;
      d.yPos = mouseY - d.Height/2;
    }
  }
  else{
    background(255);
    fill(20,255,20); 
    textAlign(CENTER);
    textSize(140);
    text("YOU WIN", width/2, height/3);
    textSize(50);
    fill(121);
    textAlign(RIGHT);
    text("TIME: " + timer.formatedTime, width/2, height/2);
  }
  
  //Verify if the player wins
  if (tower[1].size() == totalDiscs || tower[2].size() == totalDiscs){
    win = true;  
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
      disc[i] = new Disc(size);
    }
  }

  //To the disc follows the mouse after it is mousePressed
  for (int i =0; i < 3; i ++){
    if (mouseX >= disc[i].xPos && mouseX <= disc[i].xPos + disc[i].Width &&
        mouseY >= disc[i].yPos && mouseY <= disc[i].yPos + disc[i].Height) {
      move = -move;
      referencedDisc = i;
      d = tower[referencedDisc].peek(); 
    }
  }

  //Repositions the disc after a click in a allowed local
  if (mouseX >= d.xPos && mouseX <= d.xPos + d.Width &&
      mouseY >= d.yPos && mouseY <= d.yPos + d.Height) {
    for (int i = 0; i < 3; i ++){
      if (move == -1 && mouseX >= pillar[i].xPos -30 && mouseX <= pillar[i].xPos + pillar[i].Width + 30 &&
          mouseY >= pillar[i].yPos && mouseY <= pillar[i].yPos + pillar[i].Height && d.Width <= disc[i].Width){
        tower[referencedDisc].pop();
        d.xPos = pillar[i].xPos - d.Width/2 + 5;
        d.yPos = height - (d.Height * (tower[i].size() + 1)) - 10;  
        disc[i] = tower[i].push(d); 
        referencedDisc = i;
      }
    }
  }  
}
