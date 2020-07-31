void settings() {
  size(900,600);//multiples de 30  (30*20)
}

void setup() {

etat='a'; // état lors du lancement : acceuil

//--------------------------------------------Initialisation des variables PImage-------------------------------------------------------------------------------------------------------------------
ville = loadImage("ville.png");
tick = loadImage("tick.png");
cadenas_Locked = loadImage("cadenas_Locked.png");
villeconstruction = loadImage("villeconstruction.png");
plateforme = loadImage("plateforme.png");
lasers = loadImage("lasers.png");
amis = loadImage("Amis.png");
coop = loadImage("Coop.png");
splashSprite = loadImage("Sprite splash.png");
retour = loadImage("Bouton replay.png");
retourGris = loadImage("Bouton retour gris.png");
teleport = loadImage("Sprite teleporteurs.png"); 
drap = loadImage("drapeau.png");
electric = loadImage("Sprite éléctricité.png");
blocFragile = loadImage("Bloc Fragile.png");
blocSaut = loadImage("Bloc saut.png");
boutonMPause = loadImage("bouton menu pause enfoncé.png");
ligneMPause = loadImage("separations bouton menu pause.png");
boutonPauseBlanc = loadImage("Bouton pause blanc.png");
boutonPauseNoir = loadImage("Bouton pause noir.png");
boutonOptionBlanc = loadImage("Bouton options blanc.png");
boutonOptionNoir = loadImage("Bouton options noir.png");
imageAcceuil = loadImage("Ball page d'acceuil.png");
bonusSauts = loadImage("Sprite Bonus saut.png");
bonusSlowMo = loadImage("Sprite Bonus ralenti.png");
etoiles = loadImage("Sprite etoile.png");
fondMenuVictoire = loadImage("Fond menu gagné.png");
boutonReplayBlanc = loadImage("Bouton replay blanc.png");
boutonReplayGris = loadImage("Bouton replay gris.png");
boutonNextBlanc = loadImage("Bouton suivant blanc.png");
boutonNextGris = loadImage("Bouton suivant gris.png");
boutonRetourMenuBlanc = loadImage("Bouton retour menu blanc.png");
boutonRetourMenuGris = loadImage("Bouton retour menu gris.png");
maitre = loadImage("Maitre.png");
tuto = loadImage("Tuto.png");

//-----------------------------------------------Découpage des sprites en tableaux d'images----------------------------------------------------------------------------------------------------------
for(int i = 0; i<5; i++) {
  for(int j=0; j<17; j++) {
    splash[i][j] = splashSprite.get(i*160,j*120,160,120);//découpage du sprite
  }
}

for(int j =0 ; j<4 ; j++){
  for(int i = 0; i<6; i++) {
    teleporteur[i][j]=teleport.get(i*300,j*300,300,300);//découpage du sprite 
  }
}

for(int j =0 ; j<9 ; j++){
    electricite[j]=electric.get(j*120,0,120,120);//découpage du sprite 
}

for(int i = 0; i<9; i++) {
  drapeau[i]=drap.get(i*150,0,150,150);//découpage du sprite
}

for(int i = 0; i<16; i++) {
  bonusSaut[i]=bonusSauts.get(i*120,0,120,120);//découpage du sprite
}

for(int i = 0; i<16; i++) {
  bonusRalenti[i]=bonusSlowMo.get(i*120,0,120,120);//découpage du sprite
}

for(int i = 0; i<11; i++) {
  etoile[i]=etoiles.get(i*120,0,120,120);//découpage du sprite
}

//----------------------------------------------------------Copie du niveau "neuf" (sans modificatrion des blocs déplaçables, cassables etc...)------------------------------------------------------------------

for(int k=0; k<nombreNiveaux; k++){ // fait une copie de l'etat des niveau pour remettre a 0 en cas de mort.
 for(int i = 0; i<20; i++) {
  for(int j=0; j<30; j++) {
 tabNiveaucopie[k][i][j]=tabNiveau[k][i][j];
}}}
}
