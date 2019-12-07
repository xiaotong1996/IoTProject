import processing.net.*;

Client c;

boolean hasInitaled=false;

String input;
int data[];

int height = 800;
int width = 800;
int sizeSquare = 40;

Player player;

int mapSize = height/sizeSquare;
int[][] myMap = new int[mapSize][mapSize];

int wallweight = 4;
float moveSpeed = 4;

//player1's image
String url = "https://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/0e2442a7d933c89584b13984d01373f083020005.jpg";


void setup()
{
    size(800,800);
    
    c = new Client(this, "127.0.0.1", 12345); // Replace with your server's IP and port
    
    
    //initMap();

    player=new Player(sizeSquare,url,sizeSquare *1.5,sizeSquare *1.5);

    //player start point
    myMap[1][1] = 0;
    
    player.render();
}

void draw()
{
  //rect(float(0), float(0), sizeSquare,sizeSquare);
    clear();
    background(255); //<>//
    
    
    if (c.available() > 0&& !hasInitaled) {
      input = c.readString();
      input = input.substring(0, input.indexOf("\n")); // Only up to the newline
      data = int(split(input, ' ')); // Split values into an array
      for(int i = 0; i < mapSize; ++i)
      {
        for(int j = 0; j < mapSize; ++j)
        {
          myMap[i][j] = data[i*mapSize+j];
        }
      }
      hasInitaled=true;
    }
    
    
    drawMap();
    player.moveMentPlayer();
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
        player.playerDirY = -1;
    } 
    else if (keyCode == DOWN) {
       player.playerDirY = 1;
    } 
    else if (keyCode == LEFT) {
       player.playerDirX = -1;
    } 
    else if (keyCode == RIGHT) {
       player.playerDirX = 1;
    } 
  } 
  
}

void keyReleased()
{
  if (key == CODED) {
    if (keyCode == UP) {
       player.playerDirY = 0;
    } 
    else if (keyCode == DOWN) {
       player.playerDirY = 0;
    } 
    else if (keyCode == LEFT) {
       player.playerDirX = 0;
    } 
    else if (keyCode == RIGHT) {
       player.playerDirX = 0;
    } 
  } 
  
}
