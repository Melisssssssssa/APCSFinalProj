import processing.video.*;
Boolean ycam = false;
Capture cam;

void setup() {
  size(900, 800);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("You will be using the base model.");
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
}

void draw() {
    if (ycam == false){
    PImage img;
    img = loadImage("thezman.png");
    image(img, 0, 0);
    }
    if (ycam == true) {
      cam.read();
        image(cam, 0, 0);
    if (keyPressed == true){
      if (key == 'a'){    
        PImage img = get(width,height,width,height); 
        int x = 1;
        if( x > 0){
        saveFrame("Picture-"+x+".png");
        x++;
        }
    }
    }
  }
}

//Allows for us to draw whenever our moude is clicked and drawn
void mouseDragged(){
  
  
}
   


  

