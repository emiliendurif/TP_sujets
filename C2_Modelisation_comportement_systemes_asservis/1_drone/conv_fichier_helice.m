clear all
close all

start_row=3;%numero de la ligne a partir de laquelle sont stockee les donnees
data=dlmread('mesures/helice_bo.csv',';',start_row);
col_tp=1;%Numero de la colonne de temps dans le fichier csv
col_V=2;%Numero de la colonne des valeurs des vitesses dans le fichier csv
col_F=3;%Numero de la colonne des valeurs d'effort dans le fichier csv
tp=data(:,col_tp);%Temps
V=data(:,col_V);%Vitesse
F=data(:,col_F);%Commande moteur
data_V=[tp,V];
data_F=[tp,F];
dlmwrite('mesures/helice_bo_V.csv',data_V);
dlmwrite('mesures/helice_bo_F.csv',data_F);

%Identification
P=polyfit(V(600:end)-4416,F(600:end),1);
F_fit=P(1)*(V-4416)+P(2);
figure
plot(V-4416,F)
hold on
plot(V-4416,F_fit)

% entree_exp=csvread('mesures/moteur_bo_U.csv');
% V_exp=csvread('mesures/moteur_bo_V.csv');
% 
% Km=(4900-2250)/(4780-4416);%Gain statique du moteur
% Tm=0.15;%Constante de temps du moteur