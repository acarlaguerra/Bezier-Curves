//Classe para definir a curva
//Temos um array de pontos, avaliações e 
// um booleano para saber definir a curva atual
class Curve{
  ControlPoint[] points;
  int evaluation;
  boolean is_current;

//a avaliação atual será igual à avaliação declarada na outra classe
//Iniciamos a array com um ponto vazio
//Como estamos criando uma nova curva, ela é a atual que estamos editando
  Curve(){
    this.evaluation = max_evaluation;
    points = new ControlPoint[0];
    is_current = true;
  }

//adicionando novos pontos
  void AddPoint(ControlPoint p){
    this.points = (ControlPoint[])append(this.points, p);
  }

//deletando algum ponto
  void DeletePoint(int index){
    for(int i = index; i < points.length-1; i++){
      points[i] = points[i+1];
    }
    points = (ControlPoint[])shorten(points);
  }
  
//garante que estamos usando a curva atual
  void setCurrent(boolean flag){
    is_current = flag;
  }

//define o numéro de avaliações possíveis e limita o seu valor máximo
  void setEvaluation(int num){
    if(num <= 0)
      evaluation = 1;
    else if(num >200)
      evaluation = 200;
    else
      evaluation = num;
  }
  
//define qual display queremos usar no momento
  void display(){
    if (points == null || points.length == 0)
      return;
      
     if(to_view_pt)
        this.display_pt();
     if(to_view_pg)
        this.display_pg();
     if(to_view_cv)
        this.display_cv();
  }
  
  void display_pt(){
    for(ControlPoint p : points)
      p.display(is_current);
  }
  
  void display_pg(){
    if(is_current)
      stroke(#01949A);
    else
      stroke(200);
      
    for(int i = 1; i < points.length; i++)
      line(points[i].x, points[i].y, points[i-1].x, points[i-1].y);
  }
  
//printa as curvas usando o algoritmo de DeCastejaul de maneira iterativa
  void display_cv(){
    ControlPoint[] curve = new ControlPoint[evaluation + 1];
    curve[0] = points[0];
    ControlPoint[] aux = new ControlPoint[points.length];
    float t;
    for(int itr = 1; itr <= evaluation; itr++){
      arrayCopy(points, aux);
      t = ((float)itr)/evaluation;
        for(int level = 1; level <= points.length; level ++){
          for(int pt = 0; pt < points.length - level; pt++){
            aux[pt] = new ControlPoint(aux[pt], aux[pt+1], t);
          }
        }
        
        curve[itr] = aux[0];
    }
    
    if(is_current)
      stroke(#004369);
    else
      stroke(200);
    for(int i = 0; i < evaluation; i++)
      line(curve[i].x, curve[i].y, curve[i+1].x, curve[i+1].y);
  }
    
}
