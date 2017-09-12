//------------------------------------------------FEUILLE CONTENANT TOUT LES TYPES DE BLOCS, LEUR TRACAGE ET AUTRE SI BESOIN---------------------------------------------------------------------------
void bloc( int blocXsimpl, int blocYsimpl) { //numero 1
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  fill(bloc);
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
}
  
  
void blocRebond( int blocXsimpl, int blocYsimpl) { //numero 2
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  noFill();
  image(blocSaut, blocX-15 , blocY-15 , 30 , 30 );
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
}
 
void blocCasse(int blocXsimpl, int blocYsimpl) { //numero 3
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  noFill();
  image(blocFragile, blocX-15 , blocY-15 , 30 , 30 );
  rect(blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
  
}

void electricite(int blocXsimpl, int blocYsimpl) { //numero 4
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int a=(millis()/100)%9;
  pushStyle();
  imageMode(CENTER);
  image(electricite[a],blocX,blocY,30,30);
  popStyle();
}


void blocDescend(int blocXsimpl, int blocYsimpl) { //numero 40
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  fill(120);
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
  pushStyle();
  stroke(255);
  strokeWeight(2);
  line(blocX-8,blocY,blocX,blocY+10); // pas beau la fleche ! a changer
  line(blocX+8,blocY,blocX,blocY+10);
  line(blocX,blocY+10,blocX,blocY-10);
//  line(30*blocDescendX+10,30*blocDescendY+15,30*blocDescendX+15,30*blocDescendY+20);
//  line(30*blocDescendX+20,30*blocDescendY+15,30*blocDescendX+15,30*blocDescendY+20);
  popStyle();
  
//  if( ballX[n-1] > blocX-15 && ballX[n-1] < blocX+15 && ballY[n-1]+10 > blocY-15 && ballY[n-1]+10 < blocY){//si la balle touche le bloc par le haut
//    rebondir(1.75);
//     tabNiveau[niveau][blocYsimpl][blocXsimpl]=0;
//     if(blocYsimpl<19){
//     tabNiveau[niveau][blocYsimpl+1][blocXsimpl]=4;}}

}

void blocGauche(int blocXsimpl, int blocYsimpl) { //numero 41
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  fill(120);
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
  pushStyle();
  stroke(255);
  strokeWeight(2);
  line(blocX-10,blocY,blocX,blocY+10);
  line(blocX-10,blocY,blocX,blocY-10);
  line(blocX+10,blocY,blocX-10,blocY);
  popStyle();

}

void blocMonte(int blocXsimpl, int blocYsimpl) { //numero 42
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  fill(120);
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
  pushStyle();
  stroke(255);
  strokeWeight(2);
  line(blocX-8,blocY,blocX,blocY-10); // pas beau la fleche ! a changer
  line(blocX+8,blocY,blocX,blocY-10);
  line(blocX,blocY+10,blocX,blocY-10);
  popStyle();
}

void blocDroite(int blocXsimpl, int blocYsimpl) { //numero 41
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  
  pushStyle();
  fill(120);
  rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
  popStyle();
  pushStyle();
  stroke(255);
  strokeWeight(2);
  line(blocX+10,blocY,blocX,blocY+10);
  line(blocX+10,blocY,blocX,blocY-10);
  line(blocX+10,blocY,blocX-10,blocY);
  popStyle();

}



void blocLaserhauton(int blocXsimpl, int blocYsimpl) { //numero 51
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=0;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocYsimpl;j++) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j;
    }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballX[0]+13>blocX+i && ballX[0]-5<blocX+i && ballY[0]<blocY) {obstacleindividuel[i]=ballY[0];ballemorte=0;} // si une balle dans le laser //balle touche laser donc meurt
      else {obstacleindividuel[i]=0;}
      if(ballX[1]+13>blocX+i && ballX[1]-5<blocX+i && obstacleindividuel[i]<ballY[1] && ballY[1]<blocY) {obstacleindividuel[i]=ballY[1];ballemorte=1;} // si une balle dans le laser //balle touche laser donc meurt
      
      if((obstaclefixe)*30>obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=(obstaclefixe+1)*30;}
      else {obstacle=obstacleindividuel[i];  if(obstacleindividuel[i]!=0){mort[ballemorte]=true;}}
    
      pushStyle();
      strokeWeight(1);
      stroke(laser);
      line(blocX-5 +i,blocY,blocX-5 +i,obstacle);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-10,blocY-15,20,7);
      popStyle();
      pushStyle(); // point rouge car laser
      fill(laser);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}

void blocLaserbason(int blocXsimpl, int blocYsimpl) { //numero 53
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=20;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=19;j>blocYsimpl;j--) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j;
    }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballX[0]+13>blocX+i && ballX[0]-5<blocX+i && ballY[0]>blocY) {obstacleindividuel[i]=ballY[0];ballemorte=0;} // si une balle dans le laser //balle touche laser donc meurt
      else {obstacleindividuel[i]=600;}
      if(ballX[1]+13>blocX+i && ballX[1]-5<blocX+i && obstacleindividuel[i]>ballY[1] && ballY[1]>blocY) {obstacleindividuel[i]=ballY[1];ballemorte=1;} // si une balle dans le laser //balle touche laser donc meurt
      
      if((obstaclefixe)*30<obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i];  if(obstacleindividuel[i]!=height){mort[ballemorte]=true;}}
      
      pushStyle();
      strokeWeight(1);
      stroke(laser);
      line(blocX-5 +i,blocY,blocX-5 +i,obstacle);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-10,blocY+8,20,7);
      popStyle();
      pushStyle(); // point rouge car laser
      fill(laser);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}


void blocLasergaucheon(int blocXsimpl, int blocYsimpl) { //numero 55
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=0;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocXsimpl;j++) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j+1;
    }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballY[0]+13>blocY+i && ballY[0]-5<blocY+i && ballX[0]<blocX) {obstacleindividuel[i]=ballX[0]; ballemorte=0;} // si une balle dans le laser 
      else {obstacleindividuel[i]=0;}
      if(ballY[1]+13>blocY+i && ballY[1]-5<blocY+i && obstacleindividuel[i]<ballX[1] && ballX[1]<blocX) {obstacleindividuel[i]=ballX[1]; ballemorte=1;} // si une balle dans le laser 
      
      if((obstaclefixe)*30>obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i]; if(obstacleindividuel[i]!=0){ mort[ballemorte]=true;}}
      
      pushStyle();
      strokeWeight(1);
      stroke(laser);
      line(blocX-5,blocY-5+i,obstacle,blocY-5+i);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-14,blocY-10,7,20);
      popStyle();
      pushStyle(); // point rouge
      fill(laser);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}


void blocLaserdroiteon(int blocXsimpl, int blocYsimpl) { //numero 57
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=30;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=29;j>blocXsimpl;j--) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
        obstaclefixe=j;
      }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballY[0]+13>blocY+i && ballY[0]-5<blocY+i && ballX[0]>blocX) {obstacleindividuel[i]=ballX[0]; ballemorte=0;} // si une balle dans le laser 
      else {obstacleindividuel[i]=900;}
      if(ballY[1]+13>blocY+i && ballY[1]-5<blocY+i && obstacleindividuel[i]>ballX[1] && ballX[1]>blocX) {obstacleindividuel[i]=ballX[1];ballemorte=1;} // si une balle dans le laser 
      
      if((obstaclefixe)*30<obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i];  if(obstacleindividuel[i]!=width){mort[ballemorte]=true;}}
      
      pushStyle();
      strokeWeight(1);
      stroke(laser);
      line(blocX-5,blocY-5+i,obstacle,blocY-5+i);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX+7,blocY-10,7,20);//rectangle noir qui indique la direction
      popStyle();
      pushStyle(); // point bleu car lumiere
      fill(laser);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}






void blocLumierehauton(int blocXsimpl, int blocYsimpl) { //numero 52
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=0;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocYsimpl;j++) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j;
      }
    }
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballX[0]+13>blocX+i && ballX[0]-5<blocX+i && ballY[0]<blocY) {obstacleindividuel[i]=ballY[0];} // si une balle dans le laser
      else {obstacleindividuel[i]=0;}
      if(ballX[1]+13>blocX+i && ballX[1]-5<blocX+i && obstacleindividuel[i]<ballY[1] && ballY[1]<blocY) {obstacleindividuel[i]=ballY[1];} // si une balle dans le laser
      
      if((obstaclefixe)*30>obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=(obstaclefixe+1)*30;}
      else {obstacle=obstacleindividuel[i];}
    
      pushStyle();
      strokeWeight(1);
      stroke(lumiere);
      line(blocX-5 +i,blocY,blocX-5 +i,obstacle);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-10,blocY-15,20,7);
      popStyle();
      pushStyle(); // point bleu car lumiere
      fill(lumiere);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}


void blocLumierebason(int blocXsimpl, int blocYsimpl) { //numero 54
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=20;
  int ballemorte=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=19;j>blocYsimpl;j--) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j;
    }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballX[0]+13>blocX+i && ballX[0]-5<blocX+i && ballY[0]>blocY) {obstacleindividuel[i]=ballY[0];} // si une balle dans le laser 
      else {obstacleindividuel[i]=600;}
      if(ballX[1]+13>blocX+i && ballX[1]-5<blocX+i && obstacleindividuel[i]>ballY[1] && ballY[1]>blocY) {obstacleindividuel[i]=ballY[1];} // si une balle dans le laser 
      
      if((obstaclefixe)*30<obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i];}
      
      pushStyle();
      strokeWeight(1);
      stroke(lumiere);
      line(blocX-5 +i,blocY,blocX-5 +i,obstacle);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-10,blocY+8,20,7);
      popStyle();
      pushStyle(); // point bleu car lumiere
      fill(lumiere);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}


void blocLumieregaucheon(int blocXsimpl, int blocYsimpl) { //numero 56
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=0;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocXsimpl;j++) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstaclefixe=j+1;
    }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballY[0]+13>blocY+i && ballY[0]-5<blocY+i && ballX[0]<blocX) {obstacleindividuel[i]=ballX[0];} // si une balle dans le laser 
      else {obstacleindividuel[i]=0;}
      if(ballY[1]+13>blocY+i && ballY[1]-5<blocY+i && obstacleindividuel[i]<ballX[1] && ballX[1]<blocX) {obstacleindividuel[i]=ballX[1];} // si une balle dans le laser 
      
      if((obstaclefixe)*30>obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i];}
      
      pushStyle();
      strokeWeight(1);
      stroke(lumiere);
      line(blocX-5,blocY-5+i,obstacle,blocY-5+i);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX-14,blocY-10,7,20);//rectangle noir qui indique la direction
      popStyle();
      pushStyle(); // point bleu car lumiere
      fill(lumiere);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}


void blocLumieredroiteon(int blocXsimpl, int blocYsimpl) { //numero 58
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int[]obstacleindividuel= new int[10];
  int obstacle;
  int obstaclefixe=30;
  
  for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=29;j>blocXsimpl;j--) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
        obstaclefixe=j;
      }

      }
      
    for(int i=0; i<10;i++) { //pour chacune des 10 lignes 
      if(ballY[0]+13>blocY+i && ballY[0]-5<blocY+i && ballX[0]>blocX) {obstacleindividuel[i]=ballX[0];} // si une balle dans le laser 
      else {obstacleindividuel[i]=900;}
      if(ballY[1]+13>blocY+i && ballY[1]-5<blocY+i && obstacleindividuel[i]>ballX[1] && ballX[1]>blocX) {obstacleindividuel[i]=ballX[1];} // si une balle dans le laser 
      
      if((obstaclefixe)*30<obstacleindividuel[i]) { // pour le plus grand des deux obstacles
        obstacle=obstaclefixe*30;}
      else {obstacle=obstacleindividuel[i];}
      
      pushStyle();
      strokeWeight(1);
      stroke(lumiere);
      line(blocX-5,blocY-5+i,obstacle,blocY-5+i);
      popStyle();
      
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(20);
      rect(blocX+7,blocY-10,7,20);//rectangle noir qui indique la direction
      popStyle();
      pushStyle(); // point bleu car lumiere
      fill(lumiere);
      noStroke();
      ellipse( blocX , blocY , 8,8 );
      popStyle();
    }
  }
}

void etoile( int blocXsimpl, int blocYsimpl) { //numero 98
  int blocX = 15 + blocXsimpl*30;//transformer coordonées simplifiés en réels
  int blocY = 15 + blocYsimpl*30;//transformer coordonées simplifiés en réels
  int a=(millis()/100)%11;
  pushMatrix();
  translate(3,10);
  image(etoile[a],blocX-20,blocY-25,32,31);
  popMatrix();
}
  
void drapeau(int drapeauXsimpl, int drapeauYsimpl) { //numero 99
  int drapeauX = 15 + drapeauXsimpl*30;//transformer coordonées simplifiés en réels
  int drapeauY = 15 + drapeauYsimpl*30;//transformer coordonées simplifiés en réels
  int a=(millis()/100)%9;
  pushMatrix();
  translate(3,10);
  image(drapeau[a],drapeauX-20,drapeauY-25,32,31);
  popMatrix();
}

void bonusDoubleSaut(int blocXsimpl, int blocYsimpl) { //numero 20
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;
  int a=(millis()/100)%16;
  pushMatrix();
  translate(3,10);
  image(bonusSaut[a],blocX-20,blocY-25,32,31);
  popMatrix();
}

void bonusRalenti(int blocXsimpl, int blocYsimpl) { //numero 21
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;
  int a=(millis()/100)%16;  
  pushMatrix();
  translate(3,10);
  image(bonusRalenti[a],blocX-20,blocY-25,32,31);
  popMatrix();
}

void teleporteur(int Xe, int Ye,int Xf, int Yf,int paireN) { // numero 31 et 32
  int Xa= Xe*30;
  int Ya= Ye*30;
  int Xb= Xf*30;
  int Yb= Yf*30;
  int a=0;
  a=(millis()/200)%5;
  pushMatrix();
  translate(8,10);
  image(teleporteur[a][paireN],Xb,Yb-10,30,30); 
  popMatrix();
  pushMatrix();
  translate(Xa,Ya);
  rotate(PI);
  translate(15,5);
  image(teleporteur[a][paireN],-40,-35,30,30);
  popMatrix();
  for(int n=1;n<3;n++) {
    // condition pour aller d'un portail a l'autre : ce deplacer dans le bon sens d'ou le touche LEFT ou 'q' pour la deuxieme balle
    // si les conditions sont bonnes, teleportation ET changement de la variable rebond
    if((touchesCodees[RIGHT] ||touches['d']) && ballX[n-1]>Xa+10 && ballX[n-1]<Xa+20 && ballY[n-1]>Ya-5 && ballY[n-1]<Ya+35)
        {ballX[n-1]=Xb+15; ballY[n-1]=Yb+15; rebondY[n-1][0]=Yb+15;rebondY[n-1][1]=Yb+15;}
    if((touchesCodees[LEFT] ||touches['q']) && ballX[n-1]>Xb+10 && ballX[n-1]<Xb+20 && ballY[n-1]>Yb-5 && ballY[n-1]<Yb+35)
        {ballX[n-1]=Xa+15; ballY[n-1]=Ya+15;rebondY[n-1][0]=Ya+15;rebondY[n-1][1]=Ya+15;}
  }
} 



void detecteurbas(int blocXsimpl, int blocYsimpl, int numero) { //numero 110
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;

color detecter=couleurs[numero+6];
int obstacle=0;
int obstacleY=0;

for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=19;j>blocYsimpl;j--) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstacle=tabNiveau[niveau][j][blocXsimpl];
    }
  if(tabNiveau[niveau][j][blocXsimpl]==52){obstacleY=j*30; }
}}
  if(obstacle!=52
  || (ballX[0]>blocX-5 && ballX[0]<blocX+5 && ballY[0]>blocY && ballY[0]<obstacleY)
  || (ballX[1]>blocX-5 && ballX[1]<blocX+5 && ballY[1]>blocY && ballY[1]<obstacleY)) {ouverturebas[numero]=0;}
     else{ouverturebas[numero]=1;}
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(0);
      arc(blocX,blocY+15, 20,20,PI,2*PI);
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      ellipse( blocX , blocY-3 , 10,10);
      popStyle();  
}

void detecteurhaut(int blocXsimpl, int blocYsimpl, int numero) { //numero 160
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;

color detecter=couleurs[numero+6];
int obstacle=0;
int obstacleY=0;

for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocYsimpl;j++) {
      if(tabNiveau[niveau][j][blocXsimpl]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstacle=tabNiveau[niveau][j][blocXsimpl];
    }
  if(tabNiveau[niveau][blocYsimpl][j]==54){obstacleY=j*30;}
}}
    
    
  
  if(obstacle!=54 || (ballX[0]>blocX-5 && ballX[0]<blocX+5 && ballY[0]<blocY && ballY[0]>obstacleY)
                  || (ballX[1]>blocX-5 && ballX[1]<blocX+5 && ballY[1]<blocY && ballY[1]>obstacleY)) {ouverturehaut[numero]=0;}
     else{ouverturehaut[numero]=1;}
     
 
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(0);
      arc(blocX,blocY-15,20,20,0,PI);
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      ellipse( blocX , blocY+3 , 10,10);
      popStyle();
      
}

void detecteurdroite(int blocXsimpl, int blocYsimpl, int numero) { //numero 120
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;

color detecter=couleurs[numero+6];
int obstacle=0;
int obstacleX=0;

for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=29;j>blocXsimpl;j--) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstacle=tabNiveau[niveau][blocYsimpl][j];
    }
    if(tabNiveau[niveau][blocYsimpl][j]==56){obstacleX=j*30;}
  }}
  
  if(obstacle!=56
  || (ballY[0]>blocY-5 && ballY[0]<blocY+5 && ballX[0]>blocX && ballX[0]<obstacleX)
  || (ballY[1]>blocY-5 && ballY[1]<blocY+5 && ballX[1]>blocX && ballX[1]<obstacleX)) 
{ouverturedroite[numero]=0;}
     else{ouverturedroite[numero]=1;}
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(0);
      arc(blocX+15,blocY, 20,20,PI/2,3*PI/2);
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      ellipse( blocX-3 , blocY , 10,10);
      popStyle();  
}

void detecteurgauche(int blocXsimpl, int blocYsimpl, int numero) { //numero 140
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;

color detecter=couleurs[numero+6];
int obstacle=0;
int obstacleX=0;

for(int w=0; w<2; w++) { // pour les deux balles
    for(int j=0;j<blocXsimpl;j++) {
      if(tabNiveau[niveau][blocYsimpl][j]!=0) {  //scan si il y a un obstacle fixe sur la route
      obstacle=tabNiveau[niveau][blocYsimpl][j];
    }
  if(tabNiveau[niveau][blocYsimpl][j]==56){obstacleX=j*30;}
}}
  
  if(obstacle!=58
  || (ballY[0]>blocY-5 && ballY[0]<blocY+5 && ballX[0]<blocX && ballX[0]>obstacleX)
  || (ballY[1]>blocY-5 && ballY[1]<blocY+5 && ballX[1]<blocX && ballX[1]>obstacleX)) 
{ouverturegauche[numero]=0;}
     else{ouverturegauche[numero]=1;}
      pushStyle();
      fill(120);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle();
      fill(0);
      arc(blocX-15,blocY, 20,20,3*PI/2,5*PI/2);
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      ellipse( blocX+3 , blocY , 10,10);
      popStyle();  
}



void porteNC(int blocXsimpl, int blocYsimpl, int numero) { //numero 100
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;
  color detecter=couleurs[numero+6];
  
  if(ouverture[numero]==0) {  
     pushStyle();
      fill(180);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      rect( blocX-5 , blocY-5 , 10,10);
      popStyle();  
  }
  else{
     pushStyle();
      fill(100);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      rect( blocX-5 , blocY-5 , 10,10);
      popStyle();
  }
  
}

void porteNO(int blocXsimpl, int blocYsimpl, int numero) { //numero 150
  int blocX = 15 + blocXsimpl*30;
  int blocY = 15 + blocYsimpl*30;
  color detecter=couleurs[numero+6];
  
  if(ouverture[numero]==0) {  
     pushStyle();
      fill(100);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      rect( blocX-5 , blocY-5 , 10,10);
      popStyle();  
  }
  else{
     pushStyle();
      fill(180);
      rect( blocX-15 , blocY-15 , 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
      popStyle();
      pushStyle(); // point qui annonce si lumiere ou pas
      fill(detecter);
      noStroke();
      rect( blocX-5 , blocY-5 , 10,10);
      popStyle();
  }
  
}
