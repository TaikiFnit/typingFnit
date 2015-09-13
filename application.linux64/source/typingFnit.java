import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class typingFnit extends PApplet {

String questions[] = {"fnit", "taiki"};
int foucs_question = 0;
int foucs_character = 0;
boolean end = false;
int back = color(63,81,181);

public void setup() {
  
  colorMode(RGB,256);
  background(back);
  frameRate(15);
  
  // setting of font
  PFont font = createFont("Noto Sans", 32);
  textFont(font, 24);
  
  display();
}

public void draw() {

}

public void keyPressed() {
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
  

public void display() {
  textAlign(CENTER);
  fill(255,255,255);
  text(questions[foucs_question].substring(foucs_character), 200, 200);
}

  public void settings() {  size(400, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "typingFnit" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
