//Classe Principal
Curve[] curves = new Curve[0];
int max_evaluation, temp_evaluation;
boolean to_view_pt = true, to_view_pg = true, to_view_cv = true;
int position;
int point_edit = -1;
PFont font;
int textSize;
int state;
Menu menu;


public void setup(){
  size(1200, 650);
  menu = new Menu(0, 0, width, height*0.2);
  position = 0;
  max_evaluation = 1000;
  curves = (Curve[])append(curves, new Curve());
  textSize = 14;
  font = createFont("Arial Bold", textSize, true); 
  state = 0;
}

public void draw(){
  background(#d3ed99);
  for(Curve curva : curves)
    curva.display();
  menu.display();
}

void mouseClicked(){
  if(mouseButton == LEFT){
    if(menu.is_inside(mouseX, mouseY)){
      for(Buttons button : menu.button)
        if(button.is_inside(mouseX, mouseY))
          button.exec();
      if(menu.input.is_inside(mouseX, mouseY))
        menu.input.exec();
    }
    else  
      curves[position].AddPoint(new ControlPoint(mouseX, mouseY));
  }
}

void mouseDragged(){
  if(mouseButton != LEFT)
    return;
  
  if(point_edit == -1){
    for(int i = 0; i < curves[position].points.length; i++){
      if(curves[position].points[i].is_inside())
        point_edit = i;
    }
  }
  
  if(point_edit != -1)
    curves[position].points[point_edit].UpdateCoord(mouseX, mouseY);
}

void mouseReleased(){
  point_edit = -1;
}

void keyPressed(){
  if(state == 1){
    if(key == ENTER){
      max_evaluation = temp_evaluation;
      for(Curve curva : curves)
        curva.setEvaluation(max_evaluation);
      state = 0;
    }
    else if(key == BACKSPACE){
      temp_evaluation /= 10;
    }
    else if(key >= '0' && key <= '9'){
      temp_evaluation *= 10;
      temp_evaluation = temp_evaluation + (key-'0');
    }
  }
}

//Adicionando uma nova curva no array
void AddCurva(){
  curves = (Curve[])append(curves, new Curve());
  curves[position].setCurrent(false);
  position++;
  for(int i = curves.length - 2; i >= position; i--)
    curves[i+1] = curves[i];
  curves[position] = new Curve();
  curves[position].setCurrent(true);
}

void DeleteCurva(){
  if(curves.length == 1){
    curves[0] = new Curve();
    return;
  }
  
  for(int i = position; i < curves.length-1; i++)
    curves[i] = curves[i+1];
  curves = (Curve[])shorten(curves);
  
  if(position == curves.length)
    position = 0;
  curves[position].setCurrent(true);
}
