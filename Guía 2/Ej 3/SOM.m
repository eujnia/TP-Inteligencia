function []=SOM(alto, ancho, entradas, nro_epocas, radio, tasa)
  
  w=rand(alto, ancho, 2)-0.5;
  
  min_dist=abs(w(1,1,1)-entradas(1,1))+abs(w(1,1,2)-entradas(1,2));
  pos_min=[1 1];
  
  figure;
  axis([-1.5 1.5 -1.5 1.5]); hold on;
  for i=1:alto
    for j=1:ancho
      plot(w(i,j,1),w(i,j,2),'or','linewidth',1.2);
    endfor
  endfor
  
  for epoca=1:nro_epocas
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
          if pos_min(1)+i<=radio && pos_min(2)+j<=radio
            w(i,j,1)+=w(i,j,1)+tasa*(entradas(patron,1)-w(i,j,1));
            w(i,j,2)+=w(i,j,2)+tasa*(entradas(patron,2)-w(i,j,2));
          endif
        endfor
      endfor
      
      hold off;
      axis([-1.5 1.5 -1.5 1.5]); hold on;
      for i=1:alto
        for j=1:ancho
          plot(w(i,j,1),w(i,j,2),'or','linewidth',1.1);
        endfor
      endfor
      pause(1);
      
    endfor
  endfor
  
endfunction