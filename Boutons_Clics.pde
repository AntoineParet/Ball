//---------------------BOUTONS DANS LE JEU ------------------------------- METHODES DE CLIC FRONT MONTANT / DESCENDANT ---------------- METHODES TOUCHES DU CLAVIER----------------------------------


/*---------------------------------------------------------------Méthodes boutons---------------------------------------------------------------------------------*/
boolean bouton(int x, int y, boolean z) {
   if(mouseX>x && mouseX<x+60 && mouseY>y && mouseY<y+30 && clic()==true) {
     if(z==true) {z=false;}
     else {z=true;}
   }
  pushStyle();
  noFill();
  stroke(255);
  strokeWeight(4);
  rect(x,y,60,30,20);
  popStyle();
  pushStyle();
  noStroke();
  
  if(z==true) {fill(255);ellipse(x+20,y+15,20,20);}
  else { fill(0); ellipse(x+45,y+15,20,20);}
  popStyle();
  return z;
}

void boutonNiveau(int xMin , int yMin , int numNiveau){
  if (etatNiveau[numNiveau]!=0){
    pushStyle();
    noFill();
    stroke(100);
    strokeWeight(3);
    rect(xMin,yMin, 100, 100,10);
    if(clic(xMin,xMin+100,yMin,yMin+100)==true && etatNiveau[numNiveau]!=3){
      niveau=numNiveau;
      initialisationNiveau();
      etat='j';
    }
    if(numNiveau<10){
      textSize(80);
      text(numNiveau,xMin+25,yMin+82);}
    else{
      textSize(70);
      text(numNiveau,xMin+5,yMin+77);}
    popStyle();
    
    if (etatNiveau[numNiveau]==1){
      image(tick,xMin+15,yMin+60,40,30);
    }
    if (etatNiveau[numNiveau]==3){
      image(cadenas_Locked,xMin+15,yMin+60,40,40);
    }
  }
}


void boutonOptions(){//bouton pour acceder au menu options en cours de jeu
   if(mouseX<40 && mouseY<40) {
     image(boutonOptionNoir,0,0,40,40);
    if(clic()==true) {
      etat='o';}}
    else{image(boutonOptionBlanc,0,0,40,40);}
}
  
void boutonPause() {//bouton pour acceder au menu pause en cours de jeu
  pushStyle();
  imageMode(CORNER);
  if (mouseX>40 && mouseX<80 && mouseY<40) {
    image(boutonPauseNoir, 40, 0, 40, 40);
    if (clic()==true) {
      vPause=true;
    }
  } else {
    image(boutonPauseBlanc, 40, 0, 40, 40);
  }
  popStyle();
}
  
void boutonAutre(int xMin , int yMin , String nom, char mode, int numNiveau){
  pushStyle();
  noFill();
  rect(xMin,yMin, 100, 100);
  if(clic(xMin,xMin+100,yMin,yMin+100)==true){
    niveau=numNiveau;
    etat=mode;
    
  }
  textSize(30);
  text(nom,xMin+10,yMin+88);
  popStyle();
}

/*---------------------------------------------------------------Méthodes clic---------------------------------------------------------------------------------*/

boolean clic(){//Retourne true si clic (front montant)
    if(mousePressed==false){ n=true; }
    if(n==true && mousePressed==true){
      n=false;
      return true;
    }
    else{return false;}
}

boolean clictouche(){//Retourne true si clic (front montant)
    if(keyPressed==false){ k=true; }
    if(k==true && keyPressed==true){
      k=false;
      return true;
    }
    else{return false;}
}

boolean clictouche(char touche){//Retourne true si clic sur une touche (front montant)
    if(keyPressed==false && key==touche){ m=true; }
    if(m==true && keyPressed==true && key==touche){
      m=false;
      return true;
    }
    else{return false;}
}

boolean clicFD(){//Retourne true si clic (front descendant) fonctionne pas
    if(mousePressed==true)
      l=true;
    if(l==true && mousePressed==false) {
      l=false;
      return true;
    }
    else{return false;}
}

boolean clic(int xMin , int xMax , int yMin , int yMax){//Retourne true si clic dans la zone (front montant)
    if(mousePressed==false&& mouseX>xMin && mouseX<xMax && mouseY>yMin && mouseY<yMax)
      o=true;
    if(o==true && mousePressed==true&& mouseX>xMin && mouseX<xMax && mouseY>yMin && mouseY<yMax) {
      o=false;
      return true;
    }
    else return false;
}

//--------------------------------------------------------METHODES TOUCHES CLAVIER (pour pouvoir appuyer sur plusieurs touches en même temps)-------------------------------------------------

void keyPressed() { 

        if ( key == CODED ) {touchesCodees[keyCode] = true;}
        else {touches[key] = true;}
}


void keyReleased() {

        if ( key == CODED ) {touchesCodees[keyCode] = false;}
        else {touches[key] = false;}
}

