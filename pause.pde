//-------------------------------MENU PAUSE --------------------------------------------------------------

void pause() {
  if (clictouche(' ')==true ) {//si appui sur espace...

    if ( vPause==true) {//...quand pause
      vPause=false;
    }//alors enlever pause
    else {//...quand pas pause
      vPause=true;
    }//alors pause
  }


  if (vPause == true) {
    menuPause();
  }
}

void menuPause() {
  background(160);
  textSize(50);
  text("PAUSE", 365, 85);


  for (int i=30; i<height; i=i+80) { // cree les boutons degradés
    if (mouseY>i+100 && mouseY<i+180 && mouseX>width/2-255 && mouseX<width/2+255 && i<400) {
      imageMode(CENTER);
      image(boutonMPause, width/2, i+143,550,80);
    }
  }

  for (int i=30; i<height; i=i+80) { // cree les traits degradés
    imageMode(CENTER);
    image(ligneMPause, width/2, i+100);
    imageMode(CORNER);
  }



  fill(0, 50);
  fill(255);
  textSize(37);
  text("Reprendre la partie", 270, 185); 
 text("Recommencer la partie",240,265); 
  text("Options", 365, 345);  
  text("Retour au menu", 305, 425);
  text("Quitter le jeu", 325, 505);

  if (mouseX>width/2-255 && mouseX<width/2+255 && mouseY>130 && mouseY<530) {
    cursor(HAND); 
    if (mouseY>130  &&  mouseY<210  ) {
      if (clic()==true) {
        vPause=false;
      }
    }
    if (mouseY>210  &&  mouseY<290  ) {
      if (clic()==true) {
        initialisationNiveau();
        vPause=false;
      }
    }
    if (mouseY>290  &&  mouseY<370  ) {
      if (clic()==true) {
        etat='o'; 
        vPause=false;
      }
    }
    if (mouseY>370  &&  mouseY<450  ) {
      if (clic()==true) {
        etat='m'; 
        vPause=false;
      }
    }
    if (mouseY>450  &&  mouseY<530  ) {
      if (clic()==true) {
        exit();
      }
    }
    
  }
}


