class Player{
  float startPointX;
  float startPointY;
  int playerDirX;
  int playerDirY;
  float playerX;
  float playerY;
  int sizePlayer;
  float playerLastX;
  float playerLastY;
  PImage webImg;
  
  Player(int sizeSquare,String url,float startPointX,float startPointY){
    this.startPointX = startPointX;
    this.startPointY = startPointY;
    playerDirX = 0;
    playerDirY = 0;
    playerX = sizeSquare *1.5;;
    playerY = sizeSquare *1.5;;
    sizePlayer = 50;
    playerLastX = 0;
    playerLastY = 0;
    webImg= loadImage(url, "png");
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
    
    render();
    playerLastX = playerX;
    playerLastY = playerY; 
  }
  
  void render(){
    image(webImg,playerX, playerY, sizePlayer, sizePlayer);
  }
}
