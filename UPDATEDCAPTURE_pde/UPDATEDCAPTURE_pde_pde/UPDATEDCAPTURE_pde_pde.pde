import processing.video.*;
Boolean ycam = false;
Boolean readytobut;
Boolean UsedCam = false;
Capture cam;
//Button Information
int x,y,w,h;
int x2,y2,w2,h2;
int x3,y3,w3,h3;
int x4,y4,w4,h4;
int x5,y5,w5,h5;
int x6,y6,w6,h6;
int x7,y7,w7,h7;
color rectColor,rectHighlight,currentColor;
boolean rectOver = false;
boolean rectOver2 = false;
boolean rectOver3 = false;
boolean rectOver4 = false;
boolean rectOver5 = false;
boolean rectOver6 = false;
boolean rectOver7= false;
boolean blushify= false;
boolean maskify= false;
boolean magic = false;
PImage poop;
PImage crown;
PImage tophat;
PImage bow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  background(255,255,159);
  size(500, 710);
  
  poop = loadImage("poop.jpg");
  crown = loadImage("crown.png");
  tophat = loadImage("hat.jpg");
  bow = loadImage("bow.jpg");
  


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
  rectHighlight = color(152,179,42);
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
  x4= 20;
  y4=590;
  w4=80;
  h4=30;
  x5=20;
  y5=630;
  w5=80;
  h5=30;
  x6=20;
  y6=670;
  w6=80;
  h6=30;
  x7=200;
  y7=590;
  w7=80;
  h7=30;
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
      PImage partialSave=get(0,0,500,710);
      partialSave.save("Picture.png");
      
    }
    //Opens the picture just taken
    if ((keyPressed == true) && (ycam == true)){
      if(key == 'a'){
        UsedCam = true;
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
    if (magic == true){
      float r = random(0,4);
      
      if (r == 0){
        image(poop, 205, 100, width/3, height/3);
      }
      if (r == 1){
        image(tophat, 205 ,100, width/3, height/3);
      }
      if (r == 2){
        image(crown, 205 ,100, width/3, height/3);
      }
      if (r == 3){
         image(bow, 205 ,100, width/3, height/3);
      }
    }

    
    
      
      
    
    
    
    
    
  //Buttoncolor drawing
    if (readytobut==true){
      strokeWeight(1);
      fill(130,166,68);
      text("Filters",25,547);
      text("Makeup",205,547);
  //Draws boxes and highlights them when mouse is on top
     if (rectOver) {
       fill(rectHighlight);
     } else {
        fill(rectColor);
     }
     stroke(255);
     rect(x, y, w, h);

//button remains highlighted if blush is pressed
     if (blushify==false){
      if (rectOver2){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x2,y2,w2,h2);}
     
     if (blushify==true){
       fill(rectHighlight);
       stroke(255);
      rect(x2,y2,w2,h2);}
     
      if (rectOver3){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x3,y3,w3,h3);
   
     if (rectOver4){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x4,y4,w4,h4);
     
     
   if (rectOver5){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x5,y5,w5,h5);
     
     
  if (rectOver6){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x6,y6,w6,h6);
 //maskify remains highlighted if pressed
  if (maskify==false){
  if (rectOver7){
       fill(rectHighlight);
     }else{
       fill(rectColor);
     }
     stroke(255);
     rect(x7,y7,w7,h7);}
     else{
       fill(rectHighlight);
       rect(x7,y7,w7,h7);
     }
    
//button labeling
     fill(255,255,255);
     text("Invert",25,572);
     text("Posterize",25,613);
     text("Grey",25,649);
     text("Original",25,689);
     text("Blush",205,572);
     text("Mascara",205,613);
     text("Magic", 405,572);
   
    
   }
   
   //Blush Drawing Code
   if (blushify==true){
     strokeWeight(20);
     stroke(255,111,140,5);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
   }

  //Mascara Drawing Code
  if (maskify==true){
       strokeWeight(1);
     stroke(0,0,0,50);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
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

  if (overRect4(x4,y4,w4,h4)){
    rectOver4 = true;
}
else { rectOver4= false;
}

  if (overRect5(x5,y5,w5,h5)){
    rectOver5 = true;
}
else { rectOver5= false;
}

  if (overRect6(x6,y6,w6,h6)){
    rectOver6 = true;
}
else { rectOver6= false;
}

  if (overRect7(x7,y7,w7,h7)){
    rectOver7 = true;
}
else { rectOver7= false;
}

}



////////////////////////////////////////////////////////////////////////////////////////////////////////////
//What happens when button is clicked
void mousePressed(){
  if (rectOver){
    filter(INVERT);
  }
  
    if (rectOver2){
      if (blushify== false){
        blushify = true;
        maskify=false;}
        
      else if(blushify == true){
        blushify = false;
      }
      }
  
    if (rectOver3){
      magic = true;
      
    
  }
  
      if (rectOver4){
    filter(POSTERIZE, 4);
  }
  
      if (rectOver5){
    filter(GRAY);
  }
  
        if (rectOver6){
      if (ycam==false){
      PImage img;
      img = loadImage("thezman.png");
          image(img, 0, 0);}
      if (UsedCam==true) {
      PImage img;
      img = loadImage("Picture.png");
          image(img, 0, 0);}
  }
  
        if (rectOver7){
    if (maskify== false){
        maskify = true;
        blushify= false;}
        
      else if(maskify == true){
        maskify = false;
      }
  }
  
}
///////////////////////////////////////////////////////////////////////////////////////////////////////
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

boolean overRect4(int xe, int ye, int we, int he){
  if (mouseX>x4 && mouseX <x4+w4 && mouseY>y4 && mouseY <y4+h4){
    return true;}
    else{
      return false;
    }
}

boolean overRect5(int xe, int ye, int we, int he){
  if (mouseX>x5 && mouseX <x5+w5 && mouseY>y5 && mouseY <y5+h5){
    return true;}
    else{
      return false;
    }
}

boolean overRect6(int xe, int ye, int we, int he){
  if (mouseX>x6 && mouseX <x6+w6 && mouseY>y6 && mouseY <y6+h6){
    return true;}
    else{
      return false;
    }
}

boolean overRect7(int xe, int ye, int we, int he){
  if (mouseX>x7 && mouseX <x7+w7 && mouseY>y7 && mouseY <y7+h7){
    return true;}
    else{
      return false;
    }
}

