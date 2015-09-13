String questions[] = {"fnit", "taiki"};
int foucs_question = 0;
int foucs_character = 0;
boolean end = false;
color back = color(63,81,181);

void setup() {
  size(400, 400);
  colorMode(RGB,256);
  background(back);
  frameRate(15);
  
  // setting of font
  PFont font = createFont("Noto Sans", 32);
  textFont(font, 24);
  
  display();
}

void draw() {

}

void keyPressed() {
  if(!end) {
  if(key == questions[foucs_question].charAt(foucs_character)) {
      foucs_character++;
      
      if(questions[foucs_question].length() <= foucs_character) {
        foucs_character = 0;
        foucs_question++;
        
        if(questions.length <= foucs_question) {
          background(back);
            textAlign(CENTER);
            fill(255,255,255);
            text("Complete!", 200, 200);
            end = true;
            return;
        }
      }
      
      background(back);
      display();
    }
  }
}
  

void display() {
  textAlign(CENTER);
  fill(255,255,255);
  text(questions[foucs_question].substring(foucs_character), 200, 200);
}
