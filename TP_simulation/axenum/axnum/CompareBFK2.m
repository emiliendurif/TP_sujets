% Trac� sur une m�me figure des r�sultats exp�rimentaux et de simulation.
% Lecture r�sultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne
importBF2 %Import des variables enregistr�es avec le g�n�rateur automatique MATLAB

% Param�trage figure
plot(Temps2,vitesse2,mxp.Time,mxp.Data*1000)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('Vitesse')

