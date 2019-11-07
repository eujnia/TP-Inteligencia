#Ejercicio 1 - Problema XOR

cant_entradas=2;
nro_k=8;
nro_epocas=100;
tasa_apr=0.1;
criterio_corte=0.8;
file_trn='XOR_trn.csv';
file_tst='XOR_tst.csv';
disp('Xor:');
disp(' Caso 1: Con RBF:');
desempenio_XOR = RBF(file_trn, file_tst, cant_entradas, nro_k, nro_epocas, tasa_apr, criterio_corte)
 
tst_xor 