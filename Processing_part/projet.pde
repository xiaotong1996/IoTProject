int height = 800;
int width = 800;
int sizeSquare = 40;
int mapSize = height/sizeSquare;
int[][] myMap = new int[mapSize][mapSize];
float startPointX = 0;
float startPointY = 0;
int playerDirX = 0;
int playerDirY = 0;
float playerX = sizeSquare *1.5;;
float playerY = sizeSquare *1.5;;
int sizePlayer =10;
float playerLastX = 0;
float playerLastY = 0;
int wallweight = 4;
float moveSpeed = 4;
void setup()
{
    size(800,800);
    
    initMap();
    startPointX = sizeSquare *1.5;
    startPointY = sizeSquare *1.5;
    //player start point
    myMap[1][1] = 0;
    ellipse(startPointX, startPointX, sizePlayer, sizePlayer);
}

void draw()
{
  //rect(float(0), float(0), sizeSquare,sizeSquare);
    clear();
    background(255);
    drawMap();
    moveMentPlayer();
}

void drawMap()
{
    for(int i = 0; i < mapSize; ++i)
    {
      for(int j = 0; j < mapSize; ++j)
      {
         if(myMap[i][j] == 1)//wall
         {
           fill(82, 139, 139);
           rect(float(i*sizeSquare), float(j*sizeSquare), sizeSquare,sizeSquare);
           
         }
         else if(myMap[i][j] == 2)//wall can be broken
         {
           fill(143, 188 ,143);
           rect(float(i*sizeSquare), float(j*sizeSquare), sizeSquare,sizeSquare);
         }
      }
    }
}


void initMap()
{
    for(int i = 0; i < mapSize; ++i)
    {
      for(int j = 0; j < mapSize; ++j)
      {
        int tmp = int(random(10));
        if(tmp < wallweight)
          myMap[i][j] = 1;
        if(i == 0|| j == 0|| i == mapSize-1 || j == mapSize-1)
            myMap[i][j] = 2;
      }
    
    }
}

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
        playerDirY = -1;
    } 
    else if (keyCode == DOWN) {
       playerDirY = 1;
    } 
    else if (keyCode == LEFT) {
       playerDirX = -1;
    } 
    else if (keyCode == RIGHT) {
       playerDirX = 1;
    } 
  } 
  
}

void keyReleased()
{
  if (key == CODED) {
    if (keyCode == UP) {
       playerDirY = 0;
    } 
    else if (keyCode == DOWN) {
       playerDirY = 0;
    } 
    else if (keyCode == LEFT) {
       playerDirX = 0;
    } 
    else if (keyCode == RIGHT) {
       playerDirX = 0;
    } 
  } 
  
}

void moveMentPlayer()
{
  
  playerX += playerDirX*moveSpeed;
  playerY += playerDirY*moveSpeed;
  
  //calculate for the map index
  int i = int(playerX+playerDirX*sizePlayer/2)/sizeSquare;
  int j = int(playerY+playerDirY*sizePlayer/2)/sizeSquare;
  //collider test
  if(myMap[i][j] != 0 )
    {
      playerX = playerLastX;
      playerY = playerLastY;
    }
  ellipse(playerX, playerY, sizePlayer, sizePlayer);
  playerLastX = playerX;
  playerLastY = playerY; 
}
