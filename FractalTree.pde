private double fractionLength = .6; 
private int smallestBranch = 10; 
private double branchAngle = .4;  
public void setup() 
{   
	size(1360, 480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(206, 103, 0);
  line(80,480,80,410);      //tree1
  line(250,480,250,400);    //tree2
  line(560,480,560,390);    //tree3
	line(1050,480,1050,380);  //tree4
	drawBranches(80,410,70,Math.PI/2);  //tree1
  fractionLength = .7;
  drawBranches(250,400,80,Math.PI/2);  //tree2
  fractionLength = .75;
  drawBranches(560,390,90,Math.PI/2);  //tree3
  fractionLength = .8;
  drawBranches(1050,380,100,Math.PI/2);  //tree4
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle - branchAngle;
  double angle2 = angle + branchAngle;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(y - branchLength*Math.sin(angle1));
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(y - branchLength*Math.sin(angle2));
  if(branchLength <= smallestBranch) 
  {
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
  }
  else
  {
    stroke(0,255,0);
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
