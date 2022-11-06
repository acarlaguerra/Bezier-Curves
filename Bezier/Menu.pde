//Classe que define as configurações do menu

String[] button_labels = {"Nova Curva", 
                          "Deletar Curva", 
                          "Próxima Curva", 
                          "Mostrar/Esconder \nPontos", 
                          "Mostrar/Esconder \nPolígonos", 
                          "Mostrar/Esconder \nCurvas"};

class Menu{
  float x, y, w, h;
  Buttons[] button;
  NumEval input;
  
  Menu (float x1, float y1, float w1, float h1){
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    button = new Buttons[6];
    for(int i = 0; i < 6; i++)
      button[i] = new Buttons(x + (40*i + 1)*h/26, y+20 , w/7, 12*h/25, i, button_labels[i]);
    input = new NumEval(x + 2*w/5, y + 19*h/25, w/6, 5*h/24, "Num. Ava.");
  }
  
  void display(){
    noStroke();
    fill(#6aa84f);
    rect(x, y, w, h);
    for(Buttons button : button)
      button.display();
    input.display();
    textFont(font, 12);
    textAlign(CENTER);
    fill(#E5DDC8);
  }
  
  boolean is_inside(float x1, float y1){
    float dx = x1 - x;
    float dy = y1 - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
}
