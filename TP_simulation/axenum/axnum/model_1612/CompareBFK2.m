% Tracé sur une même figure des résultats expérimentaux et de simulation.
% Lecture résultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne
importBF2 %Import des variables enregistrées avec le générateur automatique MATLAB

% Paramétrage figure
plot(Temps2,vitesse2,mxp.Time,mxp.Data*1000)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('Vitesse')

