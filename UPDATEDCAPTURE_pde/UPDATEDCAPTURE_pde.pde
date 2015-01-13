import processing.video.*;
Boolean ycam = false;
Boolean readytobut;
Capture cam;
//Button Information
int x,y,w,h;
int x2,y2,w2,h2;
int x3,y3,w3,h3;
color rectColor,rectHighlight,currentColor;
boolean rectOver = false;
boolean rectOver2 = false;
boolean rectOver3 = false;


////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  background(255,217,90);
  size(500, 710);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    PImage img;
    img = loadImage("thezman.png");
    image(img, 0, 0);
    textSize(15);
    fill(0,102, 153);
    text("You will be using the base model. Edit as you please.", 50, 530);
    readytobut = true;
  } else {
    println("Available cameras:");
    ycam = true;
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
  //Button Basics
  rectColor = color(255,153,102);
  rectHighlight = color(51);
  x = 20;
  y=550;
  w=80;
  h=30;
  x2= 200;
  y2=550;
  w2=80;
  h2=30;
  x3=400;
  y3=550;
  w3=80;
  h3=30;
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  update(mouseX, mouseY);
    if (ycam == true){
      readytobut=false;
      cam.read();
      textSize(15);
      image(cam, 0, 0);
      fill(0,102, 153);
      text("SMILE! Press 'a' To Take a Picture!", 130, 510);
      
    //Takes the partial picture
    if (keyPressed == true){
      PImage partialSave=get(0,0,500,470);
   //   PImage img = get(width,height, width, height);
      partialSave.save("Picture.png");
      
    }
    //Opens the picture just taken
    if ((keyPressed == true) && (ycam == true)){
      if(key == 'a'){
        ycam = false;
        PImage img;
        img = loadImage("Picture.png");
        image(img,0,0);
        textSize(15);
        fill(0,102, 153);
        text("Looking like a hot pixelated beast. Edit yourself as you please.", 20, 530);
        readytobut=true;
      }
      
     }
    }
  //Buttoncolor drawing
    if (readytobut==true){
      text("Filters",25,547);
     if (rectOver) {
       fill(rectHighlight);
     } else {
        fill(rectColor);
     }
     stroke(255);
     rect(x, y, w, h);
     
     if (rectOver2){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x2,y2,w2,h2);
     
      if (rectOver3){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x3,y3,w3,h3);
     fill(0);
     text("Invert",25,570);
   }
    
   }

////////////////////////////////////////////////////////////////////////////////////////////////////////////
//updates color of buttons
void update(int x, int y){
  if (overRect(x,y,w,h)){
    rectOver = true;
}
else { rectOver= false;
}

  if (overRect2(x2,y2,w2,h2)){
    rectOver2 = true;
}
else { rectOver2= false;
}

  if (overRect3(x3,y3,w3,h3)){
    rectOver3 = true;
}
else { rectOver3= false;
}

}



////////////////////////////////////////////////////////////////////////////////////////////////////////////
//What happens when button is clicked
void mousePressed(){
  if (rectOver){
    filter(INVERT);
    text("struddlee",20,600);
  }
  
    if (rectOver2){
    text("lmao",200,600);
  }
  
    if (rectOver3){
    text("rofl",300,600);
  }
  
  
}

//Is the mouse on top of the button
boolean overRect(int xe, int ye, int we, int he){
  if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h){
    return true;}
    else{
      return false;
    }
}

boolean overRect2(int xe, int ye, int we, int he){
  if (mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2){
    return true;}
    else{
      return false;
    }
}

boolean overRect3(int xe, int ye, int we, int he){
  if (mouseX>x3 && mouseX <x3+w3 && mouseY>y3 && mouseY <y3+h3){
    return true;}
    else{
      return false;
    }
}


