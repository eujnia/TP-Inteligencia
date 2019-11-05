#Prueba de capa gaussiana
file = 'XOR_trn.csv';
entradas = csvread(file);  
file = 'XOR_tst.csv';
test = csvread(file); 
#defino los centroides iniciales

[yg] = capa_gaussiana(entradas(:,1:2),test(:,1:2), 8, 0.2);
 