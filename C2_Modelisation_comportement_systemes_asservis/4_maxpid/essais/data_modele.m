%Parametres du correcteur
Kp=200;
%Loi d'entree sortie du maxpid
Km=25*1e-3;
%Parametre du moteur
L=0.62*1e-3;
%Coefficient de frottement
f=2e-3;
f=0;
%Moment d'inertie du bras
J0=55*1e-3;%avec une masse
%J0=125*1e-3;%avec 3 masses
%Moment d'inertie du bras ramene à l'arbre moteur
Jeq=J0*Km^2;

R=2.07;
Kt=52.5*1e-3;
Ke=(1/182)*(30/pi);

