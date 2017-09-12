void draw() {
  if(ralenti==true){frameRate(30);}else{frameRate(60);}//ralenti le jeu si le bonus ralenti est actif
  cursor(ARROW);//pour que le curseur ne reste pas une main
  switch(etat){
    case 'a':  acceuil();   break;      //Page d'acceuil (image + cliquer pour passer)
    case 'm':  menu();  break;          //Menu principal
    case 'c':  choix(); break;          //Menu de choix des niveaux dans un monde (la variable "choix" est le n° du monde) 
    case 'j':  jeu();  break;           //Lors du jeu (jeu niveaux + niveau édité)
    case 'o':  options();  break;       //Menu de options
    case 'e':  editeur();  break;       //Edition des niveaux
    case 't':  tutoriel();  break;      //Tutoriel
    case 'g':  menuVictoire(); break;   //Menu lors de la fin d'un niveau
  }
   if(clicFD()==true);//la méthode clic front descendant a besoin de s'exécuter au moins 2 fois par boucle pour fonctionner correctement, ligne à laisser même si elle semble inutile
  
//  println(mouseX+" ; "+mouseY);   //DEBUG : afficher les coordonnées de la souris
//  text("X="+mouseX,mouseX, mouseY+50); text("Y="+mouseY,mouseX, mouseY+70);  //DEBUG : afficher les coordonnées de la souris à côté de la souris
//  if(mousePressed==true){ballX[0]=mouseX;ballY[0]=mouseY;}  //DEBUG : pour se déplacer plus facilement dans les niveaux (téléportation au clic)
}
