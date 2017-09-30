%% Notes diverses
% - Si il commence a faire une POM tout seul et qu'il ne bouge plus tout en 
% restant en mode "POM" il peut etre en train de bugger ce qui peut se 
% finir par d�gradation carte �lectronique. 
% Appuyer sur ARU quitter Axnum et relancer.
% - Choisir unit�s passer en "unit� IP" pour pas g�rer les inc.
% - Pour etre sur d'etre en courant revenir en mode courant (v�rifier allure
% courant) parfois passe en tension tout en affichant l'�cran controle
% courant.
% - Configurer "valeurs initiales" pour activer frottements sec, premiere
% chiffre positif, second n�gatif. 50mA sur le SMH
% - Avec frottements secs v�rifier r�guli�rement la valeur qui bugge en
% n�gatif et se modifie toute seule.
% - Configurer puis valeur initiales avant tout pour reset. Commande 100mA
% raisonnable en courant.
% - Configurer partie op�rative permet de checker les constantes.

% Double boucle mode IP/courant : coeff 5.1 manquant dans la derni�re
%       Espilon 2 bugg�
% boucle pour avoir le bon sr inc

% Vitesse/Courant Kbase : 2 V=100mm/s dep 60mm (p0 25mm)

%% Constantes Axnum

%% Syst�me physique
% Moteur
%Vitesse a vide Maxon 8010 tr/min SMH 5100 tr/min
% Constante de couple N.m
%Ki = 20.5/1000 % Maxon
%R= 9.96 %Maxon
Ki=43.2/1000 % SMH
R=4.97 %SMH
J=0.043E-4 % SMH 0.043Kg.cm�


% Gain R�ducteur
%Kred=33.2 % Maxon
Kred=35.9 % SMH
rpignon = 21*0.8/(2*1000) % Rayon pignon m

% Codeur 500 pt par tour 2 voies
% Delta inc / Delta x Ntourmot = Kred*(DeltaX)/(2*pi*1000*rpignon)
% Soit Kcod = (34061-9270)*(2*pi*1000*rpignon)/(Kred*(92.5-25.2)) % Max 534
Kcod = (61206-9325)*(2*pi*1000*rpignon)/(Kred*(157.9-24.2)) % SMH =570.5

% Masse �quivalente chariot et inertie moteur ramen�e en translation
% 100 mA => 43 mm/s� (valeur initiale) m gamma = I * Ki * Kred /rpignon
meq = 120 %181fit % Ki*Kred/rpignon (150mA=150mm/s�) % Old0.1*Ki*Kred/(rpignon*0.092) % meq = 181 Kg
% Calcul 2 150mA=>150mm/s� (200mA reel)



% Frottements sec : 50 mA (deadzone)

% Gain convertisseur courant
Kcc=0.05 % 2 inc pour 100mA

% Correction
Kp = 2 % Gain correcteur
%Cas controle vitesse/courant Gain 9mm/s * 2 * Kconvtot = 117 (-50) =>
Kconv = 7.576 % /2 ? % 2 je comprend pas trop mais en comparant les mesures...

%% Param�tres probl�me
Io=0.1 % Commande courant initiale
f=1 % Coefficient de frottement visqueux : N/(m/s) maxon sans sec 0.6 SMH avec 0.5
% Frottement sec �quivalent 50ma

% BF 874 inc 480 mA epsilon = 4.5mm
% MaxAmp 0.5A


