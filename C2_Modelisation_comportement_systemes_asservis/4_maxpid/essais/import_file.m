function [t,e,s]=import_file(filename)
text=tdfread(filename);
data=text.x_Temps_Consigne_Position_Commande_Courant_Vit0x2E_Axe_Moteur;
t=[];
e=[];
s=[];
for k=[2:length(data)]
    ligne=data(k,:);
    val=str2double(split(ligne));
    t=[t;val(1)];
    e=[e;val(2)];
    s=[s;val(3)];
end


