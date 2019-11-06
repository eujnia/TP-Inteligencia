function [w] = SOM(alto, ancho, entradas, nro_epocas)
  
  w=rand(alto, ancho, 2)*10 -4;
  tipo_distancia = 3;
  min_dist=distancia( w(1,1,:), entradas(1,:), tipo_distancia );
  % abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  epoca_salto = 1; % numero de epocas que se saltean al graficar
  
  nro_epocas_etapa_1 = nro_epocas * 0.1;
  nro_epocas_etapa_2 = nro_epocas * 0.3;
  nro_epocas_etapa_3 = nro_epocas * 0.6;
  radio_etapa_1 = 5;
  radio_etapa_2 = 3;
  radio_etapa_3 = 0;
  tasa_etapa_1 = 0.5;
  tasa_etapa_3 = 0.1;
  tasa_etapa_2 = linspace( tasa_etapa_1, tasa_etapa_3, nro_epocas_etapa_2 );
  
  %% GRAFICA
  figure;
  hold on;
  grafica_mapa;
  title("Inicio"); hold on;
  pause(.5);
    
  %% PARTE I : ORDENAMIENTO TOPOLOGICO -----------------------------------
  nro_epoca=nro_epocas_etapa_1; 
  radio=radio_etapa_1;
  tasa=tasa_etapa_1;
  for epoca=1:nro_epoca
    for patron=1:size(entradas,1)
      
      % Buscar la neurona cuya distancia al patron sea m�nima (competencia)
 
      for i=1:alto
        for j=1:ancho
          
          dist=distancia( w(i,j,:), entradas(patron,:), tipo_distancia );
           
          if dist<=min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
      
          
        endfor
      endfor
         
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if abs(pos_min(1)-i)<=radio && abs(pos_min(2)-j)<=radio 
            w(i,j,1)=w(i,j,1)+tasa* (entradas(patron,1)-w(i,j,1));
            w(i,j,2)=w(i,j,2)+tasa* (entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
    endfor
    
    % grafica
      if mod(epoca,epoca_salto)==0
          grafica_mapa;
          title("Ordenamiento topológico");  hold on;
          pause(.5);
      endif
    
  endfor
  
  
  %% PARTE II : TRANSICION ---------------------------------------------
  nro_epoca=nro_epocas_etapa_2; 
  radio=radio_etapa_2;
  tasa=tasa_etapa_2;
  for epoca=1:nro_epoca
    if radio>1
       radio=radio-1;
    endif
    for patron=1:size(entradas,1)
      min_dist=distancia( w(1,1,:), entradas(1,:), tipo_distancia );
      pos_min=[1 1];
      % buscar distancia neurona de distancia minima para el patron
      for i=1:alto
        for j=1:ancho
          
          dist=distancia( w(i,j,:), entradas(patron,:), tipo_distancia );
          if dist<min_dist
            min_dist=dist;
            pos_min=[i j];
          endif
          
        endfor
      endfor
      
      % actualizar ganadora y vecinas
      for i=1:alto
        for j=1:ancho
          if abs(pos_min(1)-i)<=radio && abs(pos_min(2)-j)<=radio
            w(i,j,1)=w(i,j,1)+tasa(epoca)*(entradas(patron,1)-w(i,j,1));
            w(i,j,2)=w(i,j,2)+tasa(epoca)*(entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
    endfor
    
    % grafica
      if mod(epoca,epoca_salto)==0
        grafica_mapa;
        title("Transicion"); hold on;
        pause(.5);
      endif
    
  endfor
  
  %% PARTE III : CONVERGENCIA -------------------------------------------
  nro_epoca=nro_epocas_etapa_3; 
  radio=radio_etapa_3;
  tasa=tasa_etapa_3;
  for epoca=1:nro_epoca
    for patron=1:size(entradas,1)
      min_dist=distancia( w(1,1,:), entradas(1,:), tipo_distancia );
      pos_min=[1 1];
      % buscar distancia neurona de distancia minima para el patron
      for i=1:alto
        for j=1:ancho
          
          dist=distancia( w(i,j,:), entradas(patron,:), tipo_distancia );
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
          if abs(pos_min(1)-i)<=radio && abs(pos_min(2)-j)<=radio
            w(i,j,1)=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
            w(i,j,2)=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
    endfor
    
    % grafica
      if mod(epoca,epoca_salto)==0
        grafica_mapa;
        title("Convergencia"); hold on;
        pause(.5);
      endif
    
  endfor
  
endfunction