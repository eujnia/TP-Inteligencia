%Ejercicio 4

file = 'irisbin.csv';

%Uso distintos k para probar
 
k_1=1;
k_2=5;
k_3=20;

%Nombre de los archivos donde se va a guardar cada particion

trn_file_1= 'trn_file_1';
tst_file_1= 'tst_file_1';
0.958,
trn_file_2= 'trn_file_2';
tst_file_2= 'tst_file_2';

trn_file_3= 'trn_file_3';
tst_file_3= 'tst_file_3';


cant_entradas= 4;
dim_red =[3,3,3,3];
cant_epocas=50;
criterio=0.9;
tasa_apr=0.02;

%Particiones con distintos k 

[n_part_1] = leave_k_out(file, k_1, trn_file_1, tst_file_1);
%[vtrn_1, vtst_1] = load_part(file, trn_file_1, tst_file_1, 1);

[n_part_2] = leave_k_out(file, k_2, trn_file_2, tst_file_2);
%[vtrn_2, vtst_2] = load_part(file, trn_file_2, tst_file_2, 1);

[n_part_3] = leave_k_out(file, k_3, trn_file_3, tst_file_3);
%[vtrn_3, vtst_3] = load_part(file, trn_file_3, tst_file_3, 1);

%comparacion

desempenio_trn_total=0;
desempenio_tst_total=0;

v_err_trn_1 = [];
v_err_tst_1 = [];
  
for i=1:n_part_1
  [vtrn, vtst] = load_part(file, trn_file_1, tst_file_1, i); 

  [w_1,e_1,desempenio_trn] = retropropagacion(vtrn,cant_entradas,dim_red,cant_epocas,criterio,tasa_apr); 
  [desempenio_tst] = retropropagacion_tst(vtst, cant_entradas, dim_red, w_1); 
  
  desempenio_trn_total += desempenio_trn;
  desempenio_tst_total += desempenio_tst;
  
  v_err_trn_1 = [v_err_trn_1 (1-desempenio_trn)];
  v_err_tst_1 = [v_err_tst_1 (1-desempenio_tst)];
   
endfor

%Error de clasifiacion 

disp("error con particiones con k=1");

desempenio_trn = desempenio_trn_total/double(n_part_1);
desempenio_tst = desempenio_tst_total/double(n_part_1);

prom_error_trn = (1 - desempenio_trn)
prom_error_tst = (1 - desempenio_tst)

desvio_error_trn = std(v_err_trn_1)
desvio_error_tst = std(v_err_tst_1)



desempenio_trn_total=0;
desempenio_tst_total=0;

v_err_trn_2 = [];
v_err_tst_2 = [];
   
for i=1:n_part_2
  [vtrn, vtst] = load_part(file, trn_file_2, tst_file_2, i); 

  [w_1,e_1,desempenio_trn] = retropropagacion(vtrn,cant_entradas,dim_red,cant_epocas,criterio,tasa_apr); 
  [desempenio_tst] = retropropagacion_tst(vtst, cant_entradas, dim_red, w_1); 
  
  desempenio_trn_total += desempenio_trn;
  desempenio_tst_total += desempenio_tst;
  
  v_err_trn_2 = [v_err_trn_2 (1-desempenio_trn)];
  v_err_tst_2 = [v_err_tst_2 (1-desempenio_tst)];
   
endfor

disp("error con particiones con k=5");

desempenio_trn = desempenio_trn_total/double(n_part_2);
desempenio_tst = desempenio_tst_total/double(n_part_2);

prom_error_trn = (1 - desempenio_trn)
prom_error_tst = (1 - desempenio_tst)

desvio_error_trn = std(v_err_trn_2)
desvio_error_tst = std(v_err_tst_2)



desempenio_trn_total=0;
desempenio_tst_total=0;

v_err_trn_3 = [];
v_err_tst_3 = [];
  
for i=1:n_part_3
  [vtrn, vtst] = load_part(file, trn_file_3, tst_file_3, i); 

  [w_1,e_1,desempenio_trn] = retropropagacion(vtrn,cant_entradas,dim_red,cant_epocas,criterio,tasa_apr); 
  [desempenio_tst] = retropropagacion_tst(vtst, cant_entradas, dim_red, w_1); 
  
  desempenio_trn_total += desempenio_trn;
  desempenio_tst_total += desempenio_tst;
  
  v_err_trn_3 = [v_err_trn_3 (1-desempenio_trn)];
  v_err_tst_3 = [v_err_tst_3 (1-desempenio_tst)];
   
endfor

disp("error con particiones con k=20");

desempenio_trn = desempenio_trn_total/double(n_part_3);
desempenio_tst = desempenio_tst_total/double(n_part_3);

prom_error_trn = (1 - desempenio_trn)
prom_error_tst = (1 - desempenio_tst)

desvio_error_trn = std(v_err_trn_3)
desvio_error_tst = std(v_err_tst_3)