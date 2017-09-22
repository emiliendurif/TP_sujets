clear all
close all
% Tracé sur une même figure des résultats expérimentaux et de simulation. saut premiere ligne
filename = 'freq_T2000.txt';

[t,e,s]=import(filename); %Import des variables enregistrées avec le générateur automatique MATLAB

% Paramétrage figure
plot(t,e,t,s)
xlabel('Temps (s)')
ylabel('\theta(t) (en °)')

