import processing.net.*;

Server s;
Client c;

int height = 800;
int width = 800;
int sizeSquare = 40;

int mapSize = height/sizeSquare;
int[][] myMap = new int[mapSize][mapSize];

int wallweight = 4;
float moveSpeed = 4;

String output="";

void setup() 
{
  initMap();
   s = new Server(this, 12345); // Start a simple server on a port
}

void draw() 
{
    for(int i = 0; i < mapSize; ++i)
    {
      for(int j = 0; j < mapSize; ++j)
      {
        output = output + myMap[i][j] + " ";
      }
    
    }
    output = output+"\n";
    s.write(output);
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
