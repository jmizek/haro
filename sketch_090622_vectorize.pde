void setup(){
/* External variables */
int path[];
int p_index=0;
int state=0;
//int room[] to be defined later
/* End External variables*/
state=1;
if queryUser()==1 //Query user whether or not to create new path; if so, continue to loop
  continue; //or is it break?
state=2;
boolean path_finished=0;
while(!path_finished){
  int userInput = queryUser()
  if queryUser == 1
    path_finished=1;
  else if queryUser == 2
    rewindPath();
  else {
    getNextPathPoint();
    vectorizePath();
  }
}
state=3;
int size[] = createRoom();
/* More external vars */
int room[size[0],size[1]];
boolean covered[size[0],size[1]];
/* End external vars */
state=4;
populateRoom();
} //End of setup

void loop(){
}

void vectorizePath(){
/*
* Vectorize: Takes a path and combines the last two points if they
*   lie on a straight line from the previous point.  The goal here
*   is to reduce the number of points in the path by removing redundancy
*/
  const int margin = 0.2; //the maximum difference in radians between p1/p2 and p2/p3
  if p_index < 2 // Must have at least 3 points to vectorize
    return;
  int p1[] = {path[p_index - 2, 0],path[p_index - 2, 1]};  //The point against which the others are determined
  int p2[] = {path[p_index - 1, 0],path[p_index - 1, 1]};  //The point which may be eliminated
  int p3[] = {path[p_index, 0],path[p_index, 1]};  //The point which may replace p2
  if abs(angle(p1[], p2[]) - angle(p2[],p3[])) < margin {
    path[p_index - 1] = path[p_index];
    p_index--;}
  return;
}

double angle(int p1[], int p2[]){ 
/*
* Angle: Takes two points and returns the angle in radians between them
*/
  x=p2[0]-p1[0];
  y=p2[1]-p1[1];
  return atan(y/x);
}

int sizeRoom(){
/*
* sizeRoom: Takes a path and returns an array containing the
*   dimensions of the room.  The format is [x_tiles, y_tiles].
*   The function should return [0,0] if the room is too large
*   to be stored in memory.  The calling function must check
*   the result for this error.
*/
  int x_min = 0;
  int x_max = 0;
  int y_min = 0;
  int y_max = 0;
  for (int i=0; i<=p_index; i++)
  {
    int x=path[i,0];
    int y=path[i,1];
    if x>x_max
      x_max=x;
    if x<x_min
      x_min=x;
    if y>y_max
      y_max=y;
    if y<y_min
      y_min=y;
   }
   const int cuttingRadius = 8; //cutting radius in inches(?)
   double tileSize = cuttingradius/sqrt(2); //the diagonal of each tile can be no wider than the cutting radius
   int x_tiles = (x_max-x_min)/cuttingRadius; //how many tiles in x direction?
   int y_tiles = (y_max-y_min)/cuttingRadius; //" " " y " ?
   if (x_max-x_min))/cuttingRadius > 0.5
     x_tiles++;
   if (y_max-y_min)/cuttingRadius > 0.5
     y_tiles++;
   int size[] = {x_tiles,y_tiles};
   const int max_size = 1000; //To be based on memory available
   if x_tiles*y_tiles > max_size //Is the room too large?
     size={0,0}; //If so, set room size to 0x0 to alert of error
 return size[];
 }


  createRoom(int[] size){
   
   
