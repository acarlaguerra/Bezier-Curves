//Classe para definir os pontos de controle
//declaramos aqui o x, y e o raio do ponto
class ControlPoint{ 
  float x, y, radius;
  
//iniciando os valores de x, y e o raio
  ControlPoint(float x1, float y1){
    x = x1;
    y = y1;
    radius = 10;
  }
  
//calculando a interpolação de pontos
  ControlPoint(ControlPoint p0, ControlPoint p1, float t){
    x = (1-t)*p0.x + t*p1.x;
    y = (1-t)*p0.y + t*p1.y;
  }
  
//atualizando as novas corrdenadas do ponto
  void UpdateCoord(float Updx, float Updy){
    x = Updx;
    y = Updy;
  }

//printa o ponto na tela e muda a cor para uma nova curva
  void display(boolean is_current){
    
    if(is_current)
      fill(#DB1F48);
    else
      fill(200);
    
    circle(x, y, radius);
  }
  
//função para identificar se está dentro desse 
  boolean is_inside(){
    float dx = mouseX-this.x;
    float dy = mouseY-this.y;
    return dx*dx + dy*dy <= radius * radius;
  }
    
}
