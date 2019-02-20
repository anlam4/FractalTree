private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .4;  
public void setup() 
{   
	size(1200, 480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,480,320,380);   //add more trees, change fractionlength for each, .6, .7, .75, .8 add color
	drawBranches(320,380,100,Math.PI/2); 
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
    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
