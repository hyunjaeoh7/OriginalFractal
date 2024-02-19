color col1 = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
color col2 = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
Fish ok = new Fish(-1080, -175, PI/2, 12, col1, col2);// the fish thing

public void setup(){//setup stuff blah blah
  size(500, 500);
  background(47, 147, 247);
  frameRate(29);
}

public void draw(){
  background(47, 147, 247);//resets the canvas before every draw()
  if(ok.gsize() == 1 && ok.gx() == 200 && ok.gy() == 230){// if the big fish is same size as small fish then end the function
    ok = new Fish(-1080, -175, PI/2, 12, ok.gtail(), ok.gbody());//resets the fish
    redraw();//recurses the draw function i guess
  }
  if(ok.grot() == 0){//when the mouth closes the fish starts shrinking and going to the same
  //position as smallFish
    if(ok.gsize() > 1){//decreases the size
      ok.ssize(ok.gsize() - 0.09);
    } else {
      ok.ssize(1); //if the size is less than 1 then it is just set to 1
    }
    
    if(ok.gx() < 200){//pretty much same as the size one
      ok.sx(ok.gx() + 10.45);
    } else {
      ok.sx(200);
    }
    
    if(ok.gy() < 230){//same as size and x
      ok.sy(ok.gy() + 3.31);
    } else {
      ok.sy(230);
    }
  } else {//if mouth hasn't finished closing yet
    ok.smallFish();//draws smaller fish
    if(ok.grot() > 0){//decerase rot(the rotation of the mouth
      ok.srot(ok.grot() - PI/100);
    } else {//if its less than 0 just set it to 0
      ok.srot(0);
    }
  }
  ok.bigFish(ok.gx(), ok.gy(), ok.grot(), ok.gsize());//draw the big fish
}

public class Fish {//x and y are
  //the coords of the top left corner of the rect that makes the body, rot is rotation
  //size is the multiplier of the fish, so how much bigger it is compared to smallFish()
  float x, y, rot, size;
  color btail, bbody, stail, sbody; //random colors for the tail/head and body of the small/big fish
  Fish(float xs, float ys, float r, float s, color st, color sb){//constructor, declare & initialize mem vars
    x = xs;
    y = ys;
    rot = r;
    size = s;
    stail = st;
    sbody = sb;
    btail = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    bbody = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
  }
  
  //fish(x, y, rot, size);//recurse

  public void smallFish(){
    fill(stail); // first part is smaller fish
    triangle(210, 260, 180, 220, 180, 300);//tail
    fill(sbody);
    rect(200, 230, 90, 60, 47);//body
    fill(stail);
    triangle(280, 218, 280, 270, 320, 270);//upper mouth
    triangle(280, 270, 280, 295, 320, 270);//lower mouth
    fill(0);
    ellipse(292, 255, 7, 7);//eye
  }
  
  public void bigFish(float x, float y, float rot, float size){//arguments are same as in fish()
    fill(btail);//bigger fish
    triangle(x + (size*10), y + (30*size), x - (size*20), y - (size*10), x - (size*20), y + (size*70));//tail
    fill(bbody);
    rect(x, y, 90 * size, 60 * size, 47);//body
    
    translate(x + (size*80), y + (size*40));//translate to where the right angles of the mouth triangles meet
    rotate(-(rot));//rotate ccw for the upper mouth
    fill(btail);
    triangle(0, -size*52, 0, 0, size*40, 0);//upper mouth
    fill(0);
    ellipse(size*12, -size*15, 7*size, 7*size);//eye
    rotate(2*rot);//rotate cw twice for the lower mouth
    fill(btail);
    triangle(0, 0, 0, size*25, size * 40, 0);//lower mouth
    rotate(-(rot));//rotate back to normal
    translate(-(x + (size*80)), -(y + (size*40)));//translate back to normal
  }
  
  public float gx(){//getter and setter functions
    return x;
  }
  
  public float gy(){
    return y;
  }
  
  public float grot(){
    return rot;
  }
  
  public float gsize(){
    return size;
  }
  
  public color gtail(){
    return btail;
  }
  
  public color gbody(){
    return bbody;
  }
  
  public void sx(float inp){
    x = inp;
  }
  
  public void sy(float inp){
    y = inp;
  }
  
  public void srot(float inp){
    rot = inp;
  }
  
  public void ssize(float inp){
    size = inp;
  }
}
