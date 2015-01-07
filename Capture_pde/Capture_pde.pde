import processing.video.*;

Capture cam;

void setup() {
  size(900, 800);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("You will be using the base model.");
    PImage img;
    img = loadImage("thezman.png");
    image(img, 0, 0);
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}


//EVERYTHING UNDERNEATH THIS SENTENCE MAKES THE CODE NOT WORK :( IF YOU WERE TO make all the code beneath this go away the
//thing works....but we need this code underneath right so AHh
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  //set(0, 0, cam);
}
