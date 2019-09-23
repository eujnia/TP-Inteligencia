function [desempenio] = RBF(file, part_trn_original, part_tst_original)
 
  entradas = csvread(file);  
  cant_part = size(entradas,1);
  cant_part_tst = size(part_tst_original,1);
   cant_part = cant_part - cant_part_tst;
  [yg] = capa_gaussiana(entradas(:,1:2), 8, 0.2);

 % part_trn_original=csvread('XOR_trn.csv');
 % part_tst_original=csvread('XOR_tst.csv');
  
  part_trn=[yg(1:cant_part,:) part_trn_original(1:cant_part,3)];
  part_tst=[yg(cant_part+1:end,:) part_tst_original(1:end,3)];
  
  cant_entradas=8;
  nro_epocas=1000;
  criterio=0.99;
  tasa_apr=0.01;

  [desempenio]= capa_salida(part_trn,part_tst,cant_entradas,nro_epocas,criterio,tasa_apr);
    
endfunction

  
