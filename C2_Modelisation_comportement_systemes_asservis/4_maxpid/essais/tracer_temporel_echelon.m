clear all
close all
% Tracé sur une même figure des résultats expérimentaux et de simulation. saut premiere ligne
filename = 'echelon_maxpid_kp50_theta_30-80.txt';

[t,e,s,wa,wm]=import_echelon(filename); %Import des variables enregistrées avec le générateur automatique MATLAB

% Paramétrage figure
plot(t,e,t,s)
xlabel('Temps (s)')
ylabel('\theta(t) (en °)')

p=polyfit(wm,wa,1);
figure
plot(wm,wa)
hold on
plot(wm,p(1)*wm+p(2),'k--')
xlabel('\omega_{m} (en rad/s)')
ylabel('\omega_{axe} (en rad/s)')

