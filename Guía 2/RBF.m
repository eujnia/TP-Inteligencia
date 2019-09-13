function [] = RBF(file, cant_entradas)
  file = 'XOR_trn.csv';
  entradas = csvread(file);  
  # cg conjuntos gausianos
  # yg salidas gausianas
 [cg, yg]=capa_gaussiana(entradas(:,1:2), 4, 0.3)  

 [ys]=capa_salida(entradas(:,1:2),cg);
  
endfunction

  
