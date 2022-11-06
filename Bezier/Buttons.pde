//Classe que define a configuração dos botões
class Buttons {
  float x, y, h, w;
  String label;
  int action;
  
  Buttons (float x1, float y1, float w1, float h1, int act, String lbl){
    x = x1;
    y = y1;
    w = w1;
    h = h1;
    label = lbl;
    action = act;
  }
  
  void display(){
    noStroke();
    fill(#876bcc);
    rect(x, y, w, h, 5);
    textFont(font);
    fill(#E5DDC8);
    textAlign(CENTER);
    text(label, x + w/2, y + h/2 + textSize/4);
  }
  
  boolean is_inside(float xx, float yy){
    float dx = xx - x;
    float dy = yy - y;
    return (dx >= 0 && dx <= w && dy >= 0 && dy <= h);
  }
  
  void exec(){
    //ação que adiciona nova curva
    if(action == 0){         
      println();
      if(curves[position].points.length == 0)
        return;
      AddCurva();
    }
    //ação que deleta uma curva
    else if(action == 1){    
      DeleteCurva();
    }  
    //ação que muda para a próxima curva
    else if(action == 2){    
      if(curves[position].points.length == 0){
        DeleteCurva();
        return;
      }
      //corrige qual a curva atual está sendo mostrada
      curves[position].setCurrent(false);
      position++;
      if(position == curves.length)
        position = 0;
      curves[position].setCurrent(true);
    }
    //ações para mostrar ou esconder os pontos, polígonos e curvas
    else if(action == 3){    
      to_view_pt = !to_view_pt;
    }
    else if(action == 4){    
      to_view_pg = !to_view_pg;  
    }
    else{                    
      to_view_cv = !to_view_cv;
    }
  }
}
