# Import du module d'optiomisation 
from scipy.optimize import fsolve
# Import de fonctions mathématiques
from math import cos,sin,pi


# Définition des variables
# ========================

# Pas de calcul en degrés :
pas_calcul = .5

# Défintion du système d'équations
def systeme(x):
    """
    Définition du système d'équations de type eqn = 0
    Entrée :
     * x(list) : liste des variables
    Sortie :
     * res(list)
    """
    t1,t2,t3 = x[0],x[1],x[2]
    global t4
    a,b,c,d,e = 1,1,1,1,1
    eq1 = a*cos(t1)+b*cos(t2)+c*cos(t2)+d*cos(t4)+e
    eq2 = a*sin(t1)+b*sin(t2)+c*sin(t2)+d*sin(t4)+e
    eq3 = t1+t2+t3+t4
    res = [eq1,eq2,eq3]
    return res

# Variations de t4 en radians
t4_ini= 0
t4_fin= pi/2


# Nom du fichier :
fichier = "simulation.txt"
# Résolution du système :
# =======================
res = []
t4 = t4_ini
print("Début de la résolution")
while t4<=t4_fin :
    t4 = t4 + pas_calcul*pi/180
    sol_ini = [0,0,0]
    res.append(fsolve(systeme,sol_ini))
    print(".",end="")

print("\n Fin de la résolution")

# Mise en forme des résultats :
# =============================
t1_res = []
t2_res = []
t3_res = []
t4_res = []
fid = open(fichier,"w")
for i in range(len(res)):
    t1_res.append(res[i][0]*180/pi)
    t2_res.append(res[i][1]*180/pi)
    t3_res.append(res[i][2]*180/pi)
    t4_res.append(t4_ini*180/pi + i*pas_calcul)
    fid.write(str(t1_res[-1])+"\t"+str(t2_res[-1])+"\t"+str(t3_res[-1])+"\t"+str(t4_res[-1])+"\n")
fid.close()

# Affichage des courbes :
# =======================
from scipy import *
from pylab import *
plot(t4_res,t1_res,label="$\\theta_1$")
plot(t4_res,t2_res,label="$\\theta_2$")
plot(t4_res,t3_res,label="$\\theta_3$")
legend()

import os
print("Dossier contenant le fichier généré")
print(os.getcwd())