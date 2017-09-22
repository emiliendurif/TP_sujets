close all
clear temps consigne sortie
% Tracé sur une même figure des résultats expérimentaux et de simulation. saut premiere ligne
filenames={'echelon_maxpid_kp20.txt';'echelon_maxpid_kp50.txt';'echelon_maxpid_kp200.txt'};
vKp=[20,50,200];
for k=1:length(filenames)
    [t,e,s]=import_file(filenames{k});
    temps{:,k} = t*1e-3;
    consigne{:,k} = e;
    sortie{:,k} = s-30;
    leg{1,k}=sprintf('Experience avec K_p= %d',vKp(k));
end

hold on
for k=1:length(filenames)
    plot(temps{:,k},sortie{:,k},'--')
end
% Parametrage figure
plot(S1.Time,S1.Data,'LineWidth',3)%Kp=20
leg{1,k+1}=sprintf('Simulation avec K_p= %d',vKp(1));
plot(S2.Time,S2.Data,'LineWidth',3)%Kp=50
leg{1,k+2}=sprintf('Simulation avec K_p= %d',vKp(2));
plot(S3.Time,S3.Data,'LineWidth',3)%Kp=200
leg{1,k+3}=sprintf('Simulation avec K_p= %d',vKp(3));
xlabel('Temps (s)')
ylabel('\theta(t) (en °)')
legend(leg)

