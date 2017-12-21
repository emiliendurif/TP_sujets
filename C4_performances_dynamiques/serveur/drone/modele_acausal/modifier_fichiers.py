import os
import sh

fichiers=os.listdir()
for f in fichiers:
    if len(f.split('faut_sldprt'))>1:
        f2=f.split('faut_sldprt')
        f2=f2[0][:-1]+'faut_sldprt.STEP'
        print(f2)
        commande='mv '+f+' '+f2
        os.system(commande)
#fichiers=os.popen('ls *.STEP').readlines()
    # lpdf=''
    # for scripts in scripts0:
    #     filepdfname=str(scripts.strip('.py\n'))+'.pdf'
    #     os.system('/usr/local/bin/enscript '+str(scripts.strip('\n'))+' -o - | /usr/local/bin/ps2pdf - '+str(scripts.strip('.py\n'))+'.pdf')
    #     lpdf=lpdf+filepdfname+' '
    # os.system('/usr/local/bin/pdftk '+lpdf+' cat output '+rep.strip('\n')+'.pdf')
    #     
        


