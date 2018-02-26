% Tracé sur une même figure des résultats expérimentaux et de simulation. saut premiere ligne
import1 %Import des variables enregistrées avec le générateur automatique MATLAB
dt=2.4/(length(Um)-1);
temps=0:dt:2.4;
% Paramétrage figure
plot(temps,theta,S1.Time,S1.Data)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('\theta(t) (en °)')

