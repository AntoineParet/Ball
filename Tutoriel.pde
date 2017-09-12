void tutoriel() {
  fond();//Ce qui s'affichera derrière
  obstacles();//La partie "active" (Balle, blocs...)
  if ( debut == true) {
    for(int j=0; j<30 ; j++) {
       for( int i=0 ; i<20 ; i++) {tabNiveaucopie[0][i][j]=tabtuto[0][i][j];}}
     }
     
   if ( debut == true ||mort[0]==true ||mort[1]==true){//remise à 0 du niveau
      initialisationNiveau();
      debut=false;
    }
    
  niveau=0;
  multijoueurs=false;
  if(page>8) {fumee=true;}
    else{fumee=false;brouillardreel=600;} // apparition du brouillard
  if(fumee==true) {brouillard();}
  
  if(page>9) {trainee=true;}
    else{trainee=false;}
    
  if(page>15) {multijoueurs=true;}
    else{multijoueurs=false;}
    
    if(page>2) {direction();} // debloque les directions
    
  pushStyle();
  textSize(30);
  textAlign(CENTER);
  text(tutoriel[page],100,pageY,700,500);//écrit les paroles du maitre
  
//----------------------Transitions entre les pages : ce qu'il faut faire, à quelle condition----------------------
  if(page==0) { if(clic()==true) {page++;}; textSize(20); text("Appuie n'importe où sur l'écran pour passer à la suite",400,200);}
  popStyle();
  if(page==1) { if(clic()==true) {page++;} }
  if(page==2) { if(clic()==true) {page++;maitreXt=400;maitreYt=450;} }
  if(page==3) { if(ballX[0]>250) {page++;} }
  if(page==4) { if(ballX[0]>400) {page++;maitreXt=600;} }
  if(page==5) { if(ballX[0]>500 && ballY[0]>590) {page++;} }
  if(page==6) { if(ballX[0]>200 && ballX[0]<500) {page++;} }
  if(page==7) { if(ballX[0]>550) {page++;maitreXt=870;maitreXt=730;} }
  if(page==8) { if(ballX[0]>760) {page++;maitreYt=230;} }
  if(page==9) { if(ballX[0]<740 && ballY[0]<360) {page++;maitreXt=540;maitreYt=140;} }
  if(page==10) { if(ballX[0]<620 && ballY[0]<200) {page++;pageY=300;maitreXt=270;maitreYt=50;} }
  if(page==11) { if(ballX[0]<320 && ballY[0]<200) {page++;maitreXt=100;maitreYt=100;} }
  if(page==12) { if(ballX[0]<260 && ballY[0]>500) {page++;} }
  if(page==13) { if(ballX[0]>170 && ballY[0]>450) {page++;maitreXt=300;maitreYt=420;} }
  if(page==14) { if(ballX[0]>440) {page++;maitreXt=450;} }
  if(page==15) { if(ballY[0]<90) {page++;maitreXt=550; maitreYt=60;ballX[1]=225; ballY[1]=30;} }
  if(page==16) { if(ballX[1]<180 || ballX[1]>270) {page++; maitreXt=330; maitreYt=200; for(int j=0; j<30 ; j++) {for( int i=0 ; i<20 ; i++) {tabNiveaucopie[0][i][j]=tabtuto[2][i][j];}} initialisationNiveau(); }}
  if(page==17) { if(ballX[0]>500 || ballX[1]>500)  {page++; maitreXt=800; maitreYt=80;}}
  if(page==18) { if(ballY[0]>350 || ballY[1]>350)  {page++; maitreXt=195; maitreYt=310;}}
  if(page==19) { if(ballY[0]>350 && ballX[0]>175 || ballY[1]>350 && ballX[1]>175)  {page++;}}
  if(page==20) { if(saut[0]==true || saut[1]==true)  {page++;pageY=pageY-150;}}
  if(page==21) {if(ballX[0]>380 && ballY[0]>275|| ballX[1]>380 && ballY[1]>275){page++; maitreXt=330; maitreYt=235;}}
  if(page==22) {if(ralenti==true){page++; maitreXt=600; maitreYt=480;}}
  if(page==23) {if(ballX[0]>750 && ballY[0]>357|| ballX[1]>750 && ballY[1]>357){page++; maitreXt=765; maitreYt=250; for(int j=0; j<30 ; j++) {for( int i=0 ; i<20 ; i++) {tabNiveaucopie[0][i][j]=tabtuto[3][i][j];}} initialisationNiveau();}}
  if(page==24 ){if(ballX[0]<750 || ballX[1]<750){page++;maitreXt=400; maitreYt=250;}}
  if(page==25) {if(ballX[0]>330 && ballX[0]<360 && ballY[0]>360  ||   ballX[1]>330 && ballX[1]<360 && ballY[1]>360){page++;}}
  if(page==26) {if((ballX[0]>330 && ballX[0]<360 && ballY[0]>360  ||   ballX[1]>330 && ballX[1]<360 && ballY[1]>360) && nombreEtoiles==etoilesRamassees){page++;maitreXt=435; maitreYt=300; pageY=pageY-10; }}
  
  if(page>5 && page<=11){tabNiveaucopie[0][18][13]=2;}//bloc rebondissant qui apparait
  if(page==16){tabNiveaucopie[0][1][8]=10;tabNiveaucopie[0][16][1]=0;}//départ de la balle 1 qui se déplace en haut
  if(page>=24){drapeau(11,12);} //drapeau
  
  if(page>11 && page<16) { //niveau tuto 1
    for(int j=0; j<30 ; j++) {
       for( int i=0 ; i<20 ; i++) {
         tabNiveaucopie[0][i][j]=tabtuto[1][i][j];}}
  }
  
  if(page>=17 && page<24) { //niveau tuto 2
    for(int j=0; j<30 ; j++) {
       for( int i=0 ; i<20 ; i++) {
         tabNiveaucopie[0][i][j]=tabtuto[2][i][j];}}
  }
  
  if(page>=24 ) { //niveau tuto 3
    for(int j=0; j<30 ; j++) {
       for( int i=0 ; i<20 ; i++) {
         tabNiveaucopie[0][i][j]=tabtuto[3][i][j];}}
  }


maitreXr=amorti(maitreXt,maitreXr,0,900,10);//déplacemant du maitre
maitreYr=amorti(maitreYt,maitreYr,0,900,10);//déplacemant du maitre
  pushStyle();
  imageMode(CENTER);
  image(maitre,maitreXr-15,maitreYr-15,100,100);//dessin du maitre
  popStyle();
  
  if(page>=27){boutonOptions(); boutonPause(); pause(); }// si tuto fini, afficher boutons
  
}
