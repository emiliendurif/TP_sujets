clear all
close all
scrsz = get(0,'ScreenSize');

wf=9/10;
hf=4/5;
figsize=[0 0  0.9*scrsz(3) 0.9*scrsz(4)];
pathsave='';
%------------------

N=13;
Ke=1/1.6;
Le=0.075;
Te=Le/1.6;
Km=0.73;
Tm=0.62;
Kem=0.122;
Ks=Kem^2*Km*Ke/N
w0=sqrt((1+Ks)/(Te*Tm));
xi=0.5*w0*(Te+Tm)/(1+Ks);
xi2=0.2
G=10

p1=w0*(-xi+sqrt(xi^2-1));
p2=w0*(-xi-sqrt(xi^2-1));
%Calcul de la fonction de transfert
%---------------------------------------


%tracer des diagrammes de bode
varlogw=-5:0.01:4;
varw=10.^(varlogw);
varlogw_scale=10.^(-4:1:4);
vFTA=G./((i*varw).^2./w0^2+2*xi*i*varw/w0+1);
vFTA2=G./((i*varw).^2./w0^2+2*xi2*i*varw/w0+1);
vgainA=abs(vFTA);
vphiA=angle(vFTA);
TA1=-1/p1;
TA2=-1/p2;
vFT1=G./(1+i*TA1*varw);
vgainA2=abs(vFTA2);
vphi1=angle(vFT1);
vgain1=abs(vFT1);
vphiA2=angle(vFTA2);
asymp0=G*ones(1,length(varw));
asymp1=zeros(1,length(varw));
asymp1(1,find(varw<1/TA1))=1*ones(1,length(varw(find(varw<1/TA1))));
asymp1(find(varw>=1/TA1))=1./(i*TA1*varw(find(varw>=1/TA1)));
asymp2=zeros(1,length(varw));
asymp2(1,find(varw<1/TA2))=1*ones(1,length(varw(find(varw<1/TA2))));
asymp2(find(varw>=1/TA2))=1./(i*TA2*varw(find(varw>=1/TA2)));
asymp3=asymp0.*asymp1.*asymp2;
phi_asymp3=angle(asymp3)*180/pi;
phi_asymp3(find(phi_asymp3==180))=-180;


figure1=figure('position',figsize);
axes1=axes('parent',figure1,'YGrid','on',...
    'XScale','log',...
    'XMinorTick','on',...
    'XMinorGrid','on',...
    'XGrid','on',...
  'position',[0.15 0.15 0.7 0.7],'fontsize',20);
box(axes1,'on');
hold(axes1,'all');

semilogx(varw,20*log(abs(vgainA))/log(10),'b-','linewidth',6)
semilogx(varw,20*log(abs(vgainA2))/log(10),'r-.','linewidth',6)
line([1/TA1,1/TA1],[30,-160],'color','k','linestyle','--','LineWidth',2);
line([1/TA2,1/TA2],[30,-160],'color','k','linestyle','--','LineWidth',2);
line([w0,w0],[30,-160],'color','k','linestyle','--','LineWidth',2);
% semilogx(varw,20*log(abs(G))/log(10)+20*log(abs(asymp1))/log(10),'g--','linewidth',3)
% semilogx(varw,20*log(abs(asymp2))/log(10),'r--','linewidth',3)
semilogx(varw,20*log(abs(asymp3))/log(10),'k--','linewidth',3)
legend('\xi=2','\xi=0,2')

xlim([10^-2 10^3])
ylim([-50 30])
% [hx,hy] = format_ticks(gca,{'$10^{-1}$','$10^{0}$','$\frac{1}{T_1}$','$10^{1}$','$\omega_0$','$10^{2}$','$\frac{1}{T_2}$','$10^{3}$'},...
%     {},...
% [10^(-1),10^(0),1/TA1,10^(1),w0,10^(2),1/TA2,10^(3)],[],0,0,0.01,...
% 'fontsize',25,'fontweight','bold');
set(axes1,'XTick',varlogw_scale)
set(axes1,'ytick',[-100:20:20])
xlabel('$\omega (rad\cdot s^{-1})$','fontsize',25,'interpreter','latex');
ylabel('$G (dB)$','fontsize',25,'interpreter','latex');
xlabh = get(gca,'xlabel');
set(xlabh,'position',get(xlabh,'position') - [0 3 0])
set(figure1,'paperpositionmode','auto');
print('-depsc',sprintf('2nd_ordre_gain'));





figure2=figure('position',figsize);
axes2=axes('parent',figure2,'ygrid','on',...
    'xscale','log',...
    'xminortick','on',...
    'xminorgrid','on',...
    'xgrid','on',...
  'position',[0.15 0.15 0.7 0.7],'fontsize',20);
box(axes2,'on');
hold(axes2,'all');

semilogx(varw,vphiA*180/pi,'b-','linewidth',6)
semilogx(varw,vphiA2*180/pi,'r-.','linewidth',6)
legend('\xi=2','\xi=0,2')
line([1/TA1,1/TA1],[-190,10],'color','k','linestyle','--','linewidth',2);
line([1/TA2,1/TA2],[-190,10],'color','k','linestyle','--','linewidth',2);
line([w0,w0],[-190,10],'color','k','linestyle','--','linewidth',2);
line([10^-2,10^3],[-90,-90],'color','k','linestyle','--','linewidth',2);
% semilogx(varw,angle(asymp1)*180/pi,'g--','linewidth',3)
% semilogx(varw,angle(asymp2)*180/pi,'r--','linewidth',3)
semilogx(varw,phi_asymp3,'k--','linewidth',3)
xlim([10^-2 10^3])
ylim([-190 10])
% [hx,hy] = format_ticks(gca,{'$10^{-1}$','$10^{0}$','$\frac{1}{T_1}$','$10^{1}$','$\omega_0$','$10^{2}$','$\frac{1}{T_2}$','$10^{3}$'},...
%     {},...
% [10^(-1),10^(0),1/TA1,10^(1),w0,10^(2),1/TA2,10^(3)],[],0,0,0.01,...
% 'fontsize',25,'fontweight','bold');
% set(axes2,'ytick',-180:45:0)

xlabel('$\omega (rad\cdot s^{-1})$','fontsize',25,'interpreter','latex');
ylabel('$\varphi (^{\circ})$','fontsize',25,'interpreter','latex');
xlabh = get(gca,'xlabel');
set(xlabh,'position',get(xlabh,'position') - [0 6 0])
set(figure2,'paperpositionmode','auto');
print('-depsc',sprintf('2nd_ordre_phase'));
% 
