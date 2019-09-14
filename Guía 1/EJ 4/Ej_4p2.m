%Ejercicio 4 - Parte 2: Prueba para los distintos k

cant_entradas= 4;
dim_red =[3,3,3,3];
cant_epocas=500;
criterio=0.99;
tasa_apr=0.1;

desempenio_trn_total=0;
desempenio_tst_total=0;

  v_err_trn = [];
  v_err_tst = [];
  
%n_part_3 es la menor cantidad de particiones.
for i=1:n_part_3
  %Cargo 3 particiones distintas
  [vtrn, vtst] = load_part(file, trn_file_3, tst_file_3, i);

  [w,e,desempenio_trn] = retropropagacion(vtrn,cant_entradas,dim_red,cant_epocas,criterio,tasa_apr);
  %e es el error cuadratico medio.. nos servir� ac�?
  
  [desempenio_tst] = retropropagacion_tst(vtst, cant_entradas, dim_red, w);
  
  desempenio_trn_total += desempenio_trn;
  desempenio_tst_total += desempenio_tst;
  
  v_err_trn = [v_err_trn (1-desempenio_trn)];
  v_err_tst = [v_err_tst (1-desempenio_tst)];
  
endfor

%Error de clasifiacion 

%Para estimar el error esperado de clasificacion usamos 1 - taza de desempenio
% su promedio y desviacion estandar segun los dos metodos 

disp("error con particiones con k=20");

desemp_trn = desempenio_trn_total/double(n_part_3);
desemp_tst = desempenio_tst_total/double(n_part_3);

error_trn = (1 - desemp_trn)
error_tst = (1 - desemp_tst)

desvio_trn = std(v_err_trn)
desvio_tst = std(v_err_tst)

 