clear all
close all
% Trac� sur une m�me figure des r�sultats exp�rimentaux et de simulation. saut premiere ligne
filename = 'freq_T2000.txt';

[t,e,s]=import(filename); %Import des variables enregistr�es avec le g�n�rateur automatique MATLAB

% Param�trage figure
plot(t,e,t,s)
xlabel('Temps (s)')
ylabel('\theta(t) (en �)')

