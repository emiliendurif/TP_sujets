Km=1;%Gain statique du moteur a identifier
Tm=1;%Constante de temps du moteur a identifier
Kh=1;%Constante de portance a identifier

%Ouverture d'un fichier experimental comprenant deux colonnes temps et
%vitesses
start_row=3;
data=dlmread('bv1.csv',';',start_row);
col_tp=1;
col_v=3;
tp=data(:,col_tp);
v=data(:,col_v);
data_s=[tp,v];
dlmwrite('bv1_s.csv',data_s);

dataexp=csvread('bv1_s.csv');