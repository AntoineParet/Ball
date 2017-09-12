//----------------------------- MENU OPTIONS -----------------------------------------
void options() {
  background(160);
  textSize(50);
  fill(255);
  text("OPTIONS",330,60);
  
  for (int i=85; i<height; i=i+50) { // cree les traits degradés
    imageMode(CENTER);
    image(ligneMPause, width/2, i+50);
    imageMode(CORNER);
  }  
  
  textSize(20);
  text("Trainée des balles",300,40+76);
  text("Trace à la mort",300,90+76);
  text("MultiJoueurs",300,140+76);
  text("Brouillard",300,190+76);
  text("Couleur balle 1",300,240+76);
  text("Couleur balle 2",300,290+76);
  text("Contour des balles",300,340+76);
  trainee = bouton(600,20+76,trainee); //crée le bouton interrupteur
  trace = bouton(600,70+76,trace); //crée le bouton interrupteur
  multijoueurs = bouton(600,120+76,multijoueurs); //crée le bouton interrupteur
  fumee = bouton(600,170+76,fumee); //crée le bouton interrupteur
  contour = bouton(600,320+76,contour); //crée le bouton interrupteur
  pushMatrix();
  pushStyle(); 
  scale(0.7);
  if(mouseX<60 && mouseY<48) { //changement de couleur au survol (pour dessin du bouton)
    stroke(0);fill(0);
    if(clic()== true) { etat='j';}
  }
  else {stroke(255);fill(255);}
// dessine le logo "retour au jeu"
  strokeWeight(5);
  line(20,20,20,60);
  line(20,60,50,60);
  line(20,20,50,20);
  line(50,20,50,30);
  line(50,60,50,50);
  rect(35,39,20,4);
  triangle(59,30,59,50,75,39);
  popStyle();
  popMatrix();
  
  for(int j =0; j<2 ; j++ ){
    for(int i =0; i<16 ; i++ ){//Dessin des rectancles de couleur
      pushStyle();
      stroke(0);
      fill(couleurs[i]);
      if(i<8){rect(510+i*20,245+47+j*50,15,15);}
      if(i>=8){rect(350+i*20,245+67+j*50,15,15);}
      
      if(i<8 && mouseX>510+i*20 && mouseX<525+i*20 && mouseY>292+j*50 && mouseY<307+j*50){pushStyle(); noFill(); strokeWeight(2); rect(510+i*20,245+47+j*50,15,15); popStyle(); if(clic()==true){ couleurBalles[j]=i;}} //changement de couleur de la balle (rangée haut)
      if(i>=8 && mouseX>350+i*20 && mouseX<365+i*20 && mouseY>312+j*50 && mouseY<327+j*50){pushStyle(); noFill(); strokeWeight(2); rect(350+i*20,245+67+j*50,15,15); popStyle();   if(clic()==true){ couleurBalles[j]=i;}}//changement de couleur de la balle (rangée bas)
      stroke(255);
      strokeWeight(2);
      if(i==couleurBalles[j]){if(i<8){rect(510+i*20,245+47+j*50,15,15);} if(i>=8){rect(350+i*20,245+67+j*50,15,15);}}
      popStyle();  
    }
  }
  
}
