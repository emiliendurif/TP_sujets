close all
scrsz = get(0,'ScreenSize');

wf=9/10;
hf=4/5;
figsize=[0 0  0.9*scrsz(3) 0.9*scrsz(4)];
pathsave='';

% S=csvread('data__bode_maxpid.csv')
% w_essai=S(:,1);
% phi_essai=S(:,3);
% gain_essai=S(:,2);

%linsys3 est une analyse lineaire lancee depuis simulink dont le contenu a
%ete deplace dans le workspace de matlab
[mag,phase,freq] = bode(linsys1)
mag2=zeros(1,size(mag,3));
phase2=zeros(1,size(mag,3));
for k=1:size(mag,3)
    mag2(k)=mag(1,1,k);
    phase2(k)=phase(1,1,k);
end

figure1=figure('position',figsize);
axes1=axes('parent',figure1,'YGrid','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'XMinorGrid','on',...
    'XGrid','on',...
  'position',[0.15 0.15 0.7 0.7],'fontsize',20);
box(axes1,'on');
hold(axes1,'all');
semilogx(w_essai,gain_essai,'ro','linewidth',4,'MarkerSize',10)
semilogx(freq,20*log10(mag2),'b-','linewidth',4)


xlabel('$\omega (rad\cdot s^{-1})$','fontsize',25,'interpreter','latex');
ylabel('$G (dB)$','fontsize',25,'interpreter','latex');

%ylim([-20 10])
legend('Essai','Simulink','location','SouthWest')
set(figure1,'paperpositionmode','auto');
print('-depsc','bode_gain_maxpid');


figure2=figure('position',figsize);
axes2=axes('parent',figure2,'ygrid','on',...
    'xscale','log',...
    'xminortick','on',...
    'xminorgrid','on',...
    'xgrid','on',...
  'position',[0.15 0.15 0.7 0.7],'fontsize',20);
box(axes2,'on');
hold(axes2,'all');

semilogx(w_essai,phi_essai,'ro','linewidth',4,'MarkerSize',10)
semilogx(freq,phase2,'b-','linewidth',4)

xlabel('$\omega (rad\cdot s^{-1})$','fontsize',25,'interpreter','latex');
ylabel('$\varphi (^{\circ})$','fontsize',25,'interpreter','latex');

set(xlabh,'position',get(xlabh,'position') - [0 6 0])
legend('Essai','Fonction de transfert identifiée en temporel','Fonction de transfert identifiée en temporel avec retard 20ms','location','SouthWest')
set(figure2,'paperpositionmode','auto');
print('-depsc','bode_phase_maxpid');
