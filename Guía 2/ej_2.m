#Ejercicio 2
 file = 'irisbin.csv';
 %part_trn_original=csvread('XOR_trn.csv');
 %part_tst_original=csvread('XOR_tst.csv');
 %cant_entradas=8;
 

 
 
k_3=20;

trn_file_3= 'trn_file_3';
tst_file_3= 'tst_file_3';

%Particiones con distintos k 

[n_part_3] = leave_k_out(file, k_3, trn_file_3, tst_file_3);
%[vtrn_1, vtst_1] = load_part(file, trn_file_1, tst_file_1, 1);

desempenio = RBF(file, trn_file_3, tst_file_3);
 