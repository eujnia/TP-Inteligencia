#Prueba de capa gaussiana
file = 'XOR_trn.csv';
entradas = csvread(file);  
#defino los centroides iniciales

[yg] = capa_gaussiana(entradas(:,1:2), 4, 0.2); 
 entradas(1:10,1:2)
 yg(1:10,:)
 
 
  
