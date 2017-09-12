//--------------------------------------Différentes couleurs --------------------------------------
color colorsaut = color(0,255,0);
color bloc = color(120);
color fond = color(150);
color laser = color(235,20,0);
color lumiere = color(0,255,255);
color paslumiere = color(0,120,120);

//---------------------------Couleurs de balle : --------------------------------------
color magenta = color(229,23,219); // 0
color cyan = color(47,170,245);
color vert = color(25,145,33);
color bleu = color(31,115,255);
color jaune = color(242,235,2);
color kiwi = color(205,205,13);
color rouge = color(245,27,2); // 5
color noir = color(0);
color grisanthrasite = color(106,103,101);
color prune = color(129,20,83);
color cerise = color(220,10,90);
color blanccasse = color(255,253,206); //10
color bleucanard = color(25,170,180);
color vertemeraude = color(35,170,100);
color abricot = color(230,126,48);
color noisette = color(165,100,0); //15
color[] couleurs={magenta,cyan,vert,bleu,jaune,kiwi,rouge,noir,grisanthrasite,prune,cerise,blanccasse,bleucanard,vertemeraude,abricot,noisette};//tableau contenant toutes les couleurs de balles disponibles

int[] couleurBalles = {0,4};//les nombres de la balle en temps normal
color[] normal = {couleurs[couleurBalles[0]],couleurs[couleurBalles[1]]};//tableau récupérant l'entier pour en faire une couleur et l'affectant à la "normale"
color[] colorballe = {normal[0],normal[1]};//couleur des balles au début : couleur normale


/*-------------------------- pour la sauvegarde txt ----------------------------------------*/
int nbreCase;
int test =0;

String[] sauvegardeEdi;
PrintWriter note;
PrintWriter notEdi;

/*---------------------- pour les splash de peinture --------------------------------*/
int peinture[][][]= new int[50][30][4];//[niveau][nb][X,Y,couleur]
int nbtraces[]= new int [50];
//int etatNiveau[]= new int [48];






//----------------------------pour les portes---------------------------------------------

int ouverture[]={0,0,0,0,0,0,0,0,0,0};
int ouverturebas[]={0,0,0,0,0,0,0,0,0,0};
int ouverturedroite[]={0,0,0,0,0,0,0,0,0,0};
int ouverturegauche[]={0,0,0,0,0,0,0,0,0,0};
int ouverturehaut[]={0,0,0,0,0,0,0,0,0,0};


//-----------------------------------------DECLARATION DES IMAGES ET TABLEAUX D'IMAGES (pour sprites-----------------------------------------

PImage splashrose1;
PImage splashSprite;
PImage ville;
PImage tick;
PImage cadenas_Locked;
PImage villeconstruction;
PImage plateforme;
PImage lasers;
PImage amis;
PImage coop;
PImage retour;
PImage retourGris;
PImage teleport;
PImage drap;
PImage electric;
PImage boutonMPause;
PImage ligneMPause;
PImage boutonPauseBlanc;
PImage boutonPauseNoir;
PImage boutonOptionBlanc;
PImage boutonOptionNoir;
PImage imageAcceuil;
PImage bonusSauts;
PImage bonusSlowMo;
PImage etoiles;
PImage fondMenuVictoire;
PImage boutonReplayBlanc;
PImage boutonReplayGris;
PImage boutonNextBlanc;
PImage boutonNextGris;
PImage boutonRetourMenuBlanc;
PImage boutonRetourMenuGris;
PImage blocFragile;
PImage blocSaut;
PImage maitre;
PImage tuto;

PImage[][] splash= new PImage[5][17];//tableau d'images du sprite
PImage[][] teleporteur=new PImage[6][4]; 
PImage[] drapeau=new PImage[9];
PImage[] bonusSaut=new PImage[16];
PImage[] bonusRalenti=new PImage[16];
PImage[] etoile=new PImage[11];
PImage[] electricite=new PImage[9];



//--------------------------------------------------------------------TABLEAU DE PHRASES POUR LE TUTO-----------------------------------------------------------------
String[] tutoriel= {"Alors comme ça tu es nouveau ici ? Essaye de me suivre !", //0
                     "Ne t'inquiètes pas, je vais t'apprendre ce que je sais !",
                     "On va commencer par les bases !", //2
                     "Appuie sur les flèches gauche et droite pour te déplacer !",//3
                     "Tu te débrouilles déjà pas mal !",//4
                     "Vas-y, n'ai pas peur, tu peux largement le faire !",//5
                     "Ne crois pas non plus tout ce que je dis ! A plus de 3 blocs tu ne passes pas !",//6
                     "Des blocs noirs ? Essaye, il me semble qu'ils rebondissent un peu plus !",//7
                     "Ceux la par contre me parraissent un peu plus fragile ! A ta place je ferrais attention !", //8
                     "Ce brouillard ne m'inspire pas confiance! A ta place je prendrais de la hauteur !",//9
                     "J'ai l'impression que c'est peine perdue, il te suit, pas grave, continue à monter !", //10
                     "Ah regarde derrière toi ! Plutôt cool, on peut voir une trainée qui te suit ! ", //11
                     "Tu veux sauter dans le vide ? A tes risques et périls !", //12
                     "Comme une crêpe... Visiblement tu ne supportes pas les chutes ! Allez, remonte !",//13
                     "Ces blocs là se déplacent quand tu sautes dessus !", //14
                     "Des rayons lumineux ? Plutôt cool ! Par contre le laser ne me rassure pas !", //15
                     "Tiens, un ami vient te rendre visite ! Demande-lui de t'aider en appuyant sur les touches Q et D ! ",
                     "Méfie toi des champs électriques !",
                     "Tiens, qu'est-ce que c'est que ça ?",
                     "Ouah ! Un téléporteur !",
                     "Regarde, on dirait un bonus ! ",//20
                     "Appuie sur la flèche haut ou sur Z pour l'utiliser",
                     "Voilà un autre bonus, à quoi peut-il bien servir ? ",
                     "Oh, le temps est ralenti !",
                     "De nouveaux blocs sont apparus !",
                     "Voilà le drapeau d'arrivée !",//25
                     "Mais tu dois d'abord ramasser toutes les étoiles !",
                     "Bravo ! Tu as terminé le tutoriel ! Tu peux maintenant régler les options, et revenir au menu en mettant le jeu en pause !"};



//-------------------------------------- Différentes variables --------------------------------------

int[] ballX = new int[2];//centre balle X
int[] ballY = new int[2]; //centre balle Y
int sensibilite = 2;
int nombreNiveaux = 49;//penser à rajouter 1 (niveau édité)
int niveau;
int theme;
int nb; // une des deux balle suivant des caracteristiques ( par exemple la plus a gauche...)
int cadre=0; //variable qui permet de gererl'emplacement du cadre de l'editeur
int cadreY1, cadreY2, cadreY3, cadreX, cadreXmax=4; // dans l'ideal on supprime les Y1 Y2Y3 ... que l'on remplace par
int[][] cadreY= {{0,0,3}, // alors en gros le premier tu choisi le rang, et le deuxieme tu as min, reel, max
                 {0,0,0},
                 {0,0,0},
                 {0,0,0},
                 {0,0,0}};
int choixBloc=0;
int brouillardreel=300;
int brouillardtheorique=600;
int sens;
int bouleX=0;
int charge=70;
int maitreXt=175,maitreYt=400,maitreXr=900,maitreYr=400;
int vx,vy;
int wville, hville,wvillec, hvillec, wTuto , hTuto;
int glissement=0;
int page=0, pageY=100; //indique a quel endroi du tutoriel le perso ce trouve
int xtp1=0, ytp1=0;
//int[] rebondY = new int[2];
//int[] rebondY1 = new int[2];
int bas; //numéro de la balle la plus basse -1
int[][] rebondY = new int[2][2]; // [nb de la balle] [rebond actuel ou dernier]
int obstaclefixe;
int choix;
int nombreEtoiles;
int etoilesRamassees;
boolean supprimer=false; // dans l'editeur
boolean m = false;//pour les fronts montants
boolean n = false;//pour les fronts montants
boolean k = false;//pour les fronts montants
boolean l = false;//pour les fronts montants
boolean o = false;//pour les fronts montants
float gravite=9.81;// 9.81 juste pour le délire, à déterminer ensemble
float[] rebond = new float[2];
char etat; //etat: j= jeu , a = acceuil , m = menu 
boolean debut=true;//active lors du lancement d'une partie
boolean trainee=true;
boolean trace=true;
boolean contour = false;
boolean hauteurcadre=true;
boolean multijoueurs=true;
boolean[] mort={false,false};
boolean[] saut={false,false};
boolean fumee=true;
boolean[] touches =new boolean[256];
boolean[] touchesCodees =new boolean[256];
boolean ralenti;
boolean avant,apres;
boolean vPause;
int[] posedepart0 ={0,0};
int[] posedepart1 ={0,0};
int[] arrivee ={0,0,0};// x,y et doit t'on enlever le bloc dessous ?
boolean editionniveaux=false;

int posX[][]= new int[2][25]; // ces deux tableaux ont pour role de creer l'effet de vitesse
int posY[][]= new int[2][25];
int tabNiveaucopie[][][]= new int[nombreNiveaux][20][30];//Déclaration du tableau vide pour les sauvegardes de niveau
int tabTransparent[][]= new int[20][30];


