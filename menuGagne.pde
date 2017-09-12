//---------------------------------------------MENU A LA FIN D'UN NIVEAU ---------------------------------------------------------------

void menuVictoire(){
  image(fondMenuVictoire,250,200,400,200);
  
  
     if(mouseX>298 && mouseX<373 && mouseY>300 && mouseY<375){
       image(boutonReplayGris,298,300,75,75);
       if(clic()==true){initialisationNiveau(); etat='j';}
     }
     else{image(boutonReplayBlanc,298,300,75,75);}
    
     if(mouseX>413 && mouseX<488 && mouseY>300 && mouseY<375){
       image(boutonNextGris,413,300,75,75);
       if(clic()==true){niveau++; initialisationNiveau(); etat='j';}
     }
     else{image(boutonNextBlanc,413,300,75,75);}
    
     if(mouseX>528 && mouseX<603 && mouseY>300 && mouseY<375){
       image(boutonRetourMenuGris,528,300,75,75);
       if(clic()==true){etat='m';}
     }
     else{image(boutonRetourMenuBlanc,528,300,75,75);}
}
