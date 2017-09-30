close all
% Tracé sur une même figure des résultats expérimentaux et de simulation.
% Lecture résultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne
filename1='mesBOC200mA.csv'
filename2='mesBOC200mA3.csv'
filenames={'mesBOC200mA.csv';'mesBOC200mA3.csv';'mesBOC200mA4.csv';'mesBOC200mA5.csv'}
for k=1:length(filenames)
    filename=filenames{k}
    dataArray=importBOfile(filename);
    Temps{:,k} = dataArray{:, 1};
    vitesse{:,k} = dataArray{:, 2};
    leg{1,k}=sprintf('essai n %d',k);
end
leg{1,k+1}='simulation'
% dataArray2=importBOfile(filename2);
% Temps2 = dataArray2{:, 1};
% vitesse2 = dataArray2{:, 2};


%importBO %Import des variables enregistrées avec le générateur automatique MATLAB

% Paramétrage figure
hold on
for k=1:length(filenames)
    plot(Temps{:,k},vitesse{:,k})
end
% plot(Temps2,vitesse2)
plot(mxp.Time,mxp.Data*1000)
legend(leg)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('Vitesse')

