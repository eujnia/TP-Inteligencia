#Prueba de capa gaussiana
file = 'XOR_trn.csv';
entradas = csvread(file);  
#defino los centroides iniciales

[yg] = capa_gaussiana(entradas(1:20,1:2), 4, 0.2);