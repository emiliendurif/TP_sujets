start_row=3;
data=dlmread('mesures/bv1.csv',';',start_row);
col_tp=1;
col_v=3;
tp=data(:,col_tp);
v=data(:,col_v);
data_s=[tp,v];
dlmwrite('mesures/bv1_s.csv',data_s);

dataexp=csvread('mesures/bv1_2.csv');