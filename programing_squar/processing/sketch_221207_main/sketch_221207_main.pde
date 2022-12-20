import processing.sound.*;
SoundFile soundfile;
int n0bj = 10;
int[] ox = new int[n0bj]; //object lefttop x object_x
int[] oy = new int[n0bj]; //object_y
int cx; //car lefttop x car_x
int[] t = new int[n0bj]; //time from start time of an object dropping
float time; //play_time
float highScore = 0; //highScore
int phrame; //total_phrame
int[] oWait = new int[n0bj]; //make randomcy
int[] carcolor = {255, 255, 255};

int speed = 10;//dropping speed
int ow = 30;//object_width
int oh = 30;//objext_height
int cw = 30;//car_width
int ch = 30;//car_height
int car_number = 0;
int[] crashed_car_situation = new int[n0bj];

int level = 1;
float game_time_level = 10.0;
float remain_time;
int remain_time_label_height = 20;
int game_status;
int previous_game_status;
int game_clear_time;
int game_over_time;

PImage img;


void setup() {

  size(400,400);
  phrame = 0;
  time = 0;
  game_status = 4;
  soundfile = new SoundFile(this, "super_mario_bros_theme.mp3");
  soundfile.loop();
  img = loadImage("Mario01.jpg");
  frameRate(speed*level);
}

void draw() {
  phrame = phrame + 1;
  if(game_status ==  0) {
    //reset
    game_clear_time = 0;
    game_over_time = 0; 
    if(previous_game_status==4){
      for (int i = 0; i < n0bj; i++) {
        t[i]= 0;
        ox[i] = int(random(width - ow));
        oWait[i] = int(random(0,50));
      }
    }    
    previous_game_status = game_status;
    image (img,0,0, width, height);
    carcolor[0] = 255;
    carcolor[1] = 255;
    carcolor[2] = 255;
        
    for (int i = 0; i < n0bj; i++) {  //draw all the objects
      t[i]++;
      oy[i] = speed * (t[i] - oWait[i]);
      //refresh(top-buttom)
      if (oy[i] > height) {
        t[i] = 0;
        ox[i] = int(random(width - ow));
        oWait[i]= int(random(10,50));
      }
      fill(255,255,255);
      rect(ox[i], oy[i], ow, oh);
            
      //car
      cx = mouseX;
      if ((cx + cw)> width) {
        cx = width - cw;
      }
      fill(carcolor[0], carcolor[1], carcolor[2]);
      rect(cx, width - ch, cw, ch);
            
      // play_timer
      time =(float)phrame / speed;
      textSize(20);
      fill(0,0,0);
      remain_time = game_time_level - time;
      text("Remain Time:" + remain_time + "[sec]",0,remain_time_label_height); 
            
      // waiting car
      for (int j = 0; j < car_number; j++) {
        fill(0,0,255);
        rect(1 +j * 33, remain_time_label_height + 3, cw, ch);
      }
      //showlevel
      textSize(20);
      fill(0,0,0);
      text("Level:" + level,0,70);
      //crash judge
      if (ox[i] < cx + cw && ox[i] + ow > cx) {
        if (oy[i]+ oh > height - ch && oy[i] < height) {
          carcolor[0] = 255;
          carcolor[1] = 0;
          carcolor[2] = 0;

          game_status = 2;
        }
      }
    }
    if (remain_time <= 0){
      game_status = 1;
    }
  }
    
  if (game_status ==  1) {
    if (game_clear_time <= 20) {
      background(200, 200, 200);
      textSize(40);
      fill(255,0,0);
      text("Game Clear",100,200);
      text("Level:" + level,100,250);   
      game_clear_time++;
    }
    else
    {
      level++;
      game_status = 3;
    }
  }
    
  if (game_status ==  2) {
    if (game_over_time <= 20) {
      background(0,0,0);
      textSize(40);
      fill(255,0,0);
      text("Game Over",100,200);
      game_over_time++;
    }
    else
    game_status = 3;
  }
    
  if (game_status ==  3) {
    background(0,0,0);
    textSize(40);
    fill(255,0,0);
    text("Replay: Press Right",60,200);
    text("Finish: Press Left",60,250);
    if (keyCode ==  RIGHT) {
      game_status = 4;
    }
    if (keyCode ==  LEFT){
      game_status = 10;
    }
  }
    
  if (game_status ==  4) {
    background(200,200,200);
    textSize(40);
    fill(255,0,0);
    text("ARE YOU READY ? ",60,200);
    text("To Start: Press UP",60,250);
    previous_game_status = game_status;
    if (keyCode ==  UP) {
      game_status = 0;
      phrame = 0;
    }
  }
  if (game_status ==  10)
  background(0,0,0);
    
}
