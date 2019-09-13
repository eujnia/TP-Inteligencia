#Prueba de capa gaussiana
file = 'XOR_trn.csv';
entradas = csvread(file);  
#defino los centroides iniciales

[cg, yg] = capa_gaussiana(entradas(:,1:2), 2, 0.2); 
 
 # muestro para cada par de entradas la salida estimada
 for i =1:size(entradas,1)
   entradas(i,1:2)
   cg(i)
 endfor
 
 
  