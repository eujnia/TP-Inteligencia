function [error] = RBF(file_trn, file_tst, cant_entradas, nro_k, nro_epocas, tasa_apr, criterio_corte)
 
  datos_trn = csvread(file_trn);
  datos_tst = csvread(file_tst);
  
  [yg_trn, yg_tst] = capa_gaussiana(datos_trn(:,1:cant_entradas), datos_tst(:,1:cant_entradas), nro_k, tasa_apr, 420);
  
  part_trn=[yg_trn datos_trn(:,cant_entradas+1:end)];
  part_tst=[yg_tst datos_tst(:,cant_entradas+1:end)];

  [error, w]= capa_salida(part_trn, part_tst, nro_k, nro_epocas, criterio_corte, tasa_apr);
    
endfunction