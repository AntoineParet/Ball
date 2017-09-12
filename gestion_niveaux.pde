//--------------------------- INITIALISATION NIVEAU --------------------------- CHARGER NIVEAU --------------------------- SAUVEGARDER NIVEAU

void initialisationNiveau(){//remise à 0 du niveau (Balle point de départ, blocs réparés...)
  for(int n=1; n<=2;n++) {
    saut[n-1]=false; // pour ne pas garder de double saut apres la mort
     bouleX=0; // meme principe que ligne du dessus
  }
//  for(int k=0; k<nombreNiveaux; k++){ // a changer en fonction du nombre de niveaux // commence a 1 pour ne pas reinitialiser le niveau edité

    nombreEtoiles=0;
    etoilesRamassees=0;
    for(int i = 0; i<20; i++) {
      for(int j=0; j< 30; j++) {
        int k=niveau;  // j'ai enlevé le fait de mettre en memoire tout les niveaux
        tabNiveau[k][i][j]=tabNiveaucopie[k][i][j]; // remet comme au debut
        if( tabNiveau[k][i][j]==11 ||  tabNiveau[k][i][j]==10) {brouillardreel=i*30+60;}
        if(tabNiveau[k][i][j]==98){nombreEtoiles++;}
        if(tabNiveau[k][i][j]==10){ ballX[0]=j*30+15; ballY[0]=i*30+15; rebondY[0][0]=i*30+15;}
        if(tabNiveau[k][i][j]==11){ ballX[1]=j*30+15; ballY[1]=i*30+15; rebondY[1][0]=i*30+15;}
        tabTransparent[i][j]=0; // reinitialisation du niveau fantome
        if(tabNiveau[k][i][j]==10 // depart
            || tabNiveau[k][i][j]==11 //depart 2
            || tabNiveau[k][i][j]==31 //teleporteur
            || tabNiveau[k][i][j]==32 //2em
            || tabNiveau[k][i][j]==33 //teleporteur
            || tabNiveau[k][i][j]==34 //2em
            || tabNiveau[k][i][j]==35 //teleporteur
            || tabNiveau[k][i][j]==36 //2em
            || tabNiveau[k][i][j]==37 //teleporteur
            || tabNiveau[k][i][j]==38 //2em
            ){tabTransparent[i][j]=tabNiveau[k][i][j];
              tabNiveau[k][i][j]=0;}
        
  } } 
  
  ralenti=false;
}

void chargerNiveau(){//charge le niveau enregistré en .txt
sauvegardeEdi=loadStrings("sauvegarde.txt");
  int k=0;
  for(int j=0; j<30 ; j++) {
     for( int i=0 ; i<20 ; i++) {//parcours le niveau
         k++;
         nbreCase = Integer.parseInt(sauvegardeEdi[k-1]);//nombreCase devient ce qui est écrit dans bloc note
         tabNiveau[0][i][j]=nbreCase;//affecte à chaque case la k_ème valeur du .txt
         tabNiveaucopie[0][i][j]=tabNiveau[0][i][j];//copier sur niveau
     }  
  }
}

void sauvegarder(){//sauvegarder niveau actuel dans le .txt
  niveau = 0;
  note = createWriter("sauvegarde.txt"); 
  for(int j=0; j<30 ; j++) {
     for( int i=0 ; i<20 ; i++) {
       note.println(getCase(j*30+10,i*30+10)); 
       note.flush();
     }  
  } 
  
}


void sauvegarderP(){//Pour nous : copier le niveau vers "niveau créé.txt"
  niveau = 0;
  note = createWriter("niveau créé.txt"); 
  for(int j=0; j<20 ; j++) {
    if(j!=0){note.print("                     {");}else{note.print("                    {{");}
     for( int i=0 ; i<30 ; i++) {
       note.print(getCase(i*30+10,j*30+10)+","); 
     }  
     if(j!=19){note.print("},");} else{note.print("}},");}
     if(j==0){note.print("//Niveau ");}
     note.println();
  } 
  note.flush();
}

