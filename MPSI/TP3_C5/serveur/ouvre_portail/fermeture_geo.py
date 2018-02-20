import numpy as np
import scipy.optimize as opt
import time
import matplotlib.pyplot as plt

global a,b,c,d,e,f,t21
(a,b,c,d,e,f)=(150,100,280,280,20,250) #constantes
t21=np.arange(0,90,1)*np.pi/180


def fermeture_portail(t41):
    return (a+c*np.cos(t41)-e*np.sin(t21)-f*np.cos(t21))**2\
    +(-b+c*np.sin(t41)+e*np.cos(t21)-f*np.sin(t21))**2-d**2
    

def fp(t41):
    return -2*(a+c*np.cos(t41)-e*np.sin(t21)-f*np.cos(t21))*c*np.sin(t41)\
    +2*c*np.cos(t41)*(-b+c*np.sin(t41)+e*np.cos(t21)-f*np.sin(t21))
    

t41 = opt.newton_krylov(fermeture_portail,0.*t21)*180/np.pi


plt.plot(t21*180/np.pi,t41)
plt.xlabel(r'$\theta_{21}$ en °')
plt.ylabel(r'$\theta_{41}$ en °')
plt.grid()
plt.savefig('courbe.eps')