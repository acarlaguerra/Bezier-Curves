//Classe para definir o número de avaliações que recebe no input
class NumEval {
  float x, y, h, w;
  String label;
  
  NumEval (float x1, float y1, float w1, float h1, String lbl1){
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    label = lbl1;
  }
  
  void display(){
    noStroke();
    fill(#876bcc);
    rect(x, y, w, h, 5);
    textFont(font);
    textAlign(CENTER);
    fill(#E5DDC8);
    text("Avaliações: " + temp_evaluation, x + w/2, y + h/2 + textSize/4);
  }
  
  boolean is_inside(float xx, float yy){
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
  
  void exec(){
    if(state == 0){
      state = 1;
      temp_evaluation = 0;
    }
  } 
}
