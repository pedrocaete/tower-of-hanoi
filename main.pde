import java.util.Stack;

Stack<Disc> tower = new Stack<>();
Pillar pillar = new Pillar();

void setup() {
  size(600, 600);
  background(255);
  int totalDiscs = 10;
  
  pillar.show();
  for(int i = 0; i < totalDiscs; i++){
    tower.push(new Disc(i));
    Disc element = tower.peek();  
    element.show();
  }
}

void draw() {
  
  
}
