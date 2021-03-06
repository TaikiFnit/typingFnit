// the instance of class
TitleView tv;
GameView gv;
int mode = 0;

color back = color(236, 240, 241);
color front = color(52, 73, 94);
// setting of font
PFont font = createFont("TakaoPGothic", 32);

void setup() {
  size(800, 400);
  colorMode(RGB,256);
  background(back);
  frameRate(15);
  for(int j = 0; j < PFont.list().length; j++) {
   println(PFont.list()[j]); 
  }

  tv = new TitleView();
}

void draw() {
  
  // switch the views(activity)
  switch(mode) {
    case 0: 
      tv.display();
      break;
    case 1:
      gv.display();
      break;      
  }
}

void keyPressed() {
  
    // switch the views(activity)
  switch(mode) {
    case 0: 
      tv.keyPress();
      break;
    case 1:
      gv.keyPress();
      break;      
  }
}
  
  

class TitleView {
  
  // constructer: called on setup
  TitleView () {
    
    // display logo and menu
    fill(front);
    textAlign(CENTER);
    textFont(font, 32);
    text("Fnit Typing for Learn English", 400, 100);
    
    textFont(font, 24);
    text("Press Enter", 400, 250);
    //text("Exit", 400, 300);
  }
  
  void display() {
    
    //triangle(340, 235, 340, 245, 355, 240 );
    
  }
  
  void keyPress() {
    if(key == ENTER) {
      gv = new GameView();
      mode = 1;
    }
  }
}

class GameView {

  String[] en = new String[500];
  String[] jp = new String[500];
  int foucs_question = 0;
  int foucs_character = 0;
  boolean end = false;
  int cnt_type = 0;
  int cnt_success = 0;
  int cnt_miss = 0;
  int cnt_en = 0;
  int cnt_jp = 0;
  String status = "";
  
  // constructer
  GameView() {
    background(back);
    
    String data[] = loadStrings("_3rd_words.txt");

    
    for(int i = 0; i < data.length; i++) { 
      
      if(i % 2 == 0) {
        en[cnt_en++] = data[i];
      }
      else {
        jp[cnt_jp++] = data[i];
      }
    }
    println(en.length);
    foucs_question = (int)random(cnt_en);
  }  

  void display() {
    if(!end) {
      
      smooth();
      fill(front);
      textFont(font, 24);
      textAlign(LEFT);
      
      text("Q : " + foucs_question, 20,50);
      
      text("success : " + cnt_success, 20, 80);
      text("type : " + cnt_type, 20, 110);
      text("miss : " + cnt_miss, 20, 140);

      textAlign(CENTER);
      textFont(font, 32);
      

      
      text(en[foucs_question], 400, 150);
      text(jp[foucs_question], 400, 100);
      
       if(status == "bad") {
         fill(231, 76, 60);
       }
      
      text(en[foucs_question].substring(foucs_character), 400, 200);
      text(en[foucs_question].substring(0, foucs_character), 400, 300);
      
       
      
      if(status == "good") {
        
        
        fill(46, 204, 113);
        text(status, 700, 50);
      }
      else if(status == "bad") {
         fill(231, 76, 60);
        text(status, 700, 50);
      }
      
    }
  }

  void keyPress() {
      if(!end) {

      if(key == en[foucs_question].charAt(foucs_character)) {
        foucs_character++;
        cnt_type++;
        status = "good";

        if(en[foucs_question].length() <= foucs_character) {

          foucs_character = 0;
          foucs_question = (int)random(cnt_en);
          cnt_success++;
          
          
          if(en.length <= foucs_question) {
            background(back);
            textAlign(CENTER);
            fill(front);
            text("Complete!", 400, 100);
            end = true;
            return;
            }
          
          }

      } else if(key == ENTER) {
        foucs_character = 0;
        foucs_question = (int)random(cnt_en);
      }
      else {
       cnt_miss++; 
       status = "bad";
      }
      
      background(back);
      display();
    }
  }
}

class helpView {
  
}