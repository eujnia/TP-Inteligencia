function []=SOM(alto, ancho, entradas, nro_epocas, radio, tasa)
  
  w=rand(alto, ancho, 2)-0.5;
  min_dist=abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  
  %% GRAFICA
  figure;
  hold on;
  grafica_mapa;
    
  %% PARTE I : ORDENAMIENTO TOPOLÓGICO
  nro_epoca=100;
  radio=2;
  tasa=0.7;
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
      
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if pos_min(1)+i<=radio && pos_min(1)-i>=radio && pos_min(2)+j<=radio && pos_min(2)-j>=radio 
            w(i,j,1)+=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
            w(i,j,2)+=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
      % grafica
      if mod(epoca,10)==0
          grafica_mapa;
      endif
      
    endfor
  endfor
  
%  %% PARTE II : TRANSICIÓN
%  nro_epoca=300;
%  radio=5;
%  tasa=0.7;
%  for epoca=1:nro_epoca
%    if radio>1
%       radio=radio-1;
%    endif
%    tasa=tasa-0.6*epoca/nro_epoca;
%    for patron=1:size(entradas,1)
%      % buscar distancia neurona de distancia minima para el patron
%      for i=1:alto
%        for j=1:ancho
%          
%          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
%          if dist<min_dist
%            min_dist=dist;
%            pos_min=[i j];
%          endif
%          
%        endfor
%      endfor
%      
%      % actualizar ganadora y vecinas
%      for i=1:alto
%        for j=1:ancho
%          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
%            w(i,j,1)+=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
%            w(i,j,2)+=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
%          endif
%        endfor
%      endfor
%      
%      % grafica
%      if mod(epoca,10)==0
%        grafica_mapa(alto,ancho,w);
%        pause(1);
%      endif
%      
%    endfor
%  endfor
%  
%  %% PARTE III : CONVERGENCIA
%  nro_epoca=600;
%  radio=0;
%  tasa=0.1;
%  for epoca=1:nro_epoca
%    for patron=1:size(entradas,1)
%      % buscar distancia neurona de distancia minima para el patron
%      for i=1:alto
%        for j=1:ancho
%          
%          dist=abs(w(i,j,1)-entradas(patron,1))+abs(w(i,j,2)-entradas(patron,2));
%          if dist<min_dist
%            min_dist=dist;
%            pos_min=[i j];
%          endif
%          
%        endfor
%      endfor
%      
%      % actualizar ganadora y vecinas
%      for i=1:alto
%        for j=1:ancho
%          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
%            w(i,j,1)+=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
%            w(i,j,2)+=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
%          endif
%        endfor
%      endfor
%      
%      % grafica
%      if mod(epoca,10)==0
%        grafica_mapa(alto,ancho,w);
%        pause(1);
%      endif
%      
%    endfor
%  endfor
  
endfunction