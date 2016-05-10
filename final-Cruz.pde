//Final CST 112. 
//Abel Cruz.
//Array of people.



Button[] buttons;
String buttonN[]={
"Tallest", "Widest", "Random", "Quit","Raise"
};
int amoButtons= buttonN.length;
People[] persons;

String personN[]= { 
  "A", "B", "C", "D", 
  "E", "F", "G", "J",
  "K","L","M"
};
int amoPersons= personN.length;
float horizon;

void setup() {


  size (750, 550);
  horizon=height-100;
  makebuttons();
  makepersons();
}
void scene(){
 background(255,255,255);
}
void reset() {
     for (int i=0; i<amoPersons; i++){
       persons[i]=new People(personN[i]);
     }
}
void makebuttons() {
  buttons=  new Button[amoButtons];
  float x=width/8, y=height/12;
  for (int j=0; j<amoButtons; j++ ) {
    buttons[j]=  new Button( x, y, buttonN[j] );
    x += 100;
  }
}
void makepersons() {
  persons=  new People[amoPersons];
  float x=10, y=horizon;
  for (int j=0; j<amoPersons; j++ ) {
    persons[j]=  new People( personN[j] );
    x += 90;
  }
}

void place() {
  float x=100, y=horizon;
  fill( 50 );
  text( "Weight", 2, horizon+55 );
  text( "Height", 2, horizon+40 );
  text( "Age", 2, height/2 );
  text( "Salary", 2, 15+height/2 );
  for (int j=0; j<personN.length; j++ ) {
    persons[j].show( x, y );
    x=  x + 60;
  }
}

void draw() {
  scene();
  place();
  msgs();
  buttons();
}
void keyPressed() {
  if (key == 'q') exit();
  if (key == 'r') reset();
  if (key == 't') tall( persons, amoPersons );
  if (key == 'w') wide( persons, amoPersons );
  //if (key == 's') raise(persons, amoPersons);
}
void mousePressed() {

  if ( buttons[0].click(mouseX, mouseY) ) { 
     tall( persons, amoPersons );
    return;
  }
  if ( buttons[1].click(mouseX, mouseY) ) { 
   wide( persons, amoPersons );
    return;
  }
  if ( buttons[2].click(mouseX, mouseY) ) { 
    reset();
    
    return;
  }
  if ( buttons[3].click(mouseX, mouseY) ) { 
   exit();
    return;
  }
  /*if ( buttons[4].click(mouseX, mouseY) ) { 
   raise(persons, amoPersons);
    return;
  }*/
  
}
/*void raise( People[] p, int m ) {    
  
  for (int j=0; j<m; j+=1) {
    if (p[j].s < 25000);{
      p[j].s=p[j].s*1.2;}
      else if (p[j].s >= 25000 && p[j].s  <=50000) {
        p[j].s=p[j].s*1.15;}
        else if (p[j].s >= 50001 && p[j].s  <=75000 ){
        p[j].s=p[j].s*1.10;}
        else if (p[j].s > 75000){
        p[j].s=p[j].s*1.05;}
  }
  }
*/
  

void tall( People[] p, int m ) {
    //// Move tallest to end.
    int k=0;
    // Find tallest
    for( int j=1; j<amoPersons; j++ ) {
      if (p[j].h > p[k].h) {
        k=j;
      }
    }  
    
    // Move it to end (swap).
    People save;
    save=  p[m-1];
    p[m-1]=  p[k];
    p[k]=  save;
}
  void wide( People[] p, int m ) {
    //// Move tallest to end.
    int k=0;
    // Find tallest
    for( int j=1; j<amoPersons; j++ ) {
      if (p[j].w > p[k].w) {
        k=j;
      }
    }  
    
    // Move it to end (swap).
    People save;
    save=  p[m-1];
    p[m-1]=  p[k];
    p[k]=  save;
}
  void buttons() {
  for (int j=0; j<buttonN.length; j++) {
    buttons[j].show();
  }
}
class Button {
  float x, y;
  float w=80, h=30;
  String name;
  float r=167, g=30, b=30;

  Button( float x, float y, String s ) {
    this.x=x;
    this.y=y;
    this.name=  s;
  }

  void show() {
    rectMode(CORNER);
    stroke(0);
    fill(r, g, b);
    rect( x, y, w, h );
    fill(255,255,255);
    text( name, x+w/4, y+h/2 );
  }
  boolean click( float xx, float yy ) {
    if (xx < x)   return false;
    if (xx > x+w) return false;
    if (yy < y)   return false;
    if (yy > y+h) return false;
    return true;
  }
}
class People {
  float x, y;
  float w, h,a,s;
  String name="?";
  float r=random(0, 255), g=random(0, 255), b=random(0, 255);
  int num;
  People ( String who ) {
    a=  random(1, 99);//age
    s=  random(1000,100000);//salary
    w=  random( 15, 50 );//width
    h=  random( 20, 100 );//height
    name=  who;
  }

  //Display
  void show( float x, float y ) {
    fill( r, g, b );
    rectMode( CENTER );
    rect( x, y-h/2, w, h,25 );
    rect( x, y-h, w/2, h/4,25 );
    stats( x, y );
  }
  void stats( float x, float y ) {
    // Name

    fill(r, g, b);
    text( name, x, y+20 );
    text( int(w), x, y+35 );
    text( int(h), x, y+50 );
    text( int(a), x, height/2 );
    text( int(s), x, 15+height/2 );
    text( "$", x-10, 15+height/2 );
    fill(0, 0, 0);              
    text( name, x-w/4, y-h/2 );
  }
  
}  

void msgs(){
String title= "Final";
String t=  "Press 't' key to move tallest to end.";
String w=  "Press 'w' key to move widest to end.";
String r=  "Press 'r' key to random.";
String q=  "Press 'q' key to quit.";
String author=  "Abel Cruz, CST112";
fill (0);
  textSize(20);
  text (title, width/2, height/5 );
  textSize(12);
  text (t, width/3, height/4 );
  text (w, width/3, height/4+15 );
  text (r, width/3, height/4+30 );
  text (q, width/3, height/4+45 );
  fill(255,0,0);
  textSize(14);
  text (author, 10, height -10 );
}
