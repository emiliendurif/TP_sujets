start_row=3;
data=dlmread('bv1.csv',';',start_row);
col_tp=1;
col_v=3;
tp=data(:,col_tp);
v=data(:,col_v);
data_s=[tp,v];
dlmwrite('bv1_2.csv',data_s);

dataexp=csvread('bv1_2.csv');