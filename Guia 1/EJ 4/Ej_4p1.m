%Ejercicio 4 - Parte 1: Genera particiones

file = 'irisbin.csv';

%Uso distintos k para probar
 
k_1=1;
k_2=5;
k_3=20;

%Nombre de los archivos donde se va a guardar cada particion

trn_file_1= 'trn_file_1';
tst_file_1= 'tst_file_1';

trn_file_2= 'trn_file_2';
tst_file_2= 'tst_file_2';

trn_file_3= 'trn_file_3';
tst_file_3= 'tst_file_3';

cant_entradas= 4;
dim_red =[3,3,5,3,3];
cant_epocas=300;
criterio=0.9;
tasa_apr=0.02;

%Particiones con distintos k 

[n_part_1] = leave_k_out(file, k_1, trn_file_1, tst_file_1);
%[vtrn_1, vtst_1] = load_part(file, trn_file_1, tst_file_1, 1);

[n_part_2] = leave_k_out(file, k_2, trn_file_2, tst_file_2);
%[vtrn_2, vtst_2] = load_part(file, trn_file_2, tst_file_2, 1);

[n_part_3] = leave_k_out(file, k_3, trn_file_3, tst_file_3);
%[vtrn_3, vtst_3] = load_part(file, trn_file_3, tst_file_3, 1);