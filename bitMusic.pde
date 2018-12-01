import processing.sound.*;
SoundFile file;
color rColor = color(120,0,0,191);
String[] music = { "mario2.wav", "mario3.wav", "2.1.wav", "2.2.wav"};
String s = "Jorge";
int index = 0;
String[] fontList;

void setup() {
  size(1000, 700);
  fontList = PFont.list();
  //Music
  index = int(random(music.length));
  println(music[index]);
  println(index);
  file = new SoundFile(this, music[index]);
  file.play();
  if(index == 0){
    println("Stress Color");
    rColor = color(0);
  } else{
    println("Happy Color");
    rColor = color(255, 221, 0);
  }
  
  
  frameRate(8);
}


void draw() {
  background(rColor);
  //Font
  int font_n = int(random(fontList.length));
  PFont f = createFont(fontList[font_n], 64, true);
  textFont(f);
  float x = mouseX;
  float y = mouseY;
  for(int i = 0; i < s.length();i++){
    char c = s.charAt(i);
    fill(random(255), random(255), random(255));
    textSize(random(50,120));
    text(c, x, y);
    x = x+textWidth(c);
    float r = random(-30,30);
    y = y+r;
  }    
}

void mousePressed(){
  file.stop();
  int new_index = int(random(music.length));
  while(index == new_index){
    new_index = int(random(music.length));
  }
  index = new_index;
  println(index);
  println(music[index]);
  file = new SoundFile(this, music[index]);
  file.play();
  //Select background color
  switch(index){
    case 0:
      println("Color stress");
      rColor = color(0);
      break;
    case 1:
      println("Color neutral");
      rColor = color(255);
      break;
    case 2:
      println("Color Happy");
      rColor = color(173,255,2);
      break;
    case 3:
      println("Color Happy");
      rColor = color(1,190,254);
      break;
  }
  //rColor = color(random(255), random(255), random(255));
}
