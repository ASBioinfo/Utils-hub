import sys
f=open(sys.argv[1], 'r')
l=""
for i in f :
     if i.startswith(">NC"):
          l=l+i
     elif i.startswith(">"):
          i=i.replace(i,(100*"N"+"\n"))
          l=l+i
     else:
          l=l+i     

l=l.replace(100*"N",">NC_chr0",1)
print(l.strip())
f.close()








     

          











