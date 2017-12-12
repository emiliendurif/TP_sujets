import os
import sh

fichier_note='Notes_D02s_info_mpsi_2017.pdf'
fichier_bilan='D02S_bilan.pdf'

for k in range(48):
    if k<10:
        num='0'+str(k)
    else:
        num=str(k)
    os.system('/usr/local/bin/pdftk A='+fichier_bilan+' B='+fichier_note+' C=blank.pdf cat A1 B'+str(k+1)+' output pdf/bilan_DS2_'+num+'.pdf')
    
os.system('/usr/local/bin/pdftk pdf/bilan_DS2_*.pdf cat output bilan_DS2_.pdf')


        
        


