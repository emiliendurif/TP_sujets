% Trac� sur une m�me figure des r�sultats exp�rimentaux et de simulation.
% Lecture r�sultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne
importBF %Import des variables enregistr�es avec le g�n�rateur automatique MATLAB
dt=2.362/(length(Um)-1);
temps=0:dt:2.362;
% Param�trage figure
plot(temps,theta,S1.Time,S1.Data)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('Vitesse')

