clear all
close all

start_row=3;%numero de la ligne a partir de laquelle sont stockee les donnees
data=dlmread('mesures/moteur_bo.csv',';',start_row);
col_tp=1;%Numero de la colonne de temps dans le fichier csv
col_U=5;%Numero de la colonne de commande moteur dans le fichier csv
col_V=7;%Numero de la colonne des valeurs des vitesses dans le fichier csv
tp=data(:,col_tp);%Temps
V=data(:,col_V);%Vitesse
U=data(:,col_U);%Commande moteur
data_U=[tp,U];
data_V=[tp,V];
dlmwrite('mesures/moteur_bo_V.csv',data_V);
dlmwrite('mesures/moteur_bo_U.csv',data_U);

entree_exp=csvread('mesures/moteur_bo_U.csv');
V_exp=csvread('mesures/moteur_bo_V.csv');

Km=(4900-2250)/(4780-4416);%Gain statique du moteur
Tm=0.15;%Constante de temps du moteur