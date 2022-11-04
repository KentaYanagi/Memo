int x,y,direction;

void setup(){
    size(300,300);
    frameRate(5);
    x=0;
    y=0;
    direction=2;
}

void draw(){
  int i;
  int j;
  int [][] field =
 {{0,1,0,1,1,1,0,0,0,0},
  {0,1,0,0,0,1,1,1,0,1},
  {0,1,1,1,0,1,0,0,0,0},
  {0,0,0,1,0,1,0,1,1,0},
  {1,1,0,1,0,1,0,1,0,0},
  {0,1,0,1,0,0,0,1,0,0},
  {0,1,0,1,0,1,1,1,0,1},
  {0,0,0,1,0,1,0,0,0,1},
  {0,1,1,1,0,1,0,1,1,1},
  {0,0,0,0,0,1,0,0,0,0}};
  for(i=0; i<10; i++){
    for(j=0; j<10; j++){
      if(field[i][j]==1){
        fill(0,0,0);
      }else{
        fill(255,255,255);
      }
      rect(30*j, 30*i, 30, 30);
    }
  }
  
  if(direction==2){
    if(x!=0 && field[y][x-1]==0){
      direction=3;
    }else if(y!=9 && field[y+1][x]==0){
      direction=2;
    }else if(x!=9 && field[y][x+1]==0){
      direction=1;
    }else{
      direction=0;
    }
  }

  else if(direction==3){
    if(y!=0 && field[y-1][x]==0){
      direction=0;
    }else if(x!=0 && field[y][x-1]==0){
      direction=3;
    }else if(y!=9 && field[y+1][x]==0){
      direction=2;
    }else{
      direction=1;
    }
  }

  else if(direction==1){
    if(y!=9 && field[y+1][x]==0){
      direction=2;
    }else if(x!=9 && field[y][x+1]==0){
      direction=1;
    }else if(y!=0 && field[y-1][x]==0){
      direction=0;
    }else{
      direction=3;
    }
  }

  else {
    if(x!=9 && field[y][x+1]==0){
      direction=1;
    }else if(y!=0 && field[y-1][x]==0){
      direction=0;
    }else if(x!=0 && field[y][x-1]==0){
      direction=3;
    }else{
      direction=2;
    }
  }
  
  if(direction==1){
    x++;
  }else if(direction==2){
    y++;
  }else if(direction==3){
    x--;
  }else{
    y--;
  }
  fill(255,0,0);
  rect(30*x, 30*y, 30, 30);
}