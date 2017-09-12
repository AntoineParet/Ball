//----------------------------------------------MODE EDITION NIVEAU-------------------------------------------------------------------------------

void editeur() {
     int resteX = mouseX % 30;        //partie de code s'occupant de placer les cases que a certains endrois, pas n'importe ou
     int xblocMouse = (mouseX - resteX) / 30;
     int resteY = mouseY % 30;
     int yblocMouse = (mouseY - resteY) / 30;
     
     if(xblocMouse<0) {xblocMouse=0;} // evite que le jeu craque
     if(xblocMouse>29) {xblocMouse=29;}
     if(yblocMouse<0) {yblocMouse=0;}
     if(yblocMouse>19) {yblocMouse=19;}
     
  fond();
  
  for(int j=0; j<30 ; j++) {
    stroke(100);
    line(j*30, 0, j*30, 600);// lignes de cadriage
    line(0,j*30, 1200, j*30); // lignes de cadriage
    stroke(0);
  }
  
  
  boolean save;
  if(keyPressed==true && key=='s'){save=true;}else{save=false;}
  if(save==true){
    if(test==1) {sauvegarder();}//pour ne pas sauvegarder lors de la premiere boucle (sinon efface tout)
  }
  sauvegardeEdi=loadStrings("sauvegarde.txt");
  int k=0;
  for(int j=0; j<30 ; j++) {
     for( int i=0 ; i<20 ; i++) {
//       tabNiveau[niveau][i][j]=0; // actualisation
       k++;
       if(save==true){
         nbreCase = Integer.parseInt(sauvegardeEdi[k-1]);
         tabNiveau[0][i][j]=nbreCase;
       }
       if(test==0){nbreCase = Integer.parseInt(sauvegardeEdi[k-1]); tabNiveau[0][i][j]=nbreCase;}
       tabNiveaucopie[0][i][j]=tabNiveau[0][i][j];//copier sur niveau
     }  
  }
 
   test =1;
  
  
  
   niveau=0;
   niveau();
   
    
    //----------------------gestion des touches---------------------------------
   if (clictouche()==true) {
       //----------------------deplacements------------------------------------
    
    if(touchesCodees[RIGHT]==true && cadreX<cadreXmax) {cadreX++; cadreY[cadreX][1]=0;} // gauche et droite
    if(touchesCodees[LEFT]==true && cadreX>0) {cadreX--;cadreXmax=4;}
    
    if(touchesCodees[DOWN]==true && cadreY[cadreX][1]<cadreY[cadreX][2]) {cadreY[cadreX][1]++;}
    if(touchesCodees[UP]==true && cadreY[cadreX][1]>cadreY[cadreX][0]) {cadreY[cadreX][1]--;}
     
    if(touches['q']==true){etat='m';}
    
    if(touches['a']==true) {
       if(supprimer==true) {supprimer=false;}
       else {supprimer=true;}}
       
   if (touches['p']==true) {sauvegarderP();background(255);}
    if (touches['c']==true) { //pour supprimer des blocs
     for(int j=0; j<30 ; j++) {
            for( int i=0 ; i<20 ; i++) {tabNiveau[niveau][i][j]=0;}
         }
     }
   }
    //----------------------cadre---------------------------------------
  pushStyle();
  noStroke();
  fill(200, 100);
  rect(0, cadre, width, 120);
  fill(255, 150);
  rect(0, cadre, 200, 120);
  fill(0);
  textSize(17);
  text("Appuyer sur :", 20, cadre+20);
  text("A pour effacer", 20, cadre+42);
  text("C pour tout effacer", 20, cadre+64);
  text("S pour sauvegarder", 21, cadre+86);
  text("Q pour quitter", 20, cadre+108);
    if(supprimer==true) {fill(255,0,0);textSize(10);text("Mode effacement", mouseX-35, mouseY+25);}
  popStyle();
  
  if (mouseY<height/4) {hauteurcadre=true;}
  if (mouseY>height*3/4) {hauteurcadre=false;} // pour ne pas que le cadre gene
  if(hauteurcadre==false) {cadre=0;}
  else{cadre=480;}
    //----------------------premiers blocs------------------------------------
  pushStyle(); // elements du debut
  textSize(17); // trop long
  text("Classique",8*30+5,cadre+22);
  fill(bloc); //bloc simple
  rect(210,cadre,30,30 );
  
  fill(255);
  textSize(17);
  text("Départs",8*30+5,cadre+52);
  fill(normal[0]);
  noStroke();
  ellipse(225,cadre+45,15,15);
  
  fill(255);
  textSize(17);
  text("Powers-up",8*30+5,cadre+82);
  fill(255,255,0); //balle et drapeau
  pushMatrix();
  translate(210,cadre+60);
  scale(0.1);
  beginShape();
  vertex(150, 30);vertex(120, 150);vertex(180, 150);vertex(150,270);vertex(240, 120);vertex(180, 120);vertex(210, 30);
  endShape(CLOSE);
  popMatrix();
  popStyle();
  
  pushStyle();
  fill(255);
  textSize(17);
  text("Interaction",8*30+5,cadre+112);
  fill(bloc); //bloc simple
  rect(210,cadre+90,30,30 );
  noStroke();
  fill(couleurs[6]);
  rect(220,cadre+100,10,10 );
  popStyle();
  
      
//----------------------cadre mouvants-----------------------------------
    pushStyle();
    noStroke();
   fill(100, 120);
  rect(210+cadreX*120, cadre+cadreY[cadreX][1]*30, 120, 30);
  popStyle();

//----------------------suppression blocs----------------------------------
   if(supprimer==true) {
     choixBloc=0;
     if(tabNiveau[niveau][yblocMouse][xblocMouse]!=0){
       pushStyle();
       stroke(255,0,0);
       strokeWeight(4);
       line(xblocMouse*30,yblocMouse*30,(xblocMouse*30)+30,(yblocMouse*30)+30);
       line(xblocMouse*30,(yblocMouse*30)+30,(xblocMouse*30)+30,yblocMouse*30);
       popStyle();}
 }

//----------------------deplacement pour choix-----------------------------------
if(cadreX>0) {  // si on va plus loin que le cadre 0
  
  switch (cadreY[0][1]){ // on regarde le premier choix
    case 0 : //bloc normaux
        cadreY[1][2]=3;// on a quatres choix
        bloc(11,(cadre/30));
        textSize(17); // reduit car trop long
        text("Immobile",12*30+5,cadre+22);
        blocDescend(11,(cadre/30)+1);
        textSize(17);
        text("Mouvant",12*30+5,cadre+52);
        pushStyle();
        fill(120);
        rect(11*30,cadre+60,30,30); // laser
        popStyle();
        pushStyle();
        fill(20);
        rect(11*30+5,cadre+60,20,7); 
        popStyle();
        pushStyle();
        fill(laser);
        noStroke();
        ellipse(11*30+15,cadre+75, 8,8 );
        popStyle();
        textSize(17);
        text("Rayons",12*30+5,cadre+82);
        image(teleporteur[0][0],11*30+5,cadre+90,30,30);
        textSize(16);
        text("Téléporteur",11*30+30,cadre+112);
        
      if(cadreX>1) {
       switch (cadreY[1][1]){ // on regarde le deuxieme choix
       
             case 0 : //bloc immobiles
             cadreY[2][2]=3;//on a 4  choix
             cadreXmax=2;
              bloc(15,cadre/30);
              textSize(17);
              text("Normal",15*30+35,cadre+22);
              blocCasse(15,(cadre/30)+1);
              textSize(17);
              text("Cassant",15*30+35,cadre+52);
              blocRebond(15,(cadre/30)+2);
              textSize(17);
              text("Rebond",15*30+35,cadre+82);
              image(electricite[0],15*30,((cadre/30)+3)*30,30,30);
              textSize(17);
              text("Electricité",15*30+35,cadre+112);
             break;
             
             case 1 : //bloc mouvants
             cadreY[2][2]=3;
             cadreXmax=2;
              textSize(17);
              blocDescend(15,cadre/30);
              text("Bas",15*30+35,cadre+22);  // blocs mouvant
              blocGauche(15,(cadre/30)+1);
              text("Gauche",15*30+35,cadre+52);
              blocMonte(15,(cadre/30)+2);
              text("Haut",15*30+35,cadre+82);
              blocDroite(15,(cadre/30)+3);
              text("Droite",15*30+35,cadre+112);
             break;
             
             case 2 : //bloc lasers
              cadreY[2][2]=1;
              cadreXmax=3;
              pushStyle();
              fill(120);
              rect(15*30,cadre,30,30); // laser
              popStyle();
              pushStyle();
              fill(20);
              rect(15*30+5,cadre,20,7); 
              popStyle();
              pushStyle();
              fill(laser);
              noStroke();
              ellipse( 15*30+15,cadre+15, 8,8 );
              popStyle();
              textSize(17);
              text("Laser",15*30+35,cadre+22);
              
              pushStyle();
              fill(120);
              rect(15*30,cadre+30,30,30); // Lumiere
              popStyle();
              pushStyle();
              fill(20);
              rect(15*30+5,cadre+30,20,7); 
              popStyle();
              pushStyle();
              fill(lumiere);
              noStroke();
              ellipse( 15*30+15,cadre+45, 8,8 );
              popStyle();
              textSize(17);
              text("Lumiere",15*30+35,cadre+52);
              
              if(cadreX>2) {
                 switch (cadreY[2][1]){ // on regarde le deuxieme choix
                 
                 case 0 :
                  cadreY[3][2]=3;
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+5,cadre,20,7); 
                  popStyle();
                  pushStyle();
                  fill(laser);
                  noStroke();
                  ellipse(19*30+15,cadre+15, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Haut",19*30+35,cadre+22);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+30,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30,cadre+30+5,7,20); 
                  popStyle();
                  pushStyle();
                  fill(laser);
                  noStroke();
                  ellipse(19*30+15,cadre+45, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Gauche",19*30+35,cadre+52);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+60,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+5,cadre+90-7,20,7); 
                  popStyle();
                  pushStyle();
                  fill(laser);
                  noStroke();
                  ellipse(19*30+15,cadre+75, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Bas",19*30+35,cadre+82);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+90,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+30-7,cadre+95,7,20); 
                  popStyle();
                  pushStyle();
                  fill(laser);
                  noStroke();
                  ellipse(19*30+15,cadre+105, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Droite",19*30+35,cadre+112);
                  break;
                  
                  case 1:
                  cadreY[3][2]=3;
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+5,cadre,20,7); 
                  popStyle();
                  pushStyle();
                  fill(lumiere);
                  noStroke();
                  ellipse(19*30+15,cadre+15, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Haut",19*30+35,cadre+22);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+30,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30,cadre+30+5,7,20); 
                  popStyle();
                  pushStyle();
                  fill(lumiere);
                  noStroke();
                  ellipse(19*30+15,cadre+45, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Gauche",19*30+35,cadre+52);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+60,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+5,cadre+90-7,20,7); 
                  popStyle();
                  pushStyle();
                  fill(lumiere);
                  noStroke();
                  ellipse(19*30+15,cadre+75, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Bas",19*30+35,cadre+82);
                  
                  pushStyle();
                  fill(120);
                  rect(19*30,cadre+90,30,30); // laser
                  popStyle();
                  pushStyle();
                  fill(20);
                  rect(19*30+30-7,cadre+95,7,20); 
                  popStyle();
                  pushStyle();
                  fill(lumiere);
                  noStroke();
                  ellipse(19*30+15,cadre+105, 8,8 );
                  popStyle();
                  textSize(17);
                  text("Droite",19*30+35,cadre+112);
                  break;
                 }
              }
             break;
             
              case 3 : //teleporteur
             cadreY[2][2]=3;
             cadreXmax=2;
             image(teleporteur[0][0],15*30,cadre,30,30);
             textSize(17);
             text("Vert",15*30+35,cadre+22);
             image(teleporteur[0][1],15*30,cadre+30,30,30);
             text("Rouge",15*30+35,cadre+52);
             image(teleporteur[0][2],15*30,cadre+60,30,30);
             text("Bleu",15*30+35,cadre+82);
             image(teleporteur[0][3],15*30,cadre+90,30,30);
             text("Violet",15*30+35,cadre+112);
             break;
       }
      }
    break;
    
    case 1 : //bloc departs
        cadreY[1][2]=1;// on a deux choix
         pushStyle(); // balle
        fill(normal[0]);
        noStroke();
        ellipse(345,cadre+15,15,15);
        popStyle();
        textSize(17);text("Départs",12*30+5,cadre+22);
        image(drapeau[0],330,cadre+30,30,30);
        text("Arrivées",12*30+5,cadre+52);
        
      if(cadreX>1) {
        switch (cadreY[1][1]){ // on regarde le deuxieme choix
       
             case 0 : //depart
              cadreY[2][2]=1;
              cadreXmax=2;
              pushStyle(); // balle
              fill(normal[0]);
              noStroke();
              ellipse(465,cadre+15,15,15);
              popStyle();
              fill(255);textSize(17);text("Départ 1",16*30+5,cadre+22);
              pushStyle(); // balle
              fill(normal[1]);
              noStroke();
              ellipse(465,cadre+45,15,15);
              popStyle();
              textSize(17);text("Départ 2",16*30+5,cadre+52);
             break;
             
             case 1:
             cadreY[2][2]=1;
             cadreXmax=2;
             image(drapeau[0],450,cadre,30,30);
             fill(255);textSize(17);
             text("Drapeau",16*30+5,cadre+22);
             text("Etoile",16*30+5,cadre+52);
             image(etoile[0],15*30,cadre+30,30,30);
             break;
        }
      }
    break;
    
    case 2 :
    cadreY[1][2]=1;
    cadreXmax=1;
    image(bonusSaut[0],330,cadre,30,30);
    textSize(17);text("Saut x2",360+5,cadre+22);
    image(bonusRalenti[0],330,cadre+30,30,30);
    text("Ralenti",360+5,cadre+52);
    break;
    
    case 3 :
    cadreY[1][2]=2;
    cadreXmax=3;
    pushStyle();
    fill(100);
    rect(11*30 ,cadre, 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
    popStyle();
    pushStyle(); // point qui annonce si lumiere ou pas
    fill(couleurs[6]);
    noStroke();
    rect(11*30+10,cadre+10, 10,10);
    popStyle();  
    textSize(17);
    text("Porte fermée",12*30,cadre+22);
    
    pushStyle();
    fill(150);
    rect(11*30 ,cadre+30, 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
    popStyle();
    pushStyle(); // point qui annonce si lumiere ou pas
    fill(couleurs[6]);
    noStroke();
    rect(11*30+10,cadre+40, 10,10);
    popStyle();  
    textSize(17); 
    text("Porte ouverte",12*30,cadre+52);

    pushStyle();
    fill(120);
    rect(11*30 ,cadre+60, 30 , 30 );//créer un rectangle de 30*30 de centre (blocX,blocY)
    popStyle();
    pushStyle();
    fill(0);
    arc(11*30+15,cadre+60, 20,20,0,PI);
    popStyle();
    pushStyle(); // point qui annonce si lumiere ou pas
    fill(couleurs[6]);
    noStroke();
    ellipse(11*30+15 ,cadre+60+18, 10,10);
    popStyle();  
    textSize(17);
    text("Capteurs",12*30+5,cadre+82);
    
     if(cadreX>1) {
        switch (cadreY[1][1]){ // on regarde le deuxieme choix
        
        case 0:
        cadreY[2][2]=3;
        cadreXmax=2;
        pushStyle();
        fill(100);
        rect(15*30 ,cadre, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[6]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+10, 10,10);
        popStyle();
        textSize(17);
        text("Rouge",16*30+5,cadre+22);
        
        pushStyle();
        fill(100);
        rect(15*30 ,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[7]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+40, 10,10);
        popStyle();
        textSize(17);
        text("Noir",16*30+5,cadre+52);
        
        pushStyle();
        fill(100);
        rect(15*30 ,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[8]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+70, 10,10);
        popStyle();
        textSize(17);
        text("Gris",16*30+5,cadre+82);
        
        pushStyle();
        fill(100);
        rect(15*30 ,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[9]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+100, 10,10);
        popStyle();
        textSize(17);
        text("Violet",16*30+5,cadre+112);
         break;
         
        case 1:
        cadreY[2][2]=3;
        cadreXmax=2;
        pushStyle();
        fill(150);
        rect(15*30 ,cadre, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[6]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+10, 10,10);
        popStyle();
        textSize(17);
        text("Rouge",16*30+5,cadre+22);
        
        pushStyle();
        fill(150);
        rect(15*30 ,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[7]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+40, 10,10);
        popStyle();
        textSize(17);
        text("Noir",16*30+5,cadre+52);
        
        pushStyle();
        fill(150);
        rect(15*30 ,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[8]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+70, 10,10);
        popStyle();
        textSize(17);
        text("Gris",16*30+5,cadre+82);
        
        pushStyle();
        fill(150);
        rect(15*30 ,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(couleurs[9]); // couleur de la porte
        noStroke();
        rect(15*30+10,cadre+100, 10,10);
        popStyle();
        textSize(17);
        text("Violet",16*30+5,cadre+112);
         break;
         
         case 2:
        cadreY[2][2]=3;
        cadreXmax=3;
        pushStyle();
        fill(120);
        rect(15*30,cadre, 30 , 30 );//detecteur haut
        popStyle();
        pushStyle();
        fill(0);
        arc(15*30+15,cadre,20,20,0,PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(15*30+15, cadre+18 , 10,10);
        popStyle();
         textSize(17);
        text("Haut",16*30+5,cadre+22);
        
        pushStyle();
        fill(120);
        rect(15*30,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(15*30,cadre+45,20,20,3*PI/2,5*PI/2);
        popStyle();
        pushStyle();
        fill(couleurs[6]);
        noStroke();
        ellipse(15*30+18, cadre+45 , 10,10);
        popStyle();
         textSize(17);
        text("Gauche",16*30+5,cadre+52);
        
        pushStyle();
        fill(120);
        rect(15*30,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(15*30+15,cadre+90,20,20,PI,2*PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(15*30+15, cadre+72 , 10,10);
        popStyle();
        textSize(17);
        text("Bas",16*30+5,cadre+82);
        
        pushStyle();
        fill(120);
        rect(15*30,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(15*30+30,cadre+105,20,20,PI/2,3*PI/2);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(15*30+12, cadre+105 , 10,10);
        popStyle();
         textSize(17);
        text("Droite",16*30+5,cadre+112);
        if(cadreX>2) {
        switch (cadreY[2][1]){
          case 0 :
        cadreY[3][2]=3;
        cadreXmax=3;
        pushStyle();
        fill(120);
        rect(19*30,cadre, 30 , 30 );//detecteur haut
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre,20,20,0,PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(19*30+15, cadre+18 , 10,10);
        popStyle();
         textSize(17);
        text("Rouge",20*30+5,cadre+22);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+30, 30 , 30 );//detecteur haut
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+30,20,20,0,PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[7]);
        noStroke();
        ellipse(19*30+15, cadre+48 , 10,10);
        popStyle();
         textSize(17);
        text("Noir",20*30+5,cadre+60-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+60, 30 , 30 );//detecteur haut
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+60,20,20,0,PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[8]);
        noStroke();
        ellipse(19*30+15, cadre+78 , 10,10);
        popStyle();
         textSize(17);
        text("Gris",20*30+5,cadre+90-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+90, 30 , 30 );//detecteur haut
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+90,20,20,0,PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[9]);
        noStroke();
        ellipse(19*30+15, cadre+108 , 10,10);
        popStyle();
         textSize(17);
        text("Violet",20*30+5,cadre+120-8);
          break;
          
          case 1 :
        cadreY[3][2]=3;
        cadreXmax=3;
        pushStyle();
        fill(120);
        rect(19*30,cadre, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30,cadre+15,20,20,3*PI/2,5*PI/2);
        popStyle();
        pushStyle();
        fill(couleurs[6]);
        noStroke();
        ellipse(19*30+18, cadre+15 , 10,10);
        popStyle();
         textSize(17);
        text("Rouge",20*30+5,cadre+30-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30,cadre+45,20,20,3*PI/2,5*PI/2);
        popStyle();
        pushStyle();
        fill(couleurs[7]);
        noStroke();
        ellipse(19*30+18, cadre+45 , 10,10);
        popStyle();
         textSize(17);
        text("Noir",20*30+5,cadre+60-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30,cadre+75,20,20,3*PI/2,5*PI/2);
        popStyle();
        pushStyle();
        fill(couleurs[8]);
        noStroke();
        ellipse(19*30+18, cadre+75 , 10,10);
        popStyle();
         textSize(17);
        text("Gris",20*30+5,cadre+90-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30,cadre+105,20,20,3*PI/2,5*PI/2);
        popStyle();
        pushStyle();
        fill(couleurs[9]);
        noStroke();
        ellipse(19*30+18, cadre+105 , 10,10);
        popStyle();
         textSize(17);
        text("Violet",20*30+5,cadre+120-8);
          break;
          
         case 2 :
        cadreY[3][2]=3;
        cadreXmax=3;
        pushStyle();
        fill(120);
        rect(19*30,cadre, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+30,20,20,PI,2*PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(19*30+15, cadre+12 , 10,10);
        popStyle();
        textSize(17);
        text("Rouge",20*30+5,cadre+30-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+60,20,20,PI,2*PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[7]);
        noStroke();
        ellipse(19*30+15, cadre+42 , 10,10);
        popStyle();
        textSize(17);
        text("Noir",20*30+5,cadre+60-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+90,20,20,PI,2*PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[8]);
        noStroke();
        ellipse(19*30+15, cadre+72 , 10,10);
        popStyle();
        textSize(17);
        text("Gris",20*30+5,cadre+90-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+15,cadre+120,20,20,PI,2*PI);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[9]);
        noStroke();
        ellipse(19*30+15, cadre+102 , 10,10);
        popStyle();
        textSize(17);
        text("Violet",20*30+5,cadre+120-8);
        break;
        
        case 3 :
        cadreY[3][2]=3;
        cadreXmax=3;
        pushStyle();
        fill(120);
        rect(19*30,cadre, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+30,cadre+15,20,20,PI/2,3*PI/2);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[6]);
        noStroke();
        ellipse(19*30+12, cadre+15 , 10,10);
        popStyle();
        textSize(17);
        text("Rouge",20*30+5,cadre+30-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+30, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+30,cadre+45,20,20,PI/2,3*PI/2);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[7]);
        noStroke();
        ellipse(19*30+12, cadre+45 , 10,10);
        popStyle();
        textSize(17);
        text("Noir",20*30+5,cadre+60-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+60, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+30,cadre+75,20,20,PI/2,3*PI/2);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[8]);
        noStroke();
        ellipse(19*30+12, cadre+75 , 10,10);
        popStyle();
        textSize(17);
        text("Gris",20*30+5,cadre+90-8);
        
        pushStyle();
        fill(120);
        rect(19*30,cadre+90, 30 , 30 );
        popStyle();
        pushStyle();
        fill(0);
        arc(19*30+30,cadre+105,20,20,PI/2,3*PI/2);
        popStyle();
        pushStyle(); // point qui annonce si lumiere ou pas
        fill(couleurs[9]);
        noStroke();
        ellipse(19*30+12, cadre+105 , 10,10);
        popStyle();
        textSize(17);
        text("Violet",20*30+5,cadre+120-8);
        break;
        }}
        break;
        }}
    break;
  }
 }
 
 
 if(mousePressed==true && choixBloc!=10 && choixBloc!=11 && (choixBloc<31 ||choixBloc>38)  && choixBloc!=99) {  //si tu appuis, enregistre, mais pas egal a 10 car c'est plus compliqué pour le depart
     tabNiveau[0][yblocMouse][xblocMouse]=choixBloc;
   }
 
    if(mousePressed==true && choixBloc==10) { //si tu appuis, et que tu as choisi depart ou arrivée, enleve celui d'avant
     tabNiveau[0][posedepart0[0]][posedepart0[1]]=0;
     tabNiveau[0][yblocMouse][xblocMouse]=choixBloc;
     posedepart0[0]=yblocMouse;
     posedepart0[1]=xblocMouse;
   }
   
    if(mousePressed==true && choixBloc==11) { // pose un seul depart
     tabNiveau[0][posedepart1[0]][posedepart1[1]]=0;
     tabNiveau[0][yblocMouse][xblocMouse]=choixBloc;
     posedepart1[0]=yblocMouse;
     posedepart1[1]=xblocMouse;
   }
   
    if(choixBloc>30 && choixBloc<38) { // pose un teleporteur
    if(clic()==true) { xtp1=xblocMouse; ytp1=yblocMouse;}
    if(mousePressed==true) {pushStyle();strokeWeight(4);stroke(255);line(xtp1*30+15,ytp1*30+15,xblocMouse*30+15,yblocMouse*30+15);popStyle();image(teleporteur[0][(choixBloc-31)/2],xtp1*30,ytp1*30,30,30);}
    if(clicFD()==true) {tabNiveau[0][ytp1][xtp1] =choixBloc+1;tabNiveau[0][yblocMouse][xblocMouse] =choixBloc;}
   }
   
   if(mousePressed==true && choixBloc==99) { //si tu appuis, et que tu as choisi depart ou arrivée, enleve celui d'avant
     tabNiveau[0][arrivee[0]][arrivee[1]]=0; // eleve drapeau d'avnt
     tabNiveau[0][arrivee[0]+1][arrivee[1]]=arrivee[2];//remet l'ancien truc sous drapeau
     arrivee[2]=tabNiveau[0][yblocMouse+1][xblocMouse];// retient ce qu'il y avit sous le drapeua
     tabNiveau[0][yblocMouse][xblocMouse]=choixBloc;// pose drapeau
     arrivee[2]=tabNiveau[0][yblocMouse+1][xblocMouse]; //retient dessous
     tabNiveau[0][yblocMouse+1][xblocMouse]=1;// pose bloc simple dessous
     arrivee[0]=yblocMouse;
     arrivee[1]=xblocMouse;
   }
   
 if(supprimer==false) { // a part si suppresion est activée
     if(cadreY[0][1]==0) {  // affiche tout les blocs quel qu'ils soit, qui ce trouvent sous la souris
       if(cadreY[1][1]==0) {
         if(cadreY[2][1]==0) {
           bloc(xblocMouse,yblocMouse);
           choixBloc=1;
         }
         if(cadreY[2][1]==1) {
           blocCasse(xblocMouse,yblocMouse);
           choixBloc=3;
         }
         if(cadreY[2][1]==2) {
           blocRebond(xblocMouse,yblocMouse);
           choixBloc=2;
         }
         if(cadreY[2][1]==3) {
           image(electricite[0],xblocMouse*30,yblocMouse*30,30,30);
           choixBloc=4;
         }
       
       }
       if(cadreY[1][1]==1) {
         if(cadreY3==0) {
           blocDescend(xblocMouse,yblocMouse);
           choixBloc=40;
         }
         if(cadreY[2][1]==1) {
           blocGauche(xblocMouse,yblocMouse);
           choixBloc=41;
         }
         if(cadreY[2][1]==2) {
           blocMonte(xblocMouse,yblocMouse);
           choixBloc=42;
         }
         if(cadreY[2][1]==3) {
           blocDroite(xblocMouse,yblocMouse);
           choixBloc=43;
         }
       }
       if(cadreY[1][1]==2) {
         if(cadreY[2][1]==0) {
           if(cadreY[3][1]==0) {
               blocLaserhauton(xblocMouse,yblocMouse);
               choixBloc=51;  
            }
             if(cadreY[3][1]==2) {
               blocLaserbason(xblocMouse,yblocMouse);
               choixBloc=53;  
            }
             if(cadreY[3][1]==1) {
               blocLasergaucheon(xblocMouse,yblocMouse);
               choixBloc=55;  
            }
             if(cadreY[3][1]==3) {
               blocLaserdroiteon(xblocMouse,yblocMouse);
               choixBloc=57;  
            }
         if(cadreY[2][1]==1) {
           blocLumierehauton(xblocMouse,yblocMouse);
           choixBloc=52;
         }
         }
         if(cadreY[2][1]==1) {
           if(cadreY[3][1]==0) {
               blocLumierehauton(xblocMouse,yblocMouse);
               choixBloc=52;  
            }
             if(cadreY[3][1]==2) {
               blocLumierebason(xblocMouse,yblocMouse);
               choixBloc=54;  
            }
             if(cadreY[3][1]==1) {
               blocLumieregaucheon(xblocMouse,yblocMouse);
               choixBloc=56;  
            }
             if(cadreY[3][1]==3) {
               blocLumieredroiteon(xblocMouse,yblocMouse);
               choixBloc=58;  
            }
         }
       }
       if(cadreY[1][1]==3) {
         if(cadreY[2][1]==0) {
             choixBloc=31;
             if(mousePressed==false) {
             image(teleporteur[0][0],xblocMouse*30,yblocMouse*30,30,30);
             }
             else{
            pushMatrix();
            translate(xblocMouse*30,yblocMouse*30);
            rotate(PI);
            image(teleporteur[0][0],-30,-30,30,30);
            popMatrix();
            }
           }
           
           
           if(cadreY[2][1]==1) {
             choixBloc=33;
             if(mousePressed==false) {
             image(teleporteur[0][1],xblocMouse*30,yblocMouse*30,30,30);
             }
             else{
            pushMatrix();
            translate(xblocMouse*30,yblocMouse*30);
            rotate(PI);
            image(teleporteur[0][1],-30,-30,30,30);
            popMatrix();}
           }
           
           
           if(cadreY[2][1]==2) {
             choixBloc=35;
             if(mousePressed==false) {
             image(teleporteur[0][2],xblocMouse*30,yblocMouse*30,30,30);
             }
             else{
            pushMatrix();
            translate(xblocMouse*30,yblocMouse*30);
            rotate(PI);
            image(teleporteur[0][2],-30,-30,30,30);
            popMatrix();}
           }
           
           
           if(cadreY[2][1]==3) {
             choixBloc=37;
             if(mousePressed==false) {
             image(teleporteur[0][3],xblocMouse*30,yblocMouse*30,30,30);
             }
             else{
            pushMatrix();
            translate(xblocMouse*30,yblocMouse*30);
            rotate(PI);
            image(teleporteur[0][3],-30,-30,30,30);
            popMatrix();}
           }
         }
       }
     if(cadreY[0][1]==1) {
       if(cadreY[1][1]==0) {
           if(cadreY[2][1]==0) {
              pushStyle(); // balle
              fill(normal[0]);
              noStroke();
              ellipse((xblocMouse*30)+15,(yblocMouse*30)+15,15,15);
              popStyle();
              choixBloc=10;
           }
           if(cadreY[2][1]==1) {
             pushStyle(); // balle
              fill(normal[1]);
              noStroke();
              ellipse((xblocMouse*30)+15,(yblocMouse*30)+15,15,15);
              popStyle();
              choixBloc=11;
           }
       }
       if(cadreY[1][1]==1) {
         if(cadreY[2][1]==0) {
          image(drapeau[0],(xblocMouse*30),(yblocMouse*30),30,30);
         choixBloc=99;
         bloc(xblocMouse,yblocMouse+1);}
         if(cadreY[2][1]==1) {
          image(etoile[0],(xblocMouse*30),(yblocMouse*30),30,30);
         choixBloc=98;}
       }
         
     }
  if(cadreY[0][1]==2) {
    if(cadreY[1][1]==0) {
    pushStyle();
    image(bonusSaut[0],(xblocMouse*30),(yblocMouse*30),30,30);
    popStyle();
    choixBloc=20;
    }
    if(cadreY[1][1]==1) {
    pushStyle();
    image(bonusRalenti[0],(xblocMouse*30),(yblocMouse*30),30,30);
    popStyle();
    choixBloc=21;
    }
     }
   if(cadreY[0][1]==3) {
    if(cadreY[1][1]==0) {
      if(cadreY[2][1]==0) {
        porteNC(xblocMouse,yblocMouse,0);
        choixBloc=150;}
      if(cadreY[2][1]==1) {
        porteNC(xblocMouse,yblocMouse,1);
        choixBloc=151;}
      if(cadreY[2][1]==2) {
        porteNC(xblocMouse,yblocMouse,2);
        choixBloc=152;}
      if(cadreY[2][1]==3) {
        porteNC(xblocMouse,yblocMouse,3);
        choixBloc=153;}
    }
    if(cadreY[1][1]==1) {
        if(cadreY[2][1]==0) {
          porteNO(xblocMouse,yblocMouse,0);
          choixBloc=100;}
        if(cadreY[2][1]==1) {
          porteNO(xblocMouse,yblocMouse,1);
          choixBloc=101;}
        if(cadreY[2][1]==2) {
          porteNO(xblocMouse,yblocMouse,2);
          choixBloc=102;}
        if(cadreY[2][1]==3) {
          porteNO(xblocMouse,yblocMouse,3);
          choixBloc=103;}
    }
    if(cadreY[1][1]==2) {
      if(cadreY[2][1]==0) {
        if(cadreY[3][1]==0) {
          detecteurhaut(xblocMouse,yblocMouse,0);
          choixBloc=160;}
        if(cadreY[3][1]==1) {
          detecteurhaut(xblocMouse,yblocMouse,1);
          choixBloc=161;}
        if(cadreY[3][1]==2) {
          detecteurhaut(xblocMouse,yblocMouse,2);
          choixBloc=162;}
        if(cadreY[3][1]==3) {
          detecteurhaut(xblocMouse,yblocMouse,3);
          choixBloc=163;}
      }
      if(cadreY[2][1]==1) {
        if(cadreY[3][1]==0) {
          detecteurgauche(xblocMouse,yblocMouse,0);
          choixBloc=140;}
        if(cadreY[3][1]==1) {
          detecteurgauche(xblocMouse,yblocMouse,1);
          choixBloc=141;}
        if(cadreY[3][1]==2) {
          detecteurgauche(xblocMouse,yblocMouse,2);
          choixBloc=142;}
        if(cadreY[3][1]==3) {
          detecteurgauche(xblocMouse,yblocMouse,3);
          choixBloc=143;}
      }
      if(cadreY[2][1]==2) {
        if(cadreY[3][1]==0) {
          detecteurbas(xblocMouse,yblocMouse,0);
          choixBloc=110;}
        if(cadreY[3][1]==1) {
          detecteurbas(xblocMouse,yblocMouse,1);
          choixBloc=111;}
        if(cadreY[3][1]==2) {
          detecteurbas(xblocMouse,yblocMouse,2);
          choixBloc=112;}
        if(cadreY[3][1]==3) {
          detecteurbas(xblocMouse,yblocMouse,3);
          choixBloc=113;}
      }
      if(cadreY[2][1]==3) {
        if(cadreY[3][1]==0) {
          detecteurdroite(xblocMouse,yblocMouse,0);
          choixBloc=120;}
        if(cadreY[3][1]==1) {
          detecteurdroite(xblocMouse,yblocMouse,1);
          choixBloc=121;}
        if(cadreY[3][1]==2) {
          detecteurdroite(xblocMouse,yblocMouse,2);
          choixBloc=122;}
        if(cadreY[3][1]==3) {
          detecteurdroite(xblocMouse,yblocMouse,3);
          choixBloc=123;}
      }
    }
   }
 }
 
 for(int j=0; j<30 ; j++) {
     for( int i=0 ; i<20 ; i++) {
        if(tabNiveau[niveau][i][j]==10){ // affiche la balle car le bloc depart est invisible
        posedepart0[0]=i;posedepart0[1]=j;
        pushStyle(); // balle
        fill(normal[0]);
        noStroke();
        ellipse((j*30)+15,(i*30)+15,15,15);
        popStyle();}
        if(tabNiveau[niveau][i][j]==11){ // affiche la balle car le bloc depart est invisible
        posedepart1[0]=i;posedepart1[1]=j;
        pushStyle(); // balle
        fill(normal[1]);
        noStroke();
        ellipse((j*30)+15,(i*30)+15,15,15);
        popStyle();
        }
        if(tabNiveau[niveau][i][j]==32){
          image(teleporteur[0][0],j*30,i*30,30,30);}
        if(tabNiveau[niveau][i][j]==34){
          image(teleporteur[0][1],j*30,i*30,30,30);}
        if(tabNiveau[niveau][i][j]==36){
          image(teleporteur[0][2],j*30,i*30,30,30);}
        if(tabNiveau[niveau][i][j]==38){
          image(teleporteur[0][3],j*30,i*30,30,30);}
        if(tabNiveau[niveau][i][j]==31){
          pushMatrix();
          translate(j*30,i*30);
          rotate(PI);
          image(teleporteur[0][0],-30,-30,30,30);
          popMatrix();
        }
        if(tabNiveau[niveau][i][j]==31){
          pushMatrix();
          translate(j*30,i*30);
          rotate(PI);
          image(teleporteur[0][0],-30,-30,30,30);
          popMatrix();
        }
        if(tabNiveau[niveau][i][j]==33){
          pushMatrix();
          translate(j*30,i*30);
          rotate(PI);
          image(teleporteur[0][1],-30,-30,30,30);
          popMatrix();
        }
        if(tabNiveau[niveau][i][j]==35){
          pushMatrix();
          translate(j*30,i*30);
          rotate(PI);
          image(teleporteur[0][2],-30,-30,30,30);
          popMatrix();
        }
        if(tabNiveau[niveau][i][j]==37){
          pushMatrix();
          translate(j*30,i*30);
          rotate(PI);
          image(teleporteur[0][3],-30,-30,30,30);
          popMatrix();
        }
     }
 }
}
