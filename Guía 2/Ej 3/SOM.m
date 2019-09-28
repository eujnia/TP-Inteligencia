function []=SOM(alto, ancho, entradas, nro_epocas, radio)
  
  w=rand(alto, ancho, 2)-0.5;
  min_dist=norm((w(1,1,1)-entradas(1,1)),(w(1,1,2)-entradas(1,2)),2);
  % abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  
  %% GRAFICA
  figure;
  hold on;
  grafica_mapa;
    
  %% PARTE I : ORDENAMIENTO TOPOLOGICO -----------------------------------
  nro_epoca=nro_epocas*0.1; 
  radio=1;
  tasa=0.5;
  for epoca=1:nro_epoca
    for patron=1:size(entradas,1)
      
      % Buscar la neurona cuya distancia al patron sea m�nima (competencia)
 
      for i=1:alto
        for j=1:ancho
          
          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
           
          if dist<=min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
      
          
        endfor
      endfor
         min_dist=100; 
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if abs(pos_min(1)-i)<=radio && abs(pos_min(2)-j)<=radio 
            w(i,j,1)=w(i,j,1)+tasa* (entradas(patron,1)-w(i,j,1));
            w(i,j,2)=w(i,j,2)+tasa* (entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
      % grafica
      if mod(epoca,10)==0
          grafica_mapa;
      endif
      
    endfor
  endfor
  
  
  %% PARTE II : TRANSICION ---------------------------------------------
  nro_epoca=nro_epocas*0.3;
  radio=2;
  tasa=0.2;
  for epoca=1:nro_epoca
    if radio>1
       radio=radio-1;
    endif
    tasa=tasa-0.6*epoca/nro_epoca;
    for patron=1:size(entradas,1)
      % buscar distancia neurona de distancia minima para el patron
      for i=1:alto
        for j=1:ancho
          
          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
          if dist<min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
          
        endfor
      endfor
        min_dist=100;
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
            w(i,j,1)=w(i,j,1)+tasa*(w(i,j,1)-entradas(patron,1));
            w(i,j,2)=w(i,j,2)+tasa*(w(i,j,2)-entradas(patron,2));
          endif
        endfor
      endfor
      
      % grafica
      if mod(epoca,10)==0
        grafica_mapa;
      endif
      
    endfor
  endfor
  
  %% PARTE III : CONVERGENCIA -------------------------------------------
  nro_epoca=nro_epocas*0.6;
  radio=0;
  tasa=0.1;
  for epoca=1:nro_epoca
    for patron=1:size(entradas,1)
      % buscar distancia neurona de distancia minima para el patron
      for i=1:alto
        for j=1:ancho
          
          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
          if dist<min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
          
        endfor
      endfor
        min_dist=100;
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
            w(i,j,1)=w(i,j,1)+tasa*(w(i,j,1)-entradas(patron,1));
            w(i,j,2)=w(i,j,2)+tasa*(w(i,j,2)-entradas(patron,2));
          endif
        endfor
      endfor
      
      % grafica
      if mod(epoca,10)==0
        grafica_mapa(alto,ancho,w);
        pause(1);
      endif
      
    endfor
  endfor
  
endfunction