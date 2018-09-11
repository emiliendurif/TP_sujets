clear all
close all



% leglabel={'Bi pales weiss','3pales impr3D parrot','4pales impr3D parrot','2pales impr3D parrot',...
%     '2pales parrot BRUT','4pales parrot polie','2 pales parrot 0','Lidié'};
% fichiers={'18-05-2pales0.mat','18-05-3pales.mat','18-05-4pales.mat',...
%     '18-05-bipales.mat','25-05-2pales-parrot.mat','25-05-4pales_polies.mat','30-05-2pales_parrot0.mat','lidie_2pales.mat'}
%npales=[1/20,3/10,4/10,2/10,2,4,1,2];

% leglabel={'Bi pales weiss','Bi pales parrot nouveau support''Bi pales Parrot',};
% fichiers={'03-06-bipales_weiss.mat','08-06-bipales_parrot','30-05-2pales_parrot0'};

% leglabel={'Bi pales weiss','Bi pales parrot','Bipales APC','Bi-pales_bleu'};
% fichiers={'03-06-bipales_weiss.mat','08-06-bipales_parrot','05-06_bipales_apc','04-06-bipales_bleu'};

leglabel={'Expérimental hélice GWS 7035'};
fichiers={'05-06_bipales_apc.mat'};



num=[1];


npales=[2,2,2,2,2,2];


i=1;
npts=5; %nombre de points a enlever
freq_flt=1;
for k=num
A{1,k}=load(fichiers{1,k});
tp{1,k}=A{1,k}.data(1:end-npts,1);
we{1,k}=A{1,k}.data(1:end-npts,2)/npales(k);
Ct{1,k}=A{1,k}.data(1:end-npts,3);
Fp{1,k}=A{1,k}.data(1:end-npts,4);
I{1,k}=A{1,k}.data(1:end-npts,5);
U{1,k}=A{1,k}.data(1:end-npts,6);
leg{1,i}=leglabel{1,k};
i=i+1;
end


% %Simulation
% data_simu1=load('simu_2pales_parrot_12_06.csv');
% %data_simu1=load('simu_2pales_parrot.csv');
% wes=data_simu1(:,4);
% Fps=data_simu1(:,5);
% Cts=data_simu1(:,6);
% 
% %Cahier des charges
% M_drone=0.418;
% ws_lim=28000/8.5;
% Fp_lim=M_drone*9.81/4;
% Fp_cdc=Fp_lim/ws_lim^2*wes.^2;
% 
% %Interpolation pour le calcul des coefficient de poussee et portance
% coeff_p_e=polyfit(we{1,k}*pi/30,Fp{1,k},2);
% Fp_e_int=coeff_p_e(1)*(we{1,k}*pi/30).^2+coeff_p_e(2)*(we{1,k}*pi/30)+coeff_p_e(3);
% coeff_p_s=polyfit(wes*pi/30,Fps,2);
% Fp_s_int=coeff_p_s(1)*(wes*pi/30).^2+coeff_p_s(2)*(wes*pi/30)+coeff_p_s(3);
% 
% coeff_t_e=polyfit(we{1,k}*pi/30,Ct{1,k},2);
% Ct_e_int=coeff_t_e(1)*(we{1,k}*pi/30).^2+coeff_t_e(2)*(we{1,k}*pi/30)+coeff_t_e(3);
% coeff_t_s=polyfit(wes*pi/30,Cts,2);
% Ct_s_int=coeff_t_s(1)*(wes*pi/30).^2+coeff_t_s(2)*(wes*pi/30)+coeff_t_s(3);
% %Fp_e_int=0.0086*(we{1,k}*pi/30).^2


%Poussée
f1=figure
ax1=axes('FontSize',20)
for k=num
plot(we{1,k},Fp{1,k},'*')

end
% plot(wes,Fps,'k*--')
% plot(wes,Fp_cdc,'b*--')
grid on

xlabel('Vitesse en tour par min')
ylabel('Poussée en N')
%legend(leg)
%axis([0 5000 0 2])
ylim([0 1.2])
set(gca, 'fontsize', 20);

% %Trainée
% figure
% for k=num
% plot(we{1,k},Ct{1,k},'*')
% hold on
% end
% 
% grid on
% xlabel('Vitesse en tour par min')
% ylabel('Trainée en N.m')
% legend(leg)
% %axis([0 5000 0 2])




%Filtrage du signal par un passe bas
function res=filtrage_passe_bas(freq,t,signal)
    tau =1/freq; % Coupure du filtre
    res=[signal(1)];
    for i = [2:length(signal)]
        h=t(i)-t(i-1);
        res=[res,(h*signal(i)+tau*res(end))/(h+tau)];
    end
end

% %Filtrage du signal par une moyenne glissante
function filtrageg=filtrage_moyenne(signal,fenetre)
    filtrageg =signal(1:fenetre-1)
    for i =[fenetre:length(signal)]
        s = sum(signal(i-fenetre+1:i+1))/fenetre
        filtrageg=[filtrageg,s]
    end
end

