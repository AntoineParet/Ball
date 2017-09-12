
//------------- JEU ------------- PAUSE ------------- OBSTACLES ------------- BROUILLARD ------------- NIVEAU ------------- ACCEUIL ------------- MENU ------------- CHOIX ------------- METHODES PRATIQUES DIVERSES


/*-----------------------------------JEU-ET-NIVEAUX---------------------------------------------*/

void jeu(){//méthode s'executant lorsqu'une partie (jeu sur un niveau) est ouvert
  pause();
  if(vPause==false){
    fond();//Ce qui s'affichera derrière
    obstacles();//La partie "active" (Balle, blocs...)
    direction();
    if ( debut == true || (mort[0]==true && mort[1]==true) || (mort[0]==true && multijoueurs==false) ){//remise à 0 du niveau
      initialisationNiveau();
      debut=false;
    }
    boutonOptions();
    boutonPause();
    if(fumee==true) {brouillard();}
    
    for(int i=0;i<6;i++) {
    if(ouverturebas[i]==1 || ouverturedroite[i]==1 || ouverturehaut[i]==1 || ouverturegauche[i]==1) {ouverture[i]=1;}
    else{ouverture[i]=0;}
  }
  }
}


boolean vPause(){//Méthode pause à modifier (touches, pop-up ...)
  if(keyPressed == true && key == ' '){return true;} 
  else{return false;}
}


void fond(){
 background(fond); //Arrière plan , nettoyage
}

void obstacles(){//La partie "active" (Balle, blocs...)
  niveau();
  affichagePeinture();
  ball(1);//calcul de la position, positionnement et dessin de la balle
  if(multijoueurs==true) {ball(2);}
  
}

void brouillard() {
  
  if( brouillardtheorique<brouillardreel) {brouillardreel--;} // permet la translation du brouillard
  if( brouillardtheorique>brouillardreel) {brouillardreel++;} 
  // theorique est l'endroit souhaité, reel est l'endroi sur l'ecran (pas le meme car tmps de translation)

  for(int i=height; i>brouillardreel; i=i-5) {
  pushStyle();
  int transparence = (int)map(i,brouillardreel,600,0,255);
  fill(170,transparence*1.8);
  noStroke();
  rect(0,i,width,5);
  popStyle();
  }
}


void niveau(){

  
   for(int j=0; j<30 ; j++) {
     for( int i=0 ; i<20 ; i++) {
        
        if(tabNiveau[niveau][i][j]==1){bloc(j,i);}
          
        if(tabNiveau[niveau][i][j]==2){blocRebond(j,i);}
          
        if(tabNiveau[niveau][i][j]==3){blocCasse(j,i);}
        
        if(tabNiveau[niveau][i][j]==4){electricite(j,i);}
          
        if(tabNiveau[niveau][i][j]==20){bonusDoubleSaut(j,i);}
        
        if(tabNiveau[niveau][i][j]==21){bonusRalenti(j,i);}
        
        if(tabNiveau[niveau][i][j]==98){etoile(j,i);}
          
        if(tabNiveau[niveau][i][j]==99){drapeau(j,i);}
          
          
  /*-----------blocs qui ce decallent----------------*/
        if(tabNiveau[niveau][i][j]==40){blocDescend(j,i);}
          
        if(tabNiveau[niveau][i][j]==41){blocGauche(j,i);}
          
        if(tabNiveau[niveau][i][j]==42){blocMonte(j,i);}
          
        if(tabNiveau[niveau][i][j]==43){blocDroite(j,i);}
        
 /*-----------------lasers et lumiere------------------------*/
        if(tabNiveau[niveau][i][j]==51){blocLaserhauton(j,i);}
        
        if(tabNiveau[niveau][i][j]==52){blocLumierehauton(j,i);}
        
        if(tabNiveau[niveau][i][j]==53){blocLaserbason(j,i);}
        
        if(tabNiveau[niveau][i][j]==54){blocLumierebason(j,i);}
         
        if(tabNiveau[niveau][i][j]==55){blocLasergaucheon(j,i);}
         
        if(tabNiveau[niveau][i][j]==56){blocLumieregaucheon(j,i);}
         
        if(tabNiveau[niveau][i][j]==57){blocLaserdroiteon(j,i);}
         
        if(tabNiveau[niveau][i][j]==58){blocLumieredroiteon(j,i);}
        
        if(tabNiveau[niveau][i][j]>149 && tabNiveau[niveau][i][j]<160){porteNC(j,i,tabNiveau[niveau][i][j]-150);}
        
        if(tabNiveau[niveau][i][j]>99 && tabNiveau[niveau][i][j]<110){porteNO(j,i,tabNiveau[niveau][i][j]-100);}
        
        if(tabNiveau[niveau][i][j]>109 && tabNiveau[niveau][i][j]<120){detecteurbas(j,i,tabNiveau[niveau][i][j]-110);}
        
        if(tabNiveau[niveau][i][j]>119 && tabNiveau[niveau][i][j]<130){detecteurdroite(j,i,tabNiveau[niveau][i][j]-120);}
        
        if(tabNiveau[niveau][i][j]>139 && tabNiveau[niveau][i][j]<150){detecteurgauche(j,i,tabNiveau[niveau][i][j]-140);}
        
        if(tabNiveau[niveau][i][j]>159 && tabNiveau[niveau][i][j]<170){detecteurhaut(j,i,tabNiveau[niveau][i][j]-160);}

 /*-----------------téléporteurs------------------------*/        
        if( tabTransparent[i][j]==31) { // pour les teleporteurs
          for(int l = 0; l<20; l++) {
            for(int m=0; m<30; m++) {
              if( tabTransparent[l][m] ==32) {
                teleporteur(j,i,m,l,0);
              }}}}
              
        if( tabTransparent[i][j]==33) { // pour les teleporteurs
          for(int l = 0; l<20; l++) {
            for(int m=0; m<30; m++) {
              if( tabTransparent[l][m] ==34) {
                teleporteur(j,i,m,l,1);
              }}}}      
               
        if( tabTransparent[i][j]==35) { // pour les teleporteurs
          for(int l = 0; l<20; l++) {
            for(int m=0; m<30; m++) {
              if( tabTransparent[l][m] ==36) {
                teleporteur(j,i,m,l,2);
              }}}}      
               
        if( tabTransparent[i][j]==37) { // pour les teleporteurs
          for(int l = 0; l<20; l++) {
            for(int m=0; m<30; m++) {
              if( tabTransparent[l][m] ==38) {
                teleporteur(j,i,m,l,3);
              }}}}      
       
     }
  }
  if(editionniveaux==true) {
    pushStyle();
    fill(normal[0]);
    noStroke();
    ellipse(mouseX,mouseY,15,15);
    popStyle();
    if(mousePressed==true) {ballX[0]=mouseX; ballY[0]=mouseY;}
  }
}






//-----------------------------------------------ACCEUIL-ET-MENU-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void acceuil(){
  background(imageAcceuil);
  if(clicFD() == true) etat = 'm';//Si appui sur l'écran, passer au menu
}

void menu(){
  background(fond);
  
  if(keyPressed==true && key=='+'){etat='a';}//a supprimer
  
  if(mouseY>150 && mouseY<350){//gère le glissement des niveaux
    if(mouseX>width-150 && glissement>-150){glissement=glissement-3;}
    if(mouseX<150 && glissement<0){glissement=glissement+3;}
  }
  
  if(mouseX>width-wville && mouseY>height-hville) {
  wville=250; hville=181;
   if(clicFD()==true) {etat='j';niveau=0; chargerNiveau(); initialisationNiveau();}}
  else {wville=200; hville=145;}
  
  if(mouseX>(width/2)-(wTuto/2) && mouseX<(width/2)+(wTuto/2) && mouseY>height-hTuto) {
  wTuto=250; hTuto=180;
   if(clicFD()==true) {etat='t';page=0; debut=true; niveau=0;}}
  else {wTuto=200; hTuto=145;}
  
  if(mouseX<wvillec && mouseY>height-hvillec) {
  wvillec=350; hvillec=181;
  if(clicFD()==true) {etat='e';chargerNiveau();}
   }
  else {wvillec=280; hvillec=145;}
  
  if(mouseX>glissement+50 && mouseY>150 && mouseX<glissement+250 && mouseY<350 && clicFD()==true) {
    etat='c';
    choix=0;
  }
  
  if(mouseX>glissement+300 && mouseY>150 && mouseX<glissement+500 && mouseY<350 && clicFD()==true) {
    etat='c';
    choix=1;
  }
  
  if(mouseX>glissement+550 && mouseY>150 && mouseX<glissement+750 && mouseY<350 && clicFD()==true) {
    etat='c';
    choix=2;
  }
  
  if(mouseX>glissement+800 && mouseY>150 && mouseX<glissement+1000 && mouseY<350 && clicFD()==true) {
    etat='c';
    choix=3;
  }
  
  pushStyle();
  imageMode(CENTER);
  image(tuto,width/2,height-(hTuto/2),wTuto,hTuto);
  popStyle();
  image(ville,width-wville,height-hville,wville,hville);
  image(villeconstruction,0,height-hvillec,wvillec,hvillec);
  image(plateforme,glissement+50,150,200,200);
  image(lasers,glissement+300,150,200,200);
  image(amis,glissement+550,150,200,200);
  image(coop,glissement+800,150,200,200);
}

void choix() {
  background(fond);
    if(mouseX>5 && mouseY>5 && mouseX<55 && mouseY<55 ) {image(retourGris,5,5,50,50);if(clicFD()==true){etat='m';}}else{image(retour,5,5,50,50);}
  pushStyle();
  textSize(60);
  switch (choix) {
   case 0 : 
     text("Plateformes innofensives",110,100);
   break; 
   
   case 1 : 
     text("Forêt de lasers",235,100);
   break; 
   
   case 2 : 
     text("Parties entre amis",190,100);
   break; 
   
   case 3 : 
     text("Rois de la coopération",125,100);
   break; 
  }
    popStyle();
    
  for(int j = 0 ; j<3 ; j++){
    for(int i = 0 ; i<4 ; i++){
      boutonNiveau(175+i*150,175+j*125,i+1+j*4+12*choix);
    }
  }
}



  




//------------------------------------------------------------------AUTRES------------------------------------------------------------------------------

int getCase(int X , int Y){//Méthode qui retourne le type de case dans lequel se trouve le pixel correspondant
  if(X>0 && X<width && Y>0 && Y<height){
  return tabNiveau[niveau][(int)Y/30/*case de Y ordonnée*/][(int)X/30/*case de X abscisse*/] ;
  }
  else{return 99999;}
}

int getY(int Y){//Méthode qui retourne l'ordonnée de la case du tableau dans laquelle se trouve le pixel
  if(Y>0 && Y<height){
  return (int)Y/30;
  }
  else{return 99999;}
}

int getX(int X ){//Méthode qui retourne l'abscisse de la case du tableau dans laquelle se trouve le pixel
  if(X>0 && X<width){
  return (int)X/30;
  }
  else{return 99999;}
}

boolean bordG (int n, int X ){//regarde le type de la case au point gauche des balles
  if(getCase(ballX[n-1]+7,ballY[n-1])==X && getCase(ballX[n-1]+6,ballY[n-1])==X){ return true ;}   
  else return false;
}

boolean bordD (int n, int X ){//regarde le type de la case au point droit des balles
  if(getCase(ballX[n-1]-10,ballY[n-1])==X && getCase(ballX[n-1]-9,ballY[n-1])==X){ return true ;}   
  else return false;
}

boolean bordB (int n, int X ){//regarde le type de la case au point bas des balles
  if(getCase(ballX[n-1],ballY[n-1]-8)==X){ return true ;}   
  else return false;
}

int amorti(int a, int b, int min, int max, int v) { //gère le déplacement progressif du maitre (tuto)
  // a = theorique, b=reel
  int e=a-b;
  if(e<0)
  e =-e;
  int d=(int)map(e,min,max,1,v);
  if(a<b)
  b=b-d;
  if(a>b)
  b=b+d;
  return b;
}
