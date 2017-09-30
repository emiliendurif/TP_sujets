close all
clear Temps vitesse Imoteur Ecart Consigne leg
% Tracé sur une même figure des résultats expérimentaux et de simulation.
% Lecture résultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne

filenames={'BFV100VI_1512-K1.csv';'BFV100VI_1512-K2.csv'}

for k=1:length(filenames)
    filename=filenames{k}
    dataArray=importBFfile(filename);
    Temps{:,k} = dataArray{:, 1};
    vitesse{:,k} = dataArray{:, 5};
    Imoteur{:,k} = dataArray{:, 4};
    Ecart{:,k} = dataArray{:, 3};
    Consigne{:,k} = dataArray{:, 2};
    leg{1,k}=sprintf('essai n %d',k);
end


% Tracé sur une même figure des résultats expérimentaux et de simulation.
% Lecture résultat experience Boucle ouverte BO=csvread('mesBOC200mA.csv',1,0) %lecture csv saut premiere ligne
%importBF %Import des variables enregistrées avec le générateur automatique MATLAB

% Paramétrage figure
% plot(Temps1,vitesse1,mxp.Time,mxp.Data*1000)
% title('2-D Line Plot')
% xlabel('Temps (s)')
% ylabel('Vitesse')

hold on
for k=1:length(filenames)
    plot(Temps{:,k},vitesse{:,k})
end
% plot(Temps2,vitesse2)
plot(mxp_bf.Time,mxp_bf.Data*1000)
leg{1,k+1}='simulation avec K1=1'
plot(mxp_bf2.Time,mxp_bf2.Data*1000)
leg{1,k+2}='simulation avec K1=2'
legend(leg)
title('2-D Line Plot')
xlabel('Temps (s)')
ylabel('Vitesse')

