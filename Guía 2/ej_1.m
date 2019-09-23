#Ejercicio 1 
 file = 'XOR_trn.csv';
 part_trn_original=csvread('XOR_trn.csv');
 part_tst_original=csvread('XOR_tst.csv');
  
 desempenio = RBF(file, part_trn_original, part_tst_original);
 
  