#Ejercicio 2
 file = 'irisbin.csv';
 %part_trn_original=csvread('XOR_trn.csv');
 %part_tst_original=csvread('XOR_tst.csv');
 %cant_entradas=8;
 desempenio = RBF(file, part_trn_original, part_tst_original, cant_entradas);
 