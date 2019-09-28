function [w,etiqueta]=trn_SOM(alto, ancho, entradas, nro_epocas, radio)
  
  cant_patrones= size(entradas,1);
  w=rand(alto, ancho, 2)-0.5;
  clasificador = zeros(alto,ancho);
  etiqueta = zeros(alto, ancho);
  
  %minima disntancia = primer distancia 
  min_dist=norm((w(1,1,1)-entradas(1,1)),(w(1,1,2)-entradas(1,2)),2);
  % abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  tic();
  %% GRAFICA
  figure;
  hold on;
  grafica_mapa;
  p=toc()
  tic();
  %% PARTE I : ORDENAMIENTO TOPOLOGICO -----------------------------------
  nro_epoca=nro_epocas*0.1; 
  radio=6;
  tasa=0.7;
  aux_trn_SOM 
  p=toc()
  %% PARTE II : TRANSICION -----------------------------------------------------------
  nro_epoca=nro_epocas*0.6; 
  radio=2;
  tasa=0.3;
  %aux_trn_SOM 
  
  %% PARTE III : CONVERGENCIA ------------------------------------------------------
  nro_epoca=nro_epocas*0.3; 
  radio=0;
  tasa=0.1;
  %aux_trn_SOM 
  
endfunction