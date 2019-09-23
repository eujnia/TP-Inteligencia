function [desempenio] = RBF(file, cant_entradas)
  file = 'XOR_trn.csv';
  entradas = csvread(file);  
 
  [yg] = capa_gaussiana(entradas(:,1:2), 8, 0.2);

  part_trn_original=csvread('XOR_trn.csv');
  part_tst_original=csvread('XOR_tst.csv');
  
  part_trn=[yg(1:1800,:) part_trn_original(1:1800,3)];
  part_tst=[yg(1800+1:end,:) part_tst_original(1:end,3)];
  
  cant_entradas=8;
  nro_epocas=1000;
  criterio=0.99;
  tasa_apr=0.01;

  [desempenio]= capa_salida(part_trn,part_tst,cant_entradas,nro_epocas,criterio,tasa_apr);
    
endfunction

  
