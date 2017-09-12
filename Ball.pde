
//------------- BALLE -------------- BONUS SAUT ------------- MORT ---------------- PEINTURE ---------------- DIRECTION --------------- COLLISIONS ------------------ REBONDS ----------------TRAINEE



//------------------------------------------BALLE-----------------------------------------------------------------
void ball(int n) {//calcul de la position, positionnement et dessin de la balle
  rebond(n);//gère l'évolution de la variable rebond
  if(mort[n-1]==true) {mort(n);}
  conditionsMort(1);
  conditionsMort(2);
  collisions(n);
  ballX[n-1] = int(ballX[n-1]);//position + différentes forces de côté
  while(gravite+rebond[n-1]>7){gravite--;}//Pour éviter que la descente soit trop rapide et la balle s'enfonce dans le bloc
  ballY[n-1] = int(ballY[n-1] + gravite + rebond[n-1]);//position + différentes forces verticales
  pushStyle();
  doublesaut(n);
  normal[0] = couleurs[couleurBalles[0]];//gère la couleur de la balle
  normal[1] = couleurs[couleurBalles[1]];//gère la couleur de la balle
  if(contour==false){noStroke();}else{stroke(0);strokeWeight(0.75);}
  fill(colorballe[n-1]);
  ellipse(ballX[n-1],ballY[n-1],15,15); //balle de 30pxl de diamètre
  trainee(n); //gere la trainée simulant la vitesse a l'arriere de la balle
  popStyle();
}

//-----------------------------------------BONUS SAUT------------------------------------------

void doublesaut(int n) {
  if(saut[n-1]==true) { colorballe[n-1]=colorsaut;}//colore la(les) balle(s) qui a le bonus double saut
  else {colorballe[n-1]=normal[n-1];}

  if(touchesCodees[UP] ==true && saut[0]==true) {// double saut balle 1
    rebondir(1,2);
    saut[0]=false;
    int sautX=ballX[0];
    int sautY=ballY[0]+8;
    int tempssaut=millis();
    ellipse(sautX,sautY,30,10);
  }

  if(touches['z'] ==true && saut[1]==true) {// double saut balle 2
    rebondir(2,2);
    saut[1]=false;
    int sautX=ballX[1];
    int sautY=ballY[1]+8;
    int tempssaut=millis();
    ellipse(sautX,sautY,30,10);
  }
}

//------------------------------------------Mort et traçage de peinture-----------------------------------------------------------

void mort(int n) {
  initialisationNiveau();
  mort[n-1]=false;
}
void conditionsMort(int n){
  if(ballY[n-1]>height) {mort[n-1]=true;}
}

void enregistrePeinture(int niveau, int X, int Y, int couleur) {
   if(nbtraces[niveau]<50) { // pour ne pas que ca crash
   int ypile;
   int Yreste = Y % 30;        //partie de code s'occupant de placer les cases que a certains endrois, pas n'importe ou
   if(Yreste>15) {ypile =(Y+ 30-Yreste);}
   else {ypile = (Y - Yreste);}

   int aleatoire=(int)random(0,5);

   peinture[niveau][nbtraces[niveau]][0]=X;
   peinture[niveau][nbtraces[niveau]][1]=ypile;
   peinture[niveau][nbtraces[niveau]][2]=aleatoire;
   peinture[niveau][nbtraces[niveau]][3]=couleur;
   nbtraces[niveau]++;
 }
}

void affichagePeinture() {
  for(int i=0;i<nbtraces[niveau];i++) {
    image(splash[peinture[niveau][i][2]][peinture[niveau][i][3]],peinture[niveau][i][0]-10,peinture[niveau][i][1],20,20);
  }
}




//----------------------------------------------------------------------DIRECTION------------------------------------------------------------------------------------------------------------------

void direction(){
  if(touchesCodees[RIGHT] == true && getCase(ballX[0]+8,ballY[0])!=1 && getCase(ballX[0]+8,ballY[0])!=2){//si appui sur touche droite et pas de bloc
     ballX[0] = ballX[0]+sensibilite;}//décaler à droite de la valeur de sensibilite
  if(touchesCodees[LEFT] == true  && getCase(ballX[0]-10,ballY[0])!=1 && getCase(ballX[0]+8,ballY[0])!=2){//si appui sur touche gauche et pas de bloc
     ballX[0] = ballX[0]-sensibilite;}//décaler à gauche de la valeur de sensibilite
     //c'est un essai de multijoueurs
 if(multijoueurs==true){
  if(touches['d'] == true && getCase(ballX[1]+8,ballY[1])!=1 && getCase(ballX[1]+8,ballY[1])!=2){
     ballX[1] = ballX[1]+sensibilite;}//décaler à droite de la valeur de sensibilite
  if(touches['q'] == true  && getCase(ballX[1]-10,ballY[1])!=1 && getCase(ballX[1]+8,ballY[1])!=2){
     ballX[1] = ballX[1]-sensibilite;}//décaler à gauche de la valeur de sensibilite
 }
}

void collisions(int n){
//------------------------------------COLLISION A GAUCHE ( Pour que la balle ne soit pas à moitié dans un bloc mais sorte )--------------------------------------------------
  if(bordG(n,1)==true
  || bordG(n,2)==true
  || bordG(n,3)==true
  || bordG(n,40)==true
  || bordG(n,41)==true
  || bordG(n,42)==true
  || bordG(n,43)==true
  || bordG(n,51)==true
  || bordG(n,52)==true
  || bordG(n,53)==true
  || bordG(n,54)==true
  || bordG(n,55)==true
  || bordG(n,56)==true
  || bordG(n,57)==true
  || bordG(n,58)==true
  || bordG(n,75)==true

  || bordG(n,110)==true
  || bordG(n,111)==true
  || bordG(n,113)==true
  || bordG(n,114)==true
  || bordG(n,115)==true
  || bordG(n,116)==true
  || bordG(n,117)==true
  || bordG(n,118)==true
  || bordG(n,119)==true

  || bordG(n,120)==true
  || bordG(n,121)==true
  || bordG(n,123)==true
  || bordG(n,124)==true
  || bordG(n,125)==true
  || bordG(n,126)==true
  || bordG(n,127)==true
  || bordG(n,128)==true
  || bordG(n,129)==true

  || bordG(n,140)==true
  || bordG(n,141)==true
  || bordG(n,143)==true
  || bordG(n,144)==true
  || bordG(n,145)==true
  || bordG(n,146)==true
  || bordG(n,147)==true
  || bordG(n,148)==true
  || bordG(n,149)==true

  || bordG(n,160)==true
  || bordG(n,161)==true
  || bordG(n,163)==true
  || bordG(n,164)==true
  || bordG(n,165)==true
  || bordG(n,166)==true
  || bordG(n,167)==true
  || bordG(n,168)==true
  || bordG(n,169)==true

  || (bordG(n,100)==true && (ouverture[0]==0))
  || (bordG(n,101)==true && (ouverture[1]==0))
  || (bordG(n,102)==true && (ouverture[2]==0))
  || (bordG(n,103)==true && (ouverture[3]==0))
  || (bordG(n,104)==true && (ouverture[4]==0))
  || (bordG(n,105)==true && (ouverture[5]==0))
  || (bordG(n,106)==true && (ouverture[6]==0))
  || (bordG(n,107)==true && (ouverture[7]==0))
  || (bordG(n,108)==true && (ouverture[8]==0))
  || (bordG(n,109)==true && (ouverture[9]==0))

  || (bordG(n,150)==true && (ouverture[0]!=0))
  || (bordG(n,151)==true && (ouverture[1]!=0))
  || (bordG(n,152)==true && (ouverture[2]!=0))
  || (bordG(n,153)==true && (ouverture[3]!=0))
  || (bordG(n,154)==true && (ouverture[4]!=0))
  || (bordG(n,155)==true && (ouverture[5]!=0))
  || (bordG(n,156)==true && (ouverture[6]!=0))
  || (bordG(n,157)==true && (ouverture[7]!=0))
  || (bordG(n,158)==true && (ouverture[8]!=0))
  || (bordG(n,159)==true && (ouverture[9]!=0))
  || bordG(n,123)==true
  ){ballX[n-1] = ballX[n-1]-sensibilite;}

//------------------------------------COLLISION A DROITE ( Pour que la balle ne soit pas à moitié dans un bloc mais sorte )--------------------------------------------------
  if(bordD(n,1)==true
  || bordD(n,2)==true
  || bordD(n,3)==true
  || bordD(n,40)==true
  || bordD(n,41)==true
  || bordD(n,42)==true
  || bordD(n,43)==true
  || bordD(n,51)==true
  || bordD(n,52)==true
  || bordD(n,53)==true
  || bordD(n,54)==true
  || bordD(n,55)==true
  || bordD(n,56)==true
  || bordD(n,57)==true
  || bordD(n,58)==true
  || bordD(n,75)==true

  || bordD(n,110)==true
  || bordD(n,111)==true
  || bordD(n,113)==true
  || bordD(n,114)==true
  || bordD(n,115)==true
  || bordD(n,116)==true
  || bordD(n,117)==true
  || bordD(n,118)==true
  || bordD(n,119)==true

  || bordD(n,120)==true
  || bordD(n,121)==true
  || bordD(n,123)==true
  || bordD(n,124)==true
  || bordD(n,125)==true
  || bordD(n,126)==true
  || bordD(n,127)==true
  || bordD(n,128)==true
  || bordD(n,129)==true

  || bordD(n,140)==true
  || bordD(n,141)==true
  || bordD(n,143)==true
  || bordD(n,144)==true
  || bordD(n,145)==true
  || bordD(n,146)==true
  || bordD(n,147)==true
  || bordD(n,148)==true
  || bordD(n,149)==true

  || bordD(n,160)==true
  || bordD(n,161)==true
  || bordD(n,163)==true
  || bordD(n,164)==true
  || bordD(n,165)==true
  || bordD(n,166)==true
  || bordD(n,167)==true
  || bordD(n,168)==true
  || bordD(n,169)==true

  || (bordD(n,100)==true && (ouverture[0]==0))
  || (bordD(n,101)==true && (ouverture[1]==0))
  || (bordD(n,102)==true && (ouverture[2]==0))
  || (bordD(n,103)==true && (ouverture[3]==0))
  || (bordD(n,104)==true && (ouverture[4]==0))
  || (bordD(n,105)==true && (ouverture[5]==0))
  || (bordD(n,106)==true && (ouverture[6]==0))
  || (bordD(n,107)==true && (ouverture[7]==0))
  || (bordD(n,108)==true && (ouverture[8]==0))
  || (bordD(n,109)==true && (ouverture[9]==0))

  || (bordD(n,150)==true && (ouverture[0]!=0))
  || (bordD(n,151)==true && (ouverture[1]!=0))
  || (bordD(n,152)==true && (ouverture[2]!=0))
  || (bordD(n,153)==true && (ouverture[3]!=0))
  || (bordD(n,154)==true && (ouverture[4]!=0))
  || (bordD(n,155)==true && (ouverture[5]!=0))
  || (bordD(n,156)==true && (ouverture[6]!=0))
  || (bordD(n,157)==true && (ouverture[7]!=0))
  || (bordD(n,158)==true && (ouverture[8]!=0))
  || (bordD(n,159)==true && (ouverture[9]!=0))
  || bordD(n,123)==true
  ){ballX[n-1] = ballX[n-1]+sensibilite;}

  //COLLISION EN BAS DU BLOC (en haut de la balle)
  if(bordB(n,1)==true
  || bordB(n,2)==true
  || bordB(n,3)==true
  || bordB(n,40)==true
  || bordB(n,41)==true
  || bordB(n,42)==true
  || bordB(n,43)==true
  || bordB(n,51)==true
  || bordB(n,52)==true
  || bordB(n,53)==true
  || bordB(n,54)==true
  || bordB(n,55)==true
  || bordB(n,56)==true
  || bordB(n,57)==true
  || bordB(n,58)==true
  || bordB(n,75)==true

  || bordB(n,110)==true
  || bordB(n,111)==true
  || bordB(n,113)==true
  || bordB(n,114)==true
  || bordB(n,115)==true
  || bordB(n,116)==true
  || bordB(n,117)==true
  || bordB(n,118)==true
  || bordB(n,119)==true

  || bordB(n,120)==true
  || bordB(n,121)==true
  || bordB(n,123)==true
  || bordB(n,124)==true
  || bordB(n,125)==true
  || bordB(n,126)==true
  || bordB(n,127)==true
  || bordB(n,128)==true
  || bordB(n,129)==true

  || bordB(n,140)==true
  || bordB(n,141)==true
  || bordB(n,143)==true
  || bordB(n,144)==true
  || bordB(n,145)==true
  || bordB(n,146)==true
  || bordB(n,147)==true
  || bordB(n,148)==true
  || bordB(n,149)==true

  || bordB(n,160)==true
  || bordB(n,161)==true
  || bordB(n,163)==true
  || bordB(n,164)==true
  || bordB(n,165)==true
  || bordB(n,166)==true
  || bordB(n,167)==true
  || bordB(n,168)==true
  || bordB(n,169)==true

  || (bordB(n,100)==true && (ouverture[0]==0))
  || (bordB(n,101)==true && (ouverture[1]==0))
  || (bordB(n,102)==true && (ouverture[2]==0))
  || (bordB(n,103)==true && (ouverture[3]==0))
  || (bordB(n,104)==true && (ouverture[4]==0))
  || (bordB(n,105)==true && (ouverture[5]==0))
  || (bordB(n,106)==true && (ouverture[6]==0))
  || (bordB(n,107)==true && (ouverture[7]==0))
  || (bordB(n,108)==true && (ouverture[8]==0))
  || (bordB(n,109)==true && (ouverture[9]==0))

  || (bordB(n,150)==true && (ouverture[0]!=0))
  || (bordB(n,151)==true && (ouverture[1]!=0))
  || (bordB(n,152)==true && (ouverture[2]!=0))
  || (bordB(n,153)==true && (ouverture[3]!=0))
  || (bordB(n,154)==true && (ouverture[4]!=0))
  || (bordB(n,155)==true && (ouverture[5]!=0))
  || (bordB(n,156)==true && (ouverture[6]!=0))
  || (bordB(n,157)==true && (ouverture[7]!=0))
  || (bordB(n,158)==true && (ouverture[8]!=0))
  || (bordB(n,159)==true && (ouverture[9]!=0))
  || bordB(n,123)==true
  ){rebond[n-1] = -0.80*gravite;}

//------------------------------------------------DIFFERENTS REBONDS (switch dessous de la balle)------------------------------------------------
  switch (getCase(ballX[n-1],ballY[n-1]+8)){
    case 1 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 2 : //rebond si balle sur bloc rebondissant
    rebondir(n,2.4);
    break;

    case 3 : //rebond si balle sur bloc cassant
    rebondir(n,1.75);
    tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;
    break;

    case 40 : //rebond si balle sur bloc descendant
    rebondir(n,1.75);
    if(getY(ballY[n-1]+8)<19){
      if(tabNiveau[niveau][getY(ballY[n-1]+8)+1][getX(ballX[n-1])]==0){ // gere la descente du bloc qui descend
        tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;
        if(getY(ballY[n-1]+8)<19){
          tabNiveau[niveau][getY(ballY[n-1]+8)+1][getX(ballX[n-1])]=40;}
      }
    }
    if(getY(ballY[n-1]+8)==19){tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;}
    break;

    case 41 : //rebond si balle sur bloc gauche
    rebondir(n,1.75);
    if(getX(ballX[n-1])>0){ // pour ne pas sortir à gauche de l'écran
      if(tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])-1]==0){ // si la case à gauche du bloc est un 0
         tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;
         tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])-1]=41;}
      }
    if(getX(ballX[n-1])==0){tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;}
    break;

    case 42 : //rebond si balle sur bloc montant
    rebondir(n,1.75);
    if(getY(ballY[n-1]+8)>0){ //pour ne pas sortir à droite de l'écran
      if(tabNiveau[niveau][getY(ballY[n-1]+8)-1][getX(ballX[n-1])]==0){ //  gere le deplacement
        tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;
        tabNiveau[niveau][getY(ballY[n-1]+8)-1][getX(ballX[n-1])]=42;
        ballY[n-1]=ballY[n-1]-30;}
        if(getY(ballY[n-1]+8)==19){
          tabNiveau[niveau][getY(ballY[n-1]+8)-1][getX(ballX[n-1])]=0;}
      }


    if(getY(ballY[n-1]+8)==19){tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;}
    break;

    case 43 : //rebond si balle sur bloc droite
    rebondir(n,1.75);
    if(getX(ballX[n-1])<29){ //pas sortir à droite de l'écran
      if(tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])+1]==0){ // gere le deplacement
        tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;
        tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])+1]=43;}
      }
    if(getX(ballX[n-1]+8)==29){tabNiveau[niveau][getY(ballY[n-1]+8)][getX(ballX[n-1])]=0;}
    break;

    case 50 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 51 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 52 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 53 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 54 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 55 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 56 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 57 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 58 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 75 : //rebond si balle sur bloc
    rebondir(n,1.75);
    break;

    case 100 : //porte
    if(ouverture[0]==0) { rebondir(n,1.75);}
    break;

     case 101 : //porte
    if(ouverture[1]==0) { rebondir(n,1.75);}
    break;

    case 102 : //porte
    if(ouverture[2]==0) { rebondir(n,1.75);}
    break;

    case 103 : //porte
    if(ouverture[3]==0) { rebondir(n,1.75);}
    break;

    case 104 : //porte
    if(ouverture[4]==0) { rebondir(n,1.75);}
    break;

    case 105 : //porte
    if(ouverture[5]==0) { rebondir(n,1.75);}
    break;

    case 106 : //porte
    if(ouverture[6]==0) { rebondir(n,1.75);}
    break;

    case 107 : //porte
    if(ouverture[7]==0) { rebondir(n,1.75);}
    break;

     case 108 : //porte
    if(ouverture[8]==0) { rebondir(n,1.75);}
    break;

    case 109 : //porte
    if(ouverture[9]==0) { rebondir(n,1.75);}
    break;

    case 110 :rebondir(n,1.75);break; // tout les detecteurs
    case 111 :rebondir(n,1.75);break;
    case 112 :rebondir(n,1.75);break;
    case 113 :rebondir(n,1.75);break;
    case 114 :rebondir(n,1.75);break;
    case 115 :rebondir(n,1.75);break;
    case 116 :rebondir(n,1.75);break;
    case 117 :rebondir(n,1.75);break;
    case 118 :rebondir(n,1.75);break;
    case 119 :rebondir(n,1.75);break;

    case 120 :rebondir(n,1.75);break;
    case 121 :rebondir(n,1.75);break;
    case 122 :rebondir(n,1.75);break;
    case 123 :rebondir(n,1.75);break;
    case 124 :rebondir(n,1.75);break;
    case 125 :rebondir(n,1.75);break;
    case 126 :rebondir(n,1.75);break;
    case 127 :rebondir(n,1.75);break;
    case 128 :rebondir(n,1.75);break;
    case 129 :rebondir(n,1.75);break;

    case 140 :rebondir(n,1.75);break;
    case 141 :rebondir(n,1.75);break;
    case 142 :rebondir(n,1.75);break;
    case 143 :rebondir(n,1.75);break;
    case 144 :rebondir(n,1.75);break;
    case 145 :rebondir(n,1.75);break;
    case 146 :rebondir(n,1.75);break;
    case 147 :rebondir(n,1.75);break;
    case 148 :rebondir(n,1.75);break;
    case 149 :rebondir(n,1.75);break;

    case 160 :rebondir(n,1.75);break;
    case 161 :rebondir(n,1.75);break;
    case 162 :rebondir(n,1.75);break;
    case 163 :rebondir(n,1.75);break;
    case 164 :rebondir(n,1.75);break;
    case 165 :rebondir(n,1.75);break;
    case 166 :rebondir(n,1.75);break;
    case 167 :rebondir(n,1.75);break;
    case 168 :rebondir(n,1.75);break;
    case 169 :rebondir(n,1.75);break;

    case 150 : if(ouverture[0]!=0) { rebondir(n,1.75);} break;//porte
    case 151 : if(ouverture[1]!=0) { rebondir(n,1.75);} break;//porte
    case 152 : if(ouverture[2]!=0) { rebondir(n,1.75);} break;//porte
    case 153 : if(ouverture[3]!=0) { rebondir(n,1.75);} break;//porte
    case 154 : if(ouverture[4]!=0) { rebondir(n,1.75);} break;//porte
    case 155 : if(ouverture[5]!=0) { rebondir(n,1.75);} break;//porte
    case 156 : if(ouverture[6]!=0) { rebondir(n,1.75);} break;//porte
    case 157 : if(ouverture[7]!=0) { rebondir(n,1.75);} break;//porte
    case 158 : if(ouverture[8]!=0) { rebondir(n,1.75);} break;//porte
    case 159 : if(ouverture[9]!=0) { rebondir(n,1.75);} break;//porte
  }

//------------------------------------------------DIFFERENTS TOUCHERS (switch derrière de la balle) ------------------------------------------------------------
   switch (getCase(ballX[n-1],ballY[n-1])){ // pour ce qui ce trouve derriere la balle

    case 4 : //mort si touche bloc électrique
    mort[n-1]=true;
    break;

    case 20 :
      tabNiveau[niveau][getY(ballY[n-1])][getX(ballX[n-1])]=0;
      for(int nn=1 ; nn<=2 ; nn++){
        saut[nn-1]=true;
      }
    break;

    case 21 :
      tabNiveau[niveau][getY(ballY[n-1])][getX(ballX[n-1])]=0;
      ralenti=true;
    break;

    case 98 : //Si étoile
      etoilesRamassees++;
      tabNiveau[niveau][getY(ballY[n-1])][getX(ballX[n-1])]=0;
    break;

    case 99 : //victoire si drapeau
      if(nombreEtoiles<=etoilesRamassees){etat='g'; etatNiveau[niveau-1]=1; etatNiveau[niveau]=2;}
    break;

   }

  if(getCase(ballX[n-1]+2,ballY[n-1])==-51 || getCase(ballX[n-1]-2,ballY[n-1])== -51){mort[n-1]=true;}//pour la mort par laser, "2" car il ne fait pas toute la case


}


//----------------------------------------------------------------------REBOND ET TRAINEE----------------------------------------------------------------------

void rebondir(int n ,float detente){//Fait rebondir la balle  PS : detente=1.75  => à peu près naturel
  rebondY[n-1][1]=rebondY[n-1][0];//met en mémoire le dernier choc des balles
  rebondY[n-1][0]=ballY[n-1];
  if(rebondY[n-1][1]-rebondY[n-1][0]<-150) {enregistrePeinture(niveau,ballX[n-1],ballY[n-1],couleurBalles[n-1]);mort[n-1]=true;}//Tue et laisse une trace si chute de trop haut
  else {rebond[n-1] = -1*detente*gravite;}//rebond prend une valeur négative dépendant du paramètre entré et de la gravité

  brouillardtheorique=rebondY[bas][0];
}


void rebond(int n){//gère l'évolution de la variable rebond
 if(rebond[n-1]<0){//si la force vers le haut "rebond" est négative (donc efficace)
   rebond[n-1]=rebond[n-1]-rebond[n-1]/25;}//la force "rebond" rétrécit
 if(rebond[n-1]>0){//Pour que rebond ne dépasse pas le 0 et devienne positif
   rebond[n-1] =0;}

   if(multijoueurs==true) { // cherche la balle la plus basse
     if(ballY[0]>ballY[1]) {bas=0;}
     else {bas=1;}
   }
   else {bas=0;}
}


void trainee(int n) {
  if(trainee==true) {
    for(int i=24; i>0;i--) { //effet de vitesse balle
        posX[n-1][i]=posX[n-1][i-1]; //gere le tableau
        posY[n-1][i]=posY[n-1][i-1];
        posX[n-1][0]=(int)ballX[n-1];
        posY[n-1][0]=(int)ballY[n-1];
    }
    for(int j=0; j<25;j++) {
      pushStyle();
      fill(colorballe[n-1],55-j*2); // affiche la trainee
      noStroke();
      int x=posX[n-1][j];
      int y=posY[n-1][j];
      ellipse(x,y,12-(j/2),12-(j/2));
      popStyle();
    }
  }
}
