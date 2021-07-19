// array til slangens position
//int[] snake = new int[2];

ArrayList<int[]> s = new ArrayList<int[]>();


// array til goodie pos
int[] goodie = new int[2];
// retning slangen kører i
String direction="right";
// fart
int speed=8;
// en score tæller
int score=0;

void setup(){
// sætter størrelsen på canvas og framerate så det ikke går alt for stærkt. Jeg initierer slangen og placerer goodie
  size(600,600);
  gameInit();  
}


void draw(){
  // sætter baggrund så slagens spor og goodies bliver slettet
  background(180,180,180);  
  // vis goodie og snake på canvas. rækkefølgen er vigtig så slangen kører over og ikke under.
  displayGoodie();
  dispaySnake();
  // flytter slangen i retning
  moveSnake();
  // se om vi rammer en goodie
  snakeColsion();
  // test om vi rammer kanten
  ifGameOver();
}

void keyPressed(){
 if (key =='w'){
   if (direction =="down")
     gameOver();
   else
     direction = "up";
  }
 if (key =='s'){
   if (direction == "up")
     gameOver();
 
   else
     direction = "down";
    }
 if (key =='a'){
   if (direction == "right")
     gameOver();
   else
     direction = "left";
 }
 if (key =='d'){
   if (direction == "left")
     gameOver();
   else
     direction = "right";
 }
 if (key ==32)
   noLoop();
   if (key =='t')
   gameInit();
}

void moveSnake(){
  int[] snake = new int[2];
  int[] snake2 = new int[2];
 //<>//
  //s.remove(s.size()-1);
  s.remove(0);
  snake = s.get(s.size()-1);
  
  if (direction == "right"){
  snake2[0]=snake[0]+10;
     snake2[1]=snake[1];
  }
  else if (direction == "left"){
    snake2[0]=snake[0]-10;
    snake2[1]=snake[1];
  }
  else if (direction == "up"){
    snake2[1]=snake[1]-10;
    snake2[0]=snake[0];
  }
  else if (direction == "down"){
    snake2[1]=snake[1]+10;
    snake2[0]=snake[0];
  }
  s.add(snake2);
}

void initSnake(int x, int y){
  int[] coordinates1 = new int[2];
  int[] coordinates2 = new int[2];
  int[] coordinates3 = new int[2];
    
    coordinates3[0]=280;
    coordinates3[1]=y;
    s.add(coordinates3);
    
    coordinates2[0]=290;
    coordinates2[1]=y;
    s.add(coordinates2);
    
    coordinates1[0]=300;
    coordinates1[1]=y;
    s.add(coordinates1);
}

void placeGoodie(){
  int x = int(random(0,width/10));
  int y = int(random(0,height/10));
  goodie[0] = x*10;
  goodie[1] = y*10;
}

void displayGoodie(){
  fill(255,0,0);
  rect(goodie[0],goodie[1],10,10);
}

void dispaySnake(){
  int[] snake = new int[2];
  
  fill(255);
  for (int i=0; i<s.size();i++){
    snake = s.get(i);
    rect(snake[0],snake[1],10,10);
  }
  
}

void ifGameOver(){
  int[] snake = new int[2];
  snake = s.get(0);
  if (snake[0]<0 || snake[0]> width || snake[1]<0 || snake[1]>height){
    gameOver();
  }
}

void gameOver(){
    textSize(32);
    fill(0);
    text("Game Over!",width/2-100,height/2);
    noLoop();
}
  
void snakeColsion(){
  int[] snake = new int[2];  
  snake = s.get(0);
  
if (snake[0]==goodie[0] && snake[1]== goodie[1]){
  s.add(snake); //<>//
  score++;
  println(score);
  speed++;
  frameRate(speed);
  placeGoodie();
  }
}  

void gameInit(){
  s.clear();
  direction="right";
  speed=8;
  score=0;
  loop();
  frameRate(speed);
  initSnake(width/2,height/2);
  placeGoodie();
}

void printList(){
  for (int i=0; i<=s.size()-1;i++){
    println(i,": ");
    println(s.get(i));
  }
  
}
