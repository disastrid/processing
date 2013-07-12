Maxim maxim;
AudioPlayer player;
float ratio;
boolean playing;

void setup() 
{
size(512,512);/* setup the size */
background(255);
maxim = new Maxim(this);
player = maxim.loadFile("melody.wav");
player.setLooping(true);
player.volume(0.7);
colorMode(HSB);
}

void draw()
{
  //
}

void mouseDragged() {
  playing = false;
  ratio = 0;
  player.cue(0);
  player.play();
  for (int i = 0; i < height; i++) {
    ratio = (float) mouseX / (float) width;
    ratio *= 2;
    player.speed(ratio);
  }
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 10, 0, 10);
  float grey = 200;
  
  float lineWidth = map(speed, 1, 10, 10, 1);
  lineWidth = constrain(lineWidth, 2, 3);
  //brush7(pmouseX, pmouseY,mouseX, mouseY);
  circle_brush(mouseX, mouseY,speed, speed,lineWidth);
  player.setFilter((float) mouseY/height*5000,mouseX / width);
  stroke(0);
  strokeWeight(1);
  
  //rect(mouseX, mouseY, speed, speed);
  line(pmouseX, pmouseY,mouseX, mouseY);
}

void mousePressed() 
{
  background(255);
  if(player.isPlaying) {
    player.stop();
  }  
}


void line_brush(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  line(px,py,x,y);
  line(width/2+((width/2)-px),py,width/2+((width/2)-x),y);
  return;
}

void circle_brush(float x,float y, float px, float py, float lineWidth) {
  strokeWeight(lineWidth);
  px=px;
  py=py;
  ellipse(x,y,px,py);
  ellipse(width/2+((width/2)-x),y,px,py);
  ellipse(x,height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-x),height/2+((height/2)-y),px,py);
  ellipse(width/2+((width/2)-y),width/2-((width/2)-x),px,py);
  ellipse(height/2-((height/2)-y),width/2-((width/2)-x),px,py);
  ellipse(width/2+((width/2)-y),height/2+((height/2)-x),px,py);
  ellipse(width/2-((width/2)-y),height/2+((height/2)-x),px,py);  
  fill(random(0, 256), random(155, 255), random(150, 255), random(50, 155));
  return;
}

