clear all
close all
% Trac� sur une m�me figure des r�sultats exp�rimentaux et de simulation. saut premiere ligne
filename = 'echelon_maxpid_kp50_theta_30-80.txt';

[t,e,s,wa,wm]=import_echelon(filename); %Import des variables enregistr�es avec le g�n�rateur automatique MATLAB

% Param�trage figure
plot(t,e,t,s)
xlabel('Temps (s)')
ylabel('\theta(t) (en �)')

p=polyfit(wm,wa,1);
figure
plot(wm,wa)
hold on
plot(wm,p(1)*wm+p(2),'k--')
xlabel('\omega_{m} (en rad/s)')
ylabel('\omega_{axe} (en rad/s)')

